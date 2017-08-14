Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDJF-0007WQ-13
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:13:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJC-0007T9-9O
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDJB-0007XM-Dx
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:13:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDJ6-0007UP-Sp; Mon, 14 Aug 2017 07:13:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7DC240D51;
	Mon, 14 Aug 2017 14:07:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3F23AB75;
	Mon, 14 Aug 2017 14:07:44 +0300 (MSK)
Received: (nullmailer pid 31407 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:42 +0300
Message-Id: <80758ec57d26bd2751f204ade356db094ce4b08c.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 5/7] qemu-iotests: remove commented out
 variables
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
X-List-Received-Date: Mon, 14 Aug 2017 11:13:23 -0000

From: Cleber Rosa <crosa@redhat.com>

The variables FULL_MKFS_OPTIONS and FULL_MOUNT_OPTIONS are commented
out, never used, and even refer to functions that do exist.  The last
time these were touched was around 8 years ago, so I guess it's safe
to assume outputting such information on test execution is still on the
radar.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/qemu-iotests/check | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 7a2e0d0119..437ef65320 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -229,8 +229,6 @@ rm -f check.full
 
 FULL_IMGFMT_DETAILS=`_full_imgfmt_details`
 FULL_HOST_DETAILS=`_full_platform_details`
-#FULL_MKFS_OPTIONS=`_scratch_mkfs_options`
-#FULL_MOUNT_OPTIONS=`_scratch_mount_options`
 
 cat <<EOF
 QEMU          -- "$QEMU_PROG" $QEMU_OPTIONS
@@ -244,8 +242,6 @@ TEST_DIR      -- $TEST_DIR
 SOCKET_SCM_HELPER -- $SOCKET_SCM_HELPER
 
 EOF
-#MKFS_OPTIONS  -- $FULL_MKFS_OPTIONS
-#MOUNT_OPTIONS -- $FULL_MOUNT_OPTIONS
 
 seq="check"
 
-- 
2.11.0


