Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axwUX-0002et-KX
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 09:05:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1axwUO-0002Eu-8q
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 09:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1axwU4-0004TC-WD
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 09:05:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1axwTm-0004JK-Lw; Wed, 04 May 2016 09:04:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C78883F45;
	Wed,  4 May 2016 13:04:22 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u44D4Fab002315; Wed, 4 May 2016 09:04:20 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Date: Wed,  4 May 2016 15:04:07 +0200
Message-Id: <1462367048-20997-3-git-send-email-lvivier@redhat.com>
In-Reply-To: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
References: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/3] The only 64bit parameter of muldiv64()
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
X-List-Received-Date: Wed, 04 May 2016 13:05:23 -0000

muldiv64() is "uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)"

Some time it is used as muldiv64(uint32_t a, uint64_t b, uint32_t c)"

This patch is the result of coccinelle script
scripts/coccinelle/swap_muldiv64.cocci to reorder arguments.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
index ffab561..e5b535f 100644
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
2.5.5


