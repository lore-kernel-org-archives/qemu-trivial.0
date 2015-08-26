Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYi5-00030t-Bl
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhy-0002qQ-UP
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhx-00085J-QO
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46620)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhu-00083T-2V; Wed, 26 Aug 2015 07:17:30 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 9B65D8CF4B;
	Wed, 26 Aug 2015 11:17:29 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODs028642; Wed, 26 Aug 2015 07:17:28 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:14 +0100
Message-Id: <1440587838-25595-4-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/7] maint: remove unused include for assert.h
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:36 -0000

A number of files were including assert.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
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
2.4.3


