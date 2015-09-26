Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFN-0000Da-Bj
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF5-0008AM-NI
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-0006Y2-O6
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13]:54827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEw-0006Oa-7H; Sat, 26 Sep 2015 12:22:22 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 53B204C8090;
	Sat, 26 Sep 2015 18:22:21 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:12 +0200
Message-Id: <1443284532-8634-11-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::13
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [Qemu-trivial] [PATCH 10/10][TRIVIAL] openpic: add to misc category
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:32 -0000

openpic is a programmable interrupt controller, so
add it to the misc category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/intc/openpic.c     | 1 +
 hw/intc/openpic_kvm.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 14ab0e3..bfcf155 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1643,6 +1643,7 @@ static void openpic_class_init(ObjectClass *oc, void *data)
     dc->props = openpic_properties;
     dc->reset = openpic_reset;
     dc->vmsd = &vmstate_openpic;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo openpic_info = {
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index f7cac58..649f476 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -275,6 +275,7 @@ static void kvm_openpic_class_init(ObjectClass *oc, void *data)
     dc->realize = kvm_openpic_realize;
     dc->props = kvm_openpic_properties;
     dc->reset = kvm_openpic_reset;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo kvm_openpic_info = {
-- 
2.4.3


