Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8GZG-0005UB-U8
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jan 2022 02:00:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8GZD-0005R3-Pu
 for qemu-trivial@nongnu.org; Fri, 14 Jan 2022 02:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8GZ8-0008Bg-Uv
 for qemu-trivial@nongnu.org; Fri, 14 Jan 2022 02:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
 b=DUXH6e3j5651oC+10H+EVYWsm/TeBoFB6n1+azU9qhQQiBuiX+98LXILPQhoCEtEjiPIbk
 rWeonsYw0lsRWAu99C6szGbESWHMeiqT7HIai/P5FV1Q5u+AjqPRnPvZGX7wgYzLGV2Nr9
 wopo34Pm0RqkMgV2Hj1mu06J8FZ+Y8A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-ux3zlFB7NW-AbeP5nC-XXw-1; Fri, 14 Jan 2022 02:00:00 -0500
X-MC-Unique: ux3zlFB7NW-AbeP5nC-XXw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso1516544wra.18
 for <qemu-trivial@nongnu.org>; Thu, 13 Jan 2022 22:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
 b=LNpzGkFb2JlKmDo4MI6RlmdpDUu559NAD8dj3KCm2zcMRF99//7RlYtonWHdL/ObyS
 WYzzJWNFoF2SfjEZfoFaezsAorWg+o/t+t6tBm00P8vSVYF/Tm2RRIHutIuM7M++u5EP
 RC/1trdsNo4fxdX3O5oPxc1A8enPJCh/mDI1lW0ilhjgG/UbCReK6UkFjkZGssw5bzxy
 lU1Na+6y+NypRZ/FCbzQtnnL3iHHyYcQWnpjIIKNQyGsBHuUIXgJhBm10m14/i9P7KLm
 ENlilRzaZ13sf1j4QEYX/QAyoq3o+lwTiEo8917HptAM3QBcLITQ+m8znoZpXTHJ53jo
 +c3w==
X-Gm-Message-State: AOAM532HEGtzekq8LxtVdCPj840HAcLCwEkNVZA4899PB4jUzGoks4xO
 c2v6LruaRAAUVagvj788861IOGrZaj4pmSH2vgb0XaPF6JPl/pq+u4RWq6S7XaH5hYzZh9YtI+M
 1guVq5rwzNuQVNz+Ejg==
X-Received: by 2002:a05:6000:c8:: with SMTP id
 q8mr7029369wrx.611.1642143598952; 
 Thu, 13 Jan 2022 22:59:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV+HTwRahAA4geCnQVubX4Pfhl/gGbyIcVC++ab3IoF7RdaU/+bXelqehPlU9L6QozMsxw6g==
X-Received: by 2002:a05:6000:c8:: with SMTP id
 q8mr7029313wrx.611.1642143598578; 
 Thu, 13 Jan 2022 22:59:58 -0800 (PST)
Received: from [192.168.42.76] (tmo-098-185.customers.d1-online.com.
 [80.187.98.185])
 by smtp.gmail.com with ESMTPSA id r205sm3437942wma.26.2022.01.13.22.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 22:59:57 -0800 (PST)
Message-ID: <a75789e0-0ace-c898-ea61-9b55624c772a@redhat.com>
Date: Fri, 14 Jan 2022 07:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] Mark remaining global TypeInfo instances as const
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Corey Minyard <minyard@acm.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Fam Zheng
 <fam@euphon.net>, Beniamino Galvani <b.galvani@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting
 <kfting@nuvoton.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:S390 PCI" <qemu-s390x@nongnu.org>
References: <20220113171038.18128-1-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220113171038.18128-1-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Fri, 14 Jan 2022 07:00:08 -0000

On 13/01/2022 18.10, Bernhard Beschow wrote:
> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/core/generic-loader.c   | 2 +-
>   hw/core/guest-loader.c     | 2 +-
>   hw/display/bcm2835_fb.c    | 2 +-
>   hw/display/i2c-ddc.c       | 2 +-
>   hw/display/macfb.c         | 4 ++--
>   hw/display/virtio-vga.c    | 2 +-
>   hw/dma/bcm2835_dma.c       | 2 +-
>   hw/i386/pc_piix.c          | 2 +-
>   hw/i386/sgx-epc.c          | 2 +-
>   hw/intc/bcm2835_ic.c       | 2 +-
>   hw/intc/bcm2836_control.c  | 2 +-
>   hw/ipmi/ipmi.c             | 4 ++--
>   hw/mem/nvdimm.c            | 2 +-
>   hw/mem/pc-dimm.c           | 2 +-
>   hw/misc/bcm2835_mbox.c     | 2 +-
>   hw/misc/bcm2835_powermgt.c | 2 +-
>   hw/misc/bcm2835_property.c | 2 +-
>   hw/misc/bcm2835_rng.c      | 2 +-
>   hw/misc/pvpanic-isa.c      | 2 +-
>   hw/misc/pvpanic-pci.c      | 2 +-
>   hw/net/fsl_etsec/etsec.c   | 2 +-
>   hw/ppc/prep_systemio.c     | 2 +-
>   hw/ppc/spapr_iommu.c       | 2 +-
>   hw/s390x/s390-pci-bus.c    | 2 +-
>   hw/s390x/sclp.c            | 2 +-
>   hw/s390x/tod-kvm.c         | 2 +-
>   hw/s390x/tod-tcg.c         | 2 +-
>   hw/s390x/tod.c             | 2 +-
>   hw/scsi/lsi53c895a.c       | 2 +-
>   hw/sd/allwinner-sdhost.c   | 2 +-
>   hw/sd/aspeed_sdhci.c       | 2 +-
>   hw/sd/bcm2835_sdhost.c     | 2 +-
>   hw/sd/cadence_sdhci.c      | 2 +-
>   hw/sd/npcm7xx_sdhci.c      | 2 +-
>   hw/usb/dev-mtp.c           | 2 +-
>   hw/usb/host-libusb.c       | 2 +-
>   hw/vfio/igd.c              | 2 +-
>   hw/virtio/virtio-pmem.c    | 2 +-
>   qom/object.c               | 4 ++--
>   39 files changed, 42 insertions(+), 42 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>




