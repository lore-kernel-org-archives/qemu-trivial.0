Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFN-0000Cy-4F
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-00089F-MM
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF1-0006VR-Gz
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:30 -0400
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13]:54613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEr-0006KX-SY; Sat, 26 Sep 2015 12:22:18 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id AD4664C806C;
	Sat, 26 Sep 2015 18:22:16 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:04 +0200
Message-Id: <1443284532-8634-3-git-send-email-laurent@vivier.eu>
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
Subject: [Qemu-trivial] [PATCH 02/10][TRIVIAL] cmd646: add to storage
	category
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

cmd646 is an IDE controller, so add it to the
storage category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ide/cmd646.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 66fb9d9..27f3da2 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -417,6 +417,7 @@ static void cmd646_ide_class_init(ObjectClass *klass, void *data)
     k->config_read = cmd646_pci_config_read;
     k->config_write = cmd646_pci_config_write;
     dc->props = cmd646_ide_properties;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo cmd646_ide_info = {
-- 
2.4.3


