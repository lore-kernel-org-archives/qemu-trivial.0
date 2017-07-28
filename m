Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3hG-0001td-Fa
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:44:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3hE-0001mD-7I
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3hD-0008Do-Ha
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:44:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1db3h5-0008A3-VI; Fri, 28 Jul 2017 07:44:36 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6FF9F4283F;
	Fri, 28 Jul 2017 14:44:32 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 7CCBA5E0;
	Fri, 28 Jul 2017 14:44:30 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-20-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <78b454a6-b0a4-8cfe-8a4d-9b5207f03faa@msgid.tls.msk.ru>
Date: Fri, 28 Jul 2017 14:44:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 20/20] i2c/exynos4210: fix
 write to I2CADD register, bit 0 is not mapped
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 11:44:45 -0000

27.07.2017 05:42, Philippe Mathieu-Daud=C3=A9 wrote:
> From the Exynos4210 User Manual [1]:
>=20
> 14.4.1.3 I2CADDn (MULTI-MASTER I2C-Bus Address Register)
>   [7-1] slave address, latched from the I2C-bus.
>   bit [0] is not mapped.
>=20
> [1]: Exynos_4_Dual_45nm_User_Manaul_Public_REV1.00-0.pdf

Okay, so what happens when one writes to bit0?

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i2c/exynos4210_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
> index c96fa7d7be..e6a9ca8f03 100644
> --- a/hw/i2c/exynos4210_i2c.c
> +++ b/hw/i2c/exynos4210_i2c.c
> @@ -243,7 +243,7 @@ static void exynos4210_i2c_write(void *opaque, hwad=
dr offset,
>          break;
>      case I2CADD_ADDR:
>          if ((s->i2cstat & I2CSTAT_OUTPUT_EN) =3D=3D 0) {
> -            s->i2cadd =3D v;
> +            s->i2cadd =3D v & ~1;

Maybe a comment is a good idea here, saying that bit0 is unmapped.

Thanks,

/mjt

