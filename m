Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFN-0000EK-KE
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF6-0008Ap-0L
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-0006YA-OU
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:28677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEs-0006Kp-Ce; Sat, 26 Sep 2015 12:22:18 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 4D1A74C8090;
	Sat, 26 Sep 2015 18:22:17 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:05 +0200
Message-Id: <1443284532-8634-4-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 212.27.42.4
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [Qemu-trivial] [PATCH 03/10][TRIVIAL] escc: add to input category
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:33 -0000

ESCC is a serial port controller, so add it
to the input category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/char/escc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index ba653ef..9816154 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -1035,6 +1035,7 @@ static void escc_class_init(ObjectClass *klass, void *data)
     dc->reset = escc_reset;
     dc->vmsd = &vmstate_escc;
     dc->props = escc_properties;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo escc_info = {
-- 
2.4.3


