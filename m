Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqgn-0006ie-Pg
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:43:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgk-0006cq-OM
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgi-0006ym-E2
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:46 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:46027 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgh-0006yJ-NH
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:44 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqgY-00084j-T9; Fri, 06 Feb 2015 22:43:34 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:43:12 +0100
Message-Id: <1423258997-30957-6-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
References: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Green <green@moxielogic.com>
Subject: [Qemu-trivial] [PATCH 05/10] moxie: Fix warning caused by missing
	include statement
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
X-List-Received-Date: Fri, 06 Feb 2015 21:43:47 -0000

Warning from the Sparse static analysis tool:

target-moxie/machine.c:4:26:
 warning: symbol 'vmstate_moxie_cpu' was not declared. Should it be static?

machine.h includes the missing declaration.

Cc: Anthony Green <green@moxielogic.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-moxie/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-moxie/machine.c b/target-moxie/machine.c
index da1a857..b9316f0 100644
--- a/target-moxie/machine.c
+++ b/target-moxie/machine.c
@@ -1,5 +1,6 @@
 #include "hw/hw.h"
 #include "hw/boards.h"
+#include "machine.h"
 
 const VMStateDescription vmstate_moxie_cpu = {
     .name = "cpu",
-- 
2.1.4


