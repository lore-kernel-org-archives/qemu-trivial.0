Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GL2-0006jR-Ut
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:10:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0006gT-KS
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GKz-0000jo-S9
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35631)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GKv-0000hZ-DA; Sun, 07 May 2017 03:10:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AB8614047F;
	Sun,  7 May 2017 10:10:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5D02C43A;
	Sun,  7 May 2017 10:02:32 +0300 (MSK)
Received: (nullmailer pid 26577 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:22 +0300
Message-Id: <09f606f4f982b1914f1e54ac14c60cda566ff4d9.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/23] tests: Ignore another built executable
 (test-hmp)
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
X-List-Received-Date: Sun, 07 May 2017 07:10:39 -0000

From: Eric Blake <eblake@redhat.com>

Commit 78f86a2b7 added a new test, but forgot to exclude the built
binary from version control.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 5ab00a9c95..40c2e3e757 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -40,6 +40,7 @@ test-crypto-tlssession-server/
 test-crypto-xts
 test-cutils
 test-hbitmap
+test-hmp
 test-int128
 test-iov
 test-io-channel-buffer
-- 
2.11.0


