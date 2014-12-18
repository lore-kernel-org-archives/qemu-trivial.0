Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y1Rvv-00012l-Tb
	for mharc-qemu-trivial@gnu.org; Wed, 17 Dec 2014 22:39:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y1OyF-0006u8-U0
	for qemu-trivial@nongnu.org; Wed, 17 Dec 2014 19:29:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y1OyA-0007OY-RZ
	for qemu-trivial@nongnu.org; Wed, 17 Dec 2014 19:29:35 -0500
Received: from fofx.invlim.com ([71.6.153.225]:49914)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>)
	id 1Y1Oy0-0007Ih-EV; Wed, 17 Dec 2014 19:29:20 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by fofx.invlim.com (Postfix) with ESMTP id 1E74E248288;
	Wed, 17 Dec 2014 16:19:49 -0800 (PST)
X-Virus-Scanned: amavisd-new at example.com
Received: from fofx.invlim.com ([127.0.0.1])
	by localhost (fofx.invlim.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zkVznf3SRo5k; Wed, 17 Dec 2014 16:19:47 -0800 (PST)
Received: from monster337-linux.localdomain (unknown [10.240.0.46])
	by fofx.invlim.com (Postfix) with ESMTP id 7BB4A24827F;
	Wed, 17 Dec 2014 16:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=invlim.com;
	s=default; t=1418861987;
	bh=t4z1nOzs9MNkiibX1p4opVRqPiQT+wVVCfg0gWzSY6Q=;
	h=From:To:Cc:Subject:Date;
	b=Hiw89tJ1rlwHqSqHh8CfnybQNI+tIx7xGq5L4mU8OTCLiK2GT8XCcJhEJCTSOWGf4
	fh+aeHzQwQ0Hf1VbjU0iqIxv4iP0derqgjbf5hlAxmfaOtgTtJakK5ULqFebJtRK08
	LkjLIWaM0CCKm9Kd1y/BF/fQejqEDeMJ4+sAoFnc=
From: David Morrison <dmorrison@invlim.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	proljc@gmail.com
Date: Wed, 17 Dec 2014 16:26:33 -0800
Message-Id: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
X-Mailer: git-send-email 2.1.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 71.6.153.225
X-Mailman-Approved-At: Wed, 17 Dec 2014 22:39:22 -0500
Cc: David Morrison <dmorrison@invlim.com>
Subject: [Qemu-trivial] [PATCH] target-openrisc: bugfixes for debugging with
	GDB+Qemu on OpenRISC
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
X-List-Received-Date: Thu, 18 Dec 2014 00:29:41 -0000

This patch fixes two bugs in Qemu for OpenRISC, and enables more
functionality from or1k-elf-gdb:

1) Fixed the decoding of "system" instructions (starting with 0x2)
in dec_sys() in translate.c.  In particular, the l.trap instruction
is now correctly decoded, which enables for singlestepping and
breakpoints to be set in GDB.

2) Fixed a memory read error when debugging kernels inside Qemu and
the OpenRISC MMU is enabled

Signed-off-by: David R. Morrison <dmorrison@invlim.com>
---
 target-openrisc/cpu.h       | 1 +
 target-openrisc/mmu.c       | 2 +-
 target-openrisc/translate.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
index 69b96c6..6b08af6 100644
--- a/target-openrisc/cpu.h
+++ b/target-openrisc/cpu.h
@@ -20,6 +20,7 @@
 #ifndef CPU_OPENRISC_H
 #define CPU_OPENRISC_H
 
+#define TARGET_HAS_ICE 
 #define TARGET_LONG_BITS 32
 #define ELF_MACHINE    EM_OPENRISC
 
diff --git a/target-openrisc/mmu.c b/target-openrisc/mmu.c
index 750a936..bbd05f1 100644
--- a/target-openrisc/mmu.c
+++ b/target-openrisc/mmu.c
@@ -219,7 +219,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     hwaddr phys_addr;
     int prot;
 
-    if (cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0)) {
+    if (cpu_openrisc_get_phys_nommu(cpu, &phys_addr, &prot, addr, 0)) {
         return -1;
     }
 
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 407bd97..d36278f 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
 #ifdef OPENRISC_DISAS
     uint32_t K16;
 #endif
-    op0 = extract32(insn, 16, 8);
+    op0 = extract32(insn, 16, 10);
 #ifdef OPENRISC_DISAS
     K16 = extract32(insn, 0, 16);
 #endif
-- 
2.1.3


