Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d81e6-0001K7-NA
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 05:41:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d81e2-0001EY-JH
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 05:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d81e1-0001Y6-Jm
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 05:41:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d81dw-0001WL-87; Tue, 09 May 2017 05:41:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 768704E4C3;
	Tue,  9 May 2017 09:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 768704E4C3
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 768704E4C3
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A04AA24FF;
	Tue,  9 May 2017 09:41:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9ADA0113864C; Tue,  9 May 2017 11:41:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "thuth@redhat.comthuth"@redhat.com
Date: Tue,  9 May 2017 11:41:15 +0200
Message-Id: <1494322876-28843-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1494322876-28843-1-git-send-email-armbru@redhat.com>
References: <1494322876-28843-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 09 May 2017 09:41:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/2] docs qemu-doc: Avoid ide-drive,
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
X-List-Received-Date: Tue, 09 May 2017 09:41:27 -0000

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/bootindex.txt       | 2 +-
 docs/qdev-device-use.txt | 4 ++--
 qemu-options.hx          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/bootindex.txt b/docs/bootindex.txt
index b9a8ba1..6937862 100644
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
index b059405..caf779b 100644
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
index f68829f..37147b3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -224,7 +224,7 @@ STEXI
 Set default value of @var{driver}'s property @var{prop} to @var{value}, e.g.:
 
 @example
-qemu-system-i386 -global ide-drive.physical_block_size=4096 -drive file=file,if=ide,index=0,media=disk
+qemu-system-i386 -global ide-hd.physical_block_size=4096 disk-image.img
 @end example
 
 In particular, you can use this to set driver properties for devices which are 
-- 
2.7.4


