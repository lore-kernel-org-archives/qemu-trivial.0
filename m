Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iU6lp-00071F-W3
	for mharc-qemu-trivial@gnu.org; Mon, 11 Nov 2019 05:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iU6lm-0006xW-Pb
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 05:18:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iU6ll-0000oH-Nj
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 05:18:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51191
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iU6ll-0000nz-Jb
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 05:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573467481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z09O5HzS6QdzWa8EDPWyd2SK3M6EQ4wvljJa2g7nCc=;
 b=hWJ0uE9rhZ9zv7G8J6mlSLhPgUqa9R4A+r0eel2XsqaEj93spUpkRSWJlpnN4w0F470FJk
 5WuLII2SeqLgR/xhxmJ1VugaerApvroroaNL0HUfcfDX53BReP7j4wD0fCVKf4iNd+oeAn
 X87+V2v2doteVWDN2qGZSZQmOzAjhz4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-NO8ZEugzPRaPrODNoSL-MA-1; Mon, 11 Nov 2019 05:16:47 -0500
Received: by mail-qt1-f200.google.com with SMTP id 22so7665873qtw.10
 for <qemu-trivial@nongnu.org>; Mon, 11 Nov 2019 02:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uEKmjpMzFxYdumZRbv8JATTBMMWBUbghULtgERy0pbo=;
 b=P6YhBu2gMChCG0dofbDfcH+66rXXwwnTi+pMIMgi/rkXqaY7oXwBbkABRFOe2xnDZ4
 JhUUoIjERt2HeR4n7cEtbCGU9qzfcQa2/dfdJ32qEvBtxP1LXj9v6p++hKOY8KbaidXB
 WVdYVVXarYc2sNbmz0zdavLC8gh5DGJvwwkh2QwJpjU7UQ7zm66vfyWOs9n+O9zcVSIH
 6+Xu0FwFPAznOXOLf9R1J82UnCe8Q+UqbP4um8sxIK7WDpPJnaRzkJJc7n/FyfX7VQQa
 nwAgOp4/RGX38LBhtAzJHMsuI4ob1RfCggo14P1pyt88aC6KGmy+b36jP1hcltiJa9mL
 ZQtw==
X-Gm-Message-State: APjAAAVAPKo6FyMqsyusbRiQ6m2YZ3irkkqZ3AJS/MguYDwiGFoZskYR
 64zQXhrcMFwmLy0vDUs75lBvDz+DVAEEjoPCO7AE4LP8o6Bmya835fHczZJZ3l9SFl50PbeEEyK
 AY32Def8tQ6q72OJA3A==
X-Received: by 2002:aed:2be2:: with SMTP id e89mr24523501qtd.161.1573467407531; 
 Mon, 11 Nov 2019 02:16:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyabDfL13W7SFtZyi7lBn3grH+4StX5UEIa479Fraj/bPzTyMc4miKFbqkFuFg3CpBLXTRIdA==
X-Received: by 2002:aed:2be2:: with SMTP id e89mr24523488qtd.161.1573467407361; 
 Mon, 11 Nov 2019 02:16:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id w30sm8865823qtc.47.2019.11.11.02.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 02:16:46 -0800 (PST)
Date: Mon, 11 Nov 2019 05:16:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Klaus Birkelund <its@irrelevant.dk>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/1] pci: pass along the return value of dma_memory_rw
Message-ID: <20191111051055-mutt-send-email-mst@kernel.org>
References: <20191011070141.188713-1-its@irrelevant.dk>
 <20191011070141.188713-2-its@irrelevant.dk>
 <455e6dee-8dd8-fae7-5a2f-e175b9d1cb8d@redhat.com>
 <20191111093007.GA109346@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191111093007.GA109346@apples.localdomain>
X-MC-Unique: NO8ZEugzPRaPrODNoSL-MA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Mon, 11 Nov 2019 10:18:04 -0000

On Mon, Nov 11, 2019 at 10:30:07AM +0100, Klaus Birkelund wrote:
> On Thu, Oct 24, 2019 at 01:13:36AM +0200, Philippe Mathieu-Daud=E9 wrote:
> > On 10/11/19 9:01 AM, Klaus Jensen wrote:
> > > Some might actually care about the return value of dma_memory_rw. So
> > > let us pass it along instead of ignoring it.
> > >=20
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > ---
> > >   include/hw/pci/pci.h | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > index f3f0ffd5fb78..4e95bb847857 100644
> > > --- a/include/hw/pci/pci.h
> > > +++ b/include/hw/pci/pci.h
> > > @@ -779,8 +779,7 @@ static inline AddressSpace *pci_get_address_space=
(PCIDevice *dev)
> > >   static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> > >                                void *buf, dma_addr_t len, DMADirectio=
n dir)
> > >   {
> > > -    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
> > > -    return 0;
> > > +    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,=
 dir);
> > >   }
> > >   static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
> > >=20
> >=20
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Gentle ping on this.
>=20
> This fix is required for the nvme device to start passing some of the
> nasty tests from blktests that flips bus mastering while doing I/O.
>=20
>=20
> Cheers,
> Klaus

So I looked and it does not seem like anyone at all checks the
return value. While this makes the patch safe, how come it
helps anyone at all?
Maybe this is just infrastructure to allow checks in the
future, in this case do we need this for the freeze?
Or can it wait until after the release?

--=20
MST


