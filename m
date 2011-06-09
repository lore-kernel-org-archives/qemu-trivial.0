Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QUci1-00052Z-Ia
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jun 2011 06:43:29 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QUchx-00051Z-RA
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2011 06:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QUchw-0007eR-C6
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2011 06:43:25 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:52659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QUchs-0007ct-Hr; Thu, 09 Jun 2011 06:43:20 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QUchk-0007TW-Kl; Thu, 09 Jun 2011 11:43:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 Jun 2011 11:43:12 +0100
Message-Id: <1307616192-28711-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Changelog: Add explanatory note that this
	file is no longer updated
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
X-List-Received-Date: Thu, 09 Jun 2011 10:43:27 -0000

Add an explanatory note to the top of Changelog pointing at the
wiki and git history for changelogs for more recent releases.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Changelog |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Changelog b/Changelog
index 1c41e14..28a69af 100644
--- a/Changelog
+++ b/Changelog
@@ -1,3 +1,9 @@
+This file documents changes for QEMU releases 0.12 and earlier.
+For changelog information for later releases, see
+http://wiki.qemu.org/ChangeLog or look at the git history for
+more detailed information.
+
+
 version 0.12.0:
 
   - Update to SeaBIOS 0.5.0
-- 
1.7.1


