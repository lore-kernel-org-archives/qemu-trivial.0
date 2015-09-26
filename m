Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFK-00008r-PP
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-00089O-NO
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF1-0006Vt-Sg
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:30 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:28604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEr-0006KR-QX; Sat, 26 Sep 2015 12:22:17 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 30FDA4C8070;
	Sat, 26 Sep 2015 18:22:16 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:03 +0200
Message-Id: <1443284532-8634-2-git-send-email-laurent@vivier.eu>
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
Subject: [Qemu-trivial] [PATCH 01/10][TRIVIAL] adb: add to input category
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

The Apple Desktop Bus is used to connect a keyboard and a mouse,
so add it to the input category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/adb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index a18eea2..09eead9 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -362,6 +362,7 @@ static void adb_kbd_class_init(ObjectClass *oc, void *data)
 
     akc->parent_realize = dc->realize;
     dc->realize = adb_kbd_realizefn;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 
     adc->devreq = adb_kbd_request;
     dc->reset = adb_kbd_reset;
@@ -566,6 +567,7 @@ static void adb_mouse_class_init(ObjectClass *oc, void *data)
 
     amc->parent_realize = dc->realize;
     dc->realize = adb_mouse_realizefn;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 
     adc->devreq = adb_mouse_request;
     dc->reset = adb_mouse_reset;
-- 
2.4.3


