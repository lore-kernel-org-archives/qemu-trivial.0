Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buE7X-0006sY-I7
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 03:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1buE7U-0006rw-Mf
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 03:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1buE7P-0004gm-R1
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 03:38:32 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:35772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1buE7N-0004ef-AQ; Wed, 12 Oct 2016 03:38:27 -0400
Received: from 172.24.1.60 (EHLO SZXEMA418-HUB.china.huawei.com)
	([172.24.1.60])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DOQ04061; Wed, 12 Oct 2016 15:38:12 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.130]) by
	SZXEMA418-HUB.china.huawei.com ([10.82.72.36]) with mapi id
	14.03.0235.001; Wed, 12 Oct 2016 15:38:00 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Michael Tokarev <mjt@tls.msk.ru>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, "Herongguang
	(Stephen)" <herongguang.he@huawei.com>
Thread-Topic: [PATCH] mmap-alloc: check before use for ptr pointer
Thread-Index: AQHSJC0X5HaZR4l5T0ifB8xooUgK8KCj2hMAgACTZBA=
Date: Wed, 12 Oct 2016 07:37:59 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B03F1A53@SZXEMA503-MBS.china.huawei.com>
References: <1476237901-85376-1-git-send-email-arei.gonglei@huawei.com>
	<14f4caf5-3884-bd5a-0f91-b206d578aa76@msgid.tls.msk.ru>
In-Reply-To: <14f4caf5-3884-bd5a-0f91-b206d578aa76@msgid.tls.msk.ru>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.18.62]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-trivial] [PATCH] mmap-alloc: check before use for ptr
 pointer
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
X-List-Received-Date: Wed, 12 Oct 2016 07:38:33 -0000

> -----Original Message-----
> From: Michael Tokarev [mailto:mjt@tls.msk.ru]
> Sent: Wednesday, October 12, 2016 2:46 PM
> Subject: Re: [PATCH] mmap-alloc: check before use for ptr pointer
>=20
> 12.10.2016 05:05, Gonglei wrote:
> > If ptr mmap failed, we don't need to do a superfluous
> > calculation for offset variable by ptr (MAP_FAILED).
>=20
> What's the point?  There's no problem in extra calculation
> if mmap failed, yes, but do we really care?  As of it is now,
> it is more compact and readable, and works.  I think.
>=20

I just think it's more reasonable because the ptr is checked after
used. Why do we need a extra calculation?


Regards,
-Gonglei

> Thanks,
>=20
> /mjt
>=20
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  util/mmap-alloc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> > index 5a85aa3..577862b 100644
> > --- a/util/mmap-alloc.c
> > +++ b/util/mmap-alloc.c
> > @@ -61,13 +61,15 @@ void *qemu_ram_mmap(int fd, size_t size, size_t
> align, bool shared)
> >  #else
> >      void *ptr =3D mmap(0, total, PROT_NONE, MAP_ANONYMOUS |
> MAP_PRIVATE, -1, 0);
> >  #endif
> > -    size_t offset =3D QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_=
t)ptr;
> > +    size_t offset;
> >      void *ptr1;
> >
> >      if (ptr =3D=3D MAP_FAILED) {
> >          return MAP_FAILED;
> >      }
> >
> > +    offset =3D QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
> > +
> >      /* Make sure align is a power of 2 */
> >      assert(!(align & (align - 1)));
> >      /* Always align to host page size */
> >


