Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieF27-0001Vn-0N
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2019 04:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <devel@etsukata.com>) id 1ieDV0-0001AB-7M
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 02:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <devel@etsukata.com>) id 1ieDUy-0003nh-Nl
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 02:30:30 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35479)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <devel@etsukata.com>) id 1ieDUy-0003mM-9C
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 02:30:28 -0500
Received: by mail-pl1-x642.google.com with SMTP id s10so5431782plp.2
 for <qemu-trivial@nongnu.org>; Sun, 08 Dec 2019 23:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=etsukata-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ytPK+hH06lqGjyswEy6eX9rtlUfTVQLT89l523gdpMs=;
 b=TQXHKbh/UREXMkgVaVPmqJupbseTmERK85MSDdLPis5u1tVUExHIF2zXEQ/a3R7uQ7
 IPwFTVpkEKj9e2i7wuejXnNviflA1eEBi2XSijSCJWlUZqr0N0qS4AiLae2W5JKZGke6
 yEY+P7bfGFI0rkklI1oaiX+BH37TCypVO2MUIY0VN5bxvayX/7eItAEw1NtOKFiV5vuB
 BcjIw/fftHvBa+JpOPXVmCr+A99xGhk+DLnSd6EYBv/p3Mz4dCnXhGjcn1AIPquwtA7+
 YXUnwb5nWCYHsraEPdT1miHxDXgCe0/3cNCob32aTC+P57mY7Q17STKGBu/UInM6fLM2
 Byxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ytPK+hH06lqGjyswEy6eX9rtlUfTVQLT89l523gdpMs=;
 b=CZ100njWzZ+LHIhL6qs50sq+3FZE1cdNns91xDcC9kKmHvpe9WUAa2e8G2xqurDPTL
 /O5HSViaLKJrPZyVUHiwpDgn63nRwDpDLtkJGGTHf4GLoohG25JO0bn/J7krUW5mG4QK
 r/H9JoeHx/ukjr6Xo4pIrhL0evGE8+0AQ0q+aU3bQnuMOqeB0w3MX6LeRCx/4FIC901e
 znYqwH+s+x0r5fDxmRAPGfow97OHTpxvr9SkTqmSLBRqSM5kVkvMWxxmeyi6NmhHSIns
 0OLycHta00alP0gZxh28H8xkbBzDT9QjoTO01n2Qv94TbKJAe+3GuFFdhA7GZCnjoUMX
 Ny9w==
X-Gm-Message-State: APjAAAUatINNTiXJL6xbyI24OoPmqPTBI7//g6WvMSLEQ/uotB6n8h70
 ekPLLAndeYp2JeGEDjOvcuampw==
X-Google-Smtp-Source: APXvYqzqCU1qinCtg2re+a0Na3/RreE9wGd00R/ycD/EeVqpcds+bFJlRj6O+FZYejrD+pKoLWVleA==
X-Received: by 2002:a17:902:968b:: with SMTP id
 n11mr23780213plp.120.1575876626379; 
 Sun, 08 Dec 2019 23:30:26 -0800 (PST)
Received: from localhost.localdomain
 (p5309002-ipngn11902marunouchi.tokyo.ocn.ne.jp. [114.166.47.2])
 by smtp.gmail.com with ESMTPSA id q22sm26104660pfg.170.2019.12.08.23.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 23:30:25 -0800 (PST)
From: Eiichi Tsukata <devel@etsukata.com>
To: pbonzini@redhat.com, mtosatti@redhat.com, rth@twiddle.net,
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Eiichi Tsukata <devel@etsukata.com>
Subject: [PATCH] target/i386: remove unused pci-assign codes
Date: Mon,  9 Dec 2019 16:29:32 +0900
Message-Id: <20191209072932.313056-1-devel@etsukata.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-Mailman-Approved-At: Mon, 09 Dec 2019 04:08:45 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2019 07:30:32 -0000

Legacy PCI device assignment has been already removed in commit ab37bfc7d641
("pci-assign: Remove"), but some codes remain unused.

CC: qemu-trivial@nongnu.org
Signed-off-by: Eiichi Tsukata <devel@etsukata.com>
---
 target/i386/kvm.c      | 140 -----------------------------------------
 target/i386/kvm_i386.h |  20 ------
 2 files changed, 160 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index bf1655645b..efd39843c4 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -4505,146 +4505,6 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
     }
 }
 
-/* Classic KVM device assignment interface. Will remain x86 only. */
-int kvm_device_pci_assign(KVMState *s, PCIHostDeviceAddress *dev_addr,
-                          uint32_t flags, uint32_t *dev_id)
-{
-    struct kvm_assigned_pci_dev dev_data = {
-        .segnr = dev_addr->domain,
-        .busnr = dev_addr->bus,
-        .devfn = PCI_DEVFN(dev_addr->slot, dev_addr->function),
-        .flags = flags,
-    };
-    int ret;
-
-    dev_data.assigned_dev_id =
-        (dev_addr->domain << 16) | (dev_addr->bus << 8) | dev_data.devfn;
-
-    ret = kvm_vm_ioctl(s, KVM_ASSIGN_PCI_DEVICE, &dev_data);
-    if (ret < 0) {
-        return ret;
-    }
-
-    *dev_id = dev_data.assigned_dev_id;
-
-    return 0;
-}
-
-int kvm_device_pci_deassign(KVMState *s, uint32_t dev_id)
-{
-    struct kvm_assigned_pci_dev dev_data = {
-        .assigned_dev_id = dev_id,
-    };
-
-    return kvm_vm_ioctl(s, KVM_DEASSIGN_PCI_DEVICE, &dev_data);
-}
-
-static int kvm_assign_irq_internal(KVMState *s, uint32_t dev_id,
-                                   uint32_t irq_type, uint32_t guest_irq)
-{
-    struct kvm_assigned_irq assigned_irq = {
-        .assigned_dev_id = dev_id,
-        .guest_irq = guest_irq,
-        .flags = irq_type,
-    };
-
-    if (kvm_check_extension(s, KVM_CAP_ASSIGN_DEV_IRQ)) {
-        return kvm_vm_ioctl(s, KVM_ASSIGN_DEV_IRQ, &assigned_irq);
-    } else {
-        return kvm_vm_ioctl(s, KVM_ASSIGN_IRQ, &assigned_irq);
-    }
-}
-
-int kvm_device_intx_assign(KVMState *s, uint32_t dev_id, bool use_host_msi,
-                           uint32_t guest_irq)
-{
-    uint32_t irq_type = KVM_DEV_IRQ_GUEST_INTX |
-        (use_host_msi ? KVM_DEV_IRQ_HOST_MSI : KVM_DEV_IRQ_HOST_INTX);
-
-    return kvm_assign_irq_internal(s, dev_id, irq_type, guest_irq);
-}
-
-int kvm_device_intx_set_mask(KVMState *s, uint32_t dev_id, bool masked)
-{
-    struct kvm_assigned_pci_dev dev_data = {
-        .assigned_dev_id = dev_id,
-        .flags = masked ? KVM_DEV_ASSIGN_MASK_INTX : 0,
-    };
-
-    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_INTX_MASK, &dev_data);
-}
-
-static int kvm_deassign_irq_internal(KVMState *s, uint32_t dev_id,
-                                     uint32_t type)
-{
-    struct kvm_assigned_irq assigned_irq = {
-        .assigned_dev_id = dev_id,
-        .flags = type,
-    };
-
-    return kvm_vm_ioctl(s, KVM_DEASSIGN_DEV_IRQ, &assigned_irq);
-}
-
-int kvm_device_intx_deassign(KVMState *s, uint32_t dev_id, bool use_host_msi)
-{
-    return kvm_deassign_irq_internal(s, dev_id, KVM_DEV_IRQ_GUEST_INTX |
-        (use_host_msi ? KVM_DEV_IRQ_HOST_MSI : KVM_DEV_IRQ_HOST_INTX));
-}
-
-int kvm_device_msi_assign(KVMState *s, uint32_t dev_id, int virq)
-{
-    return kvm_assign_irq_internal(s, dev_id, KVM_DEV_IRQ_HOST_MSI |
-                                              KVM_DEV_IRQ_GUEST_MSI, virq);
-}
-
-int kvm_device_msi_deassign(KVMState *s, uint32_t dev_id)
-{
-    return kvm_deassign_irq_internal(s, dev_id, KVM_DEV_IRQ_GUEST_MSI |
-                                                KVM_DEV_IRQ_HOST_MSI);
-}
-
-bool kvm_device_msix_supported(KVMState *s)
-{
-    /* The kernel lacks a corresponding KVM_CAP, so we probe by calling
-     * KVM_ASSIGN_SET_MSIX_NR with an invalid parameter. */
-    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_MSIX_NR, NULL) == -EFAULT;
-}
-
-int kvm_device_msix_init_vectors(KVMState *s, uint32_t dev_id,
-                                 uint32_t nr_vectors)
-{
-    struct kvm_assigned_msix_nr msix_nr = {
-        .assigned_dev_id = dev_id,
-        .entry_nr = nr_vectors,
-    };
-
-    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_MSIX_NR, &msix_nr);
-}
-
-int kvm_device_msix_set_vector(KVMState *s, uint32_t dev_id, uint32_t vector,
-                               int virq)
-{
-    struct kvm_assigned_msix_entry msix_entry = {
-        .assigned_dev_id = dev_id,
-        .gsi = virq,
-        .entry = vector,
-    };
-
-    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_MSIX_ENTRY, &msix_entry);
-}
-
-int kvm_device_msix_assign(KVMState *s, uint32_t dev_id)
-{
-    return kvm_assign_irq_internal(s, dev_id, KVM_DEV_IRQ_HOST_MSIX |
-                                              KVM_DEV_IRQ_GUEST_MSIX, 0);
-}
-
-int kvm_device_msix_deassign(KVMState *s, uint32_t dev_id)
-{
-    return kvm_deassign_irq_internal(s, dev_id, KVM_DEV_IRQ_GUEST_MSIX |
-                                                KVM_DEV_IRQ_HOST_MSIX);
-}
-
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
index 06fe06bdb3..7d0242f5fb 100644
--- a/target/i386/kvm_i386.h
+++ b/target/i386/kvm_i386.h
@@ -40,26 +40,6 @@ void kvm_synchronize_all_tsc(void);
 void kvm_arch_reset_vcpu(X86CPU *cs);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 
-int kvm_device_pci_assign(KVMState *s, PCIHostDeviceAddress *dev_addr,
-                          uint32_t flags, uint32_t *dev_id);
-int kvm_device_pci_deassign(KVMState *s, uint32_t dev_id);
-
-int kvm_device_intx_assign(KVMState *s, uint32_t dev_id,
-                           bool use_host_msi, uint32_t guest_irq);
-int kvm_device_intx_set_mask(KVMState *s, uint32_t dev_id, bool masked);
-int kvm_device_intx_deassign(KVMState *s, uint32_t dev_id, bool use_host_msi);
-
-int kvm_device_msi_assign(KVMState *s, uint32_t dev_id, int virq);
-int kvm_device_msi_deassign(KVMState *s, uint32_t dev_id);
-
-bool kvm_device_msix_supported(KVMState *s);
-int kvm_device_msix_init_vectors(KVMState *s, uint32_t dev_id,
-                                 uint32_t nr_vectors);
-int kvm_device_msix_set_vector(KVMState *s, uint32_t dev_id, uint32_t vector,
-                               int virq);
-int kvm_device_msix_assign(KVMState *s, uint32_t dev_id);
-int kvm_device_msix_deassign(KVMState *s, uint32_t dev_id);
-
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
 
 bool kvm_enable_x2apic(void);
-- 
2.23.0


