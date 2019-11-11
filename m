Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iU7RM-0003Iw-Fy
	for mharc-qemu-trivial@gnu.org; Mon, 11 Nov 2019 06:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iU7RJ-0003GC-L2
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 06:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iU7RE-0002RN-Cf
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 06:00:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41192
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iU7RE-0002Qt-8P
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 06:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573470050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIEWfmvIm0tEcRtDcm2XQfaWLtsh8QXMBvEPxGTGgq8=;
 b=Yvt7gtcIA8oy9YcZeNstBI+m6YdlEFrURo/pQxfPfFAunMleD1eP+pi02hrAckiInExkSq
 l9GHupkhr6o2yf6dBqcMlVsdOYzBjIvRuO6usoB2Vsf8ahA19UGIPcpJFS0U+m+F5MDP7v
 hfwzqgH9aC2Mhn8mGXX7J5diXo7rhu4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-sflYVu9AOeamhy2XO0cvUQ-1; Mon, 11 Nov 2019 06:00:49 -0500
Received: by mail-qk1-f199.google.com with SMTP id c77so7455589qkb.8
 for <qemu-trivial@nongnu.org>; Mon, 11 Nov 2019 03:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2Xj9aea6wb6RLR9vsXkWm7CGkGs1SIpe2jL/vXoFpH8=;
 b=C4o8xF9YU/txwb2WCG1fwgcC0sJr9fzs6UJk1qcyS1HnMWd/5I08QahYGzV274K9cF
 I15I/fdDyb3IuL/ruI9ri6p0KvAuc35fK3NcuP/k0L3wAzu7bJ4x2EztIxyVnOaJ51ap
 IU99EE5qgh2ZhycW5/3W10VIVqMbtAYsYltRSd19K5r7WxW0d87ACa+/Z30sR8lzvhn0
 zC/XLBfcBUUJKrSVt/IuR43fNk5vO9uPAgU+L6aKmTU2GFr+oN7VglS80WO5JQnuZ0fn
 8DKIYGKjK6KT1zOAcqqhMnLH/TPhB52oeu1WUEy98zgNqN7KCMWCFxedXH6g8v1ZaGuz
 olDg==
X-Gm-Message-State: APjAAAXjeDqAmFD5Exsz+qvDzNFm5GKC/2XZJ7Zzq07OfZId0NHyitGM
 458U78Yc1dhvFAmbqkx7Mmkcq9KEWsAYPgUDQbdljUdeevAoZtsrTPOcztExI2Jcp2XYyNEVm6+
 b4/jOMcw6UwHCeuVu7w==
X-Received: by 2002:a05:620a:13c4:: with SMTP id
 g4mr9762366qkl.391.1573470049360; 
 Mon, 11 Nov 2019 03:00:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjX8w1RxqYTNpy6Z2g9reltmp97dhB7ECGoJr3YNRLqThuiHiuazcqKuHqWAQ1SYw5cnOwdg==
X-Received: by 2002:a05:620a:13c4:: with SMTP id
 g4mr9762346qkl.391.1573470049038; 
 Mon, 11 Nov 2019 03:00:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id f39sm8018285qtb.26.2019.11.11.03.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 03:00:48 -0800 (PST)
Date: Mon, 11 Nov 2019 06:00:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Klaus Birkelund <its@irrelevant.dk>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/1] pci: pass along the return value of dma_memory_rw
Message-ID: <20191111055959-mutt-send-email-mst@kernel.org>
References: <20191011070141.188713-1-its@irrelevant.dk>
 <20191011070141.188713-2-its@irrelevant.dk>
 <455e6dee-8dd8-fae7-5a2f-e175b9d1cb8d@redhat.com>
 <20191111093007.GA109346@apples.localdomain>
 <20191111051055-mutt-send-email-mst@kernel.org>
 <20191111103317.GA238995@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191111103317.GA238995@apples.localdomain>
X-MC-Unique: sflYVu9AOeamhy2XO0cvUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Mon, 11 Nov 2019 11:00:59 -0000

On Mon, Nov 11, 2019 at 11:33:17AM +0100, Klaus Birkelund wrote:
> On Mon, Nov 11, 2019 at 05:16:41AM -0500, Michael S. Tsirkin wrote:
> > On Mon, Nov 11, 2019 at 10:30:07AM +0100, Klaus Birkelund wrote:
> > > On Thu, Oct 24, 2019 at 01:13:36AM +0200, Philippe Mathieu-Daud=E9 wr=
ote:
> > > > On 10/11/19 9:01 AM, Klaus Jensen wrote:
> > > > > Some might actually care about the return value of dma_memory_rw.=
 So
> > > > > let us pass it along instead of ignoring it.
> > > > >=20
> > > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > > ---
> > > > >   include/hw/pci/pci.h | 3 +--
> > > > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > > > index f3f0ffd5fb78..4e95bb847857 100644
> > > > > --- a/include/hw/pci/pci.h
> > > > > +++ b/include/hw/pci/pci.h
> > > > > @@ -779,8 +779,7 @@ static inline AddressSpace *pci_get_address_s=
pace(PCIDevice *dev)
> > > > >   static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> > > > >                                void *buf, dma_addr_t len, DMADire=
ction dir)
> > > > >   {
> > > > > -    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, di=
r);
> > > > > -    return 0;
> > > > > +    return dma_memory_rw(pci_get_address_space(dev), addr, buf, =
len, dir);
> > > > >   }
> > > > >   static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
> > > > >=20
> > > >=20
> > > > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > >=20
> > > Gentle ping on this.
> > >=20
> > > This fix is required for the nvme device to start passing some of the
> > > nasty tests from blktests that flips bus mastering while doing I/O.
> > >=20
> > >=20
> > > Cheers,
> > > Klaus
> >=20
> > So I looked and it does not seem like anyone at all checks the
> > return value. While this makes the patch safe, how come it
> > helps anyone at all?
>=20
> I have a series[1] under review for the nvme device (I should have
> mentioned that). There is a certain test (block/011) from blktests[2],
> that disables the PCI device while doing I/O by flipping the bus master
> register. QEMU correctly understands this which causes the dma_memory_rw
> calls to fail while the device is not a bus master. For the NVMe device
> to pass that test, it needs to know that it could not do the DMA,
> otherwise it will just think that a completion queue entry was
> successfully posted or data was correctly read.
>=20
> > Maybe this is just infrastructure to allow checks in the
> > future, in this case do we need this for the freeze?
> > Or can it wait until after the release?
> >=20
>=20
> The series I'm mentioning won't be going into the release, so yeah - it
> can surely wait. I was just pinging to make sure someone would pick it
> up at some point :)
> =20
>     [1]: https://patchwork.kernel.org/cover/11190045/
>     [2]: https://github.com/osandov/blktests

It's probably best to just include it in the series.
When you do feel free to include

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

and mention that the return code has no existing
users so it's safe to change.


