Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuM2-0006hp-5b
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM0-0006eE-6U
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuLy-0005f4-Dv
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLs-0005b0-Az; Tue, 28 Jun 2016 10:51:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLm-00065x-CH; Tue, 28 Jun 2016 15:50:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 28 Jun 2016 15:50:50 +0100
Message-Id: <1467125451-16700-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 5/6] bswap.h: Fix comment typo
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
X-List-Received-Date: Tue, 28 Jun 2016 14:51:09 -0000

Fix a typo in a comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/bswap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 3b48cf4..a17d9aa 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -116,7 +116,7 @@ static inline uint32_t qemu_bswap_len(uint32_t value, int len)
 }
 
 /*
- * Same as cpu_to_le{16,23}, except that gcc will figure the result is
+ * Same as cpu_to_le{16,32}, except that gcc will figure the result is
  * a compile-time constant if you pass in a constant.  So this can be
  * used to initialize static variables.
  */
-- 
1.9.1


