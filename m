Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqwu-0005Ni-IG
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwl-00059n-OQ
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwf-0000zV-0T
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqwO-0000ov-KB; Fri, 08 Aug 2014 16:39:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5D2B041A19;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 235336D3;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: (nullmailer pid 10310 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:54 +0400
Message-Id: <1407530342-10259-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 1/9] hw/timer/imx_*: fix TIMER_MAX clash with
	system symbol
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
X-List-Received-Date: Fri, 08 Aug 2014 20:39:38 -0000

The symbol TIMER_MAX used in imx_epit.c and imx_gpt.c
clashes with system symbol with the same name.  Because
all qemu source files includes qemu-common.h which, in
turn, includes limits.h, which is not unusual to define
it.  Rename local symbol to have a reasonable prefix.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/imx_epit.c |   16 ++++++++--------
 hw/timer/imx_gpt.c  |   32 ++++++++++++++++----------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index c855eba..ffefc22 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -83,7 +83,7 @@ static char const *imx_epit_reg_name(uint32_t reg)
 #define CR_CLKSRC_SHIFT (24)
 #define CR_CLKSRC_MASK  (0x3 << CR_CLKSRC_SHIFT)
 
-#define TIMER_MAX  0XFFFFFFFFUL
+#define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
 /*
  * Exact clock frequencies vary from board to board.
@@ -155,7 +155,7 @@ static void imx_epit_reset(DeviceState *dev)
      */
     s->cr &= (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
     s->sr = 0;
-    s->lr = TIMER_MAX;
+    s->lr = EPIT_TIMER_MAX;
     s->cmp = 0;
     s->cnt = 0;
     /* stop both timers */
@@ -163,9 +163,9 @@ static void imx_epit_reset(DeviceState *dev)
     ptimer_stop(s->timer_reload);
     /* compute new frequency */
     imx_epit_set_freq(s);
-    /* init both timers to TIMER_MAX */
-    ptimer_set_limit(s->timer_cmp, TIMER_MAX, 1);
-    ptimer_set_limit(s->timer_reload, TIMER_MAX, 1);
+    /* init both timers to EPIT_TIMER_MAX */
+    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
+    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
     if (s->freq && (s->cr & CR_EN)) {
         /* if the timer is still enabled, restart it */
         ptimer_run(s->timer_reload, 0);
@@ -227,7 +227,7 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
             /* It'll fire in this round of the timer */
             next = tmp - s->cmp;
         } else { /* catch it next time around */
-            next = tmp - s->cmp + ((s->cr & CR_RLD) ? TIMER_MAX : s->lr);
+            next = tmp - s->cmp + ((s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->lr);
         }
         ptimer_set_count(s->timer_cmp, next);
     }
@@ -260,8 +260,8 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
                     ptimer_set_limit(s->timer_reload, s->lr, 1);
                     ptimer_set_limit(s->timer_cmp, s->lr, 1);
                 } else {
-                    ptimer_set_limit(s->timer_reload, TIMER_MAX, 1);
-                    ptimer_set_limit(s->timer_cmp, TIMER_MAX, 1);
+                    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
+                    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
                 }
             }
 
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 56ee4db..3b31010 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -80,11 +80,11 @@ static char const *imx_gpt_reg_name(uint32_t reg)
  * GPT : General purpose timer
  *
  * This timer counts up continuously while it is enabled, resetting itself
- * to 0 when it reaches TIMER_MAX (in freerun mode) or when it
+ * to 0 when it reaches GPT_TIMER_MAX (in freerun mode) or when it
  * reaches the value of one of the ocrX (in periodic mode).
  */
 
-#define TIMER_MAX  0XFFFFFFFFUL
+#define GPT_TIMER_MAX  0XFFFFFFFFUL
 
 /* Control register.  Not all of these bits have any effect (yet) */
 #define GPT_CR_EN     (1 << 0)  /* GPT Enable */
@@ -218,7 +218,7 @@ static inline uint32_t imx_gpt_find_limit(uint32_t count, uint32_t reg,
 
 static void imx_gpt_compute_next_timeout(IMXGPTState *s, bool event)
 {
-    uint32_t timeout = TIMER_MAX;
+    uint32_t timeout = GPT_TIMER_MAX;
     uint32_t count = 0;
     long long limit;
 
@@ -230,10 +230,10 @@ static void imx_gpt_compute_next_timeout(IMXGPTState *s, bool event)
     if (event) {
         /* This is a timer event  */
 
-        if ((s->cr & GPT_CR_FRR)  && (s->next_timeout != TIMER_MAX)) {
+        if ((s->cr & GPT_CR_FRR)  && (s->next_timeout != GPT_TIMER_MAX)) {
             /*
              * if we are in free running mode and we have not reached
-             * the TIMER_MAX limit, then update the count
+             * the GPT_TIMER_MAX limit, then update the count
              */
             count = imx_gpt_update_count(s);
         }
@@ -267,7 +267,7 @@ static void imx_gpt_compute_next_timeout(IMXGPTState *s, bool event)
     if ((s->ir & GPT_IR_OF3IE) && (timeout == s->ocr3)) {
         s->next_int |= GPT_SR_OF3;
     }
-    if ((s->ir & GPT_IR_ROVIE) && (timeout == TIMER_MAX)) {
+    if ((s->ir & GPT_IR_ROVIE) && (timeout == GPT_TIMER_MAX)) {
         s->next_int |= GPT_SR_ROV;
     }
 
@@ -370,20 +370,20 @@ static void imx_gpt_reset(DeviceState *dev)
     s->pr = 0;
     s->ir = 0;
     s->cnt = 0;
-    s->ocr1 = TIMER_MAX;
-    s->ocr2 = TIMER_MAX;
-    s->ocr3 = TIMER_MAX;
+    s->ocr1 = GPT_TIMER_MAX;
+    s->ocr2 = GPT_TIMER_MAX;
+    s->ocr3 = GPT_TIMER_MAX;
     s->icr1 = 0;
     s->icr2 = 0;
 
-    s->next_timeout = TIMER_MAX;
+    s->next_timeout = GPT_TIMER_MAX;
     s->next_int = 0;
 
     /* compute new freq */
     imx_gpt_set_freq(s);
 
-    /* reset the limit to TIMER_MAX */
-    ptimer_set_limit(s->timer, TIMER_MAX, 1);
+    /* reset the limit to GPT_TIMER_MAX */
+    ptimer_set_limit(s->timer, GPT_TIMER_MAX, 1);
 
     /* if the timer is still enabled, restart it */
     if (s->freq && (s->cr & GPT_CR_EN)) {
@@ -415,8 +415,8 @@ static void imx_gpt_write(void *opaque, hwaddr offset, uint64_t value,
             if ((oldreg ^ s->cr) & GPT_CR_EN) {
                 if (s->cr & GPT_CR_EN) {
                     if (s->cr & GPT_CR_ENMOD) {
-                        s->next_timeout = TIMER_MAX;
-                        ptimer_set_count(s->timer, TIMER_MAX);
+                        s->next_timeout = GPT_TIMER_MAX;
+                        ptimer_set_count(s->timer, GPT_TIMER_MAX);
                         imx_gpt_compute_next_timeout(s, false);
                     }
                     ptimer_run(s->timer, 1);
@@ -451,8 +451,8 @@ static void imx_gpt_write(void *opaque, hwaddr offset, uint64_t value,
 
         /* In non-freerun mode, reset count when this register is written */
         if (!(s->cr & GPT_CR_FRR)) {
-            s->next_timeout = TIMER_MAX;
-            ptimer_set_limit(s->timer, TIMER_MAX, 1);
+            s->next_timeout = GPT_TIMER_MAX;
+            ptimer_set_limit(s->timer, GPT_TIMER_MAX, 1);
         }
 
         /* compute the new timeout */
-- 
1.7.10.4


