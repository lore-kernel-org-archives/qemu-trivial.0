Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VK9nq-0003rq-5V
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 12:31:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VK9nj-0003h9-Bu
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 12:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VK9nf-00071Z-2N
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 12:31:27 -0400
Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233]:63991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VK9nU-0006zV-NF; Thu, 12 Sep 2013 12:31:12 -0400
Received: by mail-vc0-f179.google.com with SMTP id ht10so25986vcb.24
	for <multiple recipients>; Thu, 12 Sep 2013 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=AUloKa1Ku2mOVEycShbsSzTWZdf6/4JGkr9ELbJfBs4=;
	b=m9FWuIpuXesKLNp1625rIyp9mwkdIlrywzjofDrF6OcxOjUSl6XcipQYB8P0kzgcsr
	V6Izz7wHT35Qg2tjgUL5l5uYTXlo7qlMDggt8712elI8dufL8ynOkjZzxZbdmA0Ay1vN
	Svcdx7TqNVlaMj4Y77+U+k1I+17TAAoHxgtF3iN/Rw/c1fibF2XKw0XWHcWysGQKvaIj
	/0dcFMqUamo4yfAU/NjHktlzk0ZTF9lVIOvoR3T/UGj3t5WYTcCSzO21O0VrhVa3XnjU
	AZl46ibzA+HHZO5vOgfr2MuGza9fORh57HHa31oAPdJD04CemZ9+nGIbK8VZKGSaDzWM
	nqRw==
X-Received: by 10.52.23.82 with SMTP id k18mr31359vdf.63.1379003471991;
	Thu, 12 Sep 2013 09:31:11 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id c16sm3916883vdj.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 09:31:11 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5231EC56.7020905@redhat.com>
Date: Thu, 12 Sep 2013 18:31:18 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c03::233
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] linux-headers: update to 3.11
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
X-List-Received-Date: Thu, 12 Sep 2013 16:31:32 -0000

Il 03/09/2013 10:27, Alexey Kardashevskiy ha scritto:
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> I need this update as VFIO on PPC64/pseries got in upstream kernel
> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
> update useful too :)
> 
> ---
>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>  linux-headers/linux/kvm.h           |   3 +
>  linux-headers/linux/vfio.h          |  42 ++++++++-
>  linux-headers/linux/virtio_config.h |   3 +
>  6 files changed, 254 insertions(+), 44 deletions(-)
>  create mode 100644 linux-headers/asm-arm64/kvm.h
>  create mode 100644 linux-headers/asm-arm64/kvm_para.h
> 
> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
> new file mode 100644
> index 0000000..5031f42
> --- /dev/null
> +++ b/linux-headers/asm-arm64/kvm.h
> @@ -0,0 +1,168 @@
> +/*
> + * Copyright (C) 2012,2013 - ARM Ltd
> + * Author: Marc Zyngier <marc.zyngier@arm.com>
> + *
> + * Derived from arch/arm/include/uapi/asm/kvm.h:
> + * Copyright (C) 2012 - Virtual Open Systems and Columbia University
> + * Author: Christoffer Dall <c.dall@virtualopensystems.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ARM_KVM_H__
> +#define __ARM_KVM_H__
> +
> +#define KVM_SPSR_EL1	0
> +#define KVM_SPSR_SVC	KVM_SPSR_EL1
> +#define KVM_SPSR_ABT	1
> +#define KVM_SPSR_UND	2
> +#define KVM_SPSR_IRQ	3
> +#define KVM_SPSR_FIQ	4
> +#define KVM_NR_SPSR	5
> +
> +#ifndef __ASSEMBLY__
> +#include <asm/types.h>
> +#include <asm/ptrace.h>
> +
> +#define __KVM_HAVE_GUEST_DEBUG
> +#define __KVM_HAVE_IRQ_LINE
> +
> +#define KVM_REG_SIZE(id)						\
> +	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> +
> +struct kvm_regs {
> +	struct user_pt_regs regs;	/* sp = sp_el0 */
> +
> +	__u64	sp_el1;
> +	__u64	elr_el1;
> +
> +	__u64	spsr[KVM_NR_SPSR];
> +
> +	struct user_fpsimd_state fp_regs;
> +};
> +
> +/* Supported Processor Types */
> +#define KVM_ARM_TARGET_AEM_V8		0
> +#define KVM_ARM_TARGET_FOUNDATION_V8	1
> +#define KVM_ARM_TARGET_CORTEX_A57	2
> +
> +#define KVM_ARM_NUM_TARGETS		3
> +
> +/* KVM_ARM_SET_DEVICE_ADDR ioctl id encoding */
> +#define KVM_ARM_DEVICE_TYPE_SHIFT	0
> +#define KVM_ARM_DEVICE_TYPE_MASK	(0xffff << KVM_ARM_DEVICE_TYPE_SHIFT)
> +#define KVM_ARM_DEVICE_ID_SHIFT		16
> +#define KVM_ARM_DEVICE_ID_MASK		(0xffff << KVM_ARM_DEVICE_ID_SHIFT)
> +
> +/* Supported device IDs */
> +#define KVM_ARM_DEVICE_VGIC_V2		0
> +
> +/* Supported VGIC address types  */
> +#define KVM_VGIC_V2_ADDR_TYPE_DIST	0
> +#define KVM_VGIC_V2_ADDR_TYPE_CPU	1
> +
> +#define KVM_VGIC_V2_DIST_SIZE		0x1000
> +#define KVM_VGIC_V2_CPU_SIZE		0x2000
> +
> +#define KVM_ARM_VCPU_POWER_OFF		0 /* CPU is started in OFF state */
> +#define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
> +
> +struct kvm_vcpu_init {
> +	__u32 target;
> +	__u32 features[7];
> +};
> +
> +struct kvm_sregs {
> +};
> +
> +struct kvm_fpu {
> +};
> +
> +struct kvm_guest_debug_arch {
> +};
> +
> +struct kvm_debug_exit_arch {
> +};
> +
> +struct kvm_sync_regs {
> +};
> +
> +struct kvm_arch_memory_slot {
> +};
> +
> +/* If you need to interpret the index values, here is the key: */
> +#define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
> +#define KVM_REG_ARM_COPROC_SHIFT	16
> +
> +/* Normal registers are mapped as coprocessor 16. */
> +#define KVM_REG_ARM_CORE		(0x0010 << KVM_REG_ARM_COPROC_SHIFT)
> +#define KVM_REG_ARM_CORE_REG(name)	(offsetof(struct kvm_regs, name) / sizeof(__u32))
> +
> +/* Some registers need more space to represent values. */
> +#define KVM_REG_ARM_DEMUX		(0x0011 << KVM_REG_ARM_COPROC_SHIFT)
> +#define KVM_REG_ARM_DEMUX_ID_MASK	0x000000000000FF00
> +#define KVM_REG_ARM_DEMUX_ID_SHIFT	8
> +#define KVM_REG_ARM_DEMUX_ID_CCSIDR	(0x00 << KVM_REG_ARM_DEMUX_ID_SHIFT)
> +#define KVM_REG_ARM_DEMUX_VAL_MASK	0x00000000000000FF
> +#define KVM_REG_ARM_DEMUX_VAL_SHIFT	0
> +
> +/* AArch64 system registers */
> +#define KVM_REG_ARM64_SYSREG		(0x0013 << KVM_REG_ARM_COPROC_SHIFT)
> +#define KVM_REG_ARM64_SYSREG_OP0_MASK	0x000000000000c000
> +#define KVM_REG_ARM64_SYSREG_OP0_SHIFT	14
> +#define KVM_REG_ARM64_SYSREG_OP1_MASK	0x0000000000003800
> +#define KVM_REG_ARM64_SYSREG_OP1_SHIFT	11
> +#define KVM_REG_ARM64_SYSREG_CRN_MASK	0x0000000000000780
> +#define KVM_REG_ARM64_SYSREG_CRN_SHIFT	7
> +#define KVM_REG_ARM64_SYSREG_CRM_MASK	0x0000000000000078
> +#define KVM_REG_ARM64_SYSREG_CRM_SHIFT	3
> +#define KVM_REG_ARM64_SYSREG_OP2_MASK	0x0000000000000007
> +#define KVM_REG_ARM64_SYSREG_OP2_SHIFT	0
> +
> +/* KVM_IRQ_LINE irq field index values */
> +#define KVM_ARM_IRQ_TYPE_SHIFT		24
> +#define KVM_ARM_IRQ_TYPE_MASK		0xff
> +#define KVM_ARM_IRQ_VCPU_SHIFT		16
> +#define KVM_ARM_IRQ_VCPU_MASK		0xff
> +#define KVM_ARM_IRQ_NUM_SHIFT		0
> +#define KVM_ARM_IRQ_NUM_MASK		0xffff
> +
> +/* irq_type field */
> +#define KVM_ARM_IRQ_TYPE_CPU		0
> +#define KVM_ARM_IRQ_TYPE_SPI		1
> +#define KVM_ARM_IRQ_TYPE_PPI		2
> +
> +/* out-of-kernel GIC cpu interrupt injection irq_number field */
> +#define KVM_ARM_IRQ_CPU_IRQ		0
> +#define KVM_ARM_IRQ_CPU_FIQ		1
> +
> +/* Highest supported SPI, from VGIC_NR_IRQS */
> +#define KVM_ARM_IRQ_GIC_MAX		127
> +
> +/* PSCI interface */
> +#define KVM_PSCI_FN_BASE		0x95c1ba5e
> +#define KVM_PSCI_FN(n)			(KVM_PSCI_FN_BASE + (n))
> +
> +#define KVM_PSCI_FN_CPU_SUSPEND		KVM_PSCI_FN(0)
> +#define KVM_PSCI_FN_CPU_OFF		KVM_PSCI_FN(1)
> +#define KVM_PSCI_FN_CPU_ON		KVM_PSCI_FN(2)
> +#define KVM_PSCI_FN_MIGRATE		KVM_PSCI_FN(3)
> +
> +#define KVM_PSCI_RET_SUCCESS		0
> +#define KVM_PSCI_RET_NI			((unsigned long)-1)
> +#define KVM_PSCI_RET_INVAL		((unsigned long)-2)
> +#define KVM_PSCI_RET_DENIED		((unsigned long)-3)
> +
> +#endif
> +
> +#endif /* __ARM_KVM_H__ */
> diff --git a/linux-headers/asm-arm64/kvm_para.h b/linux-headers/asm-arm64/kvm_para.h
> new file mode 100644
> index 0000000..14fab8f
> --- /dev/null
> +++ b/linux-headers/asm-arm64/kvm_para.h
> @@ -0,0 +1 @@
> +#include <asm-generic/kvm_para.h>
> diff --git a/linux-headers/asm-mips/kvm.h b/linux-headers/asm-mips/kvm.h
> index 3f424f5..f09ff5a 100644
> --- a/linux-headers/asm-mips/kvm.h
> +++ b/linux-headers/asm-mips/kvm.h
> @@ -58,56 +58,53 @@ struct kvm_fpu {
>   *  bits[2..0]   - Register 'sel' index.
>   *  bits[7..3]   - Register 'rd'  index.
>   *  bits[15..8]  - Must be zero.
> - *  bits[63..16] - 1 -> CP0 registers.
> + *  bits[31..16] - 1 -> CP0 registers.
> + *  bits[51..32] - Must be zero.
> + *  bits[63..52] - As per linux/kvm.h
>   *
>   * Other sets registers may be added in the future.  Each set would
> - * have its own identifier in bits[63..16].
> - *
> - * The addr field of struct kvm_one_reg must point to an aligned
> - * 64-bit wide location.  For registers that are narrower than
> - * 64-bits, the value is stored in the low order bits of the location,
> - * and sign extended to 64-bits.
> + * have its own identifier in bits[31..16].
>   *
>   * The registers defined in struct kvm_regs are also accessible, the
>   * id values for these are below.
>   */
>  
> -#define KVM_REG_MIPS_R0 0
> -#define KVM_REG_MIPS_R1 1
> -#define KVM_REG_MIPS_R2 2
> -#define KVM_REG_MIPS_R3 3
> -#define KVM_REG_MIPS_R4 4
> -#define KVM_REG_MIPS_R5 5
> -#define KVM_REG_MIPS_R6 6
> -#define KVM_REG_MIPS_R7 7
> -#define KVM_REG_MIPS_R8 8
> -#define KVM_REG_MIPS_R9 9
> -#define KVM_REG_MIPS_R10 10
> -#define KVM_REG_MIPS_R11 11
> -#define KVM_REG_MIPS_R12 12
> -#define KVM_REG_MIPS_R13 13
> -#define KVM_REG_MIPS_R14 14
> -#define KVM_REG_MIPS_R15 15
> -#define KVM_REG_MIPS_R16 16
> -#define KVM_REG_MIPS_R17 17
> -#define KVM_REG_MIPS_R18 18
> -#define KVM_REG_MIPS_R19 19
> -#define KVM_REG_MIPS_R20 20
> -#define KVM_REG_MIPS_R21 21
> -#define KVM_REG_MIPS_R22 22
> -#define KVM_REG_MIPS_R23 23
> -#define KVM_REG_MIPS_R24 24
> -#define KVM_REG_MIPS_R25 25
> -#define KVM_REG_MIPS_R26 26
> -#define KVM_REG_MIPS_R27 27
> -#define KVM_REG_MIPS_R28 28
> -#define KVM_REG_MIPS_R29 29
> -#define KVM_REG_MIPS_R30 30
> -#define KVM_REG_MIPS_R31 31
> +#define KVM_REG_MIPS_R0 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 0)
> +#define KVM_REG_MIPS_R1 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 1)
> +#define KVM_REG_MIPS_R2 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 2)
> +#define KVM_REG_MIPS_R3 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 3)
> +#define KVM_REG_MIPS_R4 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 4)
> +#define KVM_REG_MIPS_R5 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 5)
> +#define KVM_REG_MIPS_R6 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 6)
> +#define KVM_REG_MIPS_R7 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 7)
> +#define KVM_REG_MIPS_R8 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 8)
> +#define KVM_REG_MIPS_R9 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 9)
> +#define KVM_REG_MIPS_R10 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 10)
> +#define KVM_REG_MIPS_R11 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 11)
> +#define KVM_REG_MIPS_R12 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 12)
> +#define KVM_REG_MIPS_R13 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 13)
> +#define KVM_REG_MIPS_R14 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 14)
> +#define KVM_REG_MIPS_R15 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 15)
> +#define KVM_REG_MIPS_R16 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 16)
> +#define KVM_REG_MIPS_R17 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 17)
> +#define KVM_REG_MIPS_R18 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 18)
> +#define KVM_REG_MIPS_R19 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 19)
> +#define KVM_REG_MIPS_R20 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 20)
> +#define KVM_REG_MIPS_R21 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 21)
> +#define KVM_REG_MIPS_R22 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 22)
> +#define KVM_REG_MIPS_R23 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 23)
> +#define KVM_REG_MIPS_R24 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 24)
> +#define KVM_REG_MIPS_R25 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 25)
> +#define KVM_REG_MIPS_R26 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 26)
> +#define KVM_REG_MIPS_R27 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 27)
> +#define KVM_REG_MIPS_R28 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 28)
> +#define KVM_REG_MIPS_R29 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 29)
> +#define KVM_REG_MIPS_R30 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 30)
> +#define KVM_REG_MIPS_R31 (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 31)
>  
> -#define KVM_REG_MIPS_HI 32
> -#define KVM_REG_MIPS_LO 33
> -#define KVM_REG_MIPS_PC 34
> +#define KVM_REG_MIPS_HI (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 32)
> +#define KVM_REG_MIPS_LO (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 33)
> +#define KVM_REG_MIPS_PC (KVM_REG_MIPS | KVM_REG_SIZE_U64 | 34)
>  
>  /*
>   * KVM MIPS specific structures and definitions
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index c614070..56fce1c 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -666,6 +666,7 @@ struct kvm_ppc_smmu_info {
>  #define KVM_CAP_IRQ_MPIC 90
>  #define KVM_CAP_PPC_RTAS 91
>  #define KVM_CAP_IRQ_XICS 92
> +#define KVM_CAP_ARM_EL1_32BIT 93
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> @@ -783,6 +784,8 @@ struct kvm_dirty_tlb {
>  #define KVM_REG_IA64		0x3000000000000000ULL
>  #define KVM_REG_ARM		0x4000000000000000ULL
>  #define KVM_REG_S390		0x5000000000000000ULL
> +#define KVM_REG_ARM64		0x6000000000000000ULL
> +#define KVM_REG_MIPS		0x7000000000000000ULL
>  
>  #define KVM_REG_SIZE_SHIFT	52
>  #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
> diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
> index 7ec1864..b42b9ab 100644
> --- a/linux-headers/linux/vfio.h
> +++ b/linux-headers/linux/vfio.h
> @@ -22,6 +22,7 @@
>  /* Extensions */
>  
>  #define VFIO_TYPE1_IOMMU		1
> +#define VFIO_SPAPR_TCE_IOMMU		2
>  
>  /*
>   * The IOCTL interface is designed for extensibility by embedding the
> @@ -361,10 +362,14 @@ struct vfio_iommu_type1_dma_map {
>  #define VFIO_IOMMU_MAP_DMA _IO(VFIO_TYPE, VFIO_BASE + 13)
>  
>  /**
> - * VFIO_IOMMU_UNMAP_DMA - _IOW(VFIO_TYPE, VFIO_BASE + 14, struct vfio_dma_unmap)
> + * VFIO_IOMMU_UNMAP_DMA - _IOWR(VFIO_TYPE, VFIO_BASE + 14,
> + *							struct vfio_dma_unmap)
>   *
>   * Unmap IO virtual addresses using the provided struct vfio_dma_unmap.
> - * Caller sets argsz.
> + * Caller sets argsz.  The actual unmapped size is returned in the size
> + * field.  No guarantee is made to the user that arbitrary unmaps of iova
> + * or size different from those used in the original mapping call will
> + * succeed.
>   */
>  struct vfio_iommu_type1_dma_unmap {
>  	__u32	argsz;
> @@ -375,4 +380,37 @@ struct vfio_iommu_type1_dma_unmap {
>  
>  #define VFIO_IOMMU_UNMAP_DMA _IO(VFIO_TYPE, VFIO_BASE + 14)
>  
> +/*
> + * IOCTLs to enable/disable IOMMU container usage.
> + * No parameters are supported.
> + */
> +#define VFIO_IOMMU_ENABLE	_IO(VFIO_TYPE, VFIO_BASE + 15)
> +#define VFIO_IOMMU_DISABLE	_IO(VFIO_TYPE, VFIO_BASE + 16)
> +
> +/* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
> +
> +/*
> + * The SPAPR TCE info struct provides the information about the PCI bus
> + * address ranges available for DMA, these values are programmed into
> + * the hardware so the guest has to know that information.
> + *
> + * The DMA 32 bit window start is an absolute PCI bus address.
> + * The IOVA address passed via map/unmap ioctls are absolute PCI bus
> + * addresses too so the window works as a filter rather than an offset
> + * for IOVA addresses.
> + *
> + * A flag will need to be added if other page sizes are supported,
> + * so as defined here, it is always 4k.
> + */
> +struct vfio_iommu_spapr_tce_info {
> +	__u32 argsz;
> +	__u32 flags;			/* reserved for future use */
> +	__u32 dma32_window_start;	/* 32 bit window start (bytes) */
> +	__u32 dma32_window_size;	/* 32 bit window size (bytes) */
> +};
> +
> +#define VFIO_IOMMU_SPAPR_TCE_GET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
> +
> +/* ***************************************************************** */
> +
>  #endif /* VFIO_H */
> diff --git a/linux-headers/linux/virtio_config.h b/linux-headers/linux/virtio_config.h
> index 4f51d8f..75dc20b 100644
> --- a/linux-headers/linux/virtio_config.h
> +++ b/linux-headers/linux/virtio_config.h
> @@ -51,4 +51,7 @@
>   * suppressed them? */
>  #define VIRTIO_F_NOTIFY_ON_EMPTY	24
>  
> +/* Can the device handle any descriptor layout? */
> +#define VIRTIO_F_ANY_LAYOUT		27
> +
>  #endif /* _LINUX_VIRTIO_CONFIG_H */
> 

Applied to uq/master, thanks.

Paolo

