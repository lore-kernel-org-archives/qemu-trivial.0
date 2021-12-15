Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxRfY-0003nn-5s
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 05:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRfW-0003iD-Sm
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:37:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRfT-00085m-VY
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGEDwz/WHEDzsYBcd2/xdzZK/2l7tQqnGdIg0Ut+Jk4=;
 b=OWS7A6kQMS3806Kz5RZTrIKM0rQzNi02zTSuHAyYOfXEzbDZYK2W8lvAGtPNVfr0inlhB5
 Wu9Kq3MhKRlLj7TzclkZQY8qrdsYuCBnxeO/qW2nc1GPTeNRmKifyl2CZswoSd2SozNWud
 BYrGgkEjHCJRB0+8JdqZe4ciPjfTVMs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-rdDZhzGQMPCQx6neS7lpPA-1; Wed, 15 Dec 2021 05:37:45 -0500
X-MC-Unique: rdDZhzGQMPCQx6neS7lpPA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f140-20020a1c1f92000000b00344f1cae317so801285wmf.0
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 02:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MGEDwz/WHEDzsYBcd2/xdzZK/2l7tQqnGdIg0Ut+Jk4=;
 b=iJ8ZhuqsPjPhW+CKIVJpKvy1CUK8H4flLLHd9/fFTi5w4EqCf/h9rQbl/A/H+MF82X
 OvPNroWYks6ntSqq10HSX991HNLOW7+SVJahuXzSRfqDOWcB9hmiRIZnlOd0jx9gGKZ6
 4bV7ahtFci7f0XdGAO2agpg5rq++//apITlCXGZZfX7Jl1jSNhtQba68hYGoCOmxAooU
 VOT13e3jGXL1uOKv7RTPUIiu/m1+9l2ganUTN1Te49bIAaey1L+YwxkHWP/CJkmARaA7
 +tedq5fQoIrCKW6O3fjx/yVn/LP71xKqDk+lcC5azfyDLr7sHmHBQJ4fYgZmiC+bASre
 N+aw==
X-Gm-Message-State: AOAM530oeC2j5a0IAmD1ert5p5E8fVX7ZiOyASDDsCAH2VcuDv8npcu7
 hIsxn4XRCs6toBq50+6YHeMeRpX8u3yiYBjYJ4edTchpiaJukPylNoPd671ViG197pnsA0uTnmZ
 ECHSg0H9ZChukhl71EQ==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr3968904wmj.30.1639564664194; 
 Wed, 15 Dec 2021 02:37:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRFtdElpDhakGOnEdlzHrIkG1yrMnbwCkJ2xfhMM7Fl91p9SaiA6TMrBZVaD8koteegq+wWg==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr3968892wmj.30.1639564664043; 
 Wed, 15 Dec 2021 02:37:44 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e8sm1555284wrr.26.2021.12.15.02.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:37:43 -0800 (PST)
Message-ID: <9f49038f-6d7f-cd07-b9b9-a3a329337c1b@redhat.com>
Date: Wed, 15 Dec 2021 11:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0] hw/pci: Don't open-code pci_intx()
To: qemu-devel@nongnu.org
Cc: Jagannathan Raman <jag.raman@oracle.com>, Jason Wang
 <jasowang@redhat.com>, John G Johnson <john.g.johnson@oracle.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-trivial@nongnu.org,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>
References: <20211116172655.2752742-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116172655.2752742-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Dec 2021 10:37:55 -0000

ping for review?

On 11/16/21 18:26, Philippe Mathieu-Daudé wrote:
> Use the pci_intx() helper instead of open-coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20211116170133.724751-3-fbarrat@linux.ibm.com>
> ---
>  hw/net/vmxnet3.c  | 2 +-
>  hw/remote/iohub.c | 6 ++----
>  hw/remote/proxy.c | 3 +--
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 41f796a247d..c7fc5f44d8f 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1350,7 +1350,7 @@ static void vmxnet3_update_features(VMXNET3State *s)
>  static bool vmxnet3_verify_intx(VMXNET3State *s, int intx)
>  {
>      return s->msix_used || msi_enabled(PCI_DEVICE(s))
> -        || intx == pci_get_byte(s->parent_obj.config + PCI_INTERRUPT_PIN) - 1;
> +                        || intx == pci_intx(PCI_DEVICE(s));
>  }
>  
>  static void vmxnet3_validate_interrupt_idx(bool is_msix, int idx)
> diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
> index 547d597f0fe..0e0bb651d1a 100644
> --- a/hw/remote/iohub.c
> +++ b/hw/remote/iohub.c
> @@ -93,11 +93,9 @@ void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg)
>  {
>      RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
>      RemoteIOHubState *iohub = &machine->iohub;
> -    int pirq, intx;
> +    int pirq;
>  
> -    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
> -
> -    pirq = remote_iohub_map_irq(pci_dev, intx);
> +    pirq = remote_iohub_map_irq(pci_dev, pci_intx(pci_dev));
>  
>      if (event_notifier_get_fd(&iohub->irqfds[pirq]) != -1) {
>          qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index bad164299dd..22f32a5930b 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -32,14 +32,13 @@ static void proxy_intx_update(PCIDevice *pci_dev)
>  {
>      PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
>      PCIINTxRoute route;
> -    int pin = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
>  
>      if (dev->virq != -1) {
>          kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &dev->intr, dev->virq);
>          dev->virq = -1;
>      }
>  
> -    route = pci_device_route_intx_to_irq(pci_dev, pin);
> +    route = pci_device_route_intx_to_irq(pci_dev, pci_intx(pci_dev));
>  
>      dev->virq = route.irq;
>  
> 


