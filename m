Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obJ50-0005tk-Mp
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2022 06:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obJ4l-0005pi-5J
 for qemu-trivial@nongnu.org; Thu, 22 Sep 2022 06:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obJ4d-0003Xz-CY
 for qemu-trivial@nongnu.org; Thu, 22 Sep 2022 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663841090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTbSku4IMGq+dqke5u44orpZdaAzL25RBDqR1N0gPI0=;
 b=fUccHrRHIwenU3iqztCaNijhGKK1F1eL0GeoYTnzedgetWpyAt8iG0r3OcQSTYzbCTfDZI
 WqiPkSIwdjDgvMx4tyD8o6MLv86VXcvCLRJF+iJZUt3yG/SBQsl20ykhVLB0a+RBcTFrQ9
 EFvRmdqwoWKU6xqEoffeOHVWkLp9ht4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-YSph5aB7OA6pQ47QLbg8KA-1; Thu, 22 Sep 2022 06:04:46 -0400
X-MC-Unique: YSph5aB7OA6pQ47QLbg8KA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f25-20020a7bc8d9000000b003b4768dcd9cso563477wml.9
 for <qemu-trivial@nongnu.org>; Thu, 22 Sep 2022 03:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=UTbSku4IMGq+dqke5u44orpZdaAzL25RBDqR1N0gPI0=;
 b=Iw4t3aItWeBf1oX175bTT3YD7qbiQHOpVAIfoju5VPBjQJSIABJnRVcIk5dzkbk9Mh
 NIKHr8+xwFcToIpCw/OkqE3t5vyQqV2loHGzPtGCqc7sj+R4v8Tz41aI8bLeEAcesDPr
 BA7le2HXs9glfiXctLBaylwVB/PULAVPST2hKl1g7cc7JE6zhqr3AdkwwHgj8be/4RHs
 ExaUVih1UTIW4k3wjnZQO3tMxNC2fEi+UwzxRFrV9M31KZxyDa2DiUb92wS16OO0L1H3
 wNeYwQrYnqq8KTpL8WkBLLqH7pXSMOEu6+cxyZfiuI6ZN6a1WSHEt1FgW3fotlP5159Q
 dbbA==
X-Gm-Message-State: ACrzQf1qrreDIDNaNPEUXJRZBOmViX5EgAgxE1EAug5yam5cX9KxwSWW
 /e/GybIbqH+J4uPENe1x7FSAHItcfKPtdOswhPwVrccsNQ6n82jL0SK1THfJbZNhN9bLYbPE59C
 ULvqOMcmItDWN8rpF9Q==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr1455314wrr.583.1663841085744; 
 Thu, 22 Sep 2022 03:04:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7a/v0WBRJd0us2BuaLGyPTPCHAjjstdesNMlCKVtAxKaQ5jpfOzYZzAJP/iUlEny8gQszzbQ==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr1455304wrr.583.1663841085495; 
 Thu, 22 Sep 2022 03:04:45 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c220600b003b492753826sm5338556wml.43.2022.09.22.03.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 03:04:44 -0700 (PDT)
Date: Thu, 22 Sep 2022 06:04:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-trivial@nongnu.org, f4bug@amsat.org, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20220922060325-mutt-send-email-mst@kernel.org>
References: <20220602204731.18706-1-lkujaw@member.fsf.org>
 <20220906102155-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220906102155-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 22 Sep 2022 10:05:12 -0000

On Tue, Sep 06, 2022 at 10:23:57AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 02, 2022 at 08:47:31PM +0000, Lev Kujawski wrote:
> > One method to enable PCI bus mastering for IDE controllers, often used
> > by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> > the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> > permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> > the command register would be left in an unspecified state without
> > this patch.
> > 
> > Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> 
> 
> I don't think this is appropriate in trivial at all.
> 
> 
> 
> > ---
> > This revised patch uses QEMU's built-in PCI bit-masking support rather
> > than attempting to manually filter writes.  Thanks to Philippe Mathieu-
> > Daude and Michael S. Tsirkin for review and the pointer.
> 
> But pls note I wrote:
> 
> 	Might need machine compat machinery
> 	for this.
> 
> without said machinery, if guest set one of the other
> bits, migration will fail.

I assume v3 will be forthcoming, right?


> 
> >  hw/ide/piix.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> > index 76ea8fd9f6..bd3f397de8 100644
> > --- a/hw/ide/piix.c
> > +++ b/hw/ide/piix.c
> > @@ -25,6 +25,8 @@
> >   * References:
> >   *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
> >   *      290550-002, Intel Corporation, April 1997.
> > + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> > + *      Intel Corporation, April 1997.
> >   */
> >  
> >  #include "qemu/osdep.h"
> > @@ -160,6 +162,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
> >      uint8_t *pci_conf = dev->config;
> >      int rc;
> >  
> > +    /*
> > +     * Mask all IDE PCI command register bits except for Bus Master
> > +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> > +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> > +     *
> > +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> > +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> > +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> > +     * Value: 0000h), and the PIIX4 datasheet [2].
> > +     */
> > +    pci_set_word(dev->wmask + PCI_COMMAND,
> > +                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
> > +
> >      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
> >  
> >      bmdma_setup_bar(d);
> > -- 
> > 2.34.1
> > 
> > 
> > 


