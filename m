Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5LJ-000137-Gm
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:14:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5LE-0000xE-4O
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L8-0000zQ-EP
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5L5-0000x5-JK; Wed, 14 Sep 2016 04:14:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 101AB4184A;
	Wed, 14 Sep 2016 11:14:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9299CAAB;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17331 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:36 +0300
Message-Id: <53c4e2465b9cc017337b72611f4c321e628a16c9.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/27] MAINTAINERS: Fix up F: entry bit rot
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
X-List-Received-Date: Wed, 14 Sep 2016 08:14:52 -0000

From: Markus Armbruster <armbru@redhat.com>

include/hw/xilinx.h is gone since commit d5001cf, drop.

include/hw/*/xlnx*.c is a typo, change .c to .h.

include/hw/acpi/piix.h is a typo, change piix.h to piix4.h.

hw/i386/*dsl and scripts/acpi*py are gone since since commit 9fc6502,
drop.

hw/virtio/dataplane/* are gone since commit fee089e, drop.

ICC Bus is gone since commit dfeb867, drop.

block/raw-aio.h was moved to include/block/raw-aio.h in commit
0187f5c, update.

Tracked down with

    for i in `grep "^[FX]: " MAINTAINERS | sed "s/^.: //"`
    do if [ ! -e "$i" ]; then echo "$i"; fi
    done

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2dcb58b..eb723fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -460,7 +460,6 @@ S: Maintained
 F: hw/*/xilinx_*
 F: hw/*/cadence_*
 F: hw/misc/zynq_slcr.c
-F: include/hw/xilinx.h
 X: hw/ssi/xilinx_*
 
 Xilinx ZynqMP
@@ -469,7 +468,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/xlnx*.c
-F: include/hw/*/xlnx*.c
+F: include/hw/*/xlnx*.h
 
 ARM ACPI Subsystem
 M: Shannon Zhao <zhaoshenglong@huawei.com>
@@ -699,7 +698,7 @@ F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
 F: hw/acpi/ich9.c
 F: include/hw/acpi/ich9.h
-F: include/hw/acpi/piix.h
+F: include/hw/acpi/piix4.h
 F: hw/misc/sga.c
 
 PC Chipset
@@ -805,10 +804,8 @@ F: hw/mem/*
 F: hw/acpi/*
 F: hw/smbios/*
 F: hw/i386/acpi-build.[hc]
-F: hw/i386/*dsl
 F: hw/arm/virt-acpi-build.c
 F: include/hw/arm/virt-acpi-build.h
-F: scripts/acpi*py
 
 ppc4xx
 M: Alexander Graf <agraf@suse.de>
@@ -910,7 +907,6 @@ L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/virtio-blk.c
 F: hw/block/dataplane/*
-F: hw/virtio/dataplane/*
 T: git git://github.com/stefanha/qemu.git block
 
 virtio-ccw
@@ -1072,12 +1068,6 @@ S: Supported
 F: qom/cpu.c
 F: include/qom/cpu.h
 
-ICC Bus
-M: Igor Mammedov <imammedo@redhat.com>
-S: Supported
-F: include/hw/cpu/icc_bus.h
-F: hw/cpu/icc_bus.c
-
 Device Tree
 M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 M: Alexander Graf <agraf@suse.de>
@@ -1588,7 +1578,7 @@ M: Kevin Wolf <kwolf@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/linux-aio.c
-F: block/raw-aio.h
+F: include/block/raw-aio.h
 F: block/raw-posix.c
 F: block/raw-win32.c
 F: block/raw_bsd.c
-- 
2.1.4


