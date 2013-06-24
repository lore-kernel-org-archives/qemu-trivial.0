Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rp-0004v7-EY
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rd-0004Qj-H3
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rb-0007Gl-Hm
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RT-0006xs-RH; Mon, 24 Jun 2013 02:39:59 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dx83011847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O6dwOg002277; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id F035741780; Mon, 24 Jun 2013 08:39:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:49 +0200
Message-Id: <1372055996-4072-7-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 06/13] qemu-char: print notification to
	stderr
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:12 -0000

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


