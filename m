Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLl-0003iU-FJ
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVi-0004ss-1N
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVc-0001nv-IU
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1dahVY-0001km-5a; Thu, 27 Jul 2017 08:03:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C0C44482F;
	Thu, 27 Jul 2017 12:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1C0C44482F
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain.com (ovpn-125-5.rdu2.redhat.com
	[10.10.125.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 893315D96D;
	Thu, 27 Jul 2017 12:03:09 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu, 27 Jul 2017 08:02:07 -0400
Message-Id: <20170727120210.6943-3-crosa@redhat.com>
In-Reply-To: <20170727120210.6943-1-crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 27 Jul 2017 12:03:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:08 -0400
Subject: [Qemu-trivial] [PATCH 2/5] qemu-iotests: get rid of
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
X-List-Received-Date: Thu, 27 Jul 2017 12:03:23 -0000

Although this function is used, its implementation does nothing
besides echoing a variable name.  There's no need to wrap this
functionality in a function, and based on the one usage it has, it's
not even required to adhere to a convention or code style.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/check     | 3 +--
 tests/qemu-iotests/common.rc | 5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 2a55ec9..7a2e0d0 100755
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
index 2548e58..e4d30ad 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -479,11 +479,6 @@ _full_imgfmt_details()
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
2.9.4


