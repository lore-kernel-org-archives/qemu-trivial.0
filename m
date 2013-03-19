Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UHwp4-0008Ka-GJ
	for mharc-qemu-trivial@gnu.org; Tue, 19 Mar 2013 09:43:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1UHwp2-0008Hp-JD
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 09:43:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1UHwot-0006CZ-6v
	for qemu-trivial@nongnu.org; Tue, 19 Mar 2013 09:43:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1UHwof-00068W-Cu; Tue, 19 Mar 2013 09:43:01 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDh0XG006235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 19 Mar 2013 09:43:00 -0400
Received: from dhcp-200-207.str.redhat.com (ovpn-116-87.ams2.redhat.com
	[10.36.116.87])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDgw0I001769; Tue, 19 Mar 2013 09:42:59 -0400
Date: Tue, 19 Mar 2013 14:42:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20130319134258.GE2418@dhcp-200-207.str.redhat.com>
References: <1363692343-22299-1-git-send-email-kwolf@redhat.com>
	<51486831.4070802@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <51486831.4070802@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r2JDh0XG006235
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial: Fix debug format
	strings
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 13:43:25 -0000

Am 19.03.2013 um 14:29 hat Andreas F=E4rber geschrieben:
> Am 19.03.2013 12:25, schrieb Kevin Wolf:
> > This fixes the build of hw/serial.c with DEBUG_SERIAL enabled.
> >=20
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  hw/serial.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/serial.c b/hw/serial.c
> > index 48a5eb6..0ccc499 100644
> > --- a/hw/serial.c
> > +++ b/hw/serial.c
> > @@ -306,7 +306,7 @@ static void serial_ioport_write(void *opaque, hwa=
ddr addr, uint64_t val,
> >      SerialState *s =3D opaque;
> > =20
> >      addr &=3D 7;
> > -    DPRINTF("write addr=3D0x%02x val=3D0x%02x\n", addr, val);
> > +    DPRINTF("write addr=3D0x%" HWADDR_PRIx " val=3D0x%" PRIx64 "\n",=
 addr, val);
>=20
> Are you intentionally dropping 02 in both places? That changes output F=
WIW.

%02 for 64 bit values felt odd, but I think they might be guaranteed to
be small enough in practice. If you really prefer, I can send a v2 which
adds it back. But it's only debug code, so... *shrug*

Kevin

