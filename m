Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPDe-0002Pj-Bv
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:48:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDW-0002Aw-Tg
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDS-0007X6-02
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPDG-0007Tp-VU; Tue, 10 Jun 2014 12:47:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7145F412CC;
	Tue, 10 Jun 2014 20:47:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6D5836D1;
	Tue, 10 Jun 2014 20:08:49 +0400 (MSK)
Received: (nullmailer pid 13323 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:34 +0400
Message-Id: <1402416523-13212-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/25] hw/net/ne2000-isa: Register vmstate
	struct
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
X-List-Received-Date: Tue, 10 Jun 2014 16:48:16 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The ne2000-isa device defines a VMState struct for migration, but
we forgot to actually register it. Correct this deficiency by
setting dc->vmsd.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/ne2000-isa.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index c660e58..0a14f6d 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -98,6 +98,7 @@ static void isa_ne2000_class_initfn(ObjectClass *klass, void *data)
 
     dc->realize = isa_ne2000_realizefn;
     dc->props = ne2000_isa_properties;
+    dc->vmsd = &vmstate_isa_ne2000;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 }
 
-- 
1.7.10.4


