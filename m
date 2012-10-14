Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNULN-00007g-6w
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 15:59:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNULK-0008Ps-BK
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 15:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNULJ-0002EJ-Da
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 15:59:22 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNULG-0002B9-QR; Sun, 14 Oct 2012 15:59:18 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2850165lbb.4
	for <multiple recipients>; Sun, 14 Oct 2012 12:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HwU7ABK+DKHUjCWvo6nraEJjnDQDngUfcRp5vjDxvsQ=;
	b=mJiUJI4tMRkLuuEzwjh+FHtDtgICbJLWmGML0G42ShpSOiEMti67zouX9pjqOLnXdo
	6Ica+nB5umUDClUnOdXQZqZ3aCrSeRCUkbTmpGwa0uiaQjN8DAjBgWc12KpS0Cm5ntoT
	cR36UTHaKp+7qV+JdvaoRNRRvGfeIGGihORBolhm9YMRMsUkZDGe9uzcQ1M2COX2RScy
	ByX+PVzq/JORlEUISgo0cpVHY7BON/Zv4Lvr2dJ4Nfc19aqxI8mosAVh8ShFCDWdH13W
	7qA+0ndaHQvdSO4evU+ZuXFfrE3eE6J3nkCSq/dOmsmVspCr4dVGJ9OThpBlJ5pV6k+c
	wicw==
Received: by 10.152.104.240 with SMTP id gh16mr8374796lab.56.1350244758135;
	Sun, 14 Oct 2012 12:59:18 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.12.59.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 12:59:17 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:49 +0000
Message-Id: <f81dd96e31a1c61b75f157247551c3feb4fb3c38.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH 01/11] target-sparc: make do_unaligned_access
	static
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
X-List-Received-Date: Sun, 14 Oct 2012 19:59:23 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 target-sparc/cpu.h         |    3 ---
 target-sparc/ldst_helper.c |    8 ++++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index 214d01d..b4eda18 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -711,9 +711,6 @@ uint64_t cpu_tick_get_count(CPUTimer *timer);
 void cpu_tick_set_limit(CPUTimer *timer, uint64_t limit);
 trap_state* cpu_tsptr(CPUSPARCState* env);
 #endif
-void QEMU_NORETURN do_unaligned_access(CPUSPARCState *env, target_ulong addr,
-                                       int is_write, int is_user,
-                                       uintptr_t retaddr);
 void cpu_restore_state2(CPUSPARCState *env, uintptr_t retaddr);
 
 #define TB_FLAG_FPU_ENABLED (1 << 4)
diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
index 2ca9a5c..795b0bd 100644
--- a/target-sparc/ldst_helper.c
+++ b/target-sparc/ldst_helper.c
@@ -65,6 +65,9 @@
 #define QT1 (env->qt1)
 
 #if !defined(CONFIG_USER_ONLY)
+static void QEMU_NORETURN do_unaligned_access(CPUSPARCState *env,
+                                              target_ulong addr, int is_write,
+                                              int is_user, uintptr_t retaddr);
 #include "softmmu_exec.h"
 #define MMUSUFFIX _mmu
 #define ALIGNED_ONLY
@@ -2407,8 +2410,9 @@ void cpu_restore_state2(CPUSPARCState *env, uintptr_t retaddr)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void do_unaligned_access(CPUSPARCState *env, target_ulong addr, int is_write,
-                         int is_user, uintptr_t retaddr)
+static void QEMU_NORETURN do_unaligned_access(CPUSPARCState *env,
+                                              target_ulong addr, int is_write,
+                                              int is_user, uintptr_t retaddr)
 {
 #ifdef DEBUG_UNALIGNED
     printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-- 
1.7.2.5


