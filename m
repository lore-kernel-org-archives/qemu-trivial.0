Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnav-0008FA-DV
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:07:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnas-0008Ah-LW
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnaq-00042Q-IX
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnak-0003th-SA; Sat, 08 Oct 2016 05:06:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1B0C040EB7;
	Sat,  8 Oct 2016 12:06:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DA8FBB2A;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: (nullmailer pid 19227 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:49 +0300
Message-Id: <496e079813ac793523213eebc099940b91855fd9.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/26] tests: Ignore test executables
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
X-List-Received-Date: Sat, 08 Oct 2016 09:06:59 -0000

From: Eric Blake <eblake@redhat.com>

Commits 9ef8112a and efad6682 introduced new tests, but forgot
to ignore the built executables from an in-tree build.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 0f0c79b..9f3d2ee 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -12,7 +12,9 @@ rcutorture
 test-aio
 test-base64
 test-bitops
+test-blockjob
 test-blockjob-txn
+test-bufferiszero
 test-clone-visitor
 test-coroutine
 test-crypto-afsplit
-- 
2.1.4


