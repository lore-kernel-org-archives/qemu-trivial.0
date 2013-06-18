Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8M-0002DI-8W
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uollz-000176-DT
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Uolly-0003bH-HN
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:35:55 -0400
Received: from [222.73.24.84] (port=41374 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Uollt-0003aX-Jr; Mon, 17 Jun 2013 22:35:50 -0400
X-IronPort-AV: E=Sophos;i="4.87,885,1363104000"; 
   d="scan'208";a="7583473"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 10:32:53 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I2ZlCN010723;
	Tue, 18 Jun 2013 10:35:47 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061810334532-2220463 ;
	Tue, 18 Jun 2013 10:33:45 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51B70B82.4000309@msgid.tls.msk.ru>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1370927720-4348-3-git-send-email-lig.fnst@cn.fujitsu.com>
	<51B70B82.4000309@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 10:33:37 +0800
Message-ID: <1371522817.31705.30.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 10:33:45,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 10:33:45,
	Serialize complete at 2013/06/18 10:33:45
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:16 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/5] qemu-char: pass bool
 parameter for qemu_opt_get_bool
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
X-List-Received-Date: Tue, 18 Jun 2013 02:35:56 -0000

=E5=9C=A8 2013-06-11=E4=BA=8C=E7=9A=84 15:35 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 11.06.2013 09:15, liguang wrote:
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  qemu-char.c |    8 ++++----
> >  1 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/qemu-char.c b/qemu-char.c
> > index d04b429..8092eb8 100644
> > --- a/qemu-char.c
> > +++ b/qemu-char.c
> > @@ -2767,10 +2767,10 @@ static CharDriverState *qemu_chr_open_socket(Qe=
muOpts *opts)
> >      int is_unix;
> >      int is_telnet;
> > =20
> > -    is_listen      =3D qemu_opt_get_bool(opts, "server", 0);
> > -    is_waitconnect =3D qemu_opt_get_bool(opts, "wait", 1);
> > -    is_telnet      =3D qemu_opt_get_bool(opts, "telnet", 0);
> > -    do_nodelay     =3D !qemu_opt_get_bool(opts, "delay", 1);
> > +    is_listen      =3D qemu_opt_get_bool(opts, "server", false);
> > +    is_waitconnect =3D qemu_opt_get_bool(opts, "wait", true);
> > +    is_telnet      =3D qemu_opt_get_bool(opts, "telnet", false);
> > +    do_nodelay     =3D !qemu_opt_get_bool(opts, "delay", true);
> >      is_unix        =3D qemu_opt_get(opts, "path") !=3D NULL;
> >      if (!is_listen)
> >          is_waitconnect =3D 0;
>=20
> While we're at it, all the is_* variables themselves should be made
> bool instead of int too.
>=20

right,

Thanks!



