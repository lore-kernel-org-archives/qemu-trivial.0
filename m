Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jPPwC-0000oN-Mf
	for mharc-qemu-trivial@gnu.org; Fri, 17 Apr 2020 08:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsuvorov@redhat.com>) id 1jPPw9-0000nl-TT
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 08:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsuvorov@redhat.com>) id 1jPPw7-0005Go-1e
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 08:17:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsuvorov@redhat.com>) id 1jPPw6-0005EX-TY
 for qemu-trivial@nongnu.org; Fri, 17 Apr 2020 08:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587125854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekvT2EyvCV9IV+eP1xBqHEb5NS0TJLQlR0QFGVNFFXQ=;
 b=jDgtCDMlsUWQkJPtLfjTpf8vEIq86Ns+Qt/SuSe4MnjaYcb+t157fWhvpchvbtLHUPqmpI
 LwL7R0/m6nucN1odEagMsOVSYXdo/7lxo7sVbFiO3f52MpOOxi1wQAR+l9FvkuWKx25e1l
 t0k04nKSiW407Y+TvY+rG1hfC0dQfjE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-W0wozvJuPv61ykslQd2KKA-1; Fri, 17 Apr 2020 08:17:32 -0400
X-MC-Unique: W0wozvJuPv61ykslQd2KKA-1
Received: by mail-lf1-f70.google.com with SMTP id l28so744209lfp.8
 for <qemu-trivial@nongnu.org>; Fri, 17 Apr 2020 05:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olWxZwO4m0oWi2EIm/nSKHLCLNSx6vr9cbnjSRpTEGw=;
 b=NH4WPqipdDrDNa25CZoaH3zNa+Wj++2xTntN9Ck+89/ZHyY5gTb8OMyphUrNzFwT5q
 MbJE/AOaZqDrxo9iRdJqubBKDWXC52snyN9lZuSBUCbOY5yOnhMjy6iQ1WmP/4zajaeC
 RnVdGx+sibOg6JqgGZbNOovECbKj/3WtFLWDDP8bYuoLuB+X3bJFM2quqlRztGbtvTA7
 TEvQwmYHWNHc/Ax20cCY4sgJP/Nuslq5p6DfUmKzGYwlWSEVxLmKZsnq6NmaWCCB5iEO
 PQ3pX/0q9yU7iLDTvZaB682DpCgIQGzKPLTjEt7b7DjKji/surV/nUzBm8lS6YIynbAl
 enBg==
X-Gm-Message-State: AGi0PuZacY6yN1fQmWYC8c9B0jhp4YgZAu1BLL5CSRtVHHJVq8hfccsG
 dKp+OuG7zW4NH0IcFd4ZUdxZkvUkI8U2fJWD85dLAastBl0DqwpSVvXBJJ3dCmICWKWk6bRzYld
 MRv7XIetmrBoogmMkxMgSOTE+qgUaqNAWvg==
X-Received: by 2002:a2e:99d6:: with SMTP id l22mr1876020ljj.263.1587125850864; 
 Fri, 17 Apr 2020 05:17:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJWd1QqDQhF8EE0CBKydiNlCmRB2HaDb3FibmyKNbqx8NEUYrEnUjbsMavXZKiMtwX/lE+zZAGDZKL4af65nP0=
X-Received: by 2002:a2e:99d6:: with SMTP id l22mr1875990ljj.263.1587125850442; 
 Fri, 17 Apr 2020 05:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200407145017.1041256-1-jusual@redhat.com>
 <20200408125120.7678d9ae@redhat.com>
 <20200413065048-mutt-send-email-mst@kernel.org>
 <CAMDeoFW8q5Er5re6PasjKQ3+3ABFiGrbjZ7WSf5zq836y_+GuA@mail.gmail.com>
 <20200417054957-mutt-send-email-mst@kernel.org>
 <CAMDeoFXZHjLQ=LZrStS6nLuLk1M9__Jy19D_TLEbtSgC1kYXUA@mail.gmail.com>
 <20200417070818-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200417070818-mutt-send-email-mst@kernel.org>
From: Julia Suvorova <jusual@redhat.com>
Date: Fri, 17 Apr 2020 14:17:19 +0200
Message-ID: <CAMDeoFWOAWdrHAHRmpGcWF7fiPzCAoXZ=A2C+qkzM6FpFquDbA@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Apr 2020 12:17:39 -0000

On Fri, Apr 17, 2020 at 1:11 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Apr 17, 2020 at 01:03:01PM +0200, Julia Suvorova wrote:
> > On Fri, Apr 17, 2020 at 11:51 AM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > >
> > > On Wed, Apr 15, 2020 at 10:20:33PM +0200, Julia Suvorova wrote:
> > > > On Mon, Apr 13, 2020 at 12:55 PM Michael S. Tsirkin <mst@redhat.com=
> wrote:
> > > > >
> > > > > On Wed, Apr 08, 2020 at 12:51:20PM +0200, Igor Mammedov wrote:
> > > > > > On Tue,  7 Apr 2020 16:50:17 +0200
> > > > > > Julia Suvorova <jusual@redhat.com> wrote:
> > > > > >
> > > > > > > Raise an error when trying to hot-plug/unplug a device throug=
h QMP to a device
> > > > > > > with disabled hot-plug capability. This makes the device beha=
viour more
> > > > > > > consistent and provides an explanation of the failure in the =
case of
> > > > > > > asynchronous unplug.
> > > > > >
> > > > > > it applies to hotplug in general (i.e. not only QMP)
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > > > > ---
> > > > > > >  hw/pci/pcie.c | 24 +++++++++++++++++++++---
> > > > > > >  1 file changed, 21 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > > > > index 0eb3a2a5d2..e9798caa8a 100644
> > > > > > > --- a/hw/pci/pcie.c
> > > > > > > +++ b/hw/pci/pcie.c
> > > > > > > @@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler=
 *hotplug_dev, DeviceState *dev,
> > > > > > >  {
> > > > > > >      PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
> > > > > > >      uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev=
->exp.exp_cap;
> > > > > > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCA=
P);
> > > > > > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > > > > > >
> > > > > > >      /* Don't send event when device is enabled during qemu m=
achine creation:
> > > > > > > @@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandle=
r *hotplug_dev, DeviceState *dev,
> > > > > > >          return;
> > > > > > >      }
> > > > > > >
> > > > > > > +    /* Hot-plug is disabled on the slot */
> > > > > > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > > > > > +        error_setg(errp, "Device '%s' does not support hot-p=
lug",
> > > > > > > +                         DEVICE(hotplug_dev)->id);
> > > > > > plug and unplug_req are synchronous. so one can skip on "Device=
 '%s'",
> > > > > > user will get this error message as response to device_add/del =
command.
> > > > > >
> > > > > > and more exactly it's concrete slot that does not support hotpl=
ug, how about
> > > > > > "slot doesn't support ..." or just "hotlpug is not supported"
> > > > >
> > > > > Well device name is useful here, while these commands are synchro=
nous
> > > > > others aren't so log parsing might not be synchronous.
> > > > >
> > > > > I do think we should mention slot since that's the reason
> > > > > hotplug failed:
> > > > >     "Device '%s' hot-plug failed: unsupported by slot"
> > > > >
> > > > > > > +        return;
> > > > > > > +    }
> > > > > > > +
> > > > > > >      /* To enable multifunction hot-plug, we just ensure the =
function
> > > > > > >       * 0 added last. When function 0 is added, we set the sl=
tsta and
> > > > > > >       * inform OS via event notification.
> > > > > > > @@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *=
bus, PCIDevice *dev, void *opaque)
> > > > > > >      object_unparent(OBJECT(dev));
> > > > > > >  }
> > > > > > >
> > > > > > > -void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug=
_dev,
> > > > > > > +void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug=
_handler,
> > > > > > >                                       DeviceState *dev, Error=
 **errp)
> > > > > > >  {
> > > > > > >      Error *local_err =3D NULL;
> > > > > > >      PCIDevice *pci_dev =3D PCI_DEVICE(dev);
> > > > > > >      PCIBus *bus =3D pci_get_bus(pci_dev);
> > > > > > > +    PCIDevice *hotplug_dev =3D PCI_DEVICE(hotplug_handler);
> > > > > > > +    uint8_t *exp_cap =3D hotplug_dev->config + hotplug_dev->=
exp.exp_cap;
> > > > > > > +    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCA=
P);
> > > > > > > +
> > > > > > > +    /* Hot-unplug is disabled on the slot */
> > > > > > > +    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
> > > > > > > +        error_setg(errp, "Device '%s' does not support hot-u=
nplug",
> > > > > > > +                         DEVICE(hotplug_dev)->id);
> > > > > > > +        return;
> > > > >
> > > > > Here too let's mention slot since that's the reason
> > > > > hotplug failed:
> > > > >     "Device '%s' hot-unplug failed: unsupported by slot"
> > > > >
> > > > > ?
> > > >
> > > > Just to mention, for a user it's disabled on the device,
> > >
> > > How?
> > > I assumed this is what is used:
> > >
> > > commit 530a0963184e57e71a5b538e9161f115df533e96
> > > Author: Julia Suvorova <jusual@redhat.com>
> > > Date:   Wed Feb 26 18:46:07 2020 +0100
> > >
> > >     pcie_root_port: Add hotplug disabling option
> > >
> > >     Make hot-plug/hot-unplug on PCIe Root Ports optional to allow lib=
virt
> > >     manage it and restrict unplug for the whole machine. This is goin=
g to
> > >     prevent user-initiated unplug in guests (Windows mostly).
> > >     Hotplug is enabled by default.
> > >     Usage:
> > >         -device pcie-root-port,hotplug=3Doff,...
> > >
> > >
> > > so it looks like user has to disable it on the slot.
> >
> > By device I mean root port, and it's shown in the error message. If
> > you think it's not correct, I'll change it.
>
> Oh I see. It might be confusing for user: I add device A
> and get a report "Device B does not support hot-plug".
> How about:
>         "Hot-plug failed: unsupported by port device %s"?

Looks good.

Best regards, Julia Suvorova.


