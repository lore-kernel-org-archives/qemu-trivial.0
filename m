Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVZUi-0003t5-Vr
	for mharc-qemu-trivial@gnu.org; Tue, 06 Sep 2022 10:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZUg-0003lh-Mi
 for qemu-trivial@nongnu.org; Tue, 06 Sep 2022 10:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZUe-0002El-58
 for qemu-trivial@nongnu.org; Tue, 06 Sep 2022 10:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662474239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6127IC2/fyddAz9RCJslzgJzlxCcBlp7fhZfdxkwwM=;
 b=SDQmnfraWayx6RDCyD8z1bl2O2sY9q4Vk6FHsHZcx3eZRJEPDq4BZoA2nmESm1DAkQFSbE
 yNXs4vD8zCFq1jrjDbNX40gcnHkouJlw9xwGRp2SFvGIQu6n9MZHv1xffm7unH01kVS9yu
 BqOlogRyOlgYe7Ky1WYSJFO7NvzYPKk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-cBVFQFfCNNqMaOUPFBj38w-1; Tue, 06 Sep 2022 10:23:58 -0400
X-MC-Unique: cBVFQFfCNNqMaOUPFBj38w-1
Received: by mail-ed1-f71.google.com with SMTP id
 m15-20020a056402430f00b00448af09b674so7684727edc.13
 for <qemu-trivial@nongnu.org>; Tue, 06 Sep 2022 07:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=i6127IC2/fyddAz9RCJslzgJzlxCcBlp7fhZfdxkwwM=;
 b=uGdoZBKy3PXH9CC403DEi3uWulEl+0FybEQ7KmQcK8kCrG1mWNdG+0JdNQzT4zKlLP
 4SW+F7ltZb+2DZkHaaNAT03KVxguP2w913s5SEFAX1b60nAEIDYGkUelmMoAx/ARwE9G
 GHOqjIRPn8Wt/GfJg6hkwx+IfRg+NdxsFF+Vlw6wh7TJoZzLKzs4JcencohxH1s6zLr7
 4qJk2WXV0Ig/JAnfA6KQgmBZvc3bKVvYF6a+XonnFTV5ywrPAIG2pF+hI7zqdoPL/4I6
 unsww7U1CtsprDZ3ygt3z+dncSamltCbkFdnrTzlu3kCEKZTH71T+FFo8Ur3VjfmriuJ
 hVoA==
X-Gm-Message-State: ACgBeo3CaiyCLvooGv1dbRhbOLsyNIMKl9aROwnzUEWf1d6dhi1Sy1Ut
 WuYk1qimECwHFmwv9j0d/o0AM+6rVvLVhk/nqR0DaR3dPahmhP2ALfvZWSvfCzg8lh8sU6gcqW2
 BsNBVmhRELM9I5AE8mw==
X-Received: by 2002:a17:907:c002:b0:73d:d96c:c632 with SMTP id
 ss2-20020a170907c00200b0073dd96cc632mr37873394ejc.543.1662474237151; 
 Tue, 06 Sep 2022 07:23:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LC+ccekWY4PAjtk56YDkBYJVLK2Nkbs8y2fJi886WGHh/jz49E0BRxzRnnP1Kl5z+bx6mMA==
X-Received: by 2002:a17:907:c002:b0:73d:d96c:c632 with SMTP id
 ss2-20020a170907c00200b0073dd96cc632mr37873375ejc.543.1662474236912; 
 Tue, 06 Sep 2022 07:23:56 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b0073ddfe1ea69sm6735718eju.111.2022.09.06.07.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:23:56 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:23:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-trivial@nongnu.org, f4bug@amsat.org, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20220906102155-mutt-send-email-mst@kernel.org>
References: <20220602204731.18706-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
In-Reply-To: <20220602204731.18706-1-lkujaw@member.fsf.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 06 Sep 2022 14:24:03 -0000

On Thu, Jun 02, 2022 at 08:47:31PM +0000, Lev Kujawski wrote:
> One method to enable PCI bus mastering for IDE controllers, often used
> by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> the command register would be left in an unspecified state without
> this patch.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>


I don't think this is appropriate in trivial at all.



> ---
> This revised patch uses QEMU's built-in PCI bit-masking support rather
> than attempting to manually filter writes.  Thanks to Philippe Mathieu-
> Daude and Michael S. Tsirkin for review and the pointer.

But pls note I wrote:

	Might need machine compat machinery
	for this.

without said machinery, if guest set one of the other
bits, migration will fail.


>  hw/ide/piix.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 76ea8fd9f6..bd3f397de8 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -25,6 +25,8 @@
>   * References:
>   *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
>   *      290550-002, Intel Corporation, April 1997.
> + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> + *      Intel Corporation, April 1997.
>   */
>  
>  #include "qemu/osdep.h"
> @@ -160,6 +162,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>      uint8_t *pci_conf = dev->config;
>      int rc;
>  
> +    /*
> +     * Mask all IDE PCI command register bits except for Bus Master
> +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> +     *
> +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> +     * Value: 0000h), and the PIIX4 datasheet [2].
> +     */
> +    pci_set_word(dev->wmask + PCI_COMMAND,
> +                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
> +
>      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>  
>      bmdma_setup_bar(d);
> -- 
> 2.34.1
> 
> 
> 


