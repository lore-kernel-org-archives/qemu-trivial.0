Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jPNf8-0005hK-Dc
	for mharc-qemu-trivial@gnu.org; Fri, 17 Apr 2020 05:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jPNf4-0005eT-Ta
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 05:51:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jPNf3-0005bo-Aa
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 05:51:50 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33681
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jPNf3-0005Zo-7A
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 05:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587117108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/sHYq+uSffTjN/4aI98NbYfboPL0iJ6dwtWFrN0ALg=;
 b=D0eDIShUdTJDOwbTSzHVLyf3hfp3ICvs169ZhepnXXYxeVwsbfG+3HWW+aTVn4Ai+C4cVz
 BHa8AbiG9cm/upxH5PDVHXJg7sL+x4TUs6pgMyLz8UM0vEwc7pOkn3AQfc9PuiLoe5vuEr
 F7Sh3EVcgog5dNkhTU0XrJJBB1v3uto=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-GRHyHTRhMw6OmYk66zjVnA-1; Fri, 17 Apr 2020 05:51:44 -0400
X-MC-Unique: GRHyHTRhMw6OmYk66zjVnA-1
Received: by mail-wr1-f69.google.com with SMTP id m5so725751wru.15
 for <qemu-trivial@nongnu.org>; Fri, 17 Apr 2020 02:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cbuAHlQWhRGR45gvJpKChqWaqK9VLkLyESB/t32dnS8=;
 b=GOYinPAGEbsbASlC/WGId4CpttC014d3zqlPddAyP3xIsUr/jzLkfzzilM5IYbL32c
 TWuytymerfOOSZ5DZM9jp73gJkgBPbo1FgE3MLfjgRjq4VqJOyGRH5pxan5Yva0OvXyd
 uFJxB5IyD4s5ZRu9fqTrFj13DucT63MOstS6b04EIt5SuMkEUngdl4gfr62PttAol+II
 Ii6iFaXgqZAs9B01SMqlQ0GyxlWT/MsSZHaE0Sc44KuHsoocGmt05d/7dQ/YtggWGOP/
 PEdVYOpv0AwF3yzTgCd/fGl/lYfEVa5yosnRSnnQvlRg1oJB1xa91S4zm5VIcSIlShG4
 o2wg==
X-Gm-Message-State: AGi0PuY1CsyRhg48s+ZsS3O3ltOffKsp+q2OQN+0VFBlF4SUCIqnzvtF
 DxzrmHHW3NPnrT/yxEuKF0OtO0AVWJKDA8Osoh9CIbjxzEhce9PoYgn18lijC6eoHpyqnDV7Hq3
 8ODE+nBw2P40EUSGRMQ==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr2622673wmf.175.1587117103231; 
 Fri, 17 Apr 2020 02:51:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypLJPdeX81TZ3yOKUuXkpoXT5tdzW5sT2AS3ZreZ6+O9mr/D+TZa1n0tWzhcChcx9PtC7F9VmA==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr2622657wmf.175.1587117102963; 
 Fri, 17 Apr 2020 02:51:42 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id p7sm31469988wrf.31.2020.04.17.02.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:51:42 -0700 (PDT)
Date: Fri, 17 Apr 2020 05:51:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Laine Stump <laine@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/pci/pcie: Forbid hot-plug via QMP if it's disabled on
 the slot
Message-ID: <20200417054957-mutt-send-email-mst@kernel.org>
References: <20200407145017.1041256-1-jusual@redhat.com>
 <20200408125120.7678d9ae@redhat.com>
 <20200413065048-mutt-send-email-mst@kernel.org>
 <CAMDeoFW8q5Er5re6PasjKQ3+3ABFiGrbjZ7WSf5zq836y_+GuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMDeoFW8q5Er5re6PasjKQ3+3ABFiGrbjZ7WSf5zq836y_+GuA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 17 Apr 2020 09:51:52 -0000

On Wed, Apr 15, 2020 at 10:20:33PM +0200, Julia Suvorova wrote:
> On Mon, Apr 13, 2020 at 12:55 PM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> >
> > On Wed, Apr 08, 2020 at 12:51:20PM +0200, Igor Mammedov wrote:
> > > On Tue,  7 Apr 2020 16:50:17 +0200
> > > Julia Suvorova <jusual@redhat.com> wrote:
> > >
> > > > Raise an error when trying to hot-plug/unplug a device through QMP =
to a device
> > > > with disabled hot-plug capability. This makes the device behaviour =
more
> > > > consistent and provides an explanation of the failure in the case o=
f
> > > > asynchronous unplug.
> > >
> > > it applies to hotplug in general (i.e. not only QMP)
> > >
> > > >
> > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > ---
> > > >  hw/pci/pcie.c | 24 +++++++++++++++++++++---
> > > >  1 file changed, 21 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > index 0eb3a2a5d2..e9798caa8a 100644
> > > > --- a/hw/pci/pcie.c
> > > > +++ b/hw/pci/pcie.c
> > > > @@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
> > > >  {
> > > >      PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
> > > >      uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev->exp.=
exp_cap;
> > > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > > >
> > > >      /* Don't send event when device is enabled during qemu machine=
 creation:
> > > > @@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hot=
plug_dev, DeviceState *dev,
> > > >          return;
> > > >      }
> > > >
> > > > +    /* Hot-plug is disabled on the slot */
> > > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > > +        error_setg(errp, "Device '%s' does not support hot-plug",
> > > > +                         DEVICE(hotplug_dev)->id);
> > > plug and unplug_req are synchronous. so one can skip on "Device '%s'"=
,
> > > user will get this error message as response to device_add/del comman=
d.
> > >
> > > and more exactly it's concrete slot that does not support hotplug, ho=
w about
> > > "slot doesn't support ..." or just "hotlpug is not supported"
> >
> > Well device name is useful here, while these commands are synchronous
> > others aren't so log parsing might not be synchronous.
> >
> > I do think we should mention slot since that's the reason
> > hotplug failed:
> >     "Device '%s' hot-plug failed: unsupported by slot"
> >
> > > > +        return;
> > > > +    }
> > > > +
> > > >      /* To enable multifunction hot-plug, we just ensure the functi=
on
> > > >       * 0 added last. When function 0 is added, we set the sltsta a=
nd
> > > >       * inform OS via event notification.
> > > > @@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *bus, P=
CIDevice *dev, void *opaque)
> > > >      object_unparent(OBJECT(dev));
> > > >  }
> > > >
> > > > -void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > > +void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_handl=
er,
> > > >                                       DeviceState *dev, Error **err=
p)
> > > >  {
> > > >      Error *local_err =3D NULL;
> > > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > > >      PCIBus *bus =3D pci_get_bus(pci_dev);
> > > > +    PCIDevice *hotplug_dev =3D PCI_DEVICE(hotplug_handler);
> > > > +    uint8_t *exp_cap =3D hotplug_dev->config + hotplug_dev->exp.ex=
p_cap;
> > > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > > > +
> > > > +    /* Hot-unplug is disabled on the slot */
> > > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > > +        error_setg(errp, "Device '%s' does not support hot-unplug"=
,
> > > > +                         DEVICE(hotplug_dev)->id);
> > > > +        return;
> >
> > Here too let's mention slot since that's the reason
> > hotplug failed:
> >     "Device '%s' hot-unplug failed: unsupported by slot"
> >
> > ?
>=20
> Just to mention, for a user it's disabled on the device,

How?
I assumed this is what is used:

commit 530a0963184e57e71a5b538e9161f115df533e96
Author: Julia Suvorova <jusual@redhat.com>
Date:   Wed Feb 26 18:46:07 2020 +0100

    pcie_root_port: Add hotplug disabling option
   =20
    Make hot-plug/hot-unplug on PCIe Root Ports optional to allow libvirt
    manage it and restrict unplug for the whole machine. This is going to
    prevent user-initiated unplug in guests (Windows mostly).
    Hotplug is enabled by default.
    Usage:
        -device pcie-root-port,hotplug=3Doff,...


so it looks like user has to disable it on the slot.


> and they
> don't have to know how it's implemented. This is the reason for the
> difference between the error text and comments in code.
>=20
> Best regards, Julia Suvorova.


