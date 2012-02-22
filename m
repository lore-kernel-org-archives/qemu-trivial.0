Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0KR8-00047p-5A
	for mharc-qemu-trivial@gnu.org; Wed, 22 Feb 2012 17:13:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1S0KR4-0003v7-Ml
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 17:13:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1S0KR3-0002y4-DG
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 17:13:18 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:53855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1S0KR0-0002xV-78; Wed, 22 Feb 2012 17:13:14 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1S0KQx-0006Jx-NI; Wed, 22 Feb 2012 22:13:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 Feb 2012 22:13:11 +0000
Message-Id: <1329948791-24274-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] vl.c: Increase width of machine name column
	in "-M ?" output
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
X-List-Received-Date: Wed, 22 Feb 2012 22:13:19 -0000

Increase the width of the column used for the machine name in
the "-M ?" output from 10 to 20 spaces. This fixes the formatting
so it looks nice for architectures where a few of the machines
have overly long names. (Our current longest machine name is
"petalogix-s3adsp1800" with "realview-eb-mpcore" not far behind.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 vl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 7a8cc08..f211c71 100644
--- a/vl.c
+++ b/vl.c
@@ -1999,9 +1999,9 @@ static QEMUMachine *machine_parse(const char *name)
     printf("Supported machines are:\n");
     for (m = first_machine; m != NULL; m = m->next) {
         if (m->alias) {
-            printf("%-10s %s (alias of %s)\n", m->alias, m->desc, m->name);
+            printf("%-20s %s (alias of %s)\n", m->alias, m->desc, m->name);
         }
-        printf("%-10s %s%s\n", m->name, m->desc,
+        printf("%-20s %s%s\n", m->name, m->desc,
                m->is_default ? " (default)" : "");
     }
     exit(!name || *name != '?');
-- 
1.7.5.4


