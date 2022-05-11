Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nojRQ-0003QZ-6s
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2022 06:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nojRL-0003Lz-IE
 for qemu-trivial@nongnu.org; Wed, 11 May 2022 06:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nojRI-00086N-K7
 for qemu-trivial@nongnu.org; Wed, 11 May 2022 06:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652264367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh9lYW7EGdP9yq6KP9COI0CZWCGOpSsiymfY/LYRn0Q=;
 b=eJTfJ0VRez00cTfG7r/YMuHOmIezgP9hTLijoSCuGi/LzrFvGimdpq6x9r78ymOpqgn9KD
 AllQBlx97V51VTUucFnO5fsHdZVqsRjklO/3SstZA9bZ2HXrp2lzlLu2q+6wiYuWi/l7Um
 6b468s0Ld30rLVT5mAgA8WrPJT+bUYI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-PmLVU2e1PASH8oMsGHQFgA-1; Wed, 11 May 2022 06:19:26 -0400
X-MC-Unique: PmLVU2e1PASH8oMsGHQFgA-1
Received: by mail-lj1-f198.google.com with SMTP id
 194-20020a2e09cb000000b002508b2e655dso568638ljj.11
 for <qemu-trivial@nongnu.org>; Wed, 11 May 2022 03:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nh9lYW7EGdP9yq6KP9COI0CZWCGOpSsiymfY/LYRn0Q=;
 b=H3nwYR81CgskBsjam9KItPz85UlLHKRNxq92DlLBVHpWxzU/RhhUTw0Ll3dflXj3gi
 JFdRPQqkTX+aEBCLvgiprFPGIenIthYHrjrjAhnY08wbsW3BlR7GVnqG3ozx2+Th1DnA
 qgvBU5M9jKFhircdmKH1hYjRmDEKmH0z2EfXBEyDFU1uny8ZfWKpvLNvHD3Gqa6dpaAJ
 sqCsaA/17pnXngAnVBcBXdpPV+J3oubS8RyElBpy7vbFmkwrOp4/14BoVTYzkM1q5YBZ
 fUa8wFp3v9ePytAs1VsGU1MGxjsuExQLQu16S2YSI1oh1466gmuqAe98+98tqR5jUw+q
 54aQ==
X-Gm-Message-State: AOAM531lupPPY0LAPXOSSMjEoQGTWuLwcIH5l+tUNmQ1cySYqx3cUvLW
 WbdWboMgH91KCHL7iiyM/ydPlMi3XSEotB3frmxZbtgFoxpiMyspk9QJ7Nkxp77ph1s7utfUVfS
 B0lhr6hiRDASDjERCEfJpm816VX2a99T4XA==
X-Received: by 2002:a05:6512:a91:b0:473:bb9e:fc80 with SMTP id
 m17-20020a0565120a9100b00473bb9efc80mr19853783lfu.471.1652264364896; 
 Wed, 11 May 2022 03:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTwfVNYPvaTf5tHqTY2TfRGOhW1u4ripppBav6N5UDBAaF7y93ok21YY5o/JySOGSWrjoPqGfKHyYGhOGdfKE=
X-Received: by 2002:a05:6512:a91:b0:473:bb9e:fc80 with SMTP id
 m17-20020a0565120a9100b00473bb9efc80mr19853763lfu.471.1652264364544; Wed, 11
 May 2022 03:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <YiotlroslM5hcR04@p100>
 <CAAdtpL44p=kPaRYSi8Y1HLrsQnc3e5Z_BRd1yjH=h7DDBwWWSw@mail.gmail.com>
In-Reply-To: <CAAdtpL44p=kPaRYSi8Y1HLrsQnc3e5Z_BRd1yjH=h7DDBwWWSw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 May 2022 18:19:13 +0800
Message-ID: <CACGkMEs0A9-DDsakGQtTpzy72oa0QP66KGOp=etTP4xZBypQVg@mail.gmail.com>
Subject: Re: [PATCH] tulip: Assign default MAC address if not specified
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Helge Deller <deller@gmx.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sven Schnelle <svens@stackframe.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
X-List-Received-Date: Wed, 11 May 2022 10:19:31 -0000

On Wed, May 11, 2022 at 5:41 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Jason,
>
> Do you mind taking this single patch via your networking tree?
> Otherwise I Cc'ed qemu-trivial :)

I've queued this.

Thanks

>
> Thanks!
>
> On Thu, Mar 10, 2022 at 5:56 PM Helge Deller <deller@gmx.de> wrote:
> >
> > The MAC of the tulip card is stored in the EEPROM and at startup
> > tulip_fill_eeprom() is called to initialize the EEPROM with the MAC
> > address given on the command line, e.g.:
> >     -device tulip,mac=3D00:11:22:33:44:55
> >
> > In case the mac address was not given on the command line,
> > tulip_fill_eeprom() initializes the MAC in EEPROM with 00:00:00:00:00:0=
0
> > which breaks e.g. a HP-UX guest.
> >
> > Fix this problem by moving qemu_macaddr_default_if_unset() a few lines
> > up, so that a default mac address is assigned before tulip_fill_eeprom(=
)
> > initializes the EEPROM.
> >
> > Signed-off-by: Helge Deller <deller@gmx.de>
> >
> > diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> > index d5b6cc5ee6..097e905bec 100644
> > --- a/hw/net/tulip.c
> > +++ b/hw/net/tulip.c
> > @@ -967,6 +967,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, E=
rror **errp)
> >      pci_conf =3D s->dev.config;
> >      pci_conf[PCI_INTERRUPT_PIN] =3D 1; /* interrupt pin A */
> >
> > +    qemu_macaddr_default_if_unset(&s->c.macaddr);
> > +
> >      s->eeprom =3D eeprom93xx_new(&pci_dev->qdev, 64);
> >      tulip_fill_eeprom(s);
> >
> > @@ -981,8 +983,6 @@ static void pci_tulip_realize(PCIDevice *pci_dev, E=
rror **errp)
> >
> >      s->irq =3D pci_allocate_irq(&s->dev);
> >
> > -    qemu_macaddr_default_if_unset(&s->c.macaddr);
> > -
> >      s->nic =3D qemu_new_nic(&net_tulip_info, &s->c,
> >                            object_get_typename(OBJECT(pci_dev)),
> >                            pci_dev->qdev.id, s);
> >
>


