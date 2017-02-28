Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cic92-0003xN-1k
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 02:24:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cic8z-0003uz-5X
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 02:24:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cic8y-0005KF-Bz
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 02:24:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cic8s-0005Hy-0T; Tue, 28 Feb 2017 02:24:14 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 853984338E;
	Tue, 28 Feb 2017 10:24:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 175E43E2;
	Tue, 28 Feb 2017 09:45:02 +0300 (MSK)
Received: (nullmailer pid 19621 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:46 +0300
Message-Id: <a70716eb2c766d80f605abd42115b923fedaa1f7.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/14] hw/core/or-irq: Mark the device with
 cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Tue, 28 Feb 2017 07:24:22 -0000

From: Thomas Huth <thuth@redhat.com>

The "or-irq" device needs to be wired up in source code, there is no
way the user can make any real use of this device with the "-device"
parameter or the "device_add" monitor command yet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/or-irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
index 1ac090d..1485d5b 100644
--- a/hw/core/or-irq.c
+++ b/hw/core/or-irq.c
@@ -89,6 +89,9 @@ static void or_irq_class_init(ObjectClass *klass, void *data)
     dc->props = or_irq_properties;
     dc->realize = or_irq_realize;
     dc->vmsd = &vmstate_or_irq;
+
+    /* Reason: Needs to be wired up to work, e.g. see stm32f205_soc.c */
+    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo or_irq_type_info = {
-- 
2.1.4


