Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpSff-00086M-5l
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 20:24:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UpSfb-000850-8a
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 20:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UpSfa-0000sA-0a
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 20:24:11 -0400
Received: from [222.73.24.84] (port=4992 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UpSfZ-0000qe-Lo; Wed, 19 Jun 2013 20:24:09 -0400
X-IronPort-AV: E=Sophos;i="4.87,900,1363104000"; 
   d="scan'208";a="7608145"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 20 Jun 2013 08:21:08 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5K0O2bb024488;
	Thu, 20 Jun 2013 08:24:02 +0800
Received: from [10.167.233.147] ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013062008225719-2310815 ;
	Thu, 20 Jun 2013 08:22:57 +0800 
From: li guang <lig.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51C16BB0.7070206@msgid.tls.msk.ru>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1371527137-16949-3-git-send-email-lig.fnst@cn.fujitsu.com>
	<51C16BB0.7070206@msgid.tls.msk.ru>
Date: Thu, 20 Jun 2013 08:21:39 +0800
Message-ID: <1371687699.31705.60.camel@liguang.fnst.cn.fujitsu.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/20 08:22:57,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/20 08:22:57,
	Serialize complete at 2013/06/20 08:22:57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 3/5] qemu-char: use bool in
 qemu_chr_open_socket
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
X-List-Received-Date: Thu, 20 Jun 2013 00:24:13 -0000

=E5=9C=A8 2013-06-19=E4=B8=89=E7=9A=84 12:28 +0400=EF=BC=8CMichael Tokarev=
=E5=86=99=E9=81=93=EF=BC=9A
> 18.06.2013 07:45, liguang wrote:
> > local variables is_* should be bool by usage,
> > and last parameter of qemu_opt_get_bool is bool,
> > so pass true/false for it.
> >=20
> > Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> > ---
> >  qemu-char.c |   20 ++++++++++----------
> >  1 files changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/qemu-char.c b/qemu-char.c
> > index 2c3cfe6..0d695e0 100644
> > --- a/qemu-char.c
> > +++ b/qemu-char.c
> > @@ -2679,16 +2679,16 @@ static CharDriverState *qemu_chr_open_socket(Qe=
muOpts *opts)
> >      CharDriverState *chr =3D NULL;
> >      Error *local_err =3D NULL;
> >      int fd =3D -1;
> > -    int is_listen;
> > -    int is_waitconnect;
> > -    int do_nodelay;
> > -    int is_unix;
> > -    int is_telnet;
> > -
> > -    is_listen      =3D qemu_opt_get_bool(opts, "server", 0);
> > -    is_waitconnect =3D qemu_opt_get_bool(opts, "wait", 1);
> > -    is_telnet      =3D qemu_opt_get_bool(opts, "telnet", 0);
> > -    do_nodelay     =3D !qemu_opt_get_bool(opts, "delay", 1);
> > +    bool is_listen;
> > +    bool is_waitconnect;
> > +    bool do_nodelay;
> > +    bool is_unix;
> > +    bool is_telnet;
> > +
> > +    is_listen      =3D qemu_opt_get_bool(opts, "server", false);
> > +    is_waitconnect =3D qemu_opt_get_bool(opts, "wait", true);
> > +    is_telnet      =3D qemu_opt_get_bool(opts, "telnet", false);
> > +    do_nodelay     =3D !qemu_opt_get_bool(opts, "delay", true);
> >      is_unix        =3D qemu_opt_get(opts, "path") !=3D NULL;
> >      if (!is_listen)
> >          is_waitconnect =3D 0;
>=20
> So is is_waitconnect a booleand or integer? :)

Oh, I'm so lazy to find more...
following is fine for me.

Thanks!

>=20
> How about this (I'm unsure about the author anymore ):
>=20
> commit c5b775f85f5049d7315b8f8643a65ea1cc7107eb
> Author: liguang <lig.fnst@cn.fujitsu.com>
> Date:   Tue Jun 18 11:45:35 2013 +0800
>=20
>     qemu-char: use bool in qemu_chr_open_socket and simplify code a bit
>=20
>     Local variables is_* should be bool by usage.
>     While at it, simplify the logic/code a bit.
>=20
>     Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>     Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>=20
> diff --git a/qemu-char.c b/qemu-char.c
> index 2c3cfe6..a030e6b 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2679,19 +2679,12 @@ static CharDriverState *qemu_chr_open_socket(Qemu=
Opts *opts)
>      CharDriverState *chr =3D NULL;
>      Error *local_err =3D NULL;
>      int fd =3D -1;
> -    int is_listen;
> -    int is_waitconnect;
> -    int do_nodelay;
> -    int is_unix;
> -    int is_telnet;
> -
> -    is_listen      =3D qemu_opt_get_bool(opts, "server", 0);
> -    is_waitconnect =3D qemu_opt_get_bool(opts, "wait", 1);
> -    is_telnet      =3D qemu_opt_get_bool(opts, "telnet", 0);
> -    do_nodelay     =3D !qemu_opt_get_bool(opts, "delay", 1);
> -    is_unix        =3D qemu_opt_get(opts, "path") !=3D NULL;
> -    if (!is_listen)
> -        is_waitconnect =3D 0;
> +
> +    bool is_listen      =3D qemu_opt_get_bool(opts, "server", false);
> +    bool is_waitconnect =3D is_listen && qemu_opt_get_bool(opts, "wait",=
 true);
> +    bool is_telnet      =3D qemu_opt_get_bool(opts, "telnet", false);
> +    bool do_nodelay     =3D !qemu_opt_get_bool(opts, "delay", true);
> +    bool is_unix        =3D qemu_opt_get(opts, "path") !=3D NULL;
>=20
>      if (is_unix) {
>          if (is_listen) {
>=20



