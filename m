Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmMGh-0003Zw-0u
	for mharc-qemu-trivial@gnu.org; Tue, 20 Sep 2016 10:43:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bmMGa-0003U6-N0
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 10:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bmMGV-0002zj-Uj
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 10:43:23 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bmMGP-0002uL-KK; Tue, 20 Sep 2016 10:43:13 -0400
Received: from red.redhat.com (unknown
	[IPv6:2602:30a:c7d0:7100:7657:7b6:d81b:9143])
	(Authenticated sender: eric@blake.one)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id C7E7EA8143;
	Tue, 20 Sep 2016 16:43:10 +0200 (CEST)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	berto@igalia.com,
	rth@twiddle.net
Date: Tue, 20 Sep 2016 09:43:01 -0500
Message-Id: <1474382581-12766-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.70.183.195
Subject: [Qemu-trivial] [PATCH] tests: Ignore test executables
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
X-List-Received-Date: Tue, 20 Sep 2016 14:43:29 -0000

Commits 9ef8112a and efad6682 introduced new tests, but forgot
to ignore the built executables from an in-tree build.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index b4a9cfc..bb25b7e 100644
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
2.7.4


