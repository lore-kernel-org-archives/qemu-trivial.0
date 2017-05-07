Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GL5-0006mw-BR
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0006gf-TW
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0000k3-2b
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GKv-0000hf-KV; Sun, 07 May 2017 03:10:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 036A740482;
	Sun,  7 May 2017 10:10:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AF8A4438;
	Sun,  7 May 2017 10:02:31 +0300 (MSK)
Received: (nullmailer pid 26585 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:26 +0300
Message-Id: <311875781e549af91a3216d34c6ef40420bab435.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/23] tests: Remove redundant assignment
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
X-List-Received-Date: Sun, 07 May 2017 07:10:40 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/postcopy-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/postcopy-test.c b/tests/postcopy-test.c
index de35a18903..e86f87656a 100644
--- a/tests/postcopy-test.c
+++ b/tests/postcopy-test.c
@@ -41,7 +41,7 @@ static bool ufd_version_check(void)
     struct uffdio_api api_struct;
     uint64_t ioctl_mask;
 
-    int ufd = ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    int ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
 
     if (ufd == -1) {
         g_test_message("Skipping test: userfaultfd not available");
-- 
2.11.0


