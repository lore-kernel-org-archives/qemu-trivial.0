Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieEfk-0001eI-39
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2019 03:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ieEff-0001bJ-Vb
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 03:45:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ieEfe-0006uE-9E
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 03:45:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57242
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ieEfd-0006sb-R0
 for qemu-trivial@nongnu.org; Mon, 09 Dec 2019 03:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575881133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoYFY4rhMOvAA6zJE2Fk4UkoKAxwgDgrfc97LOA8K8Y=;
 b=Sawc9PY0IhCLf41QTqiJf+QqksN/E3m4tz03g5MqBPxsXNrjqg0ja/5/3U9EgTAHCiT8hx
 UHMiQB0bbzK7rejkTrLVNNuELvX8d6nNVTkseFrIX/pn5KYFrAIpz+Y5FlO6IuyeOTLHyH
 SuF86ZNjZSrH9dcfPW5Dt0TS5cJRr/s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-WrJFg6ztP96Pi33yF1XGYg-1; Mon, 09 Dec 2019 03:45:31 -0500
Received: by mail-wm1-f69.google.com with SMTP id q21so3574343wmc.7
 for <qemu-trivial@nongnu.org>; Mon, 09 Dec 2019 00:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eoYFY4rhMOvAA6zJE2Fk4UkoKAxwgDgrfc97LOA8K8Y=;
 b=OwT4CkLq1XNYbLjVIH+3wAeEYs2OWmpwPTSsvi9J+MWiexIbO5CmgbCb2u3e0c6vkc
 4kPvV8zsUl8wMAPQQffbjGqnTBjg3grgOWXvNKbhpIM/8M/RfsFt2xB4vnYfRaKyOjis
 EC2fB6/9cccBufWkFr0ZpLEDt17mZq7wWWFmQT901ryYtR44wiv+84tlx8e7lfHeRics
 Pf2Yjo6tZOpMlAl5aFto1nw7v+gyfUyAo+VS5t+wLYI96y3wSshBXYYDI2YY90tbBo0M
 dmV5rAp9Cd4i5wH3Hwx9Cl66vYvWnK6C9+m7z3dp+MELImqgFg3pZnBSRL2JwlnjiArs
 ctQA==
X-Gm-Message-State: APjAAAVlaFPr/M8MaSQIiImT5nYyaY2Q/eCMzfWvwYLkYjarU0XUPsOq
 eLRxKoiekPxEoA5pBg5C4WDvh84JukFWqkBL4A7+Lqa6zZQOfvR8HAHBWY9uG2Ha9mDSGngQhL2
 yZcIE2zge/ReCZfRshg==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr23058427wmc.174.1575881130467; 
 Mon, 09 Dec 2019 00:45:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHPRl9+ZA0GFhUuMh/FXM/KDILMtoHyZukISsFpfocYzX6RgQGCIuLNW5fOzJRKXLhiKSdBg==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr23058398wmc.174.1575881130182; 
 Mon, 09 Dec 2019 00:45:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id c2sm26623597wrp.46.2019.12.09.00.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 00:45:29 -0800 (PST)
Subject: Re: [PATCH] target/i386: remove unused pci-assign codes
To: Eiichi Tsukata <devel@etsukata.com>, mtosatti@redhat.com,
 rth@twiddle.net, ehabkost@redhat.com, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20191209072932.313056-1-devel@etsukata.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <652d62de-bf30-7fd8-c203-0393b3720593@redhat.com>
Date: Mon, 9 Dec 2019 09:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191209072932.313056-1-devel@etsukata.com>
Content-Language: en-US
X-MC-Unique: WrJFg6ztP96Pi33yF1XGYg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 09 Dec 2019 08:45:38 -0000

On 09/12/19 08:29, Eiichi Tsukata wrote:
> Legacy PCI device assignment has been already removed in commit ab37bfc7d641
> ("pci-assign: Remove"), but some codes remain unused.
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eiichi Tsukata <devel@etsukata.com>
> ---
>  target/i386/kvm.c      | 140 -----------------------------------------
>  target/i386/kvm_i386.h |  20 ------
>  2 files changed, 160 deletions(-)
> 
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index bf1655645b..efd39843c4 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -4505,146 +4505,6 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
>      }
>  }
>  
> -/* Classic KVM device assignment interface. Will remain x86 only. */
> -int kvm_device_pci_assign(KVMState *s, PCIHostDeviceAddress *dev_addr,
> -                          uint32_t flags, uint32_t *dev_id)
> -{
> -    struct kvm_assigned_pci_dev dev_data = {
> -        .segnr = dev_addr->domain,
> -        .busnr = dev_addr->bus,
> -        .devfn = PCI_DEVFN(dev_addr->slot, dev_addr->function),
> -        .flags = flags,
> -    };
> -    int ret;
> -
> -    dev_data.assigned_dev_id =
> -        (dev_addr->domain << 16) | (dev_addr->bus << 8) | dev_data.devfn;
> -
> -    ret = kvm_vm_ioctl(s, KVM_ASSIGN_PCI_DEVICE, &dev_data);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
> -    *dev_id = dev_data.assigned_dev_id;
> -
> -    return 0;
> -}
> -
> -int kvm_device_pci_deassign(KVMState *s, uint32_t dev_id)
> -{
> -    struct kvm_assigned_pci_dev dev_data = {
> -        .assigned_dev_id = dev_id,
> -    };
> -
> -    return kvm_vm_ioctl(s, KVM_DEASSIGN_PCI_DEVICE, &dev_data);
> -}
> -
> -static int kvm_assign_irq_internal(KVMState *s, uint32_t dev_id,
> -                                   uint32_t irq_type, uint32_t guest_irq)
> -{
> -    struct kvm_assigned_irq assigned_irq = {
> -        .assigned_dev_id = dev_id,
> -        .guest_irq = guest_irq,
> -        .flags = irq_type,
> -    };
> -
> -    if (kvm_check_extension(s, KVM_CAP_ASSIGN_DEV_IRQ)) {
> -        return kvm_vm_ioctl(s, KVM_ASSIGN_DEV_IRQ, &assigned_irq);
> -    } else {
> -        return kvm_vm_ioctl(s, KVM_ASSIGN_IRQ, &assigned_irq);
> -    }
> -}
> -
> -int kvm_device_intx_assign(KVMState *s, uint32_t dev_id, bool use_host_msi,
> -                           uint32_t guest_irq)
> -{
> -    uint32_t irq_type = KVM_DEV_IRQ_GUEST_INTX |
> -        (use_host_msi ? KVM_DEV_IRQ_HOST_MSI : KVM_DEV_IRQ_HOST_INTX);
> -
> -    return kvm_assign_irq_internal(s, dev_id, irq_type, guest_irq);
> -}
> -
> -int kvm_device_intx_set_mask(KVMState *s, uint32_t dev_id, bool masked)
> -{
> -    struct kvm_assigned_pci_dev dev_data = {
> -        .assigned_dev_id = dev_id,
> -        .flags = masked ? KVM_DEV_ASSIGN_MASK_INTX : 0,
> -    };
> -
> -    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_INTX_MASK, &dev_data);
> -}
> -
> -static int kvm_deassign_irq_internal(KVMState *s, uint32_t dev_id,
> -                                     uint32_t type)
> -{
> -    struct kvm_assigned_irq assigned_irq = {
> -        .assigned_dev_id = dev_id,
> -        .flags = type,
> -    };
> -
> -    return kvm_vm_ioctl(s, KVM_DEASSIGN_DEV_IRQ, &assigned_irq);
> -}
> -
> -int kvm_device_intx_deassign(KVMState *s, uint32_t dev_id, bool use_host_msi)
> -{
> -    return kvm_deassign_irq_internal(s, dev_id, KVM_DEV_IRQ_GUEST_INTX |
> -        (use_host_msi ? KVM_DEV_IRQ_HOST_MSI : KVM_DEV_IRQ_HOST_INTX));
> -}
> -
> -int kvm_device_msi_assign(KVMState *s, uint32_t dev_id, int virq)
> -{
> -    return kvm_assign_irq_internal(s, dev_id, KVM_DEV_IRQ_HOST_MSI |
> -                                              KVM_DEV_IRQ_GUEST_MSI, virq);
> -}
> -
> -int kvm_device_msi_deassign(KVMState *s, uint32_t dev_id)
> -{
> -    return kvm_deassign_irq_internal(s, dev_id, KVM_DEV_IRQ_GUEST_MSI |
> -                                                KVM_DEV_IRQ_HOST_MSI);
> -}
> -
> -bool kvm_device_msix_supported(KVMState *s)
> -{
> -    /* The kernel lacks a corresponding KVM_CAP, so we probe by calling
> -     * KVM_ASSIGN_SET_MSIX_NR with an invalid parameter. */
> -    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_MSIX_NR, NULL) == -EFAULT;
> -}
> -
> -int kvm_device_msix_init_vectors(KVMState *s, uint32_t dev_id,
> -                                 uint32_t nr_vectors)
> -{
> -    struct kvm_assigned_msix_nr msix_nr = {
> -        .assigned_dev_id = dev_id,
> -        .entry_nr = nr_vectors,
> -    };
> -
> -    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_MSIX_NR, &msix_nr);
> -}
> -
> -int kvm_device_msix_set_vector(KVMState *s, uint32_t dev_id, uint32_t vector,
> -                               int virq)
> -{
> -    struct kvm_assigned_msix_entry msix_entry = {
> -        .assigned_dev_id = dev_id,
> -        .gsi = virq,
> -        .entry = vector,
> -    };
> -
> -    return kvm_vm_ioctl(s, KVM_ASSIGN_SET_MSIX_ENTRY, &msix_entry);
> -}
> -
> -int kvm_device_msix_assign(KVMState *s, uint32_t dev_id)
> -{
> -    return kvm_assign_irq_internal(s, dev_id, KVM_DEV_IRQ_HOST_MSIX |
> -                                              KVM_DEV_IRQ_GUEST_MSIX, 0);
> -}
> -
> -int kvm_device_msix_deassign(KVMState *s, uint32_t dev_id)
> -{
> -    return kvm_deassign_irq_internal(s, dev_id, KVM_DEV_IRQ_GUEST_MSIX |
> -                                                KVM_DEV_IRQ_HOST_MSIX);
> -}
> -
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
> index 06fe06bdb3..7d0242f5fb 100644
> --- a/target/i386/kvm_i386.h
> +++ b/target/i386/kvm_i386.h
> @@ -40,26 +40,6 @@ void kvm_synchronize_all_tsc(void);
>  void kvm_arch_reset_vcpu(X86CPU *cs);
>  void kvm_arch_do_init_vcpu(X86CPU *cs);
>  
> -int kvm_device_pci_assign(KVMState *s, PCIHostDeviceAddress *dev_addr,
> -                          uint32_t flags, uint32_t *dev_id);
> -int kvm_device_pci_deassign(KVMState *s, uint32_t dev_id);
> -
> -int kvm_device_intx_assign(KVMState *s, uint32_t dev_id,
> -                           bool use_host_msi, uint32_t guest_irq);
> -int kvm_device_intx_set_mask(KVMState *s, uint32_t dev_id, bool masked);
> -int kvm_device_intx_deassign(KVMState *s, uint32_t dev_id, bool use_host_msi);
> -
> -int kvm_device_msi_assign(KVMState *s, uint32_t dev_id, int virq);
> -int kvm_device_msi_deassign(KVMState *s, uint32_t dev_id);
> -
> -bool kvm_device_msix_supported(KVMState *s);
> -int kvm_device_msix_init_vectors(KVMState *s, uint32_t dev_id,
> -                                 uint32_t nr_vectors);
> -int kvm_device_msix_set_vector(KVMState *s, uint32_t dev_id, uint32_t vector,
> -                               int virq);
> -int kvm_device_msix_assign(KVMState *s, uint32_t dev_id);
> -int kvm_device_msix_deassign(KVMState *s, uint32_t dev_id);
> -
>  void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
>  
>  bool kvm_enable_x2apic(void);
> 

Queued, thanks.


