Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XK5sB-0002Y5-2z
	for mharc-qemu-trivial@gnu.org; Wed, 20 Aug 2014 09:24:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1XK5s4-0002Px-Ai
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 09:24:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1XK5rz-00007O-W9
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 09:24:12 -0400
Received: from lputeaux-656-01-25-125.w80-12.abo.wanadoo.fr
	([80.12.84.125]:39578 helo=paradis.irqsave.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1XK5rr-00006n-Hn; Wed, 20 Aug 2014 09:23:59 -0400
Received: from irqsave.net (laure.irqsave.net [192.168.77.2])
	by paradis.irqsave.net (Postfix) with ESMTP id A8EE5CE520;
	Wed, 20 Aug 2014 15:23:57 +0200 (CEST)
Date: Wed, 20 Aug 2014 15:23:10 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140820132308.GA30515@irqsave.net>
References: <1408437017-15648-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408437017-15648-1-git-send-email-zhang.zhanghailiang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 80.12.84.125
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, luonengjun@huawei.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v8] slirp/misc: Use the GLib
 memory allocation APIs
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
X-List-Received-Date: Wed, 20 Aug 2014 13:24:16 -0000

The Tuesday 19 Aug 2014 =E0 16:30:17 (+0800), zhanghailiang wrote :
> Here we don't check the return value of malloc() which may fail.
> Use the g_new() instead, which will abort the program when
> there is not enough memory.
>=20
> Also, use g_strdup instead of strdup and remove the unnecessary
> strdup function.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  slirp/misc.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/slirp/misc.c b/slirp/misc.c
> index b8eb74c..6543dc7 100644
> --- a/slirp/misc.c
> +++ b/slirp/misc.c
> @@ -54,11 +54,11 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, c=
har *exec,
>  	}
> =20
>  	tmp_ptr =3D *ex_ptr;
> -	*ex_ptr =3D (struct ex_list *)malloc(sizeof(struct ex_list));
> +	*ex_ptr =3D g_new(struct ex_list, 1);
>  	(*ex_ptr)->ex_fport =3D port;
>  	(*ex_ptr)->ex_addr =3D addr;
>  	(*ex_ptr)->ex_pty =3D do_pty;
> -	(*ex_ptr)->ex_exec =3D (do_pty =3D=3D 3) ? exec : strdup(exec);
> +	(*ex_ptr)->ex_exec =3D (do_pty =3D=3D 3) ? exec : g_strdup(exec);
>  	(*ex_ptr)->ex_next =3D tmp_ptr;
>  	return 0;
>  }
> @@ -187,7 +187,7 @@ fork_exec(struct socket *so, const char *ex, int do=
_pty)
>  			   bptr++;
>  			c =3D *bptr;
>  			*bptr++ =3D (char)0;
> -			argv[i++] =3D strdup(curarg);
> +			argv[i++] =3D g_strdup(curarg);
>  		   } while (c);
> =20
>                  argv[i] =3D NULL;
> @@ -228,20 +228,6 @@ fork_exec(struct socket *so, const char *ex, int d=
o_pty)
>  }
>  #endif
> =20
> -#ifndef HAVE_STRDUP
> -char *
> -strdup(str)
> -	const char *str;
> -{
> -	char *bptr;
> -
> -	bptr =3D (char *)malloc(strlen(str)+1);
> -	strcpy(bptr, str);
> -
> -	return bptr;
> -}
> -#endif
> -
>  void slirp_connection_info(Slirp *slirp, Monitor *mon)
>  {
>      const char * const tcpstates[] =3D {
> --=20
> 1.7.12.4
>=20
>=20
>=20
Reviewed-by: Beno=EEt Canet <benoit.canet@nodalink.com>

