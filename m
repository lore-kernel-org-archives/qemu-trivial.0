Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNuPe-0001fZ-34
	for mharc-qemu-trivial@gnu.org; Wed, 30 May 2018 02:16:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fNuPb-0001eJ-NI
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 02:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fNuPa-0000nG-QQ
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 02:16:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38286 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fNuPV-0000lA-Vl; Wed, 30 May 2018 02:16:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFCA9401EF0E;
	Wed, 30 May 2018 06:16:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-13.ams2.redhat.com
	[10.36.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 633701117624;
	Wed, 30 May 2018 06:16:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 72C2541A80; Wed, 30 May 2018 08:16:33 +0200 (CEST)
Date: Wed, 30 May 2018 08:16:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180530061633.iltyrqvyctpipxmt@sirius.home.kraxel.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-16-f4bug@amsat.org>
	<4f76d9d2-5c4b-a6ef-e050-9d9a1f31be85@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f76d9d2-5c4b-a6ef-e050-9d9a1f31be85@amsat.org>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 30 May 2018 06:16:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 30 May 2018 06:16:36 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH for 2.10 15/35] usb: correctly handle
 Zero Length Packets
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
X-List-Received-Date: Wed, 30 May 2018 06:16:44 -0000

On Tue, May 29, 2018 at 11:22:46AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> On 07/24/2017 03:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > USB Specification Revision 2.0, =C2=A75.5.3:
> >   The Data stage of a control transfer from an endpoint to the host i=
s complete when the endpoint does one of the following:
> >   =E2=80=A2 Has transferred exactly the amount of data specified duri=
ng the Setup stage
> >   =E2=80=A2 Transfers a packet with a payload size less than wMaxPack=
etSize or transfers a zero-length packet"
> >=20
> > hw/usb/redirect.c:802:9: warning: Declared variable-length array (VLA=
) has zero size
> >         uint8_t buf[size];
> >         ^~~~~~~~~~~ ~~~~
> >=20
> > Reported-by: Clang Static Analyzer
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  hw/usb/redirect.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> > index 5e42730449..5b7073d2cd 100644
> > --- a/hw/usb/redirect.c
> > +++ b/hw/usb/redirect.c
> > @@ -795,7 +795,7 @@ static void usbredir_handle_bulk_data(USBRedirDev=
ice *dev, USBPacket *p,
> >             usbredirparser_peer_has_cap(dev->parser,
> >                                         usb_redir_cap_32bits_bulk_len=
gth));
> > =20
> > -    if (ep & USB_DIR_IN) {
> > +    if (ep & USB_DIR_IN || size =3D=3D 0) {
> >          usbredirparser_send_bulk_packet(dev->parser, p->id,
> >                                          &bulk_packet, NULL, 0);
> >      } else {
> >=20
>=20
> Ping?

Whoops, pretty old one.  Don't have this in my qemu-devel archive any
more.  Can you rebase + resend?

thanks,
  Gerd


