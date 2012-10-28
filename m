Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgI-0002MQ-Ch
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgF-0002Df-A5
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgD-0007vs-Ux
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:23 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:41861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQgA-0007vF-9S; Sun, 28 Oct 2012 07:05:18 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so3144895lah.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PYoddt/2gM20c7aGxbLsdZINMHycAzeaaXgUYaVkqeQ=;
	b=nBTSzbjjiOCOkSWQ40GwfbiXWpPRRk29euFwnfKnfFAuD3UxAPGMFJPqIS4FKlYCZk
	aEznjckkKy67uFAfNO0+xt94aNTvZXAtVVDnfoNpEiyU7PDRmZdtCpwp+UtWuOWyFLRp
	VemLlDRTEnKB6fVkO1v30KtaWyFTVdn/9oI7FDgUf/DAhvrLorvWs4fT7yiA+5WVbjRx
	xKYixXA3kuF6UpQ8lym5GEwbRq1imV6KWyKj1JdOirdQRZwY0MvGJaxzGBc7htgeSvS9
	mr3Peutky1DrazHkIvj7/JxXiIi1m4dcZ4066zAW4pec2qpDl+UO4RE3m8P2GExYj+8T
	F9dQ==
Received: by 10.152.106.110 with SMTP id gt14mr24312662lab.1.1351422317007;
	Sun, 28 Oct 2012 04:05:17 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:16 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:46 +0000
Message-Id: <12c4e70fd90fae884afbf715c498e42e47928831.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH v2 1/6] target-sparc: make
	do_unaligned_access static
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
X-List-Received-Date: Sun, 28 Oct 2012 11:05:25 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 target-sparc/cpu.h         |    3 ---
 target-sparc/ldst_helper.c |    8 ++++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index a55fe08..7c689ee 100644
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
index 356144a..f3e08fd 100644
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


