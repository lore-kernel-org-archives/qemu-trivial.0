Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCXa-0001xw-ET
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:48:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXS-0001kJ-TO
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXO-0001Yr-E6
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45718)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCXD-0001U9-HV; Thu, 27 Mar 2014 11:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 41F4443728;
	Thu, 27 Mar 2014 19:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AFA6668B;
	Thu, 27 Mar 2014 19:28:35 +0400 (MSK)
Received: (nullmailer pid 1786 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:15 +0400
Message-Id: <1395934108-1694-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/23] target-i386: Avoid shifting left into
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
X-List-Received-Date: Thu, 27 Mar 2014 15:48:23 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add 'U' suffixes where necessary to avoid (1 << 31) which
shifts left into the sign bit, which is undefined behaviour.
Add the suffix also for other constants in the same groupings
even if they don't shift into bit 31, for consistency.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/cpu.h |  334 ++++++++++++++++++++++++++---------------------------
 1 file changed, 167 insertions(+), 167 deletions(-)

diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 4d1374c..2a22a7d 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -194,35 +194,35 @@
 #define CR0_PE_SHIFT 0
 #define CR0_MP_SHIFT 1
 
-#define CR0_PE_MASK  (1 << 0)
-#define CR0_MP_MASK  (1 << 1)
-#define CR0_EM_MASK  (1 << 2)
-#define CR0_TS_MASK  (1 << 3)
-#define CR0_ET_MASK  (1 << 4)
-#define CR0_NE_MASK  (1 << 5)
-#define CR0_WP_MASK  (1 << 16)
-#define CR0_AM_MASK  (1 << 18)
-#define CR0_PG_MASK  (1 << 31)
-
-#define CR4_VME_MASK  (1 << 0)
-#define CR4_PVI_MASK  (1 << 1)
-#define CR4_TSD_MASK  (1 << 2)
-#define CR4_DE_MASK   (1 << 3)
-#define CR4_PSE_MASK  (1 << 4)
-#define CR4_PAE_MASK  (1 << 5)
-#define CR4_MCE_MASK  (1 << 6)
-#define CR4_PGE_MASK  (1 << 7)
-#define CR4_PCE_MASK  (1 << 8)
+#define CR0_PE_MASK  (1U << 0)
+#define CR0_MP_MASK  (1U << 1)
+#define CR0_EM_MASK  (1U << 2)
+#define CR0_TS_MASK  (1U << 3)
+#define CR0_ET_MASK  (1U << 4)
+#define CR0_NE_MASK  (1U << 5)
+#define CR0_WP_MASK  (1U << 16)
+#define CR0_AM_MASK  (1U << 18)
+#define CR0_PG_MASK  (1U << 31)
+
+#define CR4_VME_MASK  (1U << 0)
+#define CR4_PVI_MASK  (1U << 1)
+#define CR4_TSD_MASK  (1U << 2)
+#define CR4_DE_MASK   (1U << 3)
+#define CR4_PSE_MASK  (1U << 4)
+#define CR4_PAE_MASK  (1U << 5)
+#define CR4_MCE_MASK  (1U << 6)
+#define CR4_PGE_MASK  (1U << 7)
+#define CR4_PCE_MASK  (1U << 8)
 #define CR4_OSFXSR_SHIFT 9
-#define CR4_OSFXSR_MASK (1 << CR4_OSFXSR_SHIFT)
-#define CR4_OSXMMEXCPT_MASK  (1 << 10)
-#define CR4_VMXE_MASK   (1 << 13)
-#define CR4_SMXE_MASK   (1 << 14)
-#define CR4_FSGSBASE_MASK (1 << 16)
-#define CR4_PCIDE_MASK  (1 << 17)
-#define CR4_OSXSAVE_MASK (1 << 18)
-#define CR4_SMEP_MASK   (1 << 20)
-#define CR4_SMAP_MASK   (1 << 21)
+#define CR4_OSFXSR_MASK (1U << CR4_OSFXSR_SHIFT)
+#define CR4_OSXMMEXCPT_MASK  (1U << 10)
+#define CR4_VMXE_MASK   (1U << 13)
+#define CR4_SMXE_MASK   (1U << 14)
+#define CR4_FSGSBASE_MASK (1U << 16)
+#define CR4_PCIDE_MASK  (1U << 17)
+#define CR4_OSXSAVE_MASK (1U << 18)
+#define CR4_SMEP_MASK   (1U << 20)
+#define CR4_SMAP_MASK   (1U << 21)
 
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
@@ -407,96 +407,96 @@ typedef enum FeatureWord {
 typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 
 /* cpuid_features bits */
-#define CPUID_FP87 (1 << 0)
-#define CPUID_VME  (1 << 1)
-#define CPUID_DE   (1 << 2)
-#define CPUID_PSE  (1 << 3)
-#define CPUID_TSC  (1 << 4)
-#define CPUID_MSR  (1 << 5)
-#define CPUID_PAE  (1 << 6)
-#define CPUID_MCE  (1 << 7)
-#define CPUID_CX8  (1 << 8)
-#define CPUID_APIC (1 << 9)
-#define CPUID_SEP  (1 << 11) /* sysenter/sysexit */
-#define CPUID_MTRR (1 << 12)
-#define CPUID_PGE  (1 << 13)
-#define CPUID_MCA  (1 << 14)
-#define CPUID_CMOV (1 << 15)
-#define CPUID_PAT  (1 << 16)
-#define CPUID_PSE36   (1 << 17)
-#define CPUID_PN   (1 << 18)
-#define CPUID_CLFLUSH (1 << 19)
-#define CPUID_DTS (1 << 21)
-#define CPUID_ACPI (1 << 22)
-#define CPUID_MMX  (1 << 23)
-#define CPUID_FXSR (1 << 24)
-#define CPUID_SSE  (1 << 25)
-#define CPUID_SSE2 (1 << 26)
-#define CPUID_SS (1 << 27)
-#define CPUID_HT (1 << 28)
-#define CPUID_TM (1 << 29)
-#define CPUID_IA64 (1 << 30)
-#define CPUID_PBE (1 << 31)
-
-#define CPUID_EXT_SSE3     (1 << 0)
-#define CPUID_EXT_PCLMULQDQ (1 << 1)
-#define CPUID_EXT_DTES64   (1 << 2)
-#define CPUID_EXT_MONITOR  (1 << 3)
-#define CPUID_EXT_DSCPL    (1 << 4)
-#define CPUID_EXT_VMX      (1 << 5)
-#define CPUID_EXT_SMX      (1 << 6)
-#define CPUID_EXT_EST      (1 << 7)
-#define CPUID_EXT_TM2      (1 << 8)
-#define CPUID_EXT_SSSE3    (1 << 9)
-#define CPUID_EXT_CID      (1 << 10)
-#define CPUID_EXT_FMA      (1 << 12)
-#define CPUID_EXT_CX16     (1 << 13)
-#define CPUID_EXT_XTPR     (1 << 14)
-#define CPUID_EXT_PDCM     (1 << 15)
-#define CPUID_EXT_PCID     (1 << 17)
-#define CPUID_EXT_DCA      (1 << 18)
-#define CPUID_EXT_SSE41    (1 << 19)
-#define CPUID_EXT_SSE42    (1 << 20)
-#define CPUID_EXT_X2APIC   (1 << 21)
-#define CPUID_EXT_MOVBE    (1 << 22)
-#define CPUID_EXT_POPCNT   (1 << 23)
-#define CPUID_EXT_TSC_DEADLINE_TIMER (1 << 24)
-#define CPUID_EXT_AES      (1 << 25)
-#define CPUID_EXT_XSAVE    (1 << 26)
-#define CPUID_EXT_OSXSAVE  (1 << 27)
-#define CPUID_EXT_AVX      (1 << 28)
-#define CPUID_EXT_F16C     (1 << 29)
-#define CPUID_EXT_RDRAND   (1 << 30)
-#define CPUID_EXT_HYPERVISOR  (1 << 31)
-
-#define CPUID_EXT2_FPU     (1 << 0)
-#define CPUID_EXT2_VME     (1 << 1)
-#define CPUID_EXT2_DE      (1 << 2)
-#define CPUID_EXT2_PSE     (1 << 3)
-#define CPUID_EXT2_TSC     (1 << 4)
-#define CPUID_EXT2_MSR     (1 << 5)
-#define CPUID_EXT2_PAE     (1 << 6)
-#define CPUID_EXT2_MCE     (1 << 7)
-#define CPUID_EXT2_CX8     (1 << 8)
-#define CPUID_EXT2_APIC    (1 << 9)
-#define CPUID_EXT2_SYSCALL (1 << 11)
-#define CPUID_EXT2_MTRR    (1 << 12)
-#define CPUID_EXT2_PGE     (1 << 13)
-#define CPUID_EXT2_MCA     (1 << 14)
-#define CPUID_EXT2_CMOV    (1 << 15)
-#define CPUID_EXT2_PAT     (1 << 16)
-#define CPUID_EXT2_PSE36   (1 << 17)
-#define CPUID_EXT2_MP      (1 << 19)
-#define CPUID_EXT2_NX      (1 << 20)
-#define CPUID_EXT2_MMXEXT  (1 << 22)
-#define CPUID_EXT2_MMX     (1 << 23)
-#define CPUID_EXT2_FXSR    (1 << 24)
-#define CPUID_EXT2_FFXSR   (1 << 25)
-#define CPUID_EXT2_PDPE1GB (1 << 26)
-#define CPUID_EXT2_RDTSCP  (1 << 27)
-#define CPUID_EXT2_LM      (1 << 29)
-#define CPUID_EXT2_3DNOWEXT (1 << 30)
-#define CPUID_EXT2_3DNOW   (1 << 31)
+#define CPUID_FP87 (1U << 0)
+#define CPUID_VME  (1U << 1)
+#define CPUID_DE   (1U << 2)
+#define CPUID_PSE  (1U << 3)
+#define CPUID_TSC  (1U << 4)
+#define CPUID_MSR  (1U << 5)
+#define CPUID_PAE  (1U << 6)
+#define CPUID_MCE  (1U << 7)
+#define CPUID_CX8  (1U << 8)
+#define CPUID_APIC (1U << 9)
+#define CPUID_SEP  (1U << 11) /* sysenter/sysexit */
+#define CPUID_MTRR (1U << 12)
+#define CPUID_PGE  (1U << 13)
+#define CPUID_MCA  (1U << 14)
+#define CPUID_CMOV (1U << 15)
+#define CPUID_PAT  (1U << 16)
+#define CPUID_PSE36   (1U << 17)
+#define CPUID_PN   (1U << 18)
+#define CPUID_CLFLUSH (1U << 19)
+#define CPUID_DTS (1U << 21)
+#define CPUID_ACPI (1U << 22)
+#define CPUID_MMX  (1U << 23)
+#define CPUID_FXSR (1U << 24)
+#define CPUID_SSE  (1U << 25)
+#define CPUID_SSE2 (1U << 26)
+#define CPUID_SS (1U << 27)
+#define CPUID_HT (1U << 28)
+#define CPUID_TM (1U << 29)
+#define CPUID_IA64 (1U << 30)
+#define CPUID_PBE (1U << 31)
+
+#define CPUID_EXT_SSE3     (1U << 0)
+#define CPUID_EXT_PCLMULQDQ (1U << 1)
+#define CPUID_EXT_DTES64   (1U << 2)
+#define CPUID_EXT_MONITOR  (1U << 3)
+#define CPUID_EXT_DSCPL    (1U << 4)
+#define CPUID_EXT_VMX      (1U << 5)
+#define CPUID_EXT_SMX      (1U << 6)
+#define CPUID_EXT_EST      (1U << 7)
+#define CPUID_EXT_TM2      (1U << 8)
+#define CPUID_EXT_SSSE3    (1U << 9)
+#define CPUID_EXT_CID      (1U << 10)
+#define CPUID_EXT_FMA      (1U << 12)
+#define CPUID_EXT_CX16     (1U << 13)
+#define CPUID_EXT_XTPR     (1U << 14)
+#define CPUID_EXT_PDCM     (1U << 15)
+#define CPUID_EXT_PCID     (1U << 17)
+#define CPUID_EXT_DCA      (1U << 18)
+#define CPUID_EXT_SSE41    (1U << 19)
+#define CPUID_EXT_SSE42    (1U << 20)
+#define CPUID_EXT_X2APIC   (1U << 21)
+#define CPUID_EXT_MOVBE    (1U << 22)
+#define CPUID_EXT_POPCNT   (1U << 23)
+#define CPUID_EXT_TSC_DEADLINE_TIMER (1U << 24)
+#define CPUID_EXT_AES      (1U << 25)
+#define CPUID_EXT_XSAVE    (1U << 26)
+#define CPUID_EXT_OSXSAVE  (1U << 27)
+#define CPUID_EXT_AVX      (1U << 28)
+#define CPUID_EXT_F16C     (1U << 29)
+#define CPUID_EXT_RDRAND   (1U << 30)
+#define CPUID_EXT_HYPERVISOR  (1U << 31)
+
+#define CPUID_EXT2_FPU     (1U << 0)
+#define CPUID_EXT2_VME     (1U << 1)
+#define CPUID_EXT2_DE      (1U << 2)
+#define CPUID_EXT2_PSE     (1U << 3)
+#define CPUID_EXT2_TSC     (1U << 4)
+#define CPUID_EXT2_MSR     (1U << 5)
+#define CPUID_EXT2_PAE     (1U << 6)
+#define CPUID_EXT2_MCE     (1U << 7)
+#define CPUID_EXT2_CX8     (1U << 8)
+#define CPUID_EXT2_APIC    (1U << 9)
+#define CPUID_EXT2_SYSCALL (1U << 11)
+#define CPUID_EXT2_MTRR    (1U << 12)
+#define CPUID_EXT2_PGE     (1U << 13)
+#define CPUID_EXT2_MCA     (1U << 14)
+#define CPUID_EXT2_CMOV    (1U << 15)
+#define CPUID_EXT2_PAT     (1U << 16)
+#define CPUID_EXT2_PSE36   (1U << 17)
+#define CPUID_EXT2_MP      (1U << 19)
+#define CPUID_EXT2_NX      (1U << 20)
+#define CPUID_EXT2_MMXEXT  (1U << 22)
+#define CPUID_EXT2_MMX     (1U << 23)
+#define CPUID_EXT2_FXSR    (1U << 24)
+#define CPUID_EXT2_FFXSR   (1U << 25)
+#define CPUID_EXT2_PDPE1GB (1U << 26)
+#define CPUID_EXT2_RDTSCP  (1U << 27)
+#define CPUID_EXT2_LM      (1U << 29)
+#define CPUID_EXT2_3DNOWEXT (1U << 30)
+#define CPUID_EXT2_3DNOW   (1U << 31)
 
 /* CPUID[8000_0001].EDX bits that are aliase of CPUID[1].EDX bits on AMD CPUs */
 #define CPUID_EXT2_AMD_ALIASES (CPUID_EXT2_FPU | CPUID_EXT2_VME | \
@@ -509,53 +509,53 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
                                 CPUID_EXT2_PAT | CPUID_EXT2_PSE36 | \
                                 CPUID_EXT2_MMX | CPUID_EXT2_FXSR)
 
-#define CPUID_EXT3_LAHF_LM (1 << 0)
-#define CPUID_EXT3_CMP_LEG (1 << 1)
-#define CPUID_EXT3_SVM     (1 << 2)
-#define CPUID_EXT3_EXTAPIC (1 << 3)
-#define CPUID_EXT3_CR8LEG  (1 << 4)
-#define CPUID_EXT3_ABM     (1 << 5)
-#define CPUID_EXT3_SSE4A   (1 << 6)
-#define CPUID_EXT3_MISALIGNSSE (1 << 7)
-#define CPUID_EXT3_3DNOWPREFETCH (1 << 8)
-#define CPUID_EXT3_OSVW    (1 << 9)
-#define CPUID_EXT3_IBS     (1 << 10)
-#define CPUID_EXT3_XOP     (1 << 11)
-#define CPUID_EXT3_SKINIT  (1 << 12)
-#define CPUID_EXT3_WDT     (1 << 13)
-#define CPUID_EXT3_LWP     (1 << 15)
-#define CPUID_EXT3_FMA4    (1 << 16)
-#define CPUID_EXT3_TCE     (1 << 17)
-#define CPUID_EXT3_NODEID  (1 << 19)
-#define CPUID_EXT3_TBM     (1 << 21)
-#define CPUID_EXT3_TOPOEXT (1 << 22)
-#define CPUID_EXT3_PERFCORE (1 << 23)
-#define CPUID_EXT3_PERFNB  (1 << 24)
-
-#define CPUID_SVM_NPT          (1 << 0)
-#define CPUID_SVM_LBRV         (1 << 1)
-#define CPUID_SVM_SVMLOCK      (1 << 2)
-#define CPUID_SVM_NRIPSAVE     (1 << 3)
-#define CPUID_SVM_TSCSCALE     (1 << 4)
-#define CPUID_SVM_VMCBCLEAN    (1 << 5)
-#define CPUID_SVM_FLUSHASID    (1 << 6)
-#define CPUID_SVM_DECODEASSIST (1 << 7)
-#define CPUID_SVM_PAUSEFILTER  (1 << 10)
-#define CPUID_SVM_PFTHRESHOLD  (1 << 12)
-
-#define CPUID_7_0_EBX_FSGSBASE (1 << 0)
-#define CPUID_7_0_EBX_BMI1     (1 << 3)
-#define CPUID_7_0_EBX_HLE      (1 << 4)
-#define CPUID_7_0_EBX_AVX2     (1 << 5)
-#define CPUID_7_0_EBX_SMEP     (1 << 7)
-#define CPUID_7_0_EBX_BMI2     (1 << 8)
-#define CPUID_7_0_EBX_ERMS     (1 << 9)
-#define CPUID_7_0_EBX_INVPCID  (1 << 10)
-#define CPUID_7_0_EBX_RTM      (1 << 11)
-#define CPUID_7_0_EBX_MPX      (1 << 14)
-#define CPUID_7_0_EBX_RDSEED   (1 << 18)
-#define CPUID_7_0_EBX_ADX      (1 << 19)
-#define CPUID_7_0_EBX_SMAP     (1 << 20)
+#define CPUID_EXT3_LAHF_LM (1U << 0)
+#define CPUID_EXT3_CMP_LEG (1U << 1)
+#define CPUID_EXT3_SVM     (1U << 2)
+#define CPUID_EXT3_EXTAPIC (1U << 3)
+#define CPUID_EXT3_CR8LEG  (1U << 4)
+#define CPUID_EXT3_ABM     (1U << 5)
+#define CPUID_EXT3_SSE4A   (1U << 6)
+#define CPUID_EXT3_MISALIGNSSE (1U << 7)
+#define CPUID_EXT3_3DNOWPREFETCH (1U << 8)
+#define CPUID_EXT3_OSVW    (1U << 9)
+#define CPUID_EXT3_IBS     (1U << 10)
+#define CPUID_EXT3_XOP     (1U << 11)
+#define CPUID_EXT3_SKINIT  (1U << 12)
+#define CPUID_EXT3_WDT     (1U << 13)
+#define CPUID_EXT3_LWP     (1U << 15)
+#define CPUID_EXT3_FMA4    (1U << 16)
+#define CPUID_EXT3_TCE     (1U << 17)
+#define CPUID_EXT3_NODEID  (1U << 19)
+#define CPUID_EXT3_TBM     (1U << 21)
+#define CPUID_EXT3_TOPOEXT (1U << 22)
+#define CPUID_EXT3_PERFCORE (1U << 23)
+#define CPUID_EXT3_PERFNB  (1U << 24)
+
+#define CPUID_SVM_NPT          (1U << 0)
+#define CPUID_SVM_LBRV         (1U << 1)
+#define CPUID_SVM_SVMLOCK      (1U << 2)
+#define CPUID_SVM_NRIPSAVE     (1U << 3)
+#define CPUID_SVM_TSCSCALE     (1U << 4)
+#define CPUID_SVM_VMCBCLEAN    (1U << 5)
+#define CPUID_SVM_FLUSHASID    (1U << 6)
+#define CPUID_SVM_DECODEASSIST (1U << 7)
+#define CPUID_SVM_PAUSEFILTER  (1U << 10)
+#define CPUID_SVM_PFTHRESHOLD  (1U << 12)
+
+#define CPUID_7_0_EBX_FSGSBASE (1U << 0)
+#define CPUID_7_0_EBX_BMI1     (1U << 3)
+#define CPUID_7_0_EBX_HLE      (1U << 4)
+#define CPUID_7_0_EBX_AVX2     (1U << 5)
+#define CPUID_7_0_EBX_SMEP     (1U << 7)
+#define CPUID_7_0_EBX_BMI2     (1U << 8)
+#define CPUID_7_0_EBX_ERMS     (1U << 9)
+#define CPUID_7_0_EBX_INVPCID  (1U << 10)
+#define CPUID_7_0_EBX_RTM      (1U << 11)
+#define CPUID_7_0_EBX_MPX      (1U << 14)
+#define CPUID_7_0_EBX_RDSEED   (1U << 18)
+#define CPUID_7_0_EBX_ADX      (1U << 19)
+#define CPUID_7_0_EBX_SMAP     (1U << 20)
 
 #define CPUID_VENDOR_SZ      12
 
@@ -571,8 +571,8 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 
 #define CPUID_VENDOR_VIA   "CentaurHauls"
 
-#define CPUID_MWAIT_IBE     (1 << 1) /* Interrupts can exit capability */
-#define CPUID_MWAIT_EMX     (1 << 0) /* enumeration supported */
+#define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
+#define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */
 
 #ifndef HYPERV_SPINLOCK_NEVER_RETRY
 #define HYPERV_SPINLOCK_NEVER_RETRY             0xFFFFFFFF
-- 
1.7.10.4


