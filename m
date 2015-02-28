Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YReOf-0000wb-Py
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:13:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YReOd-0000sa-VW
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:13:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YReOd-00017U-5d
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:13:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YReOX-00016e-S6; Sat, 28 Feb 2015 05:13:14 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D3BCC43EE1;
	Sat, 28 Feb 2015 13:13:11 +0300 (MSK)
Message-ID: <54F194B7.9080603@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 13:13:11 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 10:13:20 -0000

28.02.2015 13:08, arei.gonglei@huawei.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
> v2: fix compilation complaint. (mjt)
> ---
>  hw/ppc/e500.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7e17d18..c060b50 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -309,8 +309,10 @@ static int ppce500_load_device_tree(MachineState *=
machine,
> =20
>          fdt =3D load_device_tree(filename, &fdt_size);
>          if (!fdt) {
> +            g_free(filename);
>              goto out;
>          }
> +        g_free(filename);
>          goto done;
>      }


How about this?

--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -308,6 +308,7 @@ static int ppce500_load_device_tree(MachineState *mac=
hine,
         }

         fdt =3D load_device_tree(filename, &fdt_size);
+        g_free(filename);
         if (!fdt) {
             goto out;
         }

Thanks,

/mjt

