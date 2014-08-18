Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLGj-00031E-74
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLGc-0002rN-Nz
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLGY-0006iw-8D
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:38:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLGO-0006hg-QZ; Mon, 18 Aug 2014 07:38:13 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0831A437FE;
	Mon, 18 Aug 2014 15:38:12 +0400 (MSK)
Message-ID: <53F1E5A4.9060000@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:38:12 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: mst@redhat.com, qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	marcel.a@redhat.com, luonengjun@huawei.com, peter.huangpeng@huawei.com
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
X-List-Received-Date: Mon, 18 Aug 2014 11:38:31 -0000

18.08.2014 11:54, zhanghailiang wrote:
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

Applied to -trivial, with s/-1/1/.  No need to resend it again.

Thanks,

/mjt

>      fwrite(boot_sector, 1, sizeof boot_sector, f);
>      fclose(f);
> =20
>=20


