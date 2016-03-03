Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abSVH-0005Wa-5o
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 07:37:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abSV9-0005VA-RP
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:37:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abSV4-0003x5-Or
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:37:07 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:56836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abSV4-0003u9-13; Thu, 03 Mar 2016 07:37:02 -0500
Received: from 172.24.1.48 (EHLO SZXEMA413-HUB.china.huawei.com)
	([172.24.1.48])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFV12715; Thu, 03 Mar 2016 20:36:25 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.26]) by
	SZXEMA413-HUB.china.huawei.com ([10.82.72.72]) with mapi id
	14.03.0235.001; Thu, 3 Mar 2016 20:35:48 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH 2/6] sheepdog: fix possible resouce leak and
	out-of-bounds access
Thread-Index: AQHRdTE5wrAjRKzf/E2aFXn+mww3cJ9HDB2AgACRFaD//343AIAAi9kA
Date: Thu, 3 Mar 2016 12:35:47 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B02EC401@SZXEMA503-MBS.china.huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-3-git-send-email-arei.gonglei@huawei.com>
	<56D81D57.4040605@redhat.com>
	<33183CC9F5247A488A2544077AF19020B02EC39F@SZXEMA503-MBS.china.huawei.com>
	<56D82A2C.6000607@redhat.com>
In-Reply-To: <56D82A2C.6000607@redhat.com>
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
	refid=str=0001.0A020202.56D82FD3.021F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.6.26,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 29c8941c4b5eb74b78f351aa9ab13eb2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
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
X-List-Received-Date: Thu, 03 Mar 2016 12:37:13 -0000





Regards,
-Gonglei


> -----Original Message-----
> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> Sent: Thursday, March 03, 2016 8:12 PM
> To: Gonglei (Arei); qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org
> Subject: Re: [PATCH 2/6] sheepdog: fix possible resouce leak and out-of-b=
ounds
> access
>=20
>=20
>=20
> On 03/03/2016 13:00, Gonglei (Arei) wrote:
> >>> > >
> >>> > > -    ret =3D find_vdi_name(s, s->name, snap_id, snap_tag, &vid, t=
rue,
> >>> > > +    ret =3D find_vdi_name(s, s->name, hdr.snapid, snap_tag, &vid=
,
> true,
> >>> > >                          &local_err);
> >>> > >      if (ret) {
> >>> > > +        error_report_err(local_err);
> >>> > >          return ret;
> >>> > >      }
> >>> > >
> >>> > >
> >> >
> >> > A patch for this has been posted yesterday by Jeff Cody.
> >> >
> > OK, I found it. And Max's comments is right, Jef can use hdr.snapid ins=
tead of
> snap_tag
> > to invoke find_vdi_name().
> >
> > But, except that fix, My patch also fixed a memory leak, did you see th=
at?
>=20
> No, I didn't notice -- it's not clear that error_report_err also frees
> the error.
>=20
> > Do I need post an separate patch to fix memory leak?
>=20
> Yes, but the right fix in my opinion is to pass errp to find_vdi_name
> instead.
>=20
You are right, we'd better drop local_err in sd_snapshot_delete().

Regards,
-Gonglei

