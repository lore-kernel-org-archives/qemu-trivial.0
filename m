Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDBGa-0008Nu-8K
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 10:58:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDBGY-0008MF-IZ
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDBGX-0005CF-OZ
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 10:58:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDBGS-0004wm-1r; Tue, 23 May 2017 10:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32C33418EB;
	Tue, 23 May 2017 17:58:23 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1D033437;
	Tue, 23 May 2017 17:58:23 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-7-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <79598bed-714f-7c3b-a806-3bf1a4968fd2@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 17:58:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 06/11] hw/arm: removed unnecessary include
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
X-List-Received-Date: Tue, 23 May 2017 14:58:31 -0000

09.05.2017 02:39, Philippe Mathieu-Daud=C3=A9 wrote:
> "exec/memory.h" already includes it.

I think this sort of include cleanups isn't really necessary.
For a regular include file, it's better to include it if the
.c file in question uses definitions from there, no matter if
other .h files include that header already or not.

Thanks,

/mjt

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/arm.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index a3f79d3379..b9c11d3fb8 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -14,7 +14,6 @@
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
>  #include "hw/irq.h"
> -#include "qemu/notify.h"
> =20
>  typedef enum {
>      ARM_ENDIANNESS_UNKNOWN =3D 0,
>=20


