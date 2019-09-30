Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iEzCO-0001d2-9f
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2019 13:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iEzCL-0001aj-PV
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2019 13:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iEzCK-0005XQ-Lc
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2019 13:10:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19433)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iEzCG-0005VB-7V; Mon, 30 Sep 2019 13:10:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 049CE20F7;
 Mon, 30 Sep 2019 17:10:51 +0000 (UTC)
Received: from thuth.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF2F5C223;
 Mon, 30 Sep 2019 17:10:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Cc: qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] target/sparc: Remove old TODO file
Date: Mon, 30 Sep 2019 19:10:44 +0200
Message-Id: <20190930171044.25312-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 30 Sep 2019 17:10:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2019 17:10:59 -0000

This file hasn't seen a real (non-trivial) update since 2008 anymore,
so we can assume that it is pretty much out of date and nobody cares
for it anymore. Let's simply remove it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/sparc/TODO | 88 -----------------------------------------------
 1 file changed, 88 deletions(-)
 delete mode 100644 target/sparc/TODO

diff --git a/target/sparc/TODO b/target/sparc/TODO
deleted file mode 100644
index b8c727e858..0000000000
--- a/target/sparc/TODO
+++ /dev/null
@@ -1,88 +0,0 @@
-TODO-list:
-
-CPU common:
-- Unimplemented features/bugs:
- - Delay slot handling may fail sometimes (branch end of page, delay
- slot next page)
- - Atomical instructions
- - CPU features should match real CPUs (also ASI selection)
-- Optimizations/improvements:
- - Condition code/branch handling like x86, also for FPU?
- - Remove remaining explicit alignment checks
- - Global register for regwptr, so that windowed registers can be
- accessed directly
- - Improve Sparc32plus addressing
- - NPC/PC static optimisations (use JUMP_TB when possible)? (Is this
- obsolete?)
- - Synthetic instructions
- - MMU model dependent on CPU model
- - Select ASI helper at translation time (on V9 only if known)
- - KQemu/KVM support for VM only
- - Hardware breakpoint/watchpoint support
- - Cache emulation mode
- - Reverse-endian pages
- - Faster FPU emulation
- - Busy loop detection
-
-Sparc32 CPUs:
-- Unimplemented features/bugs:
- - Sun4/Sun4c MMUs
- - Some V8 ASIs
-
-Sparc64 CPUs:
-- Unimplemented features/bugs:
- - Interrupt handling
- - Secondary address space, other MMU functions
- - Many V9/UA2005/UA2007 ASIs
- - Rest of V9 instructions, missing VIS instructions
- - IG/MG/AG vs. UA2007 globals
- - Full hypervisor support
- - SMP/CMT
- - Sun4v CPUs
-
-Sun4:
-- To be added
-
-Sun4c:
-- A lot of unimplemented features
-- Maybe split from Sun4m
-
-Sun4m:
-- Unimplemented features/bugs:
- - Hardware devices do not match real boards
- - Floppy does not work
- - CS4231: merge with cs4231a, add DMA
- - Add cg6, bwtwo
- - Arbitrary resolution support
- - PCI for MicroSparc-IIe
- - JavaStation machines
- - SBus slot probing, FCode ROM support
- - SMP probing support
- - Interrupt routing does not match real HW
- - SuSE 7.3 keyboard sometimes unresponsive
- - Gentoo 2004.1 SMP does not work
- - SS600MP ledma -> lebuffer
- - Type 5 keyboard
- - Less fixed hardware choices
- - DBRI audio (Am7930)
- - BPP parallel
- - Diagnostic switch
- - ESP PIO mode
-
-Sun4d:
-- A lot of unimplemented features:
- - SBI
- - IO-unit
-- Maybe split from Sun4m
-
-Sun4u:
-- Unimplemented features/bugs:
- - Interrupt controller
- - PCI/IOMMU support (Simba, JIO, Tomatillo, Psycho, Schizo, Safari...)
- - SMP
- - Happy Meal Ethernet, flash, I2C, GPIO
- - A lot of real machine types
-
-Sun4v:
-- A lot of unimplemented features
- - A lot of real machine types
-- 
2.18.1


