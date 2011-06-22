Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZOgJ-0005jo-L8
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jun 2011 10:45:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:32828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QZOgG-0005it-5v
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2011 10:45:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QZOgA-0003no-0z
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2011 10:45:23 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:42802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QZOfy-0003hS-6a; Wed, 22 Jun 2011 10:45:06 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QZOft-0004gj-KT; Wed, 22 Jun 2011 15:45:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 Jun 2011 15:45:01 +0100
Message-Id: <1308753901-17998-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Fix typo in email address
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
X-List-Received-Date: Wed, 22 Jun 2011 14:45:26 -0000

Fix a typo in one of the copies of Aurelien Jarno's email address.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35d4496..6115e4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -480,7 +480,7 @@ S: Maintained
 F: tcg/ia64/
 
 MIPS target
-M: Aurelien Jarno <aurelien@aurel32.ne>
+M: Aurelien Jarno <aurelien@aurel32.net>
 S: Maintained
 F: tcg/mips/
 
-- 
1.7.1


