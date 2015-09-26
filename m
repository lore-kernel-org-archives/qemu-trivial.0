Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFO-0000F8-6l
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF6-0008At-1C
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-0006Y6-OF
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:32 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:28844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEv-0006Nq-Ne; Sat, 26 Sep 2015 12:22:21 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 9F2004C808E;
	Sat, 26 Sep 2015 18:22:20 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:11 +0200
Message-Id: <1443284532-8634-10-git-send-email-laurent@vivier.eu>
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
Subject: [Qemu-trivial] [PATCH 09/10][TRIVIAL] macio-nvram: add to misc
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:33 -0000

The macio nvram is a non volatile RAM, so add it
the misc category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/mac_nvram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index d35f8a3..9f16566 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -123,6 +123,7 @@ static void macio_nvram_class_init(ObjectClass *oc, void *data)
     dc->reset = macio_nvram_reset;
     dc->vmsd = &vmstate_macio_nvram;
     dc->props = macio_nvram_properties;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo macio_nvram_type_info = {
-- 
2.4.3


