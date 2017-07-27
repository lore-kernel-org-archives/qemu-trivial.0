Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLl-0003jC-Vc
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVk-0004uv-Of
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVj-0001rW-VM
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1dahVZ-0001lZ-7X; Thu, 27 Jul 2017 08:03:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C2B0C0E722F;
	Thu, 27 Jul 2017 12:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1C2B0C0E722F
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain.com (ovpn-125-5.rdu2.redhat.com
	[10.10.125.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CA15D744;
	Thu, 27 Jul 2017 12:03:11 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu, 27 Jul 2017 08:02:08 -0400
Message-Id: <20170727120210.6943-4-crosa@redhat.com>
In-Reply-To: <20170727120210.6943-1-crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 27 Jul 2017 12:03:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:08 -0400
Subject: [Qemu-trivial] [PATCH 3/5] qemu-iotests: remove commented out
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
X-List-Received-Date: Thu, 27 Jul 2017 12:03:25 -0000

The variables FULL_MKFS_OPTIONS and FULL_MOUNT_OPTIONS are commented
out, never used, and even refer to functions that do exist.  The last
time these were touched was around 8 years ago, so I guess it's safe
to assume outputting such information on test execution is still on the
radar.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/check | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 7a2e0d0..437ef65 100755
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
2.9.4


