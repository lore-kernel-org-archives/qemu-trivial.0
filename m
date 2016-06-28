Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuM4-0006lj-OX
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM2-0006hO-CN
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM0-0005g2-Vz
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLs-0005b0-Kg; Tue, 28 Jun 2016 10:51:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLl-00065k-TO; Tue, 28 Jun 2016 15:50:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 28 Jun 2016 15:50:49 +0100
Message-Id: <1467125451-16700-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 4/6] bswap.h: Remove unused cpu_to_*w() and
 *_to_cpup()
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
X-List-Received-Date: Tue, 28 Jun 2016 14:51:11 -0000

Now that all uses of cpu_to_*w() and *_to_cpup() have been replaced
with either ld*_p()/st*_p() or by doing direct dereferences and
using the cpu_to_*()/*_to_cpu() byteswap functions, we can remove
the unused implementations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/bswap.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ce3c42e..3b48cf4 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -99,16 +99,6 @@ static inline void endian ## size ## _to_cpus(type *p)\
 static inline void cpu_to_ ## endian ## size ## s(type *p)\
 {\
     glue(endian, _bswaps)(p, size);\
-}\
-\
-static inline type endian ## size ## _to_cpup(const type *p)\
-{\
-    return glue(glue(endian, size), _to_cpu)(*p);\
-}\
-\
-static inline void cpu_to_ ## endian ## size ## w(type *p, type v)\
-{\
-    *p = glue(glue(cpu_to_, endian), size)(v);\
 }
 
 CPU_CONVERT(be, 16, uint16_t)
-- 
1.9.1


