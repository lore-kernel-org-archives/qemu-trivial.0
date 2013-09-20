Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMyAZ-0001A9-BG
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 06:42:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VMyAT-00013S-FF
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 06:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VMyAO-0004nr-JR
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 06:42:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VMyAD-0004m5-MV; Fri, 20 Sep 2013 06:42:17 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8KAgG2o009107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 20 Sep 2013 06:42:16 -0400
Received: from localhost (ovpn-112-34.ams2.redhat.com [10.36.112.34])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8KAgFid020392; Fri, 20 Sep 2013 06:42:15 -0400
Date: Fri, 20 Sep 2013 12:42:14 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20130920104214.GB14159@stefanha-thinkpad.redhat.com>
References: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
	<523B2D6B.9050601@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <523B2D6B.9050601@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r8KAgG2o009107
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Fix compiler warning
 (-Werror=uninitialized)
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
X-List-Received-Date: Fri, 20 Sep 2013 10:42:38 -0000

On Thu, Sep 19, 2013 at 06:59:23PM +0200, Andreas F=C3=A4rber wrote:
> Am 17.09.2013 18:43, schrieb Stefan Weil:
> > The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:
> >=20
> > block/stream.c:141:22: error:
> > =E2=80=98copy=E2=80=99 may be used uninitialized in this function [-W=
error=3Duninitialized]
> >=20
> > This is not a real bug - a better compiler would not complain.
> >=20
> > Now 'copy' has always a defined value, so the check for ret >=3D 0
> > can be removed.
> >=20
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >  block/stream.c |    5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/block/stream.c b/block/stream.c
> > index 078ce4a..fc19194 100644
> > --- a/block/stream.c
> > +++ b/block/stream.c
> > @@ -108,7 +108,7 @@ static void coroutine_fn stream_run(void *opaque)
> > =20
> >      for (sector_num =3D 0; sector_num < end; sector_num +=3D n) {
> >          uint64_t delay_ns =3D 0;
> > -        bool copy;
> > +        bool copy =3D false;
> > =20
> >  wait:
> >          /* Note that even when no rate limit is applied we need to y=
ield
> > @@ -123,7 +123,6 @@ wait:
> >                                  STREAM_BUFFER_SIZE / BDRV_SECTOR_SIZ=
E, &n);
> >          if (ret =3D=3D 1) {
> >              /* Allocated in the top, no need to copy.  */
> > -            copy =3D false;
> >          } else if (ret >=3D 0) {
> >              /* Copy if allocated in the intermediate images.  Limit =
to the
> >               * known-unallocated area [sector_num, sector_num+n).  *=
/
>=20
> Sorry for not spotting this patch earlier. This hunk looks wrong and
> needs to be dropped, I believe. In the ret >=3D 0 && copy case, there i=
s a
> "goto wait" which would now no longer be able to go from copy =3D=3D tr=
ue ->
> copy =3D=3D false. Not sure if that can happen in practice.

Thanks for catching this!

I've dropped the patch from my block tree for now.

Stefan

