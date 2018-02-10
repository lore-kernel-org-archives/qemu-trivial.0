Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ0N-0002lu-9I
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:55:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0I-0002g4-KY
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0H-0000if-Mv
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ0C-0000ee-DN; Sat, 10 Feb 2018 02:55:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 70B1740C58;
	Sat, 10 Feb 2018 10:55:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E365D7A3;
	Sat, 10 Feb 2018 10:55:15 +0300 (MSK)
Received: (nullmailer pid 22792 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:54:58 +0300
Message-Id: <e80200c567ceb01a6f133cb0bf4fade09c395251.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/17] machine: Polish -machine xxx,help
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
X-List-Received-Date: Sat, 10 Feb 2018 07:55:24 -0000

From: Alexey Kardashevskiy <aik@ozlabs.ru>

The "-machine xxx,help" prints kernel-irqchip possible values as
"OnOffSplit", this adds separators to the printed line.

Also, since only lower case letters are specified in qapi/common.json,
this changes the letter cases too.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index cdc1163dc6..5d445839e8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -520,7 +520,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "accel",
         "Accelerator list", &error_abort);
 
-    object_class_property_add(oc, "kernel-irqchip", "OnOffSplit",
+    object_class_property_add(oc, "kernel-irqchip", "on|off|split",
         NULL, machine_set_kernel_irqchip,
         NULL, NULL, &error_abort);
     object_class_property_set_description(oc, "kernel-irqchip",
-- 
2.11.0


