Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbtC-0000Zf-0H
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 09:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZMXZg-0001gb-RV
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 04:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZMXZf-0002If-VI
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 04:27:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZMXZb-0002Gh-C0; Tue, 04 Aug 2015 04:27:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 8BEDFA4A1B;
	Tue,  4 Aug 2015 08:27:46 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-188.ams2.redhat.com [10.36.5.188])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t748RgZp006065; Tue, 4 Aug 2015 04:27:43 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  4 Aug 2015 10:27:31 +0200
Message-Id: <1438676851-10684-1-git-send-email-lvivier@redhat.com>
In-Reply-To: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
References: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 04 Aug 2015 09:04:16 -0400
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH][TRIVIAL] i6300esb: fix timer overflow
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
X-List-Received-Date: Tue, 04 Aug 2015 08:27:54 -0000

We use muldiv64() to compute the time to wait:

    timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);

but get_ticks_per_sec() is 10^9 (30 bit value) and timeout
is a 35 bit value.

Whereas muldiv64 is:

    uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)

So we loose 3 bits of timeout.

Swapping get_ticks_per_sec() and timeout fixes it.

We can also replace it by a multiplication by 30 ns,
but this changes PCI clock frequency from 33MHz to 33.333333MHz
and we need to do this on all the QEMU PCI devices (later...)

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/watchdog/wdt_i6300esb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index cfa2b1b..3e07d44 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -136,7 +136,7 @@ static void i6300esb_restart_timer(I6300State *d, int stage)
      * multiply here can exceed 64-bits, before we divide by 33MHz, so
      * we use a higher-precision intermediate result.
      */
-    timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
+    timeout = muldiv64(timeout, get_ticks_per_sec(), 33000000);
 
     i6300esb_debug("stage %d, timeout %" PRIi64 "\n", d->stage, timeout);
 
-- 
2.1.0


