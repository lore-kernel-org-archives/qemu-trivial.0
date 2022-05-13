Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npTRG-0001b2-N6
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2022 07:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTRD-0001Yv-V3
 for qemu-trivial@nongnu.org; Fri, 13 May 2022 07:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTR7-0005ZP-Ox
 for qemu-trivial@nongnu.org; Fri, 13 May 2022 07:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652441179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R7Kq4qPA9A8h6co1gG0mSxQds5Jk2MGiVTfdm2EgH50=;
 b=AwUNN5AecmId+SpxkeDS7AJjB+Qqkpikqoec3LwcXEFX202SsLGpSYAsHsrLQIDBvhQy3e
 8WcrGtJMj+Z4GGaq69co6Acua55271kIEdKLfkrlVgW47KQ3OkvCgvEdU+gA8Ime5crmbz
 yj90w2rkizleucbk+OWkmc1LKVlPy2E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-jmIveVr_NHi3Rni_Ee0usg-1; Fri, 13 May 2022 07:26:17 -0400
X-MC-Unique: jmIveVr_NHi3Rni_Ee0usg-1
Received: by mail-wm1-f71.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so2815365wmi.2
 for <qemu-trivial@nongnu.org>; Fri, 13 May 2022 04:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R7Kq4qPA9A8h6co1gG0mSxQds5Jk2MGiVTfdm2EgH50=;
 b=C/F/JMHnmkHZvBUQMhWtHlyp0ZFCeFXSiZu7NbcEjg1TCnbQlq5HzTX0QKOlUqK2bu
 Wdi97o2/ZIskXpIxIJtz1b61JDzs96GAKdodGfsp5Q+pJOaXb0t8zk/Qdrnp4y5Y6Azj
 Tqu3nf+Snp/bqZl6CJ+nD89QuGsVE+ANVao8PBEupiayA65yOAN87xHRsP7Y1S4Pxj3t
 yR+5ojo/Qr8KfumPpD9nMRLv2XmsSHmSY0yHHLXFpDAUHx47OSoS2gxsvtg5Rkdwqi/K
 Kwl6dAGt9BpxXrbTc68bzYw1KMV8V8oGy4DKUXEgSMK5cON75oB8guzk1tG/E5veMuqk
 Xp4Q==
X-Gm-Message-State: AOAM5337PcHtkK1q4NUmYU6m3OcbjzIqGsQu9DtROLGrM2sdv7ACNCjF
 jT1CSZ7iYr7fhxhed+jJzg3bA862V4JRd+D0nSlpKxJZbe95JfArbewtK/EsuoDk1z1TeZaVMxO
 3QHiVOWtsAG+4aDOUaA==
X-Received: by 2002:a05:600c:4f4f:b0:394:97e1:ca99 with SMTP id
 m15-20020a05600c4f4f00b0039497e1ca99mr4140827wmq.143.1652441176679; 
 Fri, 13 May 2022 04:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwahfoAz4yJLkqe0JYOlr6oxq5TOPs81+syBA98Y7s+7nEu82UM5BtNI+j6VagXjjNAwHcS/w==
X-Received: by 2002:a05:600c:4f4f:b0:394:97e1:ca99 with SMTP id
 m15-20020a05600c4f4f00b0039497e1ca99mr4140802wmq.143.1652441176401; 
 Fri, 13 May 2022 04:26:16 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 h9-20020adfa4c9000000b0020cd2e8d3b1sm2033419wrb.5.2022.05.13.04.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:26:15 -0700 (PDT)
Date: Fri, 13 May 2022 07:26:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>
Subject: Re: [PATCH 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen" device
 class
Message-ID: <20220513072532-mutt-send-email-mst@kernel.org>
References: <20220508103432.14874-1-shentey@gmail.com>
 <20220508103432.14874-2-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220508103432.14874-2-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 11:26:29 -0000

On Sun, May 08, 2022 at 12:34:30PM +0200, Bernhard Beschow wrote:
> Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
> generic class init function' already resolved redundant code which in
> turn rendered piix3-ide-xen redundant.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Cc xen maintainers for review please.

> ---
>  hw/i386/pc_piix.c | 3 +--
>  hw/ide/piix.c     | 7 -------
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 4c185c72d0..27dfde4917 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -244,8 +244,7 @@ static void pc_init1(MachineState *machine,
>      if (pcmc->pci_enabled) {
>          PCIDevice *dev;
>  
> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1,
> -                                xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
> +        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
>          pci_ide_create_devs(dev);
>          idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>          idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index ce89fd0aa3..2345fe9e1d 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -241,12 +241,6 @@ static const TypeInfo piix3_ide_info = {
>      .class_init    = piix3_ide_class_init,
>  };
>  
> -static const TypeInfo piix3_ide_xen_info = {
> -    .name          = "piix3-ide-xen",
> -    .parent        = TYPE_PCI_IDE,
> -    .class_init    = piix3_ide_class_init,
> -};
> -
>  /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
>  static void piix4_ide_class_init(ObjectClass *klass, void *data)
>  {
> @@ -272,7 +266,6 @@ static const TypeInfo piix4_ide_info = {
>  static void piix_ide_register_types(void)
>  {
>      type_register_static(&piix3_ide_info);
> -    type_register_static(&piix3_ide_xen_info);
>      type_register_static(&piix4_ide_info);
>  }
>  
> -- 
> 2.36.1


