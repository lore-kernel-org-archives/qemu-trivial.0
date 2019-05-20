Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hSoVC-00059k-AA
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2019 16:03:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hSoV7-00058b-GL
	for qemu-trivial@nongnu.org; Mon, 20 May 2019 16:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hSoV5-0005ot-EM
	for qemu-trivial@nongnu.org; Mon, 20 May 2019 16:03:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hSoUz-0005ff-VI; Mon, 20 May 2019 16:03:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCD233091755;
	Mon, 20 May 2019 20:02:27 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75C467A429;
	Mon, 20 May 2019 20:02:21 +0000 (UTC)
Date: Mon, 20 May 2019 14:02:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: Li Qiang <liq3ea@163.com>, lvivier@redhat.com, Qemu Developers
	<qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, Philippe =?UTF-8?B?TWF0?=
	=?UTF-8?B?aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190520140221.17a12a0a@x1.home>
In-Reply-To: <CAKXe6SK=Uw7ZNPDvWHFoTHynFsOrEDcAK-+p2ft7YMpo86uC+A@mail.gmail.com>
References: <20190518032811.60341-1-liq3ea@163.com>
	<20190518081830.5adab426@x1.home>
	<CAKXe6SK=Uw7ZNPDvWHFoTHynFsOrEDcAK-+p2ft7YMpo86uC+A@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 20 May 2019 20:02:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 1/4] vfio: pci: make "vfio-pci-nohotplug"
 as MACRO
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
X-List-Received-Date: Mon, 20 May 2019 20:03:14 -0000

On Mon, 20 May 2019 09:27:47 +0800
Li Qiang <liq3ea@gmail.com> wrote:

> Alex Williamson <alex.williamson@redhat.com> =E4=BA=8E2019=E5=B9=B45=E6=
=9C=8818=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8810:18=E5=86=99=E9=81=
=93=EF=BC=9A
>=20
> > On Fri, 17 May 2019 20:28:08 -0700
> > Li Qiang <liq3ea@163.com> wrote:
> >
> > Why?  (No commit message, nor cover letter)
> >
> > =20
> Once I think these are trivial so no cover letter and lack some commit
> message.
> I will add some commit message in the next revision.

There is no patch that is not improved by a commit message IMO.
=20
> For this patch, this is more consistent with QOMConventions:
> -->https://wiki.qemu.org/Documentation/QOMConventions =20

Ok, so you're effectively just updating your previous commit
2683ccd5be8f ("vfio-pci: make vfio-pci device more QOM conventional")
which crossed in flight with b290659fc3dd ("hw/vfio/display: add ramfb
support") which added this new TypeInfo.  The QOMConventions only
recommend a TYPE_FOO if used in other parts of the code, but for
consistency I think it's reasonable (with a commit log ;).  Thanks,

Alex

> > > CC: qemu-trivial@nongnu.org
> > > Signed-off-by: Li Qiang <liq3ea@163.com>
> > > ---
> > >  hw/vfio/pci.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > > index 8cecb53d5c..08729e5875 100644
> > > --- a/hw/vfio/pci.c
> > > +++ b/hw/vfio/pci.c
> > > @@ -40,6 +40,8 @@
> > >  #define TYPE_VFIO_PCI "vfio-pci"
> > >  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_=
PCI)
> > >
> > > +#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> > > +
> > >  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
> > >  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> > >
> > > @@ -3304,8 +3306,8 @@ static void =20
> > vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data) =20
> > >  }
> > >
> > >  static const TypeInfo vfio_pci_nohotplug_dev_info =3D {
> > > -    .name =3D "vfio-pci-nohotplug",
> > > -    .parent =3D "vfio-pci",
> > > +    .name =3D TYPE_VIFO_PCI_NOHOTPLUG,
> > > +    .parent =3D TYPE_VFIO_PCI,
> > >      .instance_size =3D sizeof(VFIOPCIDevice),
> > >      .class_init =3D vfio_pci_nohotplug_dev_class_init,
> > >  }; =20
> >
> > =20


