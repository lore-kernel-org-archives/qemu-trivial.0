Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aSmHi-0004rs-FS
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2016 08:55:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aSmHg-0004o0-EQ
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 08:55:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aSmHf-0007Gp-Bl
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 08:55:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aSmHa-0007Au-Vl; Mon, 08 Feb 2016 08:55:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 619B88E221;
	Mon,  8 Feb 2016 13:55:14 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-6-235.ams2.redhat.com
	[10.36.6.235])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u18DtBDP002691; Mon, 8 Feb 2016 08:55:12 -0500
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Feb 2016 13:55:07 +0000
Message-Id: <1454939707-10869-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH] char: fix repeated registration of tcp
	chardev I/O handlers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2016 13:55:21 -0000

In previous commit:

  commit f2001a7e0555b66d6db25a3ff1801540814045bb
  Author: Daniel P. Berrange <berrange@redhat.com>
  Date:   Tue Jan 19 11:14:30 2016 +0000

    char: don't assume telnet initialization will not block

The code which writes the telnet initialization sequence moved
to an event loop callback. If the TCP chardev is opened as a
server in blocking mode (ie -serial telnet:0.0.0.0:3000,server,wait)
this results in a state where the TCP chardev is connected, but not
yet ready to send/recv data when virtual hardware is created.

When the virtual hardware initialization registers its chardev
callbacks, it triggers tcp_chr_update_read_handler, which will
add I/O watches to the connection.

When the telnet initialization finally runs, it will then call
tcp_chr_connect to finish the connection setup. This will in
turn add I/O watches to the connection too.

There are now two sets of I/O watches registered on the same
connection. This ultimately causes data loss on the connection,
for example, when typing into the telnet console only every
second byte is echoed back to the client.

The same flaw can affect channels running with TLS encryption
too, since they also have delayed connection setup completion.

The fix is to update tcp_chr_update_read_handler so that it
avoids registering watches if the connection is not fully
setup yet.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 qemu-char.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index 927c47e..9060f8a 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2856,6 +2856,10 @@ static void tcp_chr_update_read_handler(CharDriverState *chr)
 {
     TCPCharDriver *s = chr->opaque;
 
+    if (!s->connected) {
+        return;
+    }
+
     remove_fd_in_watch(chr);
     if (s->ioc) {
         chr->fd_in_tag = io_add_watch_poll(s->ioc,
-- 
2.5.0


