Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SgiIF-00025K-A2
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jun 2012 16:11:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SgiIA-0001px-G9
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 16:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SgiI5-0003qc-7Z
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 16:11:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SgiI2-0003qC-9D; Mon, 18 Jun 2012 16:11:10 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0D33D7280025; Mon, 18 Jun 2012 22:11:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ev-Qk9kkmTwu; Mon, 18 Jun 2012 22:11:06 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id D994572800C1; Mon, 18 Jun 2012 22:11:06 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Mon, 18 Jun 2012 22:11:06 +0200
Message-Id: <1340050266-3395-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] configure: Fix typo
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
X-List-Received-Date: Mon, 18 Jun 2012 20:11:21 -0000

The typo did not cause an error because open_by_handle_at
was only compared to "yes".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 5d73c82..20a0fd3 100755
--- a/configure
+++ b/configure
@@ -2809,7 +2809,7 @@ fi
 ##########################################
 # check if we have open_by_handle_at
 
-open_by_hande_at=no
+open_by_handle_at=no
 cat > $TMPC << EOF
 #include <fcntl.h>
 #if !defined(AT_EMPTY_PATH)
-- 
1.7.10


