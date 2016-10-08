Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsogh-0003bT-0f
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 06:17:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsoge-0003Z0-2e
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsogd-0000F3-5i
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:17:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsogY-00008t-Jw; Sat, 08 Oct 2016 06:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2508140EE1;
	Sat,  8 Oct 2016 13:16:50 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1A867B34;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19237 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:54 +0300
Message-Id: <72fa605decb371d8ebe3c9b3ca33a004b5da3671.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/26] MAINTAINERS: Add some more files to the
 virtio section
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2016 10:17:01 -0000

From: Thomas Huth <thuth@redhat.com>

Makefile.objs and trace-events in hw/virtio/ were not covered
by MAINTAINERS yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ac5fbc..9e4ca02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -933,6 +933,8 @@ virtio
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: hw/*/virtio*
+F: hw/virtio/Makefile.objs
+F: hw/virtio/trace-events
 F: net/vhost-user.c
 F: include/hw/virtio/
 F: tests/virtio-balloon-test.c
-- 
2.1.4


