Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPoda-0000bq-KE
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 08:03:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPodY-0000Xi-2q
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 08:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPodW-0004g1-OI
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 08:03:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44107)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPod3-000463-Tf; Thu, 22 Nov 2018 08:02:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5830230C53B8;
	Thu, 22 Nov 2018 13:02:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-181.ams2.redhat.com [10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3ECA25D763;
	Thu, 22 Nov 2018 13:02:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>,
	Stefan Markovic <smarkovic@wavecomp.com>,
	Paul Burton <pburton@wavecomp.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Date: Thu, 22 Nov 2018 14:02:40 +0100
Message-Id: <1542891760-13937-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 22 Nov 2018 13:02:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add missing hw/pci-host entries
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
X-List-Received-Date: Thu, 22 Nov 2018 13:03:17 -0000

Bonito belongs to Fulong-2E, Sabre belongs to Sun4u, and Mac-Newworld
and Mips-Boston were missing the header files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6522621..46a5581 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -876,7 +876,7 @@ R: Stefan Markovic <smarkovic@wavecomp.com>
 S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 F: hw/isa/vt82c686.c
-
+F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
 
 Boston
@@ -886,6 +886,7 @@ S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
 F: hw/pci-host/xilinx-pcie.c
+F: include/hw/pci-host/xilinx-pcie.h
 
 OpenRISC Machines
 -----------------
@@ -938,6 +939,7 @@ F: hw/nvram/mac_nvram.c
 F: include/hw/misc/macio/
 F: include/hw/misc/mos6522.h
 F: include/hw/ppc/mac_dbdma.h
+F: include/hw/pci-host/uninorth.h
 
 Old World
 M: David Gibson <david@gibson.dropbear.id.au>
@@ -1029,6 +1031,8 @@ M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc64/sun4u.c
 F: pc-bios/openbios-sparc64
+F: hw/pci-host/sabre.c
+F: include/hw/pci-host/sabre.h
 
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
-- 
1.8.3.1


