Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJJ16-0000LJ-5B
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 05:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1XJJ10-0000AE-90
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 05:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1XJJ0w-0005ki-0L
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 05:14:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>)
	id 1XJJ0m-0005il-D2; Mon, 18 Aug 2014 05:13:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7I9DiT0021315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 05:13:45 -0400
Received: from [10.36.7.68] (vpn1-7-68.ams2.redhat.com [10.36.7.68])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7I9Dfte026211; Mon, 18 Aug 2014 05:13:42 -0400
Message-ID: <1408353202.4964.2.camel@localhost.localdomain>
From: Marcel Apfelbaum <marcel.a@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Date: Mon, 18 Aug 2014 12:13:22 +0300
In-Reply-To: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7I9DiT0021315
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: mst@redhat.com, qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v7] tests/bios-tables-test: check the
 value returned by fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 09:14:14 -0000

On Mon, 2014-08-18 at 15:54 +0800, zhanghailiang wrote:
> The function fopen() may fail, so check its return value.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Li Liu <john.liuli@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/bios-tables-test.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 045eb27..feb3b58 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
>      const char *arch =3D qtest_get_arch();
>      FILE *f =3D fopen(disk, "w");
>      int ret;
> +
> +    if (!f) {
> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(err=
no));
> +        return -1;
> +    }
Hi,
I think we should use an assert here, we need an indication
that the test failed and a print to stderr is not enough.

Thanks,
Marcel
>      fwrite(boot_sector, 1, sizeof boot_sector, f);
>      fclose(f);
> =20




