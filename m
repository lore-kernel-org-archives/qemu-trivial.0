Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAb8p-0001Wn-KS
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 06:55:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bAb8n-0001VA-DX
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bAb8l-00011s-JI
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:55:16 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:49740 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1bAb8f-0000wo-6A; Wed, 08 Jun 2016 06:55:09 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CHAwAO+VdX/5tjdVtdKgGDE4FTpj8FAYEPAZElgg+BeRKGAYE9OBQBAQEBAQEBZSeFRU9ONIgzAb09hV+JJXyEchwFjlmJdo4mAolChVkCj2EeNoE2AQuCL2uIS4FEAQEB
X-IPAS-Result: A2CHAwAO+VdX/5tjdVtdKgGDE4FTpj8FAYEPAZElgg+BeRKGAYE9OBQBAQEBAQEBZSeFRU9ONIgzAb09hV+JJXyEchwFjlmJdo4mAolChVkCj2EeNoE2AQuCL2uIS4FEAQEB
X-IronPort-AV: E=Sophos;i="5.26,438,1459807200"; d="scan'208";a="70751388"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 08 Jun 2016 12:55:06 +0200
Received: from [194.100.51.2] (helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1bAb8b-0000dL-S4; Wed, 08 Jun 2016 12:55:06 +0200
Received: from berto by perseus.local with local (Exim 4.87)
	(envelope-from <berto@igalia.com>)
	id 1bAb8M-0001pt-2S; Wed, 08 Jun 2016 13:54:50 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Alberto Garcia <berto@igalia.com>
Date: Wed,  8 Jun 2016 13:54:48 +0300
Message-Id: <1465383288-7021-1-git-send-email-berto@igalia.com>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: [Qemu-trivial] [PATCH] docs: Fix description of the leaky bucket
 algorithm in throttle.txt
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
X-List-Received-Date: Wed, 08 Jun 2016 10:55:18 -0000

Commit 0bab0ebb17759c926bd48fd396bd8cbb2c8e4a3e was supposed to fix
a mistake in the description of the leaky bucket algorithm, but the
version that finally landed after the review process was incorrect.

This patch solves that problem and hopefully clarifies the description
a bit better.

Signed-off-by: Alberto Garcia <berto@igalia.com>
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
2.8.1


