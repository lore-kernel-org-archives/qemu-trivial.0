Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bb-0005Pc-WF
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bR-00055E-Jf
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bM-0003Op-9S
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:09 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:39685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5bA-0003JX-FF; Mon, 10 Mar 2014 15:10:52 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002Sz-2L; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:37 +0000
Message-Id: <1394478649-9453-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 01/12] target-i386: Avoid shifting left into
	sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 19:11:14 -0000

Add 'U' suffixes where necessary to avoid (1 << 31) which
shifts left into the sign bit, which is undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-i386/cpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 0014acc..064f987 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -202,7 +202,7 @@
 #define CR0_NE_MASK  (1 << 5)
 #define CR0_WP_MASK  (1 << 16)
 #define CR0_AM_MASK  (1 << 18)
-#define CR0_PG_MASK  (1 << 31)
+#define CR0_PG_MASK  (1U << 31)
 
 #define CR4_VME_MASK  (1 << 0)
 #define CR4_PVI_MASK  (1 << 1)
@@ -436,7 +436,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_HT (1 << 28)
 #define CPUID_TM (1 << 29)
 #define CPUID_IA64 (1 << 30)
-#define CPUID_PBE (1 << 31)
+#define CPUID_PBE (1U << 31)
 
 #define CPUID_EXT_SSE3     (1 << 0)
 #define CPUID_EXT_PCLMULQDQ (1 << 1)
@@ -467,7 +467,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_EXT_AVX      (1 << 28)
 #define CPUID_EXT_F16C     (1 << 29)
 #define CPUID_EXT_RDRAND   (1 << 30)
-#define CPUID_EXT_HYPERVISOR  (1 << 31)
+#define CPUID_EXT_HYPERVISOR  (1U << 31)
 
 #define CPUID_EXT2_FPU     (1 << 0)
 #define CPUID_EXT2_VME     (1 << 1)
@@ -496,7 +496,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_EXT2_RDTSCP  (1 << 27)
 #define CPUID_EXT2_LM      (1 << 29)
 #define CPUID_EXT2_3DNOWEXT (1 << 30)
-#define CPUID_EXT2_3DNOW   (1 << 31)
+#define CPUID_EXT2_3DNOW   (1U << 31)
 
 /* CPUID[8000_0001].EDX bits that are aliase of CPUID[1].EDX bits on AMD CPUs */
 #define CPUID_EXT2_AMD_ALIASES (CPUID_EXT2_FPU | CPUID_EXT2_VME | \
-- 
1.9.0


