Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4ECt-0006FW-D4
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:04:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4ECm-00067A-HI
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:04:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4ECg-0003Xk-Os
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:04:00 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:36585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4ECW-0003UO-LA; Mon, 07 Jul 2014 15:03:44 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 8812217FA16; Mon,  7 Jul 2014 21:03:42 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:03:38 +0200
Message-Id: <1404759818-29444-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] tests: Add missing 'static' attributes (fix
	warnings from smatch)
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
X-List-Received-Date: Mon, 07 Jul 2014 19:04:05 -0000

Smatch also complains about 0 used for pointers, so replace those by
NULL in test-visitor-serialization.c, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tests/fdc-test.c                   |    2 +-
 tests/test-aio.c                   |    2 +-
 tests/test-qemu-opts.c             |    2 +-
 tests/test-throttle.c              |    8 ++++----
 tests/test-visitor-serialization.c |    6 +++---
 tests/test-vmstate.c               |    4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index c8e1e7b..203074c 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -65,7 +65,7 @@ enum {
     DSKCHG  = 0x80,
 };
 
-char test_image[] = "/tmp/qtest.XXXXXX";
+static char test_image[] = "/tmp/qtest.XXXXXX";
 
 #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), ==, (mask))
 #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), ==, 0)
diff --git a/tests/test-aio.c b/tests/test-aio.c
index e5f8b55..30a0ac6 100644
--- a/tests/test-aio.c
+++ b/tests/test-aio.c
@@ -15,7 +15,7 @@
 #include "qemu/timer.h"
 #include "qemu/sockets.h"
 
-AioContext *ctx;
+static AioContext *ctx;
 
 typedef struct {
     EventNotifier e;
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 3653507..ca08ac5 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -56,7 +56,7 @@ static QemuOptsList opts_list_02 = {
     },
 };
 
-QemuOptsList opts_list_03 = {
+static QemuOptsList opts_list_03 = {
     .name = "opts_list_03",
     .head = QTAILQ_HEAD_INITIALIZER(opts_list_03.head),
     .desc = {
diff --git a/tests/test-throttle.c b/tests/test-throttle.c
index 3de6ab8..000ae31 100644
--- a/tests/test-throttle.c
+++ b/tests/test-throttle.c
@@ -15,10 +15,10 @@
 #include "block/aio.h"
 #include "qemu/throttle.h"
 
-AioContext     *ctx;
-LeakyBucket    bkt;
-ThrottleConfig cfg;
-ThrottleState  ts;
+static AioContext     *ctx;
+static LeakyBucket    bkt;
+static ThrottleConfig cfg;
+static ThrottleState  ts;
 
 /* useful function */
 static bool double_cmp(double x, double y)
diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index 74d6481..7ad1886 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -372,8 +372,8 @@ static void test_primitive_lists(gconstpointer opaque)
     TestArgs *args = (TestArgs *) opaque;
     const SerializeOps *ops = args->ops;
     PrimitiveType *pt = args->test_data;
-    PrimitiveList pl = { .value = { 0 } };
-    PrimitiveList pl_copy = { .value = { 0 } };
+    PrimitiveList pl = { .value = { NULL } };
+    PrimitiveList pl_copy = { .value = { NULL } };
     PrimitiveList *pl_copy_ptr = &pl_copy;
     Error *err = NULL;
     void *serialize_data;
@@ -771,7 +771,7 @@ static void test_nested_struct_list(gconstpointer opaque)
     g_free(args);
 }
 
-PrimitiveType pt_values[] = {
+static PrimitiveType pt_values[] = {
     /* string tests */
     {
         .description = "string_empty",
diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index a462335..d72c64c 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -29,8 +29,8 @@
 #include "migration/vmstate.h"
 #include "block/coroutine.h"
 
-char temp_file[] = "/tmp/vmst.test.XXXXXX";
-int temp_fd;
+static char temp_file[] = "/tmp/vmst.test.XXXXXX";
+static int temp_fd;
 
 /* Fake yield_until_fd_readable() implementation so we don't have to pull the
  * coroutine code as dependency.
-- 
1.7.10.4


