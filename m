Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si25Q-00052s-MA
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 07:31:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Si25H-0004Ya-Fr
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Si25C-0005R8-W5
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:31:27 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:53418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Si250-0005L6-G0; Fri, 22 Jun 2012 07:31:10 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Si24p-0005GF-Ti; Fri, 22 Jun 2012 12:30:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2012 12:30:57 +0100
Message-Id: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 0/2] cpu-common.h: remove pointless ifdef
	guards
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
X-List-Received-Date: Fri, 22 Jun 2012 11:31:33 -0000

These patches remove a couple of pointless ifdef guards in cpu-common.h
that I happened to notice.

Peter Maydell (2):
  cpu-common.h: Remove unnecessary guard on including targphys.h
  cpu-common.h: Remove a pointless ifndef CONFIG_USER_ONLY

 cpu-common.h |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)


