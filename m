Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHsKX-0003Pv-Cy
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:32:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsKR-0003GH-0b
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:32:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsKM-0008Sr-Nl
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:32:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHsKD-0008Rd-Bx; Thu, 14 Aug 2014 06:32:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAV4pq020576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:31:04 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EAUxMQ012862; Thu, 14 Aug 2014 06:31:00 -0400
Date: Thu, 14 Aug 2014 12:31:37 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814103137.GF31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-7-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408001361-13580-7-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7EAV4pq020576
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 06/10] slirp/misc: Use g_malloc()
	instead of malloc()
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
X-List-Received-Date: Thu, 14 Aug 2014 10:32:23 -0000

On Thu, Aug 14, 2014 at 03:29:17PM +0800, zhanghailiang wrote:
> Here we don't check the return value of malloc() which may fail.
> Use the g_malloc() instead, which will abort the program when
> there is not enough memory.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>

OK, but then we need to find and replace free calls
as well.

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
> --=20
> 1.7.12.4
>=20

