Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHsLS-0004hX-R0
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsLM-0004Y4-NY
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsLH-0000L4-QC
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:33:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHsL9-0000Hn-0m; Thu, 14 Aug 2014 06:33:03 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAVwxr017409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:31:59 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EAVshU009497; Thu, 14 Aug 2014 06:31:54 -0400
Date: Thu, 14 Aug 2014 12:32:31 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814103231.GG31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-9-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408001361-13580-9-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7EAVwxr017409
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 08/10] tests/bios-tables-test: check
 the value returned by fopen()
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
X-List-Received-Date: Thu, 14 Aug 2014 10:33:21 -0000

On Thu, Aug 14, 2014 at 03:29:19PM +0800, zhanghailiang wrote:
> The function fopen() may fail, so check its return value.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Li Liu <john.liuli@huawei.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  tests/bios-tables-test.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 045eb27..28ec28d 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
>      const char *arch =3D qtest_get_arch();
>      FILE *f =3D fopen(disk, "w");
>      int ret;
> +
> +    if (f =3D=3D NULL) {

if (!f) please

> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(err=
no));
> +        return -1;
> +    }
>      fwrite(boot_sector, 1, sizeof boot_sector, f);
>      fclose(f);
> =20
> --=20
> 1.7.12.4
>=20

