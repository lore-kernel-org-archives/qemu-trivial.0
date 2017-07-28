Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db1z1-0000g6-0O
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 05:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1db1yy-0000cb-8e
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:54:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1db1yx-0007sR-Ei
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:54:56 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:60045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>)
	id 1db1yt-0007kx-Kn; Fri, 28 Jul 2017 05:54:51 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 2C2502DD4F1E9;
	Fri, 28 Jul 2017 10:54:38 +0100 (IST)
Received: from [192.168.169.52] (192.168.169.52) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 28 Jul 2017 10:54:41 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Aurelien Jarno
	<aurelien@aurel32.net>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-26-f4bug@amsat.org>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
From: Yongbok Kim <yongbok.kim@imgtec.com>
Message-ID: <635b7f27-cf61-61b8-b363-255578c54547@imgtec.com>
Date: Fri, 28 Jul 2017 10:54:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-26-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [192.168.169.52]
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-trivial] [PATCH 25/47] MAINTAINERS: add missing MIPS entry
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
X-List-Received-Date: Fri, 28 Jul 2017 09:54:58 -0000



On 28/07/2017 06:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa6b0d189a..7354afb9f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -182,6 +182,7 @@ F: include/hw/intc/mips_gic.h
>  F: include/hw/timer/mips_gictimer.h
>  F: tests/tcg/mips/
>  F: disas/mips.c
> +F: default-configs/mips*-softmmu.mak
> =20
>  Moxie
>  M: Anthony Green <green@moxielogic.com>
>=20

Acked-by: Yongbok Kim <yongbok.kim@imgtec.com>

Regards,
Yongbok

