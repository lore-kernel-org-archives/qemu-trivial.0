Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bgt1N-000252-V9
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2016 08:29:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bgt1K-00022r-VW
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 08:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bgt1J-00007a-Tt
	for qemu-trivial@nongnu.org; Mon, 05 Sep 2016 08:29:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bgt1E-00005q-7j; Mon, 05 Sep 2016 08:28:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBE5883F46;
	Mon,  5 Sep 2016 12:28:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u85CSrU4020838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 5 Sep 2016 08:28:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A64DF113300D; Mon,  5 Sep 2016 14:28:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, stefanha@redhat.com, qemu-trivial@nongnu.org
Date: Mon,  5 Sep 2016 14:28:52 +0200
Message-Id: <1473078532-3331-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 05 Sep 2016 12:28:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Fix up F: entry bit rot
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
X-List-Received-Date: Mon, 05 Sep 2016 12:29:04 -0000

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
---
Note: this supersedes Thomas's "[PATCH] virtio-blk: Remove
hw/virtio/dataplane folder from MAINTAINERS file".

 MAINTAINERS | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b6fb84e..66aa69d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -456,7 +456,6 @@ S: Maintained
 F: hw/*/xilinx_*
 F: hw/*/cadence_*
 F: hw/misc/zynq_slcr.c
-F: include/hw/xilinx.h
 X: hw/ssi/xilinx_*
 
 Xilinx ZynqMP
@@ -465,7 +464,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/xlnx*.c
-F: include/hw/*/xlnx*.c
+F: include/hw/*/xlnx*.h
 
 ARM ACPI Subsystem
 M: Shannon Zhao <zhaoshenglong@huawei.com>
@@ -695,7 +694,7 @@ F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
 F: hw/acpi/ich9.c
 F: include/hw/acpi/ich9.h
-F: include/hw/acpi/piix.h
+F: include/hw/acpi/piix4.h
 F: hw/misc/sga.c
 
 PC Chipset
@@ -797,10 +796,8 @@ F: hw/mem/*
 F: hw/acpi/*
 F: hw/smbios/*
 F: hw/i386/acpi-build.[hc]
-F: hw/i386/*dsl
 F: hw/arm/virt-acpi-build.c
 F: include/hw/arm/virt-acpi-build.h
-F: scripts/acpi*py
 
 ppc4xx
 M: Alexander Graf <agraf@suse.de>
@@ -902,7 +899,6 @@ L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/virtio-blk.c
 F: hw/block/dataplane/*
-F: hw/virtio/dataplane/*
 T: git git://github.com/stefanha/qemu.git block
 
 virtio-ccw
@@ -1064,12 +1060,6 @@ S: Supported
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
@@ -1580,7 +1570,7 @@ M: Kevin Wolf <kwolf@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/linux-aio.c
-F: block/raw-aio.h
+F: include/block/raw-aio.h
 F: block/raw-posix.c
 F: block/raw-win32.c
 F: block/raw_bsd.c
-- 
2.5.5


