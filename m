Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn7ae-0006p8-9p
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 14:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gn7ab-0006e6-T3
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 14:56:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gn7S5-00081j-9n
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 14:47:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gn7S4-000818-9s; Fri, 25 Jan 2019 14:47:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F7A72DD77C;
	Fri, 25 Jan 2019 19:47:43 +0000 (UTC)
Received: from redhat.com (ovpn-122-46.rdu2.redhat.com [10.10.122.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 346109F68;
	Fri, 25 Jan 2019 19:47:40 +0000 (UTC)
Date: Fri, 25 Jan 2019 14:47:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: ksourav <sourav.jb1988@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	pbonzini@redhat.com, QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <20190125144650-mutt-send-email-mst@kernel.org>
References: <20190125151440.13794-1-sourav.jb1988@gmail.com>
	<f9288ca3-1f07-3409-ac16-ce4dc958940e@redhat.com>
	<cc09d469-56bc-9438-acc0-0d4ccf67e6a5@redhat.com>
	<CAAJhNetypG8pwa0Vs-RV=QbBcWwev5QtPF9n3CvTQJuzbNxkhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAAJhNetypG8pwa0Vs-RV=QbBcWwev5QtPF9n3CvTQJuzbNxkhg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 25 Jan 2019 19:47:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: input: set category of
 the i8042 device
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
X-List-Received-Date: Fri, 25 Jan 2019 19:56:34 -0000

On Fri, Jan 25, 2019 at 11:30:10PM +0530, ksourav wrote:
> On Fri, Jan 25, 2019 at 10:14 PM Philippe Mathieu-Daud=E9
> <philmd@redhat.com> wrote:
> >
> > On 1/25/19 4:24 PM, Thomas Huth wrote:
> > > On 2019-01-25 16:14, kumar sourav wrote:
> > >> Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
> > >> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> > >>
> > >> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> > >> ---
> > >>  hw/input/pckbd.c | 1 +
> >
> > It seems we have other potential cases:
> >
> > $ git grep -L 'set_bit(DEVICE_CATEGORY_INPUT' hw/input/*c
> > hw/input/adb.c
> > hw/input/hid.c
> > hw/input/lm832x.c
> > hw/input/milkymist-softusb.c
> > hw/input/pckbd.c
> > hw/input/pl050.c
> > hw/input/ps2.c
> > hw/input/pxa2xx_keypad.c
> > hw/input/stellaris_input.c
> > hw/input/tsc2005.c
> > hw/input/tsc210x.c
> > hw/input/virtio-input-hid.c
> > hw/input/virtio-input-host.c
> >
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> > >> index 3e66713b47..72e7d5f6cc 100644
> > >> --- a/hw/input/pckbd.c
> > >> +++ b/hw/input/pckbd.c
> > >> @@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *kl=
ass, void *data)
> > >>
> > >>      dc->realize =3D i8042_realizefn;
> > >>      dc->vmsd =3D &vmstate_kbd_isa;
> > >> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> > >>  }
> > >>
> > >>  static const TypeInfo i8042_info =3D {
> > >>
> > >
> > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >
> Ok I will add device categories for these devices too. Should I send
> the changes in one patch for all these devices/files ?
> Or should I send it separately - one patch per device/file ?
>=20
> Thanks & Regards

Either is fine. One patch will be merged faster :)

--=20
MST

