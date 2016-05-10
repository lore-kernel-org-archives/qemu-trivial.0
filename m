Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b00iV-0004lh-LI
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 02:00:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1b00iS-0004ZW-Eg
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 02:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1b00iL-0002xt-BP
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 02:00:19 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:23579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1b00iK-0002uU-0n; Tue, 10 May 2016 02:00:13 -0400
Received: from 172.24.1.47 (EHLO SZXEMA417-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DKH72993; Tue, 10 May 2016 13:59:52 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.166]) by
	SZXEMA417-HUB.china.huawei.com ([10.82.72.34]) with mapi id
	14.03.0235.001; Tue, 10 May 2016 13:59:47 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [PATCH 3/6] spice: fix coverity complains
Thread-Index: AQHRdTE2gG4ORTjdWkyknfV7sRu49J9HDJoAgGsLHlA=
Date: Tue, 10 May 2016 05:59:46 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B032023A@SZXEMA503-MBS.china.huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-4-git-send-email-arei.gonglei@huawei.com>
	<56D81DC0.5030302@redhat.com>
In-Reply-To: <56D81DC0.5030302@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.18.62]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.573178DD.001C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.6.166,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e63a40bf414fd2b205e72415c37b2aa1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-trivial] [PATCH 3/6] spice: fix coverity complains
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
X-List-Received-Date: Tue, 10 May 2016 06:00:21 -0000

Hi Gerd,

Pls pick this one, thanks :)

Regards,
-Gonglei


> -----Original Message-----
> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> Sent: Thursday, March 03, 2016 7:19 PM
> To: Gonglei (Arei); qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org
> Subject: Re: [PATCH 3/6] spice: fix coverity complains
>=20
>=20
>=20
> On 03/03/2016 10:43, Gonglei wrote:
> > Remove the unnecessary NULL check.
> >
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  ui/spice-display.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/ui/spice-display.c b/ui/spice-display.c
> > index 242ab5f..1ffbec1 100644
> > --- a/ui/spice-display.c
> > +++ b/ui/spice-display.c
> > @@ -769,9 +769,7 @@ static void
> display_mouse_define(DisplayChangeListener *dcl,
> >      SimpleSpiceDisplay *ssd =3D container_of(dcl, SimpleSpiceDisplay, =
dcl);
> >
> >      qemu_mutex_lock(&ssd->lock);
> > -    if (c) {
> > -        cursor_get(c);
> > -    }
> > +    cursor_get(c);
> >      cursor_put(ssd->cursor);
> >      ssd->cursor =3D c;
> >      ssd->hot_x =3D c->hot_x;
> >
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

