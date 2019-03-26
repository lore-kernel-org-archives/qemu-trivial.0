Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8iSG-00061Z-CQ
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 05:33:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1h8iSE-00061C-BS
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 05:33:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1h8iSD-0003jS-8M
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 05:33:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1h8iIS-00082L-7F; Tue, 26 Mar 2019 05:23:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1A42356EA;
	Tue, 26 Mar 2019 09:13:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-65.ams2.redhat.com
	[10.36.117.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A80B177BC;
	Tue, 26 Mar 2019 09:13:56 +0000 (UTC)
Date: Tue, 26 Mar 2019 10:13:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: John Snow <jsnow@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Message-ID: <20190326091354.GC7075@localhost.localdomain>
References: <20190321094012.36541-1-sgarzare@redhat.com>
	<7c89c032-7160-32d6-90ad-f5dafbdb211d@redhat.com>
	<CAAdtpL75dz-2ZSBJWwN_HA28-p8GxuV_HqRC7_QYaQp-yzRSpw@mail.gmail.com>
	<20190326075524.qvlakskoee3phywp@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190326075524.qvlakskoee3phywp@steredhat>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 26 Mar 2019 09:13:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] block/vhdx:
 Use IEC binary prefixes from "qemu/units.h"
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
X-List-Received-Date: Tue, 26 Mar 2019 09:33:11 -0000

Am 26.03.2019 um 08:55 hat Stefano Garzarella geschrieben:
> On Mon, Mar 25, 2019 at 10:56:57PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > Le lun. 25 mars 2019 21:53, John Snow <jsnow@redhat.com> a =E9crit :
> > > On 3/21/19 5:40 AM, Stefano Garzarella wrote:
> > > > IEC binary prefixes are defined in "qemu/units.h", so we
> > > > can remove redundant definitions in "block/vhdx.h".
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > >  block/vhdx-log.c | 1 +
> > > >  block/vhdx.c     | 4 +++-
> > > >  block/vhdx.h     | 5 -----
> > > >  3 files changed, 4 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/block/vhdx-log.c b/block/vhdx-log.c
> > > > index 3149ff08d8..ad9905eb6d 100644
> > > > --- a/block/vhdx-log.c
> > > > +++ b/block/vhdx-log.c
> > > > @@ -18,6 +18,7 @@
> > > >   *
> > > >   */
> > > >  #include "qemu/osdep.h"
> > > > +#include "qemu/units.h"
> > > >  #include "qapi/error.h"
> > > >  #include "qemu-common.h"
> > > >  #include "block/block_int.h"
> > > > diff --git a/block/vhdx.c b/block/vhdx.c
> > > > index b785aef4b7..e9b16c5ef6 100644
> > > > --- a/block/vhdx.c
> > > > +++ b/block/vhdx.c
> > > > @@ -16,6 +16,7 @@
> > > >   */
> > > >
> > > >  #include "qemu/osdep.h"
> > > > +#include "qemu/units.h"
> > > >  #include "qapi/error.h"
> > > >  #include "block/block_int.h"
> > > >  #include "block/qdict.h"
> > > > @@ -1889,7 +1890,8 @@ static int coroutine_fn
> > > vhdx_co_create(BlockdevCreateOptions *opts,
> > > >          return -EINVAL;
> > > >      }
> > > >      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> > > > -        error_setg(errp, "Block size must not exceed %d",
> > > VHDX_BLOCK_SIZE_MAX);
> > > > +        error_setg(errp, "Block size must not exceed %" PRId64,
> > > > +                   VHDX_BLOCK_SIZE_MAX);
> > >
> > > Oh, changing the constants changes the inferred type of this consta=
nt,
> > > correct?
> > >
> >=20
>=20
> Yes, in "units.h" all the constants are int64_t.
>=20
> > Yes.
> >=20
> >=20
> > > >          return -EINVAL;
> > > >      }
> > > >
> > > > diff --git a/block/vhdx.h b/block/vhdx.h
> > > > index 1bfb4e4f73..deb6e362ad 100644
> > > > --- a/block/vhdx.h
> > > > +++ b/block/vhdx.h
> > > > @@ -18,11 +18,6 @@
> > > >  #ifndef BLOCK_VHDX_H
> > > >  #define BLOCK_VHDX_H
> > > >
> > > > -#define KiB              (1 * 1024)
> > > > -#define MiB            (KiB * 1024)
> > > > -#define GiB            (MiB * 1024)
> > > > -#define TiB ((uint64_t) GiB * 1024)
> > > > -
> > >
> > > I'd include units.h here because there are other references to
> > > KiB/MiB/GiB and so on throughout the rest of this header file.
> > >
> > > I think it's bad form to have a header that cannot be included unle=
ss
> > > you include other headers manually alongside it.
> > >
> >=20
> > Agreed.
>=20
> Okay, I'll include units.h here.
>=20
> >=20
> >=20
> > > >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> > >
> >=20
> > Can we also update this definition?
> >=20
>=20
> Sure, I'll update it in v2.

This is used in vhdx_create_opts:

    .def_value_str =3D stringify(DEFAULT_LOG_SIZE),

You want the default size to be a number, not an expression, so you'd
have to change the default string to retain the number. Probably better
to just leave the #define alone.

We could, however, put a comment next to the define lik vdi.c has:

    /* Note: can't use 1 * MiB, because it's passed to stringify() */

Kevin

