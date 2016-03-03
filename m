Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRyr-0005dz-3t
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 07:03:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abRyo-0005cu-Ji
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:03:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abRyi-0003ib-JY
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:03:42 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:40142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abRyh-0003hV-Rd; Thu, 03 Mar 2016 07:03:36 -0500
Received: from 172.24.1.50 (EHLO szxema411-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCN18184; Thu, 03 Mar 2016 20:02:04 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.26]) by
	szxema411-hub.china.huawei.com ([10.82.72.70]) with mapi id
	14.03.0235.001; Thu, 3 Mar 2016 20:00:23 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH 2/6] sheepdog: fix possible resouce leak and
	out-of-bounds access
Thread-Index: AQHRdTE5wrAjRKzf/E2aFXn+mww3cJ9HDB2AgACRFaA=
Date: Thu, 3 Mar 2016 12:00:23 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B02EC39F@SZXEMA503-MBS.china.huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-3-git-send-email-arei.gonglei@huawei.com>
	<56D81D57.4040605@redhat.com>
In-Reply-To: <56D81D57.4040605@redhat.com>
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
	refid=str=0001.0A020203.56D827BE.02BB, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.6.26,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8546609c6c288834809c6f07d870461d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/6] sheepdog: fix possible resouce leak
 and out-of-bounds access
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
X-List-Received-Date: Thu, 03 Mar 2016 12:03:43 -0000





Regards,
-Gonglei


> -----Original Message-----
> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> Sent: Thursday, March 03, 2016 7:18 PM
> To: Gonglei (Arei); qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org
> Subject: Re: [PATCH 2/6] sheepdog: fix possible resouce leak and out-of-b=
ounds
> access
>=20
>=20
>=20
> On 03/03/2016 10:43, Gonglei wrote:
> > CID 1352418 (#1 of 1): Out-of-bounds access (INCOMPATIBLE_CAST)
> > incompatible_cast: Pointer &snap_id points to an object whose effective
> > type is unsigned int (32 bits, unsigned) but is dereferenced as a wider
> > unsigned long (64 bits, unsigned). This may lead to memory corruption.
> >
> > We also need to free local_err when ret is not equals to 0.
> >
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  block/sheepdog.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/block/sheepdog.c b/block/sheepdog.c
> > index 8739acc..3d81bba 100644
> > --- a/block/sheepdog.c
> > +++ b/block/sheepdog.c
> > @@ -2543,7 +2543,7 @@ static int sd_snapshot_delete(BlockDriverState
> *bs,
> >                                const char *name,
> >                                Error **errp)
> >  {
> > -    uint32_t snap_id =3D 0;
> > +    unsigned long snap_id =3D 0;
> >      char snap_tag[SD_MAX_VDI_TAG_LEN];
> >      Error *local_err =3D NULL;
> >      int fd, ret;
> > @@ -2565,20 +2565,23 @@ static int sd_snapshot_delete(BlockDriverState
> *bs,
> >      memset(buf, 0, sizeof(buf));
> >      memset(snap_tag, 0, sizeof(snap_tag));
> >      pstrcpy(buf, SD_MAX_VDI_LEN, s->name);
> > -    if (qemu_strtoul(snapshot_id, NULL, 10, (unsigned long *)&snap_id)=
) {
> > +    if (qemu_strtoul(snapshot_id, NULL, 10, &snap_id)) {
> >          return -1;
> >      }
> >
> >      if (snap_id) {
> > +        assert(snap_id <=3D UINT_MAX);
> > +
> >          hdr.snapid =3D snap_id;
> >      } else {
> >          pstrcpy(snap_tag, sizeof(snap_tag), snapshot_id);
> >          pstrcpy(buf + SD_MAX_VDI_LEN, SD_MAX_VDI_TAG_LEN,
> snap_tag);
> >      }
> >
> > -    ret =3D find_vdi_name(s, s->name, snap_id, snap_tag, &vid, true,
> > +    ret =3D find_vdi_name(s, s->name, hdr.snapid, snap_tag, &vid, true=
,
> >                          &local_err);
> >      if (ret) {
> > +        error_report_err(local_err);
> >          return ret;
> >      }
> >
> >
>=20
> A patch for this has been posted yesterday by Jeff Cody.
>=20

OK, I found it. And Max's comments is right, Jef can use hdr.snapid instead=
 of snap_tag
to invoke find_vdi_name().

But, except that fix, My patch also fixed a memory leak, did you see that? =
Do I need
post an separate patch to fix memory leak?


Regards,
-Gonglei

