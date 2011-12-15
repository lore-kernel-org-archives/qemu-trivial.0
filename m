Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbGVm-0003hV-Vz
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2011 13:58:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RbGVk-0003Zq-5O
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 13:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RbGVj-0000kq-3I
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 13:58:32 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:56006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RbGVg-0000eP-Vg; Thu, 15 Dec 2011 13:58:29 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RbGVe-0005iK-Ey; Thu, 15 Dec 2011 18:58:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Dec 2011 18:58:26 +0000
Message-Id: <1323975506-21941-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] stellaris: Calculate system clock period on
	reset
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
X-List-Received-Date: Thu, 15 Dec 2011 18:58:33 -0000

Calculate the system clock period on reset; otherwise it remains
set to the default value of zero and attempting to use it provokes
a hang. This is one of the issues noted in LP:696094.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/stellaris.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/stellaris.c b/hw/stellaris.c
index ce62a98..7a73074 100644
--- a/hw/stellaris.c
+++ b/hw/stellaris.c
@@ -621,6 +621,7 @@ static void ssys_reset(void *opaque)
     s->rcgc[0] = 1;
     s->scgc[0] = 1;
     s->dcgc[0] = 1;
+    ssys_calculate_system_clock(s);
 }
 
 static int stellaris_sys_post_load(void *opaque, int version_id)
-- 
1.7.5.4


