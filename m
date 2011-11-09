Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROE6M-0008Se-Pu
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 14:46:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ROE65-0007t1-Iw
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 14:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ROE5r-0000oE-7b
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 14:46:04 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:50951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ROE5j-0000lk-1i; Wed, 09 Nov 2011 14:45:47 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ROE5a-0002dm-QC; Wed, 09 Nov 2011 19:45:38 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 Nov 2011 19:45:38 +0000
Message-Id: <1320867938-10127-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Delete spurious '.'
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
X-List-Received-Date: Wed, 09 Nov 2011 19:46:24 -0000

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
If anything qualifies as a trivial patch, this does :-)

 MAINTAINERS |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ee301e..b465299 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20,7 +20,7 @@ Descriptions of section entries:
 	   Supported:	Someone is actually paid to look after this.
 	   Maintained:	Someone actually looks after it.
 	   Odd Fixes:	It has a maintainer but they don't have time to do
-			much other than throw the odd patch in. See below..
+			much other than throw the odd patch in. See below.
 	   Orphan:	No current maintainer [but maybe you could take the
 			role as you write your new code].
 	   Obsolete:	Old code. Something tagged obsolete generally means
-- 
1.7.1


