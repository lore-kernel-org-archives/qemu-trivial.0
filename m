Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvQn-00031E-WE
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 16:03:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvQk-0002rh-SC
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 16:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvQj-0000zj-NA
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 16:03:34 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvQg-0000yK-8n; Fri, 10 Aug 2012 16:03:30 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	73B7872800CC; Fri, 10 Aug 2012 22:03:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id w1B3Ct9JH1T3; Fri, 10 Aug 2012 22:03:29 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1C38B72800CD; Fri, 10 Aug 2012 22:03:29 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 22:03:26 +0200
Message-Id: <1344629007-23311-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix spelling (licenced -> licensed) in GPL
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
X-List-Received-Date: Fri, 10 Aug 2012 20:03:36 -0000

The patch also fixes the case of "written".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/imx_avic.c  |    4 ++--
 hw/imx_timer.c |    4 ++--
 hw/kzm.c       |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/imx_avic.c b/hw/imx_avic.c
index 4f010e8..b1a8fe6 100644
--- a/hw/imx_avic.c
+++ b/hw/imx_avic.c
@@ -6,9 +6,9 @@
  *
  * Copyright (c) 2008 OKL
  * Copyright (c) 2011 NICTA Pty Ltd
- * Originally Written by Hans Jiang
+ * Originally written by Hans Jiang
  *
- * This code is licenced under the GPL version 2 or later.  See
+ * This code is licensed under the GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
  *
  * TODO: implement vectors.
diff --git a/hw/imx_timer.c b/hw/imx_timer.c
index 16215cc..c28c537 100644
--- a/hw/imx_timer.c
+++ b/hw/imx_timer.c
@@ -3,10 +3,10 @@
  *
  * Copyright (c) 2008 OK Labs
  * Copyright (c) 2011 NICTA Pty Ltd
- * Originally Written by Hans Jiang
+ * Originally written by Hans Jiang
  * Updated by Peter Chubb
  *
- * This code is licenced under GPL version 2 or later.  See
+ * This code is licensed under GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
  *
  */
diff --git a/hw/kzm.c b/hw/kzm.c
index 6a5e9df..68cd1b4 100644
--- a/hw/kzm.c
+++ b/hw/kzm.c
@@ -5,7 +5,7 @@
  * Written by Hans at OK-Labs
  * Updated by Peter Chubb.
  *
- * This code is licenced under the GPL, version 2 or later.
+ * This code is licensed under the GPL, version 2 or later.
  * See the file `COPYING' in the top level directory.
  *
  * It (partially) emulates a Kyoto Microcomputer
-- 
1.7.0.4


