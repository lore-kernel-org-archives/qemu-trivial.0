Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Sip-00031G-Ra
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sin-0002yq-5a
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sim-0004QI-90
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Sig-0004OP-8O; Sun, 05 Jun 2016 03:43:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2E0B740911;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A18E0ADC;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: (nullmailer pid 1109 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:47 +0300
Message-Id: <28ac318783b583d7f0f8a773002e941089ecc806.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/52] The only 64bit parameter of muldiv64()
 is the first one.
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
X-List-Received-Date: Sun, 05 Jun 2016 07:43:46 -0000

From: Laurent Vivier <lvivier@redhat.com>

muldiv64() is "uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)"

Some time it is used as muldiv64(uint32_t a, uint64_t b, uint32_t c)"

This patch is the result of coccinelle script
scripts/coccinelle/swap_muldiv64.cocci to reorder arguments.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/omap_gptimer.c | 4 ++--
 hw/usb/hcd-ohci.c       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index 3a43863..5e3e8a6 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -133,8 +133,8 @@ static inline void omap_gp_timer_update(struct omap_gp_timer_s *timer)
         timer_mod(timer->timer, timer->time + expires);
 
         if (timer->ce && timer->match_val >= timer->val) {
-            matches = muldiv64(timer->match_val - timer->val,
-                            timer->ticks_per_sec, timer->rate);
+            matches = muldiv64(timer->ticks_per_sec,
+                               timer->match_val - timer->val, timer->rate);
             timer_mod(timer->match, timer->time + matches);
         } else
             timer_del(timer->match);
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 16d9ff7..25cc53f 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1474,7 +1474,7 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     if (tks >= usb_frame_time)
         return (ohci->frt << 31);
 
-    tks = muldiv64(1, tks, usb_bit_time);
+    tks = muldiv64(tks, 1, usb_bit_time);
     fr = (uint16_t)(ohci->fi - tks);
 
     return (ohci->frt << 31) | fr;
-- 
2.1.4


