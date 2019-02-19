Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwBvb-0006ye-W5
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 15:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwBvZ-0006y3-UH
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 15:23:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwBvZ-0002jf-4X
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 15:23:41 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44371)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gwBvY-0002hK-VK
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 15:23:41 -0500
Received: by mail-qt1-f193.google.com with SMTP id n32so24678162qte.11
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 12:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=BApRYbieqMmHFHxzhuO740ugInRsuWpLe4g5OoKioXE=;
	b=ePQCWlfGw248WBiYKtvjg7+k0hF8s7gW2P8TFMrgTnFi6o3MTlfIENxh8q3QNMJXjM
	XqTxNWrqWSUZ1/3GDF9gziTCg6ncwFZf2usv/siDy27HXLDDbCAtirrYtJFc2OwByiOy
	sP4UrEO0JHEfWK6WtwA/Go8mgHAK5Ykj7126/SARR/Lu1e209onnmJCxYGaSNjlti0V4
	lSlMmNn76HC4Rde9pvc/EOM09Q3X73F/nHtp1fBgNbeIPhvgLYjB90q2p4dD5v6YNzg0
	4yshK2frWC3SJ9iOB1uUsf3l9X4o1NU7oxUUlN3GeJpUlSbx6BP5RmcOgwjDLViwntBC
	25ng==
X-Gm-Message-State: AHQUAuZk03hPwR/WYeRgtiy3PyKC715lSDODBJavxd8v5xqAcYPYfluz
	93Z8NEPMhX8Jk3XK91teEJPhxg==
X-Google-Smtp-Source: AHgI3Ib8VUMeFEA6aRGTD4AjMW1tgvJuAjB3kBwEvPYjXGmGTysPSUfhq4PK1dUPF1hSDkXL6h2oWw==
X-Received: by 2002:aed:23ae:: with SMTP id j43mr23832987qtc.318.1550607811025;
	Tue, 19 Feb 2019 12:23:31 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	s72sm9691498qka.10.2019.02.19.12.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 12:23:30 -0800 (PST)
Date: Tue, 19 Feb 2019 15:23:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, yang.zhong@intel.com
Message-ID: <20190219152040-mutt-send-email-mst@kernel.org>
References: <1550592459-7286-1-git-send-email-thuth@redhat.com>
	<a7eb2932-c72d-f9cf-c3c4-010f967ca743@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7eb2932-c72d-f9cf-c3c4-010f967ca743@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.193
Subject: Re: [Qemu-trivial] [PATCH] hw/pci/pci-stub: Add msi_enabled() and
 msi_notify() to the pci stubs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2019 20:23:42 -0000

On Tue, Feb 19, 2019 at 07:24:40PM +0100, Paolo Bonzini wrote:
> On 19/02/19 17:07, Thomas Huth wrote:
> > Some machines have an AHCI adapter, but no PCI. To be able to
> > compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
> > functions msi_enabled() and msi_notify() for linking.
> > This is required for the upcoming Kconfig-like build system, if
> > a user wants to compile a QEMU binary with just one machine that
> > has AHCI, but no PCI, like the ARM "cubieboard" for example.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  hw/pci/pci-stub.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
> > index b941a0e..c04a5df 100644
> > --- a/hw/pci/pci-stub.c
> > +++ b/hw/pci/pci-stub.c
> > @@ -53,3 +53,14 @@ uint16_t pci_requester_id(PCIDevice *dev)
> >      g_assert(false);
> >      return 0;
> >  }
> > +
> > +/* Required by ahci.c */
> > +bool msi_enabled(const PCIDevice *dev)
> > +{
> > +    return false;
> > +}
> > +
> > +void msi_notify(PCIDevice *dev, unsigned int vector)
> > +{
> > +    g_assert_not_reached();
> > +}
> > 
> 
> Makes sense, but it is also abstraction time. :)  What if instead there
> was a function
> 
> void msi_allocate_irqs(PCIDevice *pdev, int num, bool fallback_to_intx);
> 
> and then ich.c did
> 
>     irqs = msi_allocate_irqs(pdev, 1, true);
>     s->irq = irqs[0];
>     g_free(irqs);
> 
> ?  "if msi_enabled raise MSI else raise INTX" is really a common idiom.
> 
> Thanks,
> 
> Paolo

Maybe it is but the specific issue is not about fallback to INTX of PCI
(is the fallback broken for ahci? I don't know).
The trick is there's no pdev at all.

-- 
MST

