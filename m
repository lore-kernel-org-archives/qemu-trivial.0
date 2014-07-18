Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88vs-0001Uo-Ad
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88vl-0001MY-Hs
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88vg-0004jz-8N
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:14:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88vS-0004dK-N0; Fri, 18 Jul 2014 10:14:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7F1214386B;
	Fri, 18 Jul 2014 18:14:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0903B666;
	Fri, 18 Jul 2014 18:09:15 +0400 (MSK)
Received: (nullmailer pid 635 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:13 +0400
Message-Id: <1405692553-564-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 8/8] tests: Add missing 'static' attributes
	(fix warnings from smatch)
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
X-List-Received-Date: Fri, 18 Jul 2014 14:14:43 -0000

From: Stefan Weil <sw@weilnetz.de>

Smatch also complains about 0 used for pointers, so replace those by
NULL in test-visitor-serialization.c, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
index 4c40a49..f12b6e0 100644
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


