Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaM7k-0004r8-K9
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:04:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7d-0004cM-6j
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7b-0006sN-W7
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaM7W-0006oo-27; Fri, 11 Sep 2015 07:03:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4AFD14143B;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1BBD7A65;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: (nullmailer pid 22764 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:30 +0300
Message-Id: <8abae4d31d92be2085fd66566585cba7699ad332.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 06/26] maint: remove unused include for
	assert.h
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
X-List-Received-Date: Fri, 11 Sep 2015 11:04:02 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

A number of files were including assert.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/ia64.c                  | 1 -
 hw/i386/xen/xen_platform.c    | 2 --
 linux-user/signal.c           | 1 -
 target-microblaze/op_helper.c | 1 -
 target-moxie/helper.c         | 1 -
 target-moxie/translate.c      | 1 -
 target-sh4/op_helper.c        | 1 -
 tests/test-xbzrle.c           | 1 -
 8 files changed, 9 deletions(-)

diff --git a/disas/ia64.c b/disas/ia64.c
index a8fe26c..d7c7bdf 100644
--- a/disas/ia64.c
+++ b/disas/ia64.c
@@ -18,7 +18,6 @@
    along with this file; see the file COPYING.  If not, see
    <http://www.gnu.org/licenses/>. */
 
-#include <assert.h>
 #include <string.h>
 
 #include "disas/bfd.h"
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 28b324a..ee45f03 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -23,8 +23,6 @@
  * THE SOFTWARE.
  */
 
-#include <assert.h>
-
 #include "hw/hw.h"
 #include "hw/i386/pc.h"
 #include "hw/ide.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9d4cef4..502efd9 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -22,7 +22,6 @@
 #include <stdarg.h>
 #include <unistd.h>
 #include <errno.h>
-#include <assert.h>
 #include <sys/ucontext.h>
 #include <sys/resource.h>
 
diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
index d2b3624..092c4b5 100644
--- a/target-microblaze/op_helper.c
+++ b/target-microblaze/op_helper.c
@@ -18,7 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <assert.h>
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index f21e884..f91ac28 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -19,7 +19,6 @@
 
 #include <stdio.h>
 #include <string.h>
-#include <assert.h>
 
 #include "config.h"
 #include "cpu.h"
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index e3e9139..cc77366 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -26,7 +26,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <assert.h>
 
 #include "cpu.h"
 #include "exec/exec-all.h"
diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
index cbc11ae..a312118 100644
--- a/target-sh4/op_helper.c
+++ b/target-sh4/op_helper.c
@@ -16,7 +16,6 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#include <assert.h>
 #include <stdlib.h>
 #include "cpu.h"
 #include "exec/helper-proto.h"
diff --git a/tests/test-xbzrle.c b/tests/test-xbzrle.c
index db93b0a..b5ee8bb 100644
--- a/tests/test-xbzrle.c
+++ b/tests/test-xbzrle.c
@@ -16,7 +16,6 @@
 #include <strings.h>
 #include <string.h>
 #include <sys/time.h>
-#include <assert.h>
 #include "qemu-common.h"
 #include "include/migration/migration.h"
 
-- 
2.1.4


