Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tla3K-00044m-Kb
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 01:56:22 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Tla3H-0003ut-9P
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 01:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Tla3E-0002c6-RM
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 01:56:19 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Tla32-0002SW-Af; Thu, 20 Dec 2012 01:56:04 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6EFB67280049; Thu, 20 Dec 2012 07:56:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id es--s82vcCEU; Thu, 20 Dec 2012 07:56:03 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 913BC728004A; Thu, 20 Dec 2012 07:49:26 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu, 20 Dec 2012 07:49:25 +0100
Message-Id: <1355986165-20152-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] pseries: Remove unneeded include statement
	(fixes MinGW builds)
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
X-List-Received-Date: Thu, 20 Dec 2012 06:56:21 -0000

sys/mman.h is not needed (tested on Linux) and unavailable for MinGW,
so remove it.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/spapr_nvram.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/spapr_nvram.c b/hw/spapr_nvram.c
index f20f6b4..680cdba 100644
--- a/hw/spapr_nvram.c
+++ b/hw/spapr_nvram.c
@@ -21,7 +21,7 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
-#include <sys/mman.h>
+
 #include <libfdt.h>
 
 #include "sysemu/device_tree.h"
-- 
1.7.10.4


