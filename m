Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLB5-0001sW-5j
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:32:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLAz-0001hm-BD
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLAu-0004pf-Sd
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:32:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLAk-0004nI-Kl; Mon, 18 Aug 2014 07:32:22 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 12108437EC;
	Mon, 18 Aug 2014 15:32:21 +0400 (MSK)
Message-ID: <53F1E445.1060301@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:32:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408348310-6628-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408348310-6628-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, jan.kiszka@siemens.com, luonengjun@huawei.com,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v7] slirp/misc: Use g_malloc() instead of
 malloc()
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
X-List-Received-Date: Mon, 18 Aug 2014 11:32:41 -0000

18.08.2014 11:51, zhanghailiang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Here we don't check the return value of malloc() which may fail.
> Use the g_malloc() instead, which will abort the program when
> there is not enough memory.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  slirp/misc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/slirp/misc.c b/slirp/misc.c
> index b8eb74c..f7fe497 100644
> --- a/slirp/misc.c
> +++ b/slirp/misc.c
> @@ -54,7 +54,7 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, cha=
r *exec,
>  	}
> =20
>  	tmp_ptr =3D *ex_ptr;
> -	*ex_ptr =3D (struct ex_list *)malloc(sizeof(struct ex_list));
> +	*ex_ptr =3D (struct ex_list *)g_malloc(sizeof(struct ex_list));

There's a convinient macro in glib, g_new(typename, numelts).  Also
there's a less commonly used g_renew() which is like realloc, but it
is not applicable here.

>  	(*ex_ptr)->ex_fport =3D port;
>  	(*ex_ptr)->ex_addr =3D addr;
>  	(*ex_ptr)->ex_pty =3D do_pty;
> @@ -235,7 +235,7 @@ strdup(str)
>  {
>  	char *bptr;
> =20
> -	bptr =3D (char *)malloc(strlen(str)+1);
> +	bptr =3D (char *)g_malloc(strlen(str)+1);
>  	strcpy(bptr, str);
> =20
>  	return bptr;

Oh.  And this one should be removed completely.  It is a reimplementation
of strdup() for system which lacks it.  This code should go, we don't bui=
ld
on such a system anyway and we always have g_strdup().  There's one more
usage of strdup() in this file, btw.

I'm sorry for being so picky, and you're already at v7, but heck.. We sho=
uld
be more active at reviewing patches :)

Thanks,

/mjt

