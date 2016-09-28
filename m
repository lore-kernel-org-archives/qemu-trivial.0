Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpOkp-0000FZ-6V
	for mharc-qemu-trivial@gnu.org; Wed, 28 Sep 2016 19:59:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bpOkl-0000E1-R0
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 19:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bpOki-0006Ya-0e
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 19:59:07 -0400
Received: from ozlabs.org ([103.22.144.67]:48833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bpOkh-0006YR-Lr
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 19:59:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3skvmt6zXzz9s8x; Thu, 29 Sep 2016 09:58:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1475107134;
	bh=mZc0P1nZFnoKdxww12w9e07gFJmk/oPI5HknYbyfEIY=;
	h=From:To:Cc:Subject:Date:From;
	b=EbKKJiptc+/QfvMNI53LKObDmqc6yjKDwf959Q64gVUjkYKSoCoUGpSP1cln7hltR
	T0csOhPURXs/papw6gdHhCcnUxATRqRRFZIswM7POWzcyvuS4fYNZTxCLIFWcIqUph
	05z3qDGdJyHKLOCTYp+pcYuXylzg5mQe/tpwHskc=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 29 Sep 2016 09:58:48 +1000
Message-Id: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: [Qemu-trivial] [PATCH] Update .gitignore
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
X-List-Received-Date: Wed, 28 Sep 2016 23:59:08 -0000

This adds one generated header, and a couple of testcase binaries to the
.gitignore files, which haven't yet been included.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 .gitignore       | 1 +
 tests/.gitignore | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index c91d018..1babcc2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,6 +20,7 @@
 /trace/generated-ust.c
 /ui/shader/texture-blit-frag.h
 /ui/shader/texture-blit-vert.h
+module_block.h
 *-timestamp
 /*-softmmu
 /*-darwin-user
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
2.7.4


