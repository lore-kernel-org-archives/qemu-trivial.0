Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R61za-0002W4-Hv
	for mharc-qemu-trivial@gnu.org; Tue, 20 Sep 2011 11:12:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R61zU-0002UO-ND
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2011 11:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1R61zO-0001xO-Jp
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2011 11:12:08 -0400
Received: from thoth.sbs.de ([192.35.17.2]:22139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1R61zO-0001x7-7R; Tue, 20 Sep 2011 11:12:02 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p8KFBxAE026717;
	Tue, 20 Sep 2011 17:11:59 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p8KFBwcC016515;
	Tue, 20 Sep 2011 17:11:59 +0200
Message-ID: <4E78AD3E.5070509@siemens.com>
Date: Tue, 20 Sep 2011 17:11:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Drop unneeded pthread.h inclusions
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
X-List-Received-Date: Tue, 20 Sep 2011 15:12:12 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/xen_nic.c       |    1 -
 hw/xics.c          |    2 --
 ui/spice-display.c |    2 --
 3 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/hw/xen_nic.c b/hw/xen_nic.c
index aeca8da..ef2a2d6 100644
--- a/hw/xen_nic.c
+++ b/hw/xen_nic.c
@@ -25,7 +25,6 @@
 #include <inttypes.h>
 #include <fcntl.h>
 #include <errno.h>
-#include <pthread.h>
 #include <sys/socket.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
diff --git a/hw/xics.c b/hw/xics.c
index 9bf82aa..80e064e 100644
--- a/hw/xics.c
+++ b/hw/xics.c
@@ -29,8 +29,6 @@
 #include "hw/spapr.h"
 #include "hw/xics.h"

-#include <pthread.h>
-
 /*
  * ICP: Presentation layer
  */
diff --git a/ui/spice-display.c b/ui/spice-display.c
index e385361..590a5a6 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -15,8 +15,6 @@
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */

-#include <pthread.h>
-
 #include "qemu-common.h"
 #include "qemu-spice.h"
 #include "qemu-timer.h"
-- 
1.7.3.4

