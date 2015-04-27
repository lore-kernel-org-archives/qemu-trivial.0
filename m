Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmhaD-0004Ea-9s
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 07:52:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ymha9-000495-JK
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 07:52:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ymha8-00074C-Nw
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 07:52:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ymha3-00072c-3X; Mon, 27 Apr 2015 07:52:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DE86442746;
	Mon, 27 Apr 2015 14:52:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C5F1C8FC;
	Mon, 27 Apr 2015 14:52:05 +0300 (MSK)
Received: (nullmailer pid 32486 invoked by uid 1000);
	Mon, 27 Apr 2015 11:52:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 14:51:56 +0300
Message-Id: <1430135516-32438-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Wu <peter@lekensteyn.nl>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] block/dmg: make it modular
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
X-List-Received-Date: Mon, 27 Apr 2015 11:52:15 -0000

dmg can optionally utilize libbz2, make it modular

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/Makefile.objs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/Makefile.objs b/block/Makefile.objs
index db2933e..179e71d 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -1,4 +1,4 @@
-block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o dmg.o bochs.o vpc.o vvfat.o
+block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o bochs.o vpc.o vvfat.o
 block-obj-y += qcow2.o qcow2-refcount.o qcow2-cluster.o qcow2-snapshot.o qcow2-cache.o
 block-obj-y += qed.o qed-gencb.o qed-l2-cache.o qed-table.o qed-cluster.o
 block-obj-y += qed-check.o
@@ -37,6 +37,7 @@ gluster.o-libs     := $(GLUSTERFS_LIBS)
 ssh.o-cflags       := $(LIBSSH2_CFLAGS)
 ssh.o-libs         := $(LIBSSH2_LIBS)
 archipelago.o-libs := $(ARCHIPELAGO_LIBS)
+block-obj-m        += dmg.o
 dmg.o-libs         := $(BZIP2_LIBS)
 qcow.o-libs        := -lz
 linux-aio.o-libs   := -laio
-- 
2.1.4


