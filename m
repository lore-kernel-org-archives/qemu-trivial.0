Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMOz-0005e4-VN
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOv-0005Uv-0l
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOu-00027A-5d
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMOq-00022h-D0; Fri, 11 Sep 2015 07:21:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 12D574143D;
	Fri, 11 Sep 2015 14:21:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 06142A66;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22758 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:27 +0300
Message-Id: <fee562e9e41290a22623de83b673a8929ec5280d.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/26] i6300esb: fix timer overflow
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
X-List-Received-Date: Fri, 11 Sep 2015 11:21:54 -0000

From: Laurent Vivier <lvivier@redhat.com>

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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


