Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7Go9-0001Tk-NE
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:40:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go3-0001QM-9c
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go2-000743-MD
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7Gny-00071c-54; Sun, 07 May 2017 03:40:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9C92240482;
	Sun,  7 May 2017 10:40:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E1343431;
	Sun,  7 May 2017 10:02:29 +0300 (MSK)
Received: (nullmailer pid 26548 invoked by uid 1000);
	Sun, 07 May 2017 07:02:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:08 +0300
Message-Id: <46bbbec2d30c3d791a6d328e5ef861694ff3eafb.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/23] tests: Ignore more test executables
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
X-List-Received-Date: Sun, 07 May 2017 07:40:40 -0000

From: Eric Blake <eblake@redhat.com>

Ignore test executables when building in-tree:
test-arm-mptimer introduced in commit 882fac3
test-crypto-hmac introduced in commit 4fd460b
test-aio-multithread introduced in commit 0c330a7

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index a966740c2c..5ab00a9c95 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -11,6 +11,8 @@ check-qom-proplist
 qht-bench
 rcutorture
 test-aio
+test-aio-multithread
+test-arm-mptimer
 test-base64
 test-bitops
 test-bitcnt
@@ -24,6 +26,7 @@ test-crypto-afsplit
 test-crypto-block
 test-crypto-cipher
 test-crypto-hash
+test-crypto-hmac
 test-crypto-ivgen
 test-crypto-pbkdf
 test-crypto-secret
-- 
2.11.0


