Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXnw-0005HX-QX
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:51:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnt-0005EU-US
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnt-0003Bz-7v
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXno-00034B-62; Sun, 04 Jun 2017 11:50:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1B870404E5;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E49F25E3;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: (nullmailer pid 16368 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:11 +0300
Message-Id: <cc16ee9d4ecec35ea04eb5e44430207a447757ce.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/22] altera_timer: fix incorrect memset
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
X-List-Received-Date: Sun, 04 Jun 2017 15:50:59 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Use sizeof instead of ARRAY_SIZE, fixing -Wmemset-elt-size with recent
GCC versions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/altera_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index 6d4862661d..c9a0fc5dca 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -204,7 +204,7 @@ static void altera_timer_reset(DeviceState *dev)
 
     ptimer_stop(t->ptimer);
     ptimer_set_limit(t->ptimer, 0xffffffff, 1);
-    memset(t->regs, 0, ARRAY_SIZE(t->regs));
+    memset(t->regs, 0, sizeof(t->regs));
 }
 
 static Property altera_timer_properties[] = {
-- 
2.11.0


