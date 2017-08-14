Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDJM-0007gv-KW
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:13:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJG-0007YK-DT
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJF-0007a9-Fc
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDJD-0007YP-6B; Mon, 14 Aug 2017 07:13:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9ADF840D22;
	Mon, 14 Aug 2017 14:13:22 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B41B3B78;
	Mon, 14 Aug 2017 14:07:44 +0300 (MSK)
Received: (nullmailer pid 31405 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:41 +0300
Message-Id: <657c572afe8dae393f2321db8866c02b4bf7bc77.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 4/7] qemu-iotests: get rid of
 _full_imgproto_details()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 11:13:29 -0000

From: Cleber Rosa <crosa@redhat.com>

Although this function is used, its implementation does nothing
besides echoing a variable name.  There's no need to wrap this
functionality in a function, and based on the one usage it has, it's
not even required to adhere to a convention or code style.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/qemu-iotests/check     | 3 +--
 tests/qemu-iotests/common.rc | 5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 2a55ec9ada..7a2e0d0119 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -228,7 +228,6 @@ rm -f check.full
 [ -f $TIMESTAMP_FILE ] || touch $TIMESTAMP_FILE
 
 FULL_IMGFMT_DETAILS=`_full_imgfmt_details`
-FULL_IMGPROTO_DETAILS=`_full_imgproto_details`
 FULL_HOST_DETAILS=`_full_platform_details`
 #FULL_MKFS_OPTIONS=`_scratch_mkfs_options`
 #FULL_MOUNT_OPTIONS=`_scratch_mount_options`
@@ -239,7 +238,7 @@ QEMU_IMG      -- "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS
 QEMU_IO       -- "$QEMU_IO_PROG" $QEMU_IO_OPTIONS
 QEMU_NBD      -- "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS
 IMGFMT        -- $FULL_IMGFMT_DETAILS
-IMGPROTO      -- $FULL_IMGPROTO_DETAILS
+IMGPROTO      -- $IMGPROTO
 PLATFORM      -- $FULL_HOST_DETAILS
 TEST_DIR      -- $TEST_DIR
 SOCKET_SCM_HELPER -- $SOCKET_SCM_HELPER
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index bfbc80e5f6..8d486dbeb4 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -482,11 +482,6 @@ _full_imgfmt_details()
     fi
 }
 
-_full_imgproto_details()
-{
-    echo "$IMGPROTO"
-}
-
 _full_platform_details()
 {
     os=`uname -s`
-- 
2.11.0


