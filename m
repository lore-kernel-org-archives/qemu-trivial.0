Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJU54-0004dM-Oy
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 17:03:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1XJTSx-0001hR-N2
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 16:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1XJTSt-0001ly-D8
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 16:23:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>)
	id 1XJTSk-0001kZ-9G; Mon, 18 Aug 2014 16:23:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7IKNPfc014826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 16:23:25 -0400
Received: from localhost ([10.3.112.14])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7IKNNLN021623
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 18 Aug 2014 16:23:24 -0400
Date: Mon, 18 Aug 2014 16:23:23 -0400
From: Jeff Cody <jcody@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140818202323.GF2627@localhost.localdomain>
References: <1408348310-6628-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F1E445.1060301@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53F1E445.1060301@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7IKNPfc014826
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 18 Aug 2014 17:03:05 -0400
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v7] slirp/misc: Use
 g_malloc() instead of malloc()
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
X-List-Received-Date: Mon, 18 Aug 2014 20:23:48 -0000

On Mon, Aug 18, 2014 at 03:32:21PM +0400, Michael Tokarev wrote:
> 18.08.2014 11:51, zhanghailiang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Here we don't check the return value of malloc() which may fail.
> > Use the g_malloc() instead, which will abort the program when
> > there is not enough memory.
> >=20
> > Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >  slirp/misc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/slirp/misc.c b/slirp/misc.c
> > index b8eb74c..f7fe497 100644
> > --- a/slirp/misc.c
> > +++ b/slirp/misc.c
> > @@ -54,7 +54,7 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, c=
har *exec,
> >  	}
> > =20
> >  	tmp_ptr =3D *ex_ptr;
> > -	*ex_ptr =3D (struct ex_list *)malloc(sizeof(struct ex_list));
> > +	*ex_ptr =3D (struct ex_list *)g_malloc(sizeof(struct ex_list));
>=20
> There's a convinient macro in glib, g_new(typename, numelts).  Also
> there's a less commonly used g_renew() which is like realloc, but it
> is not applicable here.
>=20

If you are going to respin anyway, I recommend dropping the
superfluous (struct ex_list *) cast here as well.

> >  	(*ex_ptr)->ex_fport =3D port;
> >  	(*ex_ptr)->ex_addr =3D addr;
> >  	(*ex_ptr)->ex_pty =3D do_pty;
> > @@ -235,7 +235,7 @@ strdup(str)
> >  {
> >  	char *bptr;
> > =20
> > -	bptr =3D (char *)malloc(strlen(str)+1);
> > +	bptr =3D (char *)g_malloc(strlen(str)+1);
> >  	strcpy(bptr, str);
> > =20
> >  	return bptr;
>=20
> Oh.  And this one should be removed completely.  It is a reimplementati=
on
> of strdup() for system which lacks it.  This code should go, we don't b=
uild
> on such a system anyway and we always have g_strdup().  There's one mor=
e
> usage of strdup() in this file, btw.
>=20
> I'm sorry for being so picky, and you're already at v7, but heck.. We s=
hould
> be more active at reviewing patches :)
>=20
> Thanks,
>=20
> /mjt
>=20

