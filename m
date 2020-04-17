Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jPOmG-0002sg-AB
	for mharc-qemu-trivial@gnu.org; Fri, 17 Apr 2020 07:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsuvorov@redhat.com>) id 1jPOmE-0002oy-6W
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 07:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsuvorov@redhat.com>) id 1jPOmC-0005Z3-Is
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 07:03:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20830
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsuvorov@redhat.com>) id 1jPOmC-0005Wy-F2
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 07:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587121395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/U/ynZrJMghtJHwEZhXCYR3W8XeYnp5IfXrRhaJXXY=;
 b=QwNfJlhU9WGP7Wf2+rjOll/Qr2DaLIcRO63U/vNJligBemiidOpWMrkWJrrayN+ZzMoLCY
 UmMDotHjBR0XmpttpAgIHgszV3jB465xcuZG6RQwmd7+jUCDUCt5W6ojR9MUdn3kRjyvKF
 dVIxWnhUgquccgJoS2uNrkwoBVszzj4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-6zPzgK5aMDatl02E-k4yeA-1; Fri, 17 Apr 2020 07:03:14 -0400
X-MC-Unique: 6zPzgK5aMDatl02E-k4yeA-1
Received: by mail-lj1-f200.google.com with SMTP id m6so224745ljp.21
 for <qemu-trivial@nongnu.org>; Fri, 17 Apr 2020 04:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdG4SCMT33wNYx/PZRkzTQBaw7emn9F5YDTTwDmXoTw=;
 b=JUTdXG3YtWDvHOSIhCZfxL6K8YEjVi66qAVY+YVlLgHf7j1h2B65bvgaiOwVXsWmfM
 CuTSQkEkx6Fk24BuVb1Z7j2enD0HXSgRJ6ziE65L1tv095HNhsAAEyobDhRVcE9TqbXS
 lQabch6B+Xbz7MQGHAqiJvoJJxnsB1VNMwcHBz2bxlBqlhZwxxlFv9QpDLzHhzPYNM43
 7K/0wV9tA7UGt6gUFxnAEtIzbE1LsQm0c917d2meK4bpXorcwuyhcV7I+hApLll83H/w
 gMGsKTiq9XuGHeKWtSmXCZ1VIlju14ypUfx7Rgcr9eieGHI5khYdAEzs0wlYaR5Si7w4
 1IdQ==
X-Gm-Message-State: AGi0PubOjqzg7ef21WbuPlzr+q6bZeV3WB8G6R/QOsMOWtSO40LOZtPS
 WJFWRsuB3n3IhVuN/JKItahqlqYTcH8ruBE9qeJIuRYAzTC2/Ry+n7e5hdN+iav0hBCBhLR2FF8
 deL6glyG6pY6mwffXrBIc8qpQ01NFEyTAuA==
X-Received: by 2002:ac2:4a76:: with SMTP id q22mr1708591lfp.157.1587121392476; 
 Fri, 17 Apr 2020 04:03:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZW5QdL+bCMsMfMxfZVnMf/i5iYYvUNUNk+3IA2WHTmn1t51ttubEmg2L1ZKodcGIbzQGpFyzRdH/sCdV5Yx8=
X-Received: by 2002:ac2:4a76:: with SMTP id q22mr1708567lfp.157.1587121392048; 
 Fri, 17 Apr 2020 04:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200407145017.1041256-1-jusual@redhat.com>
 <20200408125120.7678d9ae@redhat.com>
 <20200413065048-mutt-send-email-mst@kernel.org>
 <CAMDeoFW8q5Er5re6PasjKQ3+3ABFiGrbjZ7WSf5zq836y_+GuA@mail.gmail.com>
 <20200417054957-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200417054957-mutt-send-email-mst@kernel.org>
From: Julia Suvorova <jusual@redhat.com>
Date: Fri, 17 Apr 2020 13:03:01 +0200
Message-ID: <CAMDeoFXZHjLQ=LZrStS6nLuLk1M9__Jy19D_TLEbtSgC1kYXUA@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Apr 2020 11:03:19 -0000

On Fri, Apr 17, 2020 at 11:51 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Apr 15, 2020 at 10:20:33PM +0200, Julia Suvorova wrote:
> > On Mon, Apr 13, 2020 at 12:55 PM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > >
> > > On Wed, Apr 08, 2020 at 12:51:20PM +0200, Igor Mammedov wrote:
> > > > On Tue,  7 Apr 2020 16:50:17 +0200
> > > > Julia Suvorova <jusual@redhat.com> wrote:
> > > >
> > > > > Raise an error when trying to hot-plug/unplug a device through QM=
P to a device
> > > > > with disabled hot-plug capability. This makes the device behaviou=
r more
> > > > > consistent and provides an explanation of the failure in the case=
 of
> > > > > asynchronous unplug.
> > > >
> > > > it applies to hotplug in general (i.e. not only QMP)
> > > >
> > > > >
> > > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > > ---
> > > > >  hw/pci/pcie.c | 24 +++++++++++++++++++++---
> > > > >  1 file changed, 21 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > > index 0eb3a2a5d2..e9798caa8a 100644
> > > > > --- a/hw/pci/pcie.c
> > > > > +++ b/hw/pci/pcie.c
> > > > > @@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
> > > > >  {
> > > > >      PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
> > > > >      uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev->ex=
p.exp_cap;
> > > > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > > > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > > > >
> > > > >      /* Don't send event when device is enabled during qemu machi=
ne creation:
> > > > > @@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandler *h=
otplug_dev, DeviceState *dev,
> > > > >          return;
> > > > >      }
> > > > >
> > > > > +    /* Hot-plug is disabled on the slot */
> > > > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > > > +        error_setg(errp, "Device '%s' does not support hot-plug"=
,
> > > > > +                         DEVICE(hotplug_dev)->id);
> > > > plug and unplug_req are synchronous. so one can skip on "Device '%s=
'",
> > > > user will get this error message as response to device_add/del comm=
and.
> > > >
> > > > and more exactly it's concrete slot that does not support hotplug, =
how about
> > > > "slot doesn't support ..." or just "hotlpug is not supported"
> > >
> > > Well device name is useful here, while these commands are synchronous
> > > others aren't so log parsing might not be synchronous.
> > >
> > > I do think we should mention slot since that's the reason
> > > hotplug failed:
> > >     "Device '%s' hot-plug failed: unsupported by slot"
> > >
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > >      /* To enable multifunction hot-plug, we just ensure the func=
tion
> > > > >       * 0 added last. When function 0 is added, we set the sltsta=
 and
> > > > >       * inform OS via event notification.
> > > > > @@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *bus,=
 PCIDevice *dev, void *opaque)
> > > > >      object_unparent(OBJECT(dev));
> > > > >  }
> > > > >
> > > > > -void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev=
,
> > > > > +void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_han=
dler,
> > > > >                                       DeviceState *dev, Error **e=
rrp)
> > > > >  {
> > > > >      Error *local_err =3D NULL;
> > > > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > > > >      PCIBus *bus =3D pci_get_bus(pci_dev);
> > > > > +    PCIDevice *hotplug_dev =3D PCI_DEVICE(hotplug_handler);
> > > > > +    uint8_t *exp_cap =3D hotplug_dev->config + hotplug_dev->exp.=
exp_cap;
> > > > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > > > > +
> > > > > +    /* Hot-unplug is disabled on the slot */
> > > > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > > > +        error_setg(errp, "Device '%s' does not support hot-unplu=
g",
> > > > > +                         DEVICE(hotplug_dev)->id);
> > > > > +        return;
> > >
> > > Here too let's mention slot since that's the reason
> > > hotplug failed:
> > >     "Device '%s' hot-unplug failed: unsupported by slot"
> > >
> > > ?
> >
> > Just to mention, for a user it's disabled on the device,
>
> How?
> I assumed this is what is used:
>
> commit 530a0963184e57e71a5b538e9161f115df533e96
> Author: Julia Suvorova <jusual@redhat.com>
> Date:   Wed Feb 26 18:46:07 2020 +0100
>
>     pcie_root_port: Add hotplug disabling option
>
>     Make hot-plug/hot-unplug on PCIe Root Ports optional to allow libvirt
>     manage it and restrict unplug for the whole machine. This is going to
>     prevent user-initiated unplug in guests (Windows mostly).
>     Hotplug is enabled by default.
>     Usage:
>         -device pcie-root-port,hotplug=3Doff,...
>
>
> so it looks like user has to disable it on the slot.

By device I mean root port, and it's shown in the error message. If
you think it's not correct, I'll change it.


