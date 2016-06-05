Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TJU-0003ix-4S
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:21:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJS-0003gl-3K
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJQ-0004Wy-6S
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9TJK-0004Vh-08; Sun, 05 Jun 2016 04:21:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D7E56408D7;
	Sun,  5 Jun 2016 11:21:25 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B8C46AE0;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: (nullmailer pid 1115 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:50 +0300
Message-Id: <63c63cfb6e3abb973afe38178dde319a65d60201.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/52] ppc: Remove a potential overflow in
 muldiv64()
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
X-List-Received-Date: Sun, 05 Jun 2016 08:21:39 -0000

From: Laurent Vivier <lvivier@redhat.com>

The coccinelle script:
scripts/coccinelle/overflow_muldiv64.cocci
gives us a list of potential overflows in muldiv64()
(the two first parameters are 64bit values).

This patch fixes one, as the fix seems obvious:

replace muldiv64(a, b, c) by muldiv64(b, a, c)
as "a" and "b" are 64bit values but a <= NANOSECONDS_PER_SECOND.
(10^9 -> 30bit value).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/ppc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index cdf9f25..1bcf740 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -880,7 +880,7 @@ static int timebase_post_load(void *opaque, int version_id)
     host_ns = qemu_clock_get_ns(QEMU_CLOCK_HOST);
     ns_diff = MAX(0, host_ns - tb_remote->time_of_the_day_ns);
     migration_duration_ns = MIN(NANOSECONDS_PER_SECOND, ns_diff);
-    migration_duration_tb = muldiv64(migration_duration_ns, freq,
+    migration_duration_tb = muldiv64(freq, migration_duration_ns,
                                      NANOSECONDS_PER_SECOND);
     guest_tb = tb_remote->guest_timebase + MIN(0, migration_duration_tb);
 
-- 
2.1.4


