Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNwk4-0000FO-G2
	for mharc-qemu-trivial@gnu.org; Mon, 13 Apr 2020 06:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jNwk1-0000E7-Ft
 for qemu-trivial@nongnu.org; Mon, 13 Apr 2020 06:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jNwjz-0005Rw-1T
 for qemu-trivial@nongnu.org; Mon, 13 Apr 2020 06:55:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26061
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jNwjy-0005RY-Ud
 for qemu-trivial@nongnu.org; Mon, 13 Apr 2020 06:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586775297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mouWL9esHDQH3pzbVuALj79s7czZcOh6oOLChTjBtn4=;
 b=G4YJCTWqj+KGUdEHw69TNK1WEuu7UP7VEFJpfk855KfTiRBMpzDl+/bYiauALY1bVLwFXc
 ifGGDP9kKZTAvqpDEr1MF5XAXps5mgCChd4ZerhUSnCcHSs6RPXzmIT+kDSIm8ZkeFPTHS
 hU9Hf5niGZS/Y/X1uLW6pe/sRAbBDD4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-ZccBcgsiNlSaGVXrlynr1Q-1; Mon, 13 Apr 2020 06:54:56 -0400
X-MC-Unique: ZccBcgsiNlSaGVXrlynr1Q-1
Received: by mail-wr1-f71.google.com with SMTP id m15so6561152wrb.0
 for <qemu-trivial@nongnu.org>; Mon, 13 Apr 2020 03:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YALn3EL1CPLgXOJUl/YE29JEMwzz7MeT7P7e/v7/gsc=;
 b=l9rxw8g07pjA6je71yTFV9JRO7k1e+0p56kRDGF7bJYkKUneqV+yhPVRj1a3ToAQQz
 vfT8KerUpyPwFDQEZpXZRHCxdnRTOQjG3fiiXx2WY6xEhH1od45oyApf4gC0XXOaK+5t
 hdtzRoTj8RRy21PljdZFivnqLPXtSyvs/tEvx+xUYq2gYx1NX5yb/r5AH6jFIAJ+SpxY
 F+rkN3zvmkAuxYHJiyCmq+lAbqv5CQuqf8pNogUQeX25tvGfApTxvxZtH6km6gS6UBHZ
 R3YmOzEgTDJAqK25imxSKarDHgG6q7mMh3ePANnZCkoStZhg9+U7A2V9sDXR01s3wwI6
 C+GA==
X-Gm-Message-State: AGi0Puahbd0DSqz7Zv236jeZ8mhMQZxZh6hGoh/ta2jPoOWsVhRLcTim
 tGRt1nLiZof+gAClVIzOPei9gfUjhMCpMJDiBybf3y81Obm3fXqchQbMAZwY+E/LbLntybzhvPc
 NpgEIwmhKp5RETFkykQ==
X-Received: by 2002:a1c:9d0d:: with SMTP id g13mr14116866wme.102.1586775294899; 
 Mon, 13 Apr 2020 03:54:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypKwtKCfU23v8E1dcO7AOY88ARasRhIagbdH4SmBfaqgTgkrzVzGM3/dluN0KiuTKIqFGWIrig==
X-Received: by 2002:a1c:9d0d:: with SMTP id g13mr14116844wme.102.1586775294549; 
 Mon, 13 Apr 2020 03:54:54 -0700 (PDT)
Received: from redhat.com ([185.107.45.41])
 by smtp.gmail.com with ESMTPSA id t20sm4722285wmi.2.2020.04.13.03.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 03:54:53 -0700 (PDT)
Date: Mon, 13 Apr 2020 06:54:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Laine Stump <laine@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/pci/pcie: Forbid hot-plug via QMP if it's disabled on
 the slot
Message-ID: <20200413065048-mutt-send-email-mst@kernel.org>
References: <20200407145017.1041256-1-jusual@redhat.com>
 <20200408125120.7678d9ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200408125120.7678d9ae@redhat.com>
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
X-List-Received-Date: Mon, 13 Apr 2020 10:55:02 -0000

On Wed, Apr 08, 2020 at 12:51:20PM +0200, Igor Mammedov wrote:
> On Tue,  7 Apr 2020 16:50:17 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
>=20
> > Raise an error when trying to hot-plug/unplug a device through QMP to a=
 device
> > with disabled hot-plug capability. This makes the device behaviour more
> > consistent and provides an explanation of the failure in the case of
> > asynchronous unplug.
>=20
> it applies to hotplug in general (i.e. not only QMP)
>=20
> >=20
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  hw/pci/pcie.c | 24 +++++++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 0eb3a2a5d2..e9798caa8a 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_=
dev, DeviceState *dev,
> >  {
> >      PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
> >      uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev->exp.exp_=
cap;
> > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > =20
> >      /* Don't send event when device is enabled during qemu machine cre=
ation:
> > @@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug=
_dev, DeviceState *dev,
> >          return;
> >      }
> > =20
> > +    /* Hot-plug is disabled on the slot */
> > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > +        error_setg(errp, "Device '%s' does not support hot-plug",
> > +                         DEVICE(hotplug_dev)->id);
> plug and unplug_req are synchronous. so one can skip on "Device '%s'",
> user will get this error message as response to device_add/del command.
>=20
> and more exactly it's concrete slot that does not support hotplug, how ab=
out
> "slot doesn't support ..." or just "hotlpug is not supported"

Well device name is useful here, while these commands are synchronous
others aren't so log parsing might not be synchronous.

I do think we should mention slot since that's the reason
hotplug failed:
    "Device '%s' hot-plug failed: unsupported by slot"

> > +        return;
> > +    }
> > +
> >      /* To enable multifunction hot-plug, we just ensure the function
> >       * 0 added last. When function 0 is added, we set the sltsta and
> >       * inform OS via event notification.
> > @@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *bus, PCIDe=
vice *dev, void *opaque)
> >      object_unparent(OBJECT(dev));
> >  }
> > =20
> > -void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> > +void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_handler,
> >                                       DeviceState *dev, Error **errp)
> >  {
> >      Error *local_err =3D NULL;
> >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> >      PCIBus *bus =3D pci_get_bus(pci_dev);
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

Here too let's mention slot since that's the reason
hotplug failed:
    "Device '%s' hot-unplug failed: unsupported by slot"

?

> > +    }
> > =20
> > -    pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, &local_err=
);
> > +    pcie_cap_slot_plug_common(hotplug_dev, dev, &local_err);
> >      if (local_err) {
> >          error_propagate(errp, local_err);
> >          return;
> > @@ -490,7 +508,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler=
 *hotplug_dev,
> >          return;
> >      }
> > =20
> > -    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
> > +    pcie_cap_slot_push_attention_button(hotplug_dev);
> >  }
> > =20
> >  /* pci express slot for pci express root/downstream port


