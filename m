Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmfSt-00043e-SV
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 03:27:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSn-0003rK-RN
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSi-0001Uf-NP
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:25 -0400
Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b]:65372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UmfSi-0001U4-7a
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 03:27:20 -0400
Received: by mail-pb0-f43.google.com with SMTP id md12so8385900pbc.16
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 00:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=2nLw2Ac/tcd8XsR5Ajyfi2Zk4niUCVWmU3va5wbUCb0=;
	b=IydHsIJTxULa9zrQHtGrbp7OLR+YLfA52pJCw3FkF1L9h1HuqNZEh7nzPOft+9hoyp
	/3qMYWrRmZqX0m76VrSuhEBB8oCE6qpzYGhr+FUtxzHUBgMgSYeEtxGpfT17PrcuVe2s
	GX2u7omtlnhbNO91l8xs3z/Gm3EDvAWc+tU9WBtxCSd4BjBMSZmur1CWhZBNWeh0KeNY
	edYPUgyhRRGaJ1KZyLrhW6B9WP0ciZYWyQ1beLuc9gRuEPk1ciAbPD/ECsWOxITMiHWQ
	BBH1F8FIW9Q0FtHL9OtPUeGvPnEOYavgGgpUxGl7i4LcHlVxZASUHuVWGFBOfbb0l2SS
	UgrA==
X-Received: by 10.68.170.193 with SMTP id ao1mr18673187pbc.18.1371022039445;
	Wed, 12 Jun 2013 00:27:19 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fp2sm18055499pbb.36.2013.06.12.00.27.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 00:27:18 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2013 17:26:55 +1000
Message-Id: <1371022015-7576-5-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
References: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
X-Gm-Message-State: ALoCoQnb22QbwZLtOI4b2kSSx6D67S0MOB6ly1y3ptjK1KiUgfF8OZg5pRsBBegExJMPQrJUN0eg
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22b
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 4/4] linux-headers: Update to v3.10-rc5
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
X-List-Received-Date: Wed, 12 Jun 2013 07:27:30 -0000

This adds symbols required for PPC64 pseries platform features:
1. sPAPR live migration;
2. in-kernel XICS interrupt controller.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 linux-headers/asm-arm/kvm.h       |   12 ++--
 linux-headers/asm-mips/kvm.h      |  138 +++++++++++++++++++++++++++++++++++++
 linux-headers/asm-mips/kvm_para.h |    1 +
 linux-headers/asm-powerpc/kvm.h   |   89 ++++++++++++++++++++++++
 linux-headers/asm-x86/kvm.h       |    1 -
 linux-headers/linux/kvm.h         |   42 +++++++++--
 linux-headers/linux/vfio.h        |    1 +
 linux-headers/linux/vhost.h       |   28 ++++++++
 8 files changed, 299 insertions(+), 13 deletions(-)
 create mode 100644 linux-headers/asm-mips/kvm.h
 create mode 100644 linux-headers/asm-mips/kvm_para.h

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 023bfeb..c1ee007 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -53,12 +53,12 @@
 #define KVM_ARM_FIQ_spsr	fiq_regs[7]
 
 struct kvm_regs {
-	struct pt_regs usr_regs;/* R0_usr - R14_usr, PC, CPSR */
-	__u32 svc_regs[3];	/* SP_svc, LR_svc, SPSR_svc */
-	__u32 abt_regs[3];	/* SP_abt, LR_abt, SPSR_abt */
-	__u32 und_regs[3];	/* SP_und, LR_und, SPSR_und */
-	__u32 irq_regs[3];	/* SP_irq, LR_irq, SPSR_irq */
-	__u32 fiq_regs[8];	/* R8_fiq - R14_fiq, SPSR_fiq */
+	struct pt_regs usr_regs;	/* R0_usr - R14_usr, PC, CPSR */
+	unsigned long svc_regs[3];	/* SP_svc, LR_svc, SPSR_svc */
+	unsigned long abt_regs[3];	/* SP_abt, LR_abt, SPSR_abt */
+	unsigned long und_regs[3];	/* SP_und, LR_und, SPSR_und */
+	unsigned long irq_regs[3];	/* SP_irq, LR_irq, SPSR_irq */
+	unsigned long fiq_regs[8];	/* R8_fiq - R14_fiq, SPSR_fiq */
 };
 
 /* Supported Processor Types */
diff --git a/linux-headers/asm-mips/kvm.h b/linux-headers/asm-mips/kvm.h
new file mode 100644
index 0000000..3f424f5
--- /dev/null
+++ b/linux-headers/asm-mips/kvm.h
@@ -0,0 +1,138 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (C) 2012  MIPS Technologies, Inc.  All rights reserved.
+ * Copyright (C) 2013 Cavium, Inc.
+ * Authors: Sanjay Lal <sanjayl@kymasys.com>
+ */
+
+#ifndef __LINUX_KVM_MIPS_H
+#define __LINUX_KVM_MIPS_H
+
+#include <linux/types.h>
+
+/*
+ * KVM MIPS specific structures and definitions.
+ *
+ * Some parts derived from the x86 version of this file.
+ */
+
+/*
+ * for KVM_GET_REGS and KVM_SET_REGS
+ *
+ * If Config[AT] is zero (32-bit CPU), the register contents are
+ * stored in the lower 32-bits of the struct kvm_regs fields and sign
+ * extended to 64-bits.
+ */
+struct kvm_regs {
+	/* out (KVM_GET_REGS) / in (KVM_SET_REGS) */
+	__u64 gpr[32];
+	__u64 hi;
+	__u64 lo;
+	__u64 pc;
+};
+
+/*
+ * for KVM_GET_FPU and KVM_SET_FPU
+ *
+ * If Status[FR] is zero (32-bit FPU), the upper 32-bits of the FPRs
+ * are zero filled.
+ */
+struct kvm_fpu {
+	__u64 fpr[32];
+	__u32 fir;
+	__u32 fccr;
+	__u32 fexr;
+	__u32 fenr;
+	__u32 fcsr;
+	__u32 pad;
+};
+
+
+/*
+ * For MIPS, we use KVM_SET_ONE_REG and KVM_GET_ONE_REG to access CP0
+ * registers.  The id field is broken down as follows:
+ *
+ *  bits[2..0]   - Register 'sel' index.
+ *  bits[7..3]   - Register 'rd'  index.
+ *  bits[15..8]  - Must be zero.
+ *  bits[63..16] - 1 -> CP0 registers.
+ *
+ * Other sets registers may be added in the future.  Each set would
+ * have its own identifier in bits[63..16].
+ *
+ * The addr field of struct kvm_one_reg must point to an aligned
+ * 64-bit wide location.  For registers that are narrower than
+ * 64-bits, the value is stored in the low order bits of the location,
+ * and sign extended to 64-bits.
+ *
+ * The registers defined in struct kvm_regs are also accessible, the
+ * id values for these are below.
+ */
+
+#define KVM_REG_MIPS_R0 0
+#define KVM_REG_MIPS_R1 1
+#define KVM_REG_MIPS_R2 2
+#define KVM_REG_MIPS_R3 3
+#define KVM_REG_MIPS_R4 4
+#define KVM_REG_MIPS_R5 5
+#define KVM_REG_MIPS_R6 6
+#define KVM_REG_MIPS_R7 7
+#define KVM_REG_MIPS_R8 8
+#define KVM_REG_MIPS_R9 9
+#define KVM_REG_MIPS_R10 10
+#define KVM_REG_MIPS_R11 11
+#define KVM_REG_MIPS_R12 12
+#define KVM_REG_MIPS_R13 13
+#define KVM_REG_MIPS_R14 14
+#define KVM_REG_MIPS_R15 15
+#define KVM_REG_MIPS_R16 16
+#define KVM_REG_MIPS_R17 17
+#define KVM_REG_MIPS_R18 18
+#define KVM_REG_MIPS_R19 19
+#define KVM_REG_MIPS_R20 20
+#define KVM_REG_MIPS_R21 21
+#define KVM_REG_MIPS_R22 22
+#define KVM_REG_MIPS_R23 23
+#define KVM_REG_MIPS_R24 24
+#define KVM_REG_MIPS_R25 25
+#define KVM_REG_MIPS_R26 26
+#define KVM_REG_MIPS_R27 27
+#define KVM_REG_MIPS_R28 28
+#define KVM_REG_MIPS_R29 29
+#define KVM_REG_MIPS_R30 30
+#define KVM_REG_MIPS_R31 31
+
+#define KVM_REG_MIPS_HI 32
+#define KVM_REG_MIPS_LO 33
+#define KVM_REG_MIPS_PC 34
+
+/*
+ * KVM MIPS specific structures and definitions
+ *
+ */
+struct kvm_debug_exit_arch {
+	__u64 epc;
+};
+
+/* for KVM_SET_GUEST_DEBUG */
+struct kvm_guest_debug_arch {
+};
+
+/* definition of registers in kvm_run */
+struct kvm_sync_regs {
+};
+
+/* dummy definition */
+struct kvm_sregs {
+};
+
+struct kvm_mips_interrupt {
+	/* in */
+	__u32 cpu;
+	__u32 irq;
+};
+
+#endif /* __LINUX_KVM_MIPS_H */
diff --git a/linux-headers/asm-mips/kvm_para.h b/linux-headers/asm-mips/kvm_para.h
new file mode 100644
index 0000000..14fab8f
--- /dev/null
+++ b/linux-headers/asm-mips/kvm_para.h
@@ -0,0 +1 @@
+#include <asm-generic/kvm_para.h>
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index ef072b1..0fb1a6e 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -25,6 +25,8 @@
 /* Select powerpc specific features in <linux/kvm.h> */
 #define __KVM_HAVE_SPAPR_TCE
 #define __KVM_HAVE_PPC_SMT
+#define __KVM_HAVE_IRQCHIP
+#define __KVM_HAVE_IRQ_LINE
 
 struct kvm_regs {
 	__u64 pc;
@@ -272,8 +274,31 @@ struct kvm_debug_exit_arch {
 
 /* for KVM_SET_GUEST_DEBUG */
 struct kvm_guest_debug_arch {
+	struct {
+		/* H/W breakpoint/watchpoint address */
+		__u64 addr;
+		/*
+		 * Type denotes h/w breakpoint, read watchpoint, write
+		 * watchpoint or watchpoint (both read and write).
+		 */
+#define KVMPPC_DEBUG_NONE		0x0
+#define KVMPPC_DEBUG_BREAKPOINT		(1UL << 1)
+#define KVMPPC_DEBUG_WATCH_WRITE	(1UL << 2)
+#define KVMPPC_DEBUG_WATCH_READ		(1UL << 3)
+		__u32 type;
+		__u32 reserved;
+	} bp[16];
 };
 
+/* Debug related defines */
+/*
+ * kvm_guest_debug->control is a 32 bit field. The lower 16 bits are generic
+ * and upper 16 bits are architecture specific. Architecture specific defines
+ * that ioctl is for setting hardware breakpoint or software breakpoint.
+ */
+#define KVM_GUESTDBG_USE_SW_BP		0x00010000
+#define KVM_GUESTDBG_USE_HW_BP		0x00020000
+
 /* definition of registers in kvm_run */
 struct kvm_sync_regs {
 };
@@ -299,6 +324,12 @@ struct kvm_allocate_rma {
 	__u64 rma_size;
 };
 
+/* for KVM_CAP_PPC_RTAS */
+struct kvm_rtas_token_args {
+	char name[120];
+	__u64 token;	/* Use a token of 0 to undefine a mapping */
+};
+
 struct kvm_book3e_206_tlb_entry {
 	__u32 mas8;
 	__u32 mas1;
@@ -359,6 +390,26 @@ struct kvm_get_htab_header {
 	__u16	n_invalid;
 };
 
+/* Per-vcpu XICS interrupt controller state */
+#define KVM_REG_PPC_ICP_STATE	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x8c)
+
+#define  KVM_REG_PPC_ICP_CPPR_SHIFT	56	/* current proc priority */
+#define  KVM_REG_PPC_ICP_CPPR_MASK	0xff
+#define  KVM_REG_PPC_ICP_XISR_SHIFT	32	/* interrupt status field */
+#define  KVM_REG_PPC_ICP_XISR_MASK	0xffffff
+#define  KVM_REG_PPC_ICP_MFRR_SHIFT	24	/* pending IPI priority */
+#define  KVM_REG_PPC_ICP_MFRR_MASK	0xff
+#define  KVM_REG_PPC_ICP_PPRI_SHIFT	16	/* pending irq priority */
+#define  KVM_REG_PPC_ICP_PPRI_MASK	0xff
+
+/* Device control API: PPC-specific devices */
+#define KVM_DEV_MPIC_GRP_MISC		1
+#define   KVM_DEV_MPIC_BASE_ADDR	0	/* 64-bit */
+
+#define KVM_DEV_MPIC_GRP_REGISTER	2	/* 32-bit */
+#define KVM_DEV_MPIC_GRP_IRQ_ACTIVE	3	/* 32-bit */
+
+/* One-Reg API: PPC-specific registers */
 #define KVM_REG_PPC_HIOR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x1)
 #define KVM_REG_PPC_IAC1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x2)
 #define KVM_REG_PPC_IAC2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x3)
@@ -422,4 +473,42 @@ struct kvm_get_htab_header {
 #define KVM_REG_PPC_CLEAR_TSR	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x88)
 #define KVM_REG_PPC_TCR		(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x89)
 #define KVM_REG_PPC_TSR		(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x8a)
+
+/* Debugging: Special instruction for software breakpoint */
+#define KVM_REG_PPC_DEBUG_INST	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x8b)
+
+/* MMU registers */
+#define KVM_REG_PPC_MAS0	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x8c)
+#define KVM_REG_PPC_MAS1	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x8d)
+#define KVM_REG_PPC_MAS2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x8e)
+#define KVM_REG_PPC_MAS7_3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x8f)
+#define KVM_REG_PPC_MAS4	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x90)
+#define KVM_REG_PPC_MAS6	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x91)
+#define KVM_REG_PPC_MMUCFG	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x92)
+/*
+ * TLBnCFG fields TLBnCFG_N_ENTRY and TLBnCFG_ASSOC can be changed only using
+ * KVM_CAP_SW_TLB ioctl
+ */
+#define KVM_REG_PPC_TLB0CFG	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x93)
+#define KVM_REG_PPC_TLB1CFG	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x94)
+#define KVM_REG_PPC_TLB2CFG	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x95)
+#define KVM_REG_PPC_TLB3CFG	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x96)
+#define KVM_REG_PPC_TLB0PS	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x97)
+#define KVM_REG_PPC_TLB1PS	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x98)
+#define KVM_REG_PPC_TLB2PS	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x99)
+#define KVM_REG_PPC_TLB3PS	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x9a)
+#define KVM_REG_PPC_EPTCFG	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0x9b)
+
+/* PPC64 eXternal Interrupt Controller Specification */
+#define KVM_DEV_XICS_GRP_SOURCES	1	/* 64-bit source attributes */
+
+/* Layout of 64-bit source attribute values */
+#define  KVM_XICS_DESTINATION_SHIFT	0
+#define  KVM_XICS_DESTINATION_MASK	0xffffffffULL
+#define  KVM_XICS_PRIORITY_SHIFT	32
+#define  KVM_XICS_PRIORITY_MASK		0xff
+#define  KVM_XICS_LEVEL_SENSITIVE	(1ULL << 40)
+#define  KVM_XICS_MASKED		(1ULL << 41)
+#define  KVM_XICS_PENDING		(1ULL << 42)
+
 #endif /* __LINUX_KVM_POWERPC_H */
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index a65ec29..5d9a303 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -29,7 +29,6 @@
 #define __KVM_HAVE_PIT
 #define __KVM_HAVE_IOAPIC
 #define __KVM_HAVE_IRQ_LINE
-#define __KVM_HAVE_DEVICE_ASSIGNMENT
 #define __KVM_HAVE_MSI
 #define __KVM_HAVE_USER_NMI
 #define __KVM_HAVE_GUEST_DEBUG
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index eb02d8a..c614070 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -561,9 +561,7 @@ struct kvm_ppc_smmu_info {
 #define KVM_CAP_MP_STATE 14
 #define KVM_CAP_COALESCED_MMIO 15
 #define KVM_CAP_SYNC_MMU 16  /* Changes to host mmap are reflected in guest */
-#ifdef __KVM_HAVE_DEVICE_ASSIGNMENT
 #define KVM_CAP_DEVICE_ASSIGNMENT 17
-#endif
 #define KVM_CAP_IOMMU 18
 #ifdef __KVM_HAVE_MSI
 #define KVM_CAP_DEVICE_MSI 20
@@ -579,13 +577,9 @@ struct kvm_ppc_smmu_info {
 #ifdef __KVM_HAVE_PIT
 #define KVM_CAP_REINJECT_CONTROL 24
 #endif
-#ifdef __KVM_HAVE_IOAPIC
 #define KVM_CAP_IRQ_ROUTING 25
-#endif
 #define KVM_CAP_IRQ_INJECT_STATUS 26
-#ifdef __KVM_HAVE_DEVICE_ASSIGNMENT
 #define KVM_CAP_DEVICE_DEASSIGNMENT 27
-#endif
 #ifdef __KVM_HAVE_MSIX
 #define KVM_CAP_DEVICE_MSIX 28
 #endif
@@ -668,6 +662,10 @@ struct kvm_ppc_smmu_info {
 #define KVM_CAP_PPC_EPR 86
 #define KVM_CAP_ARM_PSCI 87
 #define KVM_CAP_ARM_SET_DEVICE_ADDR 88
+#define KVM_CAP_DEVICE_CTRL 89
+#define KVM_CAP_IRQ_MPIC 90
+#define KVM_CAP_PPC_RTAS 91
+#define KVM_CAP_IRQ_XICS 92
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -821,6 +819,28 @@ struct kvm_arm_device_addr {
 };
 
 /*
+ * Device control API, available with KVM_CAP_DEVICE_CTRL
+ */
+#define KVM_CREATE_DEVICE_TEST		1
+
+struct kvm_create_device {
+	__u32	type;	/* in: KVM_DEV_TYPE_xxx */
+	__u32	fd;	/* out: device handle */
+	__u32	flags;	/* in: KVM_CREATE_DEVICE_xxx */
+};
+
+struct kvm_device_attr {
+	__u32	flags;		/* no flags currently defined */
+	__u32	group;		/* device-defined */
+	__u64	attr;		/* group-defined */
+	__u64	addr;		/* userspace address of attr data */
+};
+
+#define KVM_DEV_TYPE_FSL_MPIC_20	1
+#define KVM_DEV_TYPE_FSL_MPIC_42	2
+#define KVM_DEV_TYPE_XICS		3
+
+/*
  * ioctls for VM fds
  */
 #define KVM_SET_MEMORY_REGION     _IOW(KVMIO,  0x40, struct kvm_memory_region)
@@ -907,6 +927,16 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_GET_HTAB_FD	  _IOW(KVMIO,  0xaa, struct kvm_get_htab_fd)
 /* Available with KVM_CAP_ARM_SET_DEVICE_ADDR */
 #define KVM_ARM_SET_DEVICE_ADDR	  _IOW(KVMIO,  0xab, struct kvm_arm_device_addr)
+/* Available with KVM_CAP_PPC_RTAS */
+#define KVM_PPC_RTAS_DEFINE_TOKEN _IOW(KVMIO,  0xac, struct kvm_rtas_token_args)
+
+/* ioctl for vm fd */
+#define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
+
+/* ioctls for fds returned by KVM_CREATE_DEVICE */
+#define KVM_SET_DEVICE_ATTR	  _IOW(KVMIO,  0xe1, struct kvm_device_attr)
+#define KVM_GET_DEVICE_ATTR	  _IOW(KVMIO,  0xe2, struct kvm_device_attr)
+#define KVM_HAS_DEVICE_ATTR	  _IOW(KVMIO,  0xe3, struct kvm_device_attr)
 
 /*
  * ioctls for vcpu fds
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index e094121..7ec1864 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -319,6 +319,7 @@ enum {
 	VFIO_PCI_INTX_IRQ_INDEX,
 	VFIO_PCI_MSI_IRQ_INDEX,
 	VFIO_PCI_MSIX_IRQ_INDEX,
+	VFIO_PCI_ERR_IRQ_INDEX,
 	VFIO_PCI_NUM_IRQS
 };
 
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index 165a484..c656f61 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -127,4 +127,32 @@ struct vhost_memory {
 /* vhost-net should add virtio_net_hdr for RX, and strip for TX packets. */
 #define VHOST_NET_F_VIRTIO_NET_HDR 27
 
+/* VHOST_SCSI specific definitions */
+
+/*
+ * Used by QEMU userspace to ensure a consistent vhost-scsi ABI.
+ *
+ * ABI Rev 0: July 2012 version starting point for v3.6-rc merge candidate +
+ *            RFC-v2 vhost-scsi userspace.  Add GET_ABI_VERSION ioctl usage
+ * ABI Rev 1: January 2013. Ignore vhost_tpgt filed in struct vhost_scsi_target.
+ *            All the targets under vhost_wwpn can be seen and used by guset.
+ */
+
+#define VHOST_SCSI_ABI_VERSION	1
+
+struct vhost_scsi_target {
+	int abi_version;
+	char vhost_wwpn[224]; /* TRANSPORT_IQN_LEN */
+	unsigned short vhost_tpgt;
+	unsigned short reserved;
+};
+
+#define VHOST_SCSI_SET_ENDPOINT _IOW(VHOST_VIRTIO, 0x40, struct vhost_scsi_target)
+#define VHOST_SCSI_CLEAR_ENDPOINT _IOW(VHOST_VIRTIO, 0x41, struct vhost_scsi_target)
+/* Changing this breaks userspace. */
+#define VHOST_SCSI_GET_ABI_VERSION _IOW(VHOST_VIRTIO, 0x42, int)
+/* Set and get the events missed flag */
+#define VHOST_SCSI_SET_EVENTS_MISSED _IOW(VHOST_VIRTIO, 0x43, __u32)
+#define VHOST_SCSI_GET_EVENTS_MISSED _IOW(VHOST_VIRTIO, 0x44, __u32)
+
 #endif
-- 
1.7.10.4


