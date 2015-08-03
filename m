Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBqF-00061u-8E
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpz-0005Xh-KS
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpt-0003Mt-IA
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from mail-wi0-f178.google.com ([209.85.212.178]:32903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpt-0003MU-20
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:09 -0400
Received: by wicmv11 with SMTP id mv11so127066951wic.0
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=zmg7jd/nj12V2HWR5v14tLkt9q/jEgO8DX8LZiW687w=;
	b=ctDAaMRo+wHZEUsZPaOovBcVVt2+xgk4GbJ+SPqX49mN+K5yOKmioT0eB/B26nQlh3
	cRnwCyAa8kx5tXo75eFr0Y1eiVUIVkjrI+fqE59INrD9WoGJKm1tBCU4mOoZF5PiSrOE
	5cvRzknERSUFfSppeS/zIdQKu/XEKppdHHaEEYx5813gUKXwucmSYuwnywZQrChGWycA
	E7MFCrVj85J+VvAhVdVShF349TumRAwh2BJy5mjCDQmiIRsqdecblpPJXGYG3TBqL3Qm
	bgHIOiH57OOxhtB8xLAHeEO3ct1V56C+MRVuV8yw8ommOpwKeciLCwWihV/aP250Cqpf
	srBg==
X-Gm-Message-State: ALoCoQlEOdNq2xvVgClUG8eJvppTvwY59QYIIBE9WCF+SuopEBXSJY3P4XMEkdRcSDf3Epw08Eeh
X-Received: by 10.180.74.115 with SMTP id s19mr30623204wiv.18.1438593308493;
	Mon, 03 Aug 2015 02:15:08 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	ft5sm12549325wib.4.2015.08.03.02.15.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 069433E08F1;
	Mon,  3 Aug 2015 10:15:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:51 +0100
Message-Id: <1438593291-27109-12-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.178
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 11/11] cputlb: modernise the debug support
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:22 -0000

To avoid cluttering the code with #ifdef legs we wrap up the print
statements into a tlb_debug() macro. As access to the virtual TLB can
get quite heavy defining DEBUG_TLB_LOG will ensure all the logs go to
the qemu_log target of CPU_LOG_MMU instead of stderr.

I've also removed DEBUG_TLB_CHECK which wasn't used.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - ensure the compiler checks format strings even if debug is optimised out
---
 cputlb.c | 54 +++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index a506086..7095e6f 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -30,8 +30,30 @@
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
 
-//#define DEBUG_TLB
-//#define DEBUG_TLB_CHECK
+/* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
+/* #define DEBUG_TLB */
+/* #define DEBUG_TLB_LOG */
+
+#ifdef DEBUG_TLB
+# define DEBUG_TLB_GATE 1
+# ifdef DEBUG_TLB_LOG
+#  define DEBUG_TLB_LOG_GATE 1
+# else
+#  define DEBUG_TLB_LOG_GATE 0
+# endif
+#else
+# define DEBUG_TLB_GATE 0
+# define DEBUG_TLB_LOG_GATE 0
+#endif
+
+#define tlb_debug(fmt, ...) do { \
+    if (DEBUG_TLB_LOG_GATE) { \
+        qemu_log_mask(CPU_LOG_MMU, "%s: " fmt, __func__, \
+                      ## __VA_ARGS__); \
+    } else if (DEBUG_TLB_GATE) { \
+        fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__); \
+    } \
+} while (0)
 
 /* statistics */
 int tlb_flush_count;
@@ -52,9 +74,8 @@ void tlb_flush(CPUState *cpu, int flush_global)
 {
     CPUArchState *env = cpu->env_ptr;
 
-#if defined(DEBUG_TLB)
-    printf("tlb_flush:\n");
-#endif
+    tlb_debug("(%d)\n", flush_global);
+
     /* must reset current TB so that interrupts cannot modify the
        links while we are modifying them */
     cpu->current_tb = NULL;
@@ -87,16 +108,14 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr)
     int i;
     int mmu_idx;
 
-#if defined(DEBUG_TLB)
-    printf("tlb_flush_page: " TARGET_FMT_lx "\n", addr);
-#endif
+    tlb_debug("page :" TARGET_FMT_lx "\n", addr);
+
     /* Check if we need to flush due to large pages.  */
     if ((addr & env->tlb_flush_mask) == env->tlb_flush_addr) {
-#if defined(DEBUG_TLB)
-        printf("tlb_flush_page: forced full flush ("
-               TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
-               env->tlb_flush_addr, env->tlb_flush_mask);
-#endif
+        tlb_debug("forcing full flush ("
+                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
+                  env->tlb_flush_addr, env->tlb_flush_mask);
+
         tlb_flush(cpu, 1);
         return;
     }
@@ -271,12 +290,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     section = address_space_translate_for_iotlb(cpu, paddr, &xlat, &sz);
     assert(sz >= TARGET_PAGE_SIZE);
 
-#if defined(DEBUG_TLB)
-    qemu_log_mask(CPU_LOG_MMU,
-           "tlb_set_page: vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
-           " prot=%x idx=%d\n",
-           vaddr, paddr, prot, mmu_idx);
-#endif
+    tlb_debug("tlb_set_page: vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
+              " prot=%x idx=%d\n",
+              vaddr, paddr, prot, mmu_idx);
 
     address = vaddr;
     if (!memory_region_is_ram(section->mr) && !memory_region_is_romd(section->mr)) {
-- 
2.5.0


