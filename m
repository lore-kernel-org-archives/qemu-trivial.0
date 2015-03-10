Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVEFB-0006H4-9x
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 03:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVEF8-0006Cl-H8
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVEF7-0005SK-IE
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:06:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVEF1-0005Pu-7G; Tue, 10 Mar 2015 03:06:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ABDD241302;
	Tue, 10 Mar 2015 10:06:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 98AC6722;
	Tue, 10 Mar 2015 10:06:08 +0300 (MSK)
Received: (nullmailer pid 9920 invoked by uid 1000);
	Tue, 10 Mar 2015 07:06:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 10:06:04 +0300
Message-Id: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Wu <peter@lekensteyn.nl>
Subject: [Qemu-trivial] [PATCH] block/dmg: make it modular if using
	additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 07:06:19 -0000

block/dmg can use additional library (libbz2) to read
bzip2-compressed files.  Make the block driver to be
a module if libbz2 support is requested, to avoid extra
library dependency by default.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
--

This might be questionable, to make the thing to be either
module or built-in depending on build environment, so a
better idea may be to make it modular unconditionally.
This block device format isn't used often.

 block/Makefile.objs | 3 ++-
 configure           | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/Makefile.objs b/block/Makefile.objs
index db2933e..440c51f 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -1,7 +1,8 @@
-block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o dmg.o bochs.o vpc.o vvfat.o
+block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o bochs.o vpc.o vvfat.o
 block-obj-y += qcow2.o qcow2-refcount.o qcow2-cluster.o qcow2-snapshot.o qcow2-cache.o
 block-obj-y += qed.o qed-gencb.o qed-l2-cache.o qed-table.o qed-cluster.o
 block-obj-y += qed-check.o
+block-obj-$(CONFIG_DMG) += dmg.o
 block-obj-$(CONFIG_VHDX) += vhdx.o vhdx-endian.o vhdx-log.o
 block-obj-$(CONFIG_QUORUM) += quorum.o
 block-obj-y += parallels.o blkdebug.o blkverify.o
diff --git a/configure b/configure
index 7ba4bcb..1dd5721 100755
--- a/configure
+++ b/configure
@@ -4772,6 +4772,9 @@ fi
 if test "$bzip2" = "yes" ; then
   echo "CONFIG_BZIP2=y" >> $config_host_mak
   echo "BZIP2_LIBS=-lbz2" >> $config_host_mak
+  echo "CONFIG_DMG=m" >> $config_host_mak
+else
+  echo "CONFIG_DMG=y" >> $config_host_mak
 fi
 
 if test "$libiscsi" = "yes" ; then
-- 
2.1.4


