Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHsM4-0005Sg-O2
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:34:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsLz-0005Jc-7M
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsLu-0000XG-TI
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:33:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHsLl-0000VY-Rf; Thu, 14 Aug 2014 06:33:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAXH9K011797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:33:17 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EAXD0l018291; Thu, 14 Aug 2014 06:33:13 -0400
Date: Thu, 14 Aug 2014 12:33:50 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814103350.GH31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-10-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408001361-13580-10-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7EAXH9K011797
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 09/10] tcg: check return value of
	fopen()
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
X-List-Received-Date: Thu, 14 Aug 2014 10:33:59 -0000

On Thu, Aug 14, 2014 at 03:29:20PM +0800, zhanghailiang wrote:
> From: Li Liu <john.liuli@huawei.com>
>=20
> Give a warning message if fopen() failed to open the log file.
>=20
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Li Liu <john.liuli@huawei.com>
> ---
>  tcg/tcg.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index c068990..8f50d2a 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2406,6 +2406,10 @@ static void dump_op_count(void)
>      int i;
>      FILE *f;
>      f =3D fopen("/tmp/op.log", "w");
> +    if (f =3D=3D NULL) {

if (!f) please.

> +        fprintf(stderr, "Failed to open /tmp/op.log\n");

Maybe add "for writing. Logging op count will be disabled.".

> +        return;
> +    }
>      for(i =3D INDEX_op_end; i < NB_OPS; i++) {
>          fprintf(f, "%s %" PRId64 "\n", tcg_op_defs[i].name, tcg_table_=
op_count[i]);
>      }
> --=20
> 1.7.12.4
>=20

