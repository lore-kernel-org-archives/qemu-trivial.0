Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9ke-0003yM-4i
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:12 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9ka-0003kJ-Cw
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kZ-0000ct-CU
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:08 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9kV-0000bx-Jy; Fri, 09 Dec 2011 18:21:03 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	24B7D728188E; Sat, 10 Dec 2011 00:20:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id EbPm0soRtOQH; Sat, 10 Dec 2011 00:20:32 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8A6EF7281B80; Sat, 10 Dec 2011 00:19:59 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:43 +0100
Message-Id: <1323472786-26821-4-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 3/6] hw: Fix spelling (licenced->licensed)
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
X-List-Received-Date: Fri, 09 Dec 2011 23:21:09 -0000

New code introduced old misspellings.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/lm4549.c |    2 +-
 hw/lm4549.h |    2 +-
 hw/pl041.c  |    2 +-
 hw/pl041.h  |    2 +-
 hw/pl041.hx |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/lm4549.c b/hw/lm4549.c
index 4d5b831..80b3ec4 100644
--- a/hw/lm4549.c
+++ b/hw/lm4549.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2011
  * Written by Mathieu Sonet - www.elasticsheep.com
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  *
  * *****************************************************************
  *
diff --git a/hw/lm4549.h b/hw/lm4549.h
index 70d0ac1..5948780 100644
--- a/hw/lm4549.h
+++ b/hw/lm4549.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2011
  * Written by Mathieu Sonet - www.elasticsheep.com
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  *
  * *****************************************************************
  */
diff --git a/hw/pl041.c b/hw/pl041.c
index d8e55d1..4585ccf 100644
--- a/hw/pl041.c
+++ b/hw/pl041.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2011
  * Written by Mathieu Sonet - www.elasticsheep.com
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  *
  * *****************************************************************
  *
diff --git a/hw/pl041.h b/hw/pl041.h
index 1f22432..427ab6d 100644
--- a/hw/pl041.h
+++ b/hw/pl041.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2011
  * Written by Mathieu Sonet - www.elasticsheep.com
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  *
  * *****************************************************************
  */
diff --git a/hw/pl041.hx b/hw/pl041.hx
index e972996..dd7188c 100644
--- a/hw/pl041.hx
+++ b/hw/pl041.hx
@@ -4,7 +4,7 @@
  * Copyright (c) 2011
  * Written by Mathieu Sonet - www.elasticsheep.com
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  *
  * *****************************************************************
  */
-- 
1.7.2.5


