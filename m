Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Rrs-0004Bb-Gj
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 20:10:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S5Rrp-0003z0-DD
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 20:10:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S5Rrn-0006zL-L4
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 20:10:04 -0500
Received: from ozlabs.org ([203.10.76.45]:58898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1S5Rrh-0006w1-HW; Wed, 07 Mar 2012 20:09:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 90ED1B6F62; Thu,  8 Mar 2012 12:09:54 +1100 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-trivial@nongnu.org
Date: Thu,  8 Mar 2012 12:09:41 +1100
Message-Id: <1331168981-13139-2-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
References: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH 2/2] cache-utils.h needs stdint.h for
	uintptr_t
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 01:10:07 -0000

cache-utils.h uses the C99 standard uintptr_t type.  However, that type
comes from stdint.h which is not #included before cache-utils.h in all
configurations.  This patch adds the necessary include to fix this.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 cache-utils.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/cache-utils.h b/cache-utils.h
index 04a6e2e..b0f1786 100644
--- a/cache-utils.h
+++ b/cache-utils.h
@@ -1,6 +1,8 @@
 #ifndef QEMU_CACHE_UTILS_H
 #define QEMU_CACHE_UTILS_H
 
+#include <stdint.h>
+
 #if defined(_ARCH_PPC)
 struct qemu_cache_conf {
     unsigned long dcache_bsize;
-- 
1.7.9.1


