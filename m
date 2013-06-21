Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyjz-00065l-TR
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjl-0005h0-Tq
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjh-0007mZ-Tb
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjc-0007j0-Uo; Fri, 21 Jun 2013 06:38:29 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcSG0017649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:28 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5LAcR5N026024; Fri, 21 Jun 2013 06:38:27 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id B517D43262; Fri, 21 Jun 2013 12:38:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:18 +0200
Message-Id: <1371811105-730-7-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 06/13] qemu-char: print notification to stderr
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:43 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index cfc68cd..3e0044b 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2666,8 +2666,8 @@ static CharDriverState *qemu_chr_open_socket_fd(int fd, bool do_nodelay,
     }
 
     if (is_listen && is_waitconnect) {
-        printf("QEMU waiting for connection on: %s\n",
-               chr->filename);
+        fprintf(stderr, "QEMU waiting for connection on: %s\n",
+                chr->filename);
         tcp_chr_accept(s->listen_chan, G_IO_IN, chr);
         qemu_set_nonblock(s->listen_fd);
     }
-- 
1.7.9.7


