Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibX7-0001wB-HK
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:45:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibX3-0001pZ-IA
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibX2-0003Hw-RU
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:45:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibWy-0003DY-CG; Tue, 28 Feb 2017 01:45:04 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E0A6043589;
	Tue, 28 Feb 2017 09:45:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 662013D1;
	Tue, 28 Feb 2017 09:45:00 +0300 (MSK)
Received: (nullmailer pid 19641 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Igor Pavlikevich <ipavlikevich@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:56 +0300
Message-Id: <6c608953a5512b556fd0913d740e932366d6bb5d.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/14] hw/acpi/tco.c: fix tco timer stop
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
X-List-Received-Date: Tue, 28 Feb 2017 06:45:10 -0000

From: Igor Pavlikevich <ipavlikevich@gmail.com>

TCO timer does not actually stop

Signed-off-by: Igor Pavlikevich <ipavlikevich@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/tco.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index 8ce7daf..b4adac8 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -49,6 +49,7 @@ static inline void tco_timer_reload(TCOIORegs *tr)
 static inline void tco_timer_stop(TCOIORegs *tr)
 {
     tr->expire_time = -1;
+    timer_del(tr->tco_timer);
 }
 
 static void tco_timer_expired(void *opaque)
-- 
2.1.4


