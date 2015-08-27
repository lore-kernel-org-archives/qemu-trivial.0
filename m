Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZV2vN-0006th-1w
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2015 15:33:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZV2vK-0006n5-2D
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 15:33:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZV2vE-0007y3-Oy
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 15:33:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZV2vB-0007vN-GR; Thu, 27 Aug 2015 15:33:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3AE0D8EA26;
	Thu, 27 Aug 2015 19:33:13 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-7-222.ams2.redhat.com [10.36.7.222])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t7RJX7Zi024823; Thu, 27 Aug 2015 15:33:11 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Date: Thu, 27 Aug 2015 21:32:59 +0200
Message-Id: <1440703987-29012-2-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v3 1/9] i6300esb: remove muldiv64()
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
X-List-Received-Date: Thu, 27 Aug 2015 19:33:24 -0000

Originally, timers were ticks based, and it made sense to
add ticks to current time to know when to trigger an alarm.

But since commit:

7447545 change all other clock references to use nanosecond resolution accessors

All timers use nanoseconds and we need to convert ticks to nanoseconds, by
doing something like:

    y = muldiv64(x, get_ticks_per_sec(), PCI_FREQUENCY)

where x is the number of device ticks and y the number of system ticks.

y is used as nanoseconds in timer functions,
it works because 1 tick is 1 nanosecond.
(get_ticks_per_sec() is 10^9)

But as PCI frequency is 33 MHz, we can also do:

    y = x * 30; /* 33 MHz PCI period is 30 ns */

Which is much more simple.

This implies a 33.333333 MHz PCI frequency,
but this is correct.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
v3: part of "PCI: remove muldiv64()"
 hw/watchdog/wdt_i6300esb.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index cfa2b1b..a91c8fd 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -129,14 +129,9 @@ static void i6300esb_restart_timer(I6300State *d, int stage)
     else
         timeout <<= 5;
 
-    /* Get the timeout in units of ticks_per_sec.
-     *
-     * ticks_per_sec is typically 10^9 == 0x3B9ACA00 (30 bits), with
-     * 20 bits of user supplied preload, and 15 bits of scale, the
-     * multiply here can exceed 64-bits, before we divide by 33MHz, so
-     * we use a higher-precision intermediate result.
-     */
-    timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
+    /* Get the timeout in nanoseconds. */
+
+    timeout = timeout * 30; /* on a PCI bus, 1 tick is 30 ns*/
 
     i6300esb_debug("stage %d, timeout %" PRIi64 "\n", d->stage, timeout);
 
-- 
2.1.0


