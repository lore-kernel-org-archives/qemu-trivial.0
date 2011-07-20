Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qjbx4-00061d-8U
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jul 2011 14:56:58 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Qjbwz-000600-QO
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 14:56:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Qjbwy-0004at-33
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 14:56:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Qjbwr-0004TH-LU; Wed, 20 Jul 2011 14:56:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	639057282F85; Wed, 20 Jul 2011 20:56:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id W0Mpev-nNyjV; Wed, 20 Jul 2011 20:56:38 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 0BA1E7282F86; Wed, 20 Jul 2011 20:56:38 +0200 (CEST)
From: Stefan Weil <weil@mail.berlios.de>
To: qemu-devel@nongnu.org
Date: Wed, 20 Jul 2011 20:56:35 +0200
Message-Id: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] sh4: Fix potential crash in debug code
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
X-List-Received-Date: Wed, 20 Jul 2011 18:56:55 -0000

cppcheck reports this error:

qemu/hw/sh_intc.c:390: error: Possible null pointer dereference:
 s - otherwise it is redundant to check if s is null at line 385

If s were NULL, the printf() statement would crash.
Setting braces fixes this bug.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/sh_intc.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/sh_intc.c b/hw/sh_intc.c
index 0734da9..f73a4b0 100644
--- a/hw/sh_intc.c
+++ b/hw/sh_intc.c
@@ -382,13 +382,14 @@ void sh_intc_register_sources(struct intc_desc *desc,
 
 	sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
 	s = sh_intc_source(desc, vect->enum_id);
-	if (s)
-	    s->vect = vect->vect;
+        if (s) {
+            s->vect = vect->vect;
 
 #ifdef DEBUG_INTC_SOURCES
-	printf("sh_intc: registered source %d -> 0x%04x (%d/%d)\n",
-	       vect->enum_id, s->vect, s->enable_count, s->enable_max);
+            printf("sh_intc: registered source %d -> 0x%04x (%d/%d)\n",
+                   vect->enum_id, s->vect, s->enable_count, s->enable_max);
 #endif
+        }
     }
 
     if (groups) {
-- 
1.7.2.5


