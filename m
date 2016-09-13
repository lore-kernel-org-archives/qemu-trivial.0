Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqFg-0000ek-W9
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:08:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFa-0000XL-C1
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFW-0004Oy-GC
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqFN-0003zr-DW; Tue, 13 Sep 2016 12:07:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7F915416D8;
	Tue, 13 Sep 2016 19:07:40 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 50968AFB;
	Tue, 13 Sep 2016 19:07:39 +0300 (MSK)
Received: (nullmailer pid 31885 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Alberto Garcia <berto@igalia.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:40 +0300
Message-Id: <37e3645ad3974db6008c212edf68c7f9da1bedc7.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/16] docs: Fix description of the leaky
 bucket algorithm in throttle.txt
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
X-List-Received-Date: Tue, 13 Sep 2016 16:08:02 -0000

From: Alberto Garcia <berto@igalia.com>

Commit 0bab0ebb17759c926bd48fd396bd8cbb2c8e4a3e was supposed to fix
a mistake in the description of the leaky bucket algorithm, but the
version that finally landed after the review process was incorrect.

This patch solves that problem and hopefully clarifies the description
a bit better.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/throttle.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/throttle.txt b/docs/throttle.txt
index 26d4d51..cd4e109 100644
--- a/docs/throttle.txt
+++ b/docs/throttle.txt
@@ -235,7 +235,10 @@ consider the following values:
   - Water leaks from the bucket at a rate of 100 IOPS.
   - Water can be added to the bucket at a rate of 2000 IOPS.
   - The size of the bucket is 2000 x 60 = 120000
-  - If 'iops-total-max' is unset then the bucket size is 100 x 60.
+  - If 'iops-total-max-length' is unset then it defaults to 1 and the
+    size of the bucket is 2000.
+  - If 'iops-total-max' is unset then 'iops-total-max-length' must be
+    unset as well. In this case the bucket size is 100.
 
 The bucket is initially empty, therefore water can be added until it's
 full at a rate of 2000 IOPS (the burst rate). Once the bucket is full
-- 
2.1.4


