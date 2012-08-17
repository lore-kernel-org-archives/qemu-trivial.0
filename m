Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T2MTF-0007QU-45
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2012 09:20:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T2MTC-0007Kx-PF
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 09:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T2MTB-0007LV-Mr
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 09:20:10 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T2MT7-0007CA-9v; Fri, 17 Aug 2012 09:20:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	60C227280027; Fri, 17 Aug 2012 15:20:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gECdMcLmySaw; Fri, 17 Aug 2012 15:20:01 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 89D3D728002D; Fri, 17 Aug 2012 15:20:01 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 17 Aug 2012 15:20:00 +0200
Message-Id: <1345209600-808-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] ui: Fix spelling in comment (ressource ->
	resource)
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
X-List-Received-Date: Fri, 17 Aug 2012 13:20:11 -0000

The function is called interface_release_resource.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/spice-display.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 3e8f0b3..277843c 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -217,7 +217,7 @@ static SimpleSpiceUpdate *qemu_spice_create_update(SimpleSpiceDisplay *ssd)
 }
 
 /*
- * Called from spice server thread context (via interface_release_ressource)
+ * Called from spice server thread context (via interface_release_resource)
  * We do *not* hold the global qemu mutex here, so extra care is needed
  * when calling qemu functions.  QEMU interfaces used:
  *    - g_free (underlying glibc free is re-entrant).
-- 
1.7.10


