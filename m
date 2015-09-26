Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFM-0000Bz-L3
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-000898-KX
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF1-0006VS-Gs
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:30 -0400
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13]:54792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEv-0006NX-0I; Sat, 26 Sep 2015 12:22:21 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 19C114C8070;
	Sat, 26 Sep 2015 18:22:20 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:10 +0200
Message-Id: <1443284532-8634-9-git-send-email-laurent@vivier.eu>
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
Subject: [Qemu-trivial] [PATCH 08/10][TRIVIAL] macio: add to bridge category
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

macio is a bridge between the PCI bus and the Mac nvram,
IDE controller and PIC, so add it to the bridge category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/macio/macio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index e3c0242..c0989a0 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -393,6 +393,7 @@ static void macio_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_APPLE;
     k->class_id = PCI_CLASS_OTHERS << 8;
     dc->props = macio_properties;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo macio_oldworld_type_info = {
-- 
2.4.3


