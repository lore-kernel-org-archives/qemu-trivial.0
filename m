Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFJ-00007f-Ug
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-00089K-MU
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF1-0006VK-Dh
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:30 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:28761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEt-0006Mh-Vr; Sat, 26 Sep 2015 12:22:20 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 1F3534C80A3;
	Sat, 26 Sep 2015 18:22:19 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:08 +0200
Message-Id: <1443284532-8634-7-git-send-email-laurent@vivier.eu>
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
Subject: [Qemu-trivial] [PATCH 06/10][TRIVIAL] macio-ide: add to storage
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:31 -0000

macio-ide is an IDE controller, so add it
to the storage category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ide/macio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 66ac2ba..893c9b9 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -590,6 +590,7 @@ static void macio_ide_class_init(ObjectClass *oc, void *data)
     dc->realize = macio_ide_realizefn;
     dc->reset = macio_ide_reset;
     dc->vmsd = &vmstate_pmac;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo macio_ide_type_info = {
-- 
2.4.3


