Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuM5-0006mR-24
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:51:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM2-0006hY-Cg
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuLw-0005eK-1M
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:10 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLs-0005b0-0k; Tue, 28 Jun 2016 10:51:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLm-00066A-Qw; Tue, 28 Jun 2016 15:50:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 28 Jun 2016 15:50:51 +0100
Message-Id: <1467125451-16700-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 6/6] bswap.h: Document cpu_to_* and *_to_cpu
 conversion functions
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

Add a documentation comment describing the functions for
converting between the cpu and little or bigendian formats.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/bswap.h | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index a17d9aa..be3233a 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -80,6 +80,64 @@ static inline void bswap64s(uint64_t *s)
 #define be_bswaps(p, size) do { *p = glue(bswap, size)(*p); } while(0)
 #endif
 
+/**
+ * Endianness conversion functions between host cpu and specified endianness.
+ * (We list the complete set of prototypes produced by the macros below
+ * to assist people who search the headers to find their definitions.)
+ *
+ * uint16_t le16_to_cpu(uint16_t v);
+ * uint32_t le32_to_cpu(uint32_t v);
+ * uint64_t le64_to_cpu(uint64_t v);
+ * uint16_t be16_to_cpu(uint16_t v);
+ * uint32_t be32_to_cpu(uint32_t v);
+ * uint64_t be64_to_cpu(uint64_t v);
+ *
+ * Convert the value @v from the specified format to the native
+ * endianness of the host CPU by byteswapping if necessary, and
+ * return the converted value.
+ *
+ * uint16_t cpu_to_le16(uint16_t v);
+ * uint32_t cpu_to_le32(uint32_t v);
+ * uint64_t cpu_to_le64(uint64_t v);
+ * uint16_t cpu_to_be16(uint16_t v);
+ * uint32_t cpu_to_be32(uint32_t v);
+ * uint64_t cpu_to_be64(uint64_t v);
+ *
+ * Convert the value @v from the native endianness of the host CPU to
+ * the specified format by byteswapping if necessary, and return
+ * the converted value.
+ *
+ * uint16_t le16_to_cpus(uint16_t *v);
+ * uint32_t le32_to_cpus(uint32_t *v);
+ * uint64_t le64_to_cpus(uint64_t *v);
+ * uint16_t be16_to_cpus(uint16_t *v);
+ * uint32_t be32_to_cpus(uint32_t *v);
+ * uint64_t be64_to_cpus(uint64_t *v);
+ *
+ * Do an in-place conversion of the value pointed to by @v from the
+ * specified format to the native endianness of the host CPU.
+ *
+ * uint16_t cpu_to_le16s(uint16_t *v);
+ * uint32_t cpu_to_le32s(uint32_t *v);
+ * uint64_t cpu_to_le64s(uint64_t *v);
+ * uint16_t cpu_to_be16s(uint16_t *v);
+ * uint32_t cpu_to_be32s(uint32_t *v);
+ * uint64_t cpu_to_be64s(uint64_t *v);
+ *
+ * Do an in-place conversion of the value pointed to by @v from the
+ * native endianness of the host CPU to the specified format.
+ *
+ * Both X_to_cpu() and cpu_to_X() perform the same operation; you
+ * should use whichever one is better documenting of the function your
+ * code is performing.
+ *
+ * Do not use these functions for conversion of values which are in guest
+ * memory, since the data may not be sufficiently aligned for the host CPU's
+ * load and store instructions. Instead you should use the ld*_p() and
+ * st*_p() functions, which perform loads and stores of data of any
+ * required size and endianness and handle possible misalignment.
+ */
+
 #define CPU_CONVERT(endian, size, type)\
 static inline type endian ## size ## _to_cpu(type v)\
 {\
-- 
1.9.1


