Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDE1-0003il-0f
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDDz-0003hO-6H
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDDy-0004kw-Cz
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:07:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDDt-0004gt-TN; Mon, 14 Aug 2017 07:07:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 432AF40D4E;
	Mon, 14 Aug 2017 14:07:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BD2E5B77;
	Mon, 14 Aug 2017 14:07:43 +0300 (MSK)
Received: (nullmailer pid 31409 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:46 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 14 Aug 2017 14:07:43 +0300
Message-Id: <a3e08c2dbd7db9b86e174f5e50c6aa7a59a2b21d.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 6/7] qemu-iotests: remove comment about root
 privileges requirement
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
X-List-Received-Date: Mon, 14 Aug 2017 11:08:00 -0000

From: Cleber Rosa <crosa@redhat.com>

The check script contains a commented out root user requirement,
probably because of its xfstests heritage.  This requirement doesn't
apply to qemu-iotests, so it better be gone.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/qemu-iotests/check | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 437ef65320..d504b6e455 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -123,12 +123,6 @@ fi
 # we need common
 . "$source_iotests/common"
 
-#if [ `id -u` -ne 0 ]
-#then
-#    echo "check: QA must be run as root"
-#    exit 1
-#fi
-
 TIMESTAMP_FILE=check.time-$IMGPROTO-$IMGFMT
 
 tmp="${TEST_DIR}"/$$
-- 
2.11.0


