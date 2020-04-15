Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOoPv-0002nY-Jo
	for mharc-qemu-trivial@gnu.org; Wed, 15 Apr 2020 16:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsuvorov@redhat.com>) id 1jOoPs-0002mX-Dh
 for qemu-trivial@nongnu.org; Wed, 15 Apr 2020 16:13:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsuvorov@redhat.com>) id 1jOoPp-00027h-W1
 for qemu-trivial@nongnu.org; Wed, 15 Apr 2020 16:13:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsuvorov@redhat.com>) id 1jOoPp-00027O-Sf
 for qemu-trivial@nongnu.org; Wed, 15 Apr 2020 16:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586981625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CWhv9QLnp35cyhaWz7MnUd9oOKFCN9SPa/G9J7QOHA=;
 b=Uk6NBrjudzQepfue8rVRhE/RC0PRcBpO9TAKu1653uBIbTW4dmVhTo8s1ZZOUTa+Ov9mh6
 qtmQf1UACfDhROJLKLOOsEAsknPxQoWGPeMClXF8fIrlNHhWSLevbSr8qLN/LvM1XbQqOh
 3lRjPRe8PtYtpTlis2Xw8rnQGG/QRTc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-vT0cEM-mObSKLYAu9e4MPg-1; Wed, 15 Apr 2020 16:13:43 -0400
X-MC-Unique: vT0cEM-mObSKLYAu9e4MPg-1
Received: by mail-lj1-f197.google.com with SMTP id m4so938869lji.23
 for <qemu-trivial@nongnu.org>; Wed, 15 Apr 2020 13:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyCp7eEjyppw9eWOZzlxpSQTXuWD1b63cqFn01SfvnA=;
 b=tjPu2hxfqClfjBt7GXcswO3tmV30+x8iCx8MXWUliDXw2Qx7fAqlOKubqo5ful1Hnj
 KUCfkT+zVr9TQ5t47A5HOOijeLJ8mN7wgwqi+L2zUR8aXh8RMDyc3ob3ZgbtsBB019MB
 L1MbNJUd+9r4/Pr+oDqqPH7EwiuBpK5ufdbD6ZnC8xr/7LxzNevnyKmX0EssFXhej7Mb
 KemWzoumjbpK/UGyrKsraBzFv4Awyu6Sxthv7L45shrpvgv/1hR6xgoSBtMGSDszNuLI
 ZxcOgV4bFFbfe5BFdGHA2NiObd3rBD6/Y/dyKdqoUsQxHIiVsOTHHoQ1MIquOydSmVwv
 Dd/w==
X-Gm-Message-State: AGi0PuZu+601tzbSRgx4EKx9/QEWVOXsQZIHxFyAhwhiHM80vyAGgq3U
 wYYx3uU2JLI8zxr+7zS9x/MJcRmE6DR+LIVf1xcVrPZVlLO1vGnktvA62bIwwuVdgEqinYWUYSy
 Mzq0w1hNDoASuuaIteksS121UmpDiMEo7Zw==
X-Received: by 2002:a2e:9652:: with SMTP id z18mr4598166ljh.79.1586981621840; 
 Wed, 15 Apr 2020 13:13:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypIn4NnzYJPCWRkJDJVyDtil26oof+y2zCId8CiwdSawkGC/6J2aiH2qZIEmawrmXFAmARFZU4qPZjTSuJfTETo=
X-Received: by 2002:a2e:9652:: with SMTP id z18mr4598148ljh.79.1586981621441; 
 Wed, 15 Apr 2020 13:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200407145017.1041256-1-jusual@redhat.com>
 <d942234c-df99-c7c3-bddd-ea1a2daf097d@gmail.com>
In-Reply-To: <d942234c-df99-c7c3-bddd-ea1a2daf097d@gmail.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 15 Apr 2020 22:13:30 +0200
Message-ID: <CAMDeoFV2LJWMP-V=HiCbB-bVYMfW+oJ2DktXV8U0DAk6xZNfOA@mail.gmail.com>
Subject: Re: [PATCH] hw/pci/pcie: Forbid hot-plug via QMP if it's disabled on
 the slot
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laine Stump <laine@redhat.com>
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
X-List-Received-Date: Wed, 15 Apr 2020 20:13:49 -0000

On Tue, Apr 14, 2020 at 10:07 AM Marcel Apfelbaum
<marcel.apfelbaum@gmail.com> wrote:
>
> Hi Julia,
>
> On 4/7/20 5:50 PM, Julia Suvorova wrote:
> > Raise an error when trying to hot-plug/unplug a device through QMP to a=
 device
> > with disabled hot-plug capability. This makes the device behaviour more
> > consistent and provides an explanation of the failure in the case of
> > asynchronous unplug.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >   hw/pci/pcie.c | 24 +++++++++++++++++++++---
> >   1 file changed, 21 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 0eb3a2a5d2..e9798caa8a 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_=
dev, DeviceState *dev,
> >   {
> >       PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
> >       uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev->exp.exp=
_cap;
> > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> >       PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> >
> >       /* Don't send event when device is enabled during qemu machine cr=
eation:
> > @@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug=
_dev, DeviceState *dev,
> >           return;
> >       }
> >
> > +    /* Hot-plug is disabled on the slot */
> > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > +        error_setg(errp, "Device '%s' does not support hot-plug",
> > +                         DEVICE(hotplug_dev)->id);
> > +        return;
> > +    }
> > +
> >       /* To enable multifunction hot-plug, we just ensure the function
> >        * 0 added last. When function 0 is added, we set the sltsta and
> >        * inform OS via event notification.
> > @@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *bus, PCIDe=
vice *dev, void *opaque)
> >       object_unparent(OBJECT(dev));
> >   }
> >
> > -void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> > +void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_handler,
> >                                        DeviceState *dev, Error **errp)
> >   {
> >       Error *local_err =3D NULL;
> >       PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> >       PCIBus *bus =3D pci_get_bus(pci_dev);
> > +    PCIDevice *hotplug_dev =3D PCI_DEVICE(hotplug_handler);
> > +    uint8_t *exp_cap =3D hotplug_dev->config + hotplug_dev->exp.exp_ca=
p;
> > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > +
> > +    /* Hot-unplug is disabled on the slot */
> > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > +        error_setg(errp, "Device '%s' does not support hot-unplug",
> > +                         DEVICE(hotplug_dev)->id);
> > +        return;
> > +    }
>
> Since this chunk appears twice I would consider refactoring it into
> a helper function. (I see the error message is different, but I suppose
> it can be tweaked)

Okay.

> >
> > -    pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, &local_err=
);
> > +    pcie_cap_slot_plug_common(hotplug_dev, dev, &local_err);
>
> It doesn't seems related to this patch.
>
> >       if (local_err) {
> >           error_propagate(errp, local_err);
> >           return;
> > @@ -490,7 +508,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler=
 *hotplug_dev,
> >           return;
> >       }
> >
> > -    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
> > +    pcie_cap_slot_push_attention_button(hotplug_dev);
>
> Same here, maybe you can split it in 2 patches.

Yes, but it doesn't make sense by itself. Just cleaning necessary with
a new variable introduced.

Best regards, Julia Suvorova.


