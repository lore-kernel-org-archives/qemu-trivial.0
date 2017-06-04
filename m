Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXzI-00076Z-HI
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:02:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-00073T-TJ
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-0003z0-4W
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXz9-0003uK-E7; Sun, 04 Jun 2017 12:02:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 12A60404E4;
	Sun,  4 Jun 2017 19:02:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 629375E3;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16360 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:07 +0300
Message-Id: <1c9f3b887baa785d0d9942ce960492b9101fb0b9.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/22] docs qemu-doc: Avoid ide-drive,
 it's deprecated
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
X-List-Received-Date: Sun, 04 Jun 2017 16:02:43 -0000

From: Markus Armbruster <armbru@redhat.com>

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/bootindex.txt       | 2 +-
 docs/qdev-device-use.txt | 4 ++--
 qemu-options.hx          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/bootindex.txt b/docs/bootindex.txt
index b9a8ba122f..6937862ba0 100644
--- a/docs/bootindex.txt
+++ b/docs/bootindex.txt
@@ -13,7 +13,7 @@ Let's assume we have a QEMU machine with two NICs (virtio, e1000) and two
 disks (IDE, virtio):
 
 qemu -drive file=disk1.img,if=none,id=disk1
-     -device ide-drive,drive=disk1,bootindex=4
+     -device ide-hd,drive=disk1,bootindex=4
      -drive file=disk2.img,if=none,id=disk2
      -device virtio-blk-pci,drive=disk2,bootindex=3
      -netdev type=user,id=net0 -device virtio-net-pci,netdev=net0,bootindex=2
diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 4274fe9f25..95a0c3ae55 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -31,8 +31,8 @@ A QEMU block device (drive) has a host and a guest part.
 
 In the general case, the guest device is connected to a controller
 device.  For instance, the IDE controller provides two IDE buses, each
-of which can have up to two ide-drive devices, and each ide-drive
-device is a guest part, and is connected to a host part.
+of which can have up to two devices, and each device is a guest part,
+and is connected to a host part.
 
 Except we sometimes lump controller, bus(es) and drive device(s) all
 together into a single device.  For instance, the ISA floppy
diff --git a/qemu-options.hx b/qemu-options.hx
index a6c9b9e763..10995dc932 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -262,7 +262,7 @@ STEXI
 Set default value of @var{driver}'s property @var{prop} to @var{value}, e.g.:
 
 @example
-qemu-system-i386 -global ide-drive.physical_block_size=4096 -drive file=file,if=ide,index=0,media=disk
+qemu-system-i386 -global ide-hd.physical_block_size=4096 disk-image.img
 @end example
 
 In particular, you can use this to set driver properties for devices which are 
-- 
2.11.0


