Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b00l6-0008Qb-Cw
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 02:03:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1b00l0-0008Hf-Qc
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 02:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1b00kw-00041C-9q
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 02:02:58 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:6119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1b00kv-0003yp-Iw; Tue, 10 May 2016 02:02:54 -0400
Received: from 172.24.1.36 (EHLO SZXEMA412-HUB.china.huawei.com)
	([172.24.1.36])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CBL75395; Tue, 10 May 2016 14:02:33 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.166]) by
	SZXEMA412-HUB.china.huawei.com ([10.82.72.71]) with mapi id
	14.03.0235.001; Tue, 10 May 2016 14:02:27 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [PATCH 1/6] egl-helpers: fix possible resource leak
Thread-Index: AQHRdTE3pa0c06GlmUmgQwHGcmqyqZ9HDJUAgGsL6RA=
Date: Tue, 10 May 2016 06:02:26 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B0320251@SZXEMA503-MBS.china.huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-2-git-send-email-arei.gonglei@huawei.com>
	<56D81DBC.3040304@redhat.com>
In-Reply-To: <56D81DBC.3040304@redhat.com>
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
	refid=str=0001.0A090202.5731797D.0045, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.6.166,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 421903fadf8d253919741ca833f1fc4a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-trivial] [PATCH 1/6] egl-helpers: fix possible resource
 leak
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
X-List-Received-Date: Tue, 10 May 2016 06:03:03 -0000

And this one.  Thanks :)


Regards,
-Gonglei


> -----Original Message-----
> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> Sent: Thursday, March 03, 2016 7:19 PM
> To: Gonglei (Arei); qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org
> Subject: Re: [PATCH 1/6] egl-helpers: fix possible resource leak
>=20
>=20
>=20
> On 03/03/2016 10:43, Gonglei wrote:
> > CID 1352419, using g_strdup_printf instead of asprintf.
> >
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  ui/egl-helpers.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> > index 54be44c..2da1930 100644
> > --- a/ui/egl-helpers.c
> > +++ b/ui/egl-helpers.c
> > @@ -50,18 +50,15 @@ int qemu_egl_rendernode_open(void)
> >              continue;
> >          }
> >
> > -        r =3D asprintf(&p, "/dev/dri/%s", e->d_name);
> > -        if (r < 0) {
> > -            return -1;
> > -        }
> > +        p =3D g_strdup_printf("/dev/dri/%s", e->d_name);
> >
> >          r =3D open(p, O_RDWR | O_CLOEXEC | O_NOCTTY |
> O_NONBLOCK);
> >          if (r < 0) {
> > -            free(p);
> > +            g_free(p);
> >              continue;
> >          }
> >          fd =3D r;
> > -        free(p);
> > +        g_free(p);
> >          break;
> >      }
> >
> >
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

