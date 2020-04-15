Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOoWj-0007tr-Gq
	for mharc-qemu-trivial@gnu.org; Wed, 15 Apr 2020 16:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsuvorov@redhat.com>) id 1jOoWg-0007sj-UU
 for qemu-trivial@nongnu.org; Wed, 15 Apr 2020 16:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsuvorov@redhat.com>) id 1jOoWf-0005Dy-El
 for qemu-trivial@nongnu.org; Wed, 15 Apr 2020 16:20:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28496
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsuvorov@redhat.com>) id 1jOoWf-0005Dc-89
 for qemu-trivial@nongnu.org; Wed, 15 Apr 2020 16:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586982048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACPdjNVvmouEetV5cKQkpIH11nx9aEqn65Ge9hBpiXw=;
 b=eAtznwLp5xhT/D9T8Wsid1VMw/RNEdzWtNqwpY3B4EyDtXTim0H1tkLFT649AYBMFr3mQL
 dBgY5hMvbBl8uRCTHdEvHa9cF5aqlrehaC9rtIkkpaqE4SVNcig0T5/gqRE9XTGtDJHYac
 ndholddtdmB/RLQBFYQOWoG+hsYAx7E=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-4LBCyQ-rM3-w9QsiCMGcVA-1; Wed, 15 Apr 2020 16:20:46 -0400
X-MC-Unique: 4LBCyQ-rM3-w9QsiCMGcVA-1
Received: by mail-lj1-f198.google.com with SMTP id e6so958935ljj.5
 for <qemu-trivial@nongnu.org>; Wed, 15 Apr 2020 13:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MKElnjWfEn84cPRtezfLRgCG8UwHpfWMebEMfg58Ao=;
 b=q+DXYBRkOdvFk5qTNWjsofOZS495TJ4sjXsma4D1qgXEyjkao0lKmoXRzrCL4RloL2
 c359OtceqFvEj5VBcgA1gqlqwRyuHcN79rxPPqlRDJE1RVrAGitdm1eyK/bTxpN1ic+0
 dAQGAKyinbcu74l8G/77KgTFmdMht5W63Sl+sWlOQcaFgfZdi13kcxgJacZ7yJiX7MoP
 sXjbkNuvFrdAyiVrjgHSCpRUlHUUmZxxRqGjiAT3emWTIroq0kqc7noDk1yA7AphiQF6
 GKEB5hcGWxdggr/y7a63lopGrNHyBDvsUwJOCNVu0gxETZLitsg3aU4JyLe/J3RYMEnU
 NG2w==
X-Gm-Message-State: AGi0PuZ2JO6qrxolY7jpGM3pEYnMIyHRhk1DAlkX69GGoA31r6jEzqwo
 jWY/laZCbfbQoFlos0OvBYNJP1KdW5/zpHIcjVnXNJYZIAa+7NuPA9G8DjIkXRqf4wE99Wv2ij6
 iUthES48Ppz7VE29MloaT0LAVXs6pfiDt8Q==
X-Received: by 2002:a2e:140e:: with SMTP id u14mr2807806ljd.252.1586982045112; 
 Wed, 15 Apr 2020 13:20:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypK3Khi8SgYcsHTz+CJGIXuRG8HnPhjMRnZ9N8lK0S4E0YMiRMhwBtOXqxt+nXciVGg6tgjnroF3TV/tV6Dmz3M=
X-Received: by 2002:a2e:140e:: with SMTP id u14mr2807783ljd.252.1586982044755; 
 Wed, 15 Apr 2020 13:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200407145017.1041256-1-jusual@redhat.com>
 <20200408125120.7678d9ae@redhat.com>
 <20200413065048-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200413065048-mutt-send-email-mst@kernel.org>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 15 Apr 2020 22:20:33 +0200
Message-ID: <CAMDeoFW8q5Er5re6PasjKQ3+3ABFiGrbjZ7WSf5zq836y_+GuA@mail.gmail.com>
Subject: Re: [PATCH] hw/pci/pcie: Forbid hot-plug via QMP if it's disabled on
 the slot
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laine Stump <laine@redhat.com>, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Wed, 15 Apr 2020 20:20:52 -0000

On Mon, Apr 13, 2020 at 12:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Apr 08, 2020 at 12:51:20PM +0200, Igor Mammedov wrote:
> > On Tue,  7 Apr 2020 16:50:17 +0200
> > Julia Suvorova <jusual@redhat.com> wrote:
> >
> > > Raise an error when trying to hot-plug/unplug a device through QMP to=
 a device
> > > with disabled hot-plug capability. This makes the device behaviour mo=
re
> > > consistent and provides an explanation of the failure in the case of
> > > asynchronous unplug.
> >
> > it applies to hotplug in general (i.e. not only QMP)
> >
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  hw/pci/pcie.c | 24 +++++++++++++++++++++---
> > >  1 file changed, 21 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index 0eb3a2a5d2..e9798caa8a 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
> > >  {
> > >      PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
> > >      uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev->exp.ex=
p_cap;
> > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > >
> > >      /* Don't send event when device is enabled during qemu machine c=
reation:
> > > @@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotpl=
ug_dev, DeviceState *dev,
> > >          return;
> > >      }
> > >
> > > +    /* Hot-plug is disabled on the slot */
> > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > +        error_setg(errp, "Device '%s' does not support hot-plug",
> > > +                         DEVICE(hotplug_dev)->id);
> > plug and unplug_req are synchronous. so one can skip on "Device '%s'",
> > user will get this error message as response to device_add/del command.
> >
> > and more exactly it's concrete slot that does not support hotplug, how =
about
> > "slot doesn't support ..." or just "hotlpug is not supported"
>
> Well device name is useful here, while these commands are synchronous
> others aren't so log parsing might not be synchronous.
>
> I do think we should mention slot since that's the reason
> hotplug failed:
>     "Device '%s' hot-plug failed: unsupported by slot"
>
> > > +        return;
> > > +    }
> > > +
> > >      /* To enable multifunction hot-plug, we just ensure the function
> > >       * 0 added last. When function 0 is added, we set the sltsta and
> > >       * inform OS via event notification.
> > > @@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *bus, PCI=
Device *dev, void *opaque)
> > >      object_unparent(OBJECT(dev));
> > >  }
> > >
> > > -void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > +void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_handler=
,
> > >                                       DeviceState *dev, Error **errp)
> > >  {
> > >      Error *local_err =3D NULL;
> > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > >      PCIBus *bus =3D pci_get_bus(pci_dev);
> > > +    PCIDevice *hotplug_dev =3D PCI_DEVICE(hotplug_handler);
> > > +    uint8_t *exp_cap =3D hotplug_dev->config + hotplug_dev->exp.exp_=
cap;
> > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > > +
> > > +    /* Hot-unplug is disabled on the slot */
> > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > +        error_setg(errp, "Device '%s' does not support hot-unplug",
> > > +                         DEVICE(hotplug_dev)->id);
> > > +        return;
>
> Here too let's mention slot since that's the reason
> hotplug failed:
>     "Device '%s' hot-unplug failed: unsupported by slot"
>
> ?

Just to mention, for a user it's disabled on the device, and they
don't have to know how it's implemented. This is the reason for the
difference between the error text and comments in code.

Best regards, Julia Suvorova.


