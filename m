Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3IW-0006BQ-P2
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1db3IU-000685-SW
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1db3IT-0007C5-SN
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:19:10 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:53176)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1db3IM-0006vA-Pw; Fri, 28 Jul 2017 07:19:02 -0400
Received: from aurel32 by hall.aurel32.net with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1db3ID-0006m3-4o; Fri, 28 Jul 2017 13:18:53 +0200
Date: Fri, 28 Jul 2017 13:18:53 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170728111853.llmfq5ayjp2j36sh@aurel32.net>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-30-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20170728053610.15770-30-f4bug@amsat.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [PATCH 29/47] MAINTAINERS: add missing SH-4 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 11:19:11 -0000

On 2017-07-28 02:35, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a0da13bcd..bb1cb1fc1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -235,6 +235,7 @@ F: target/sh4/
>  F: hw/sh4/
>  F: disas/sh4.c
>  F: include/hw/sh4/
> +F: default-configs/sh4*-softmmu.mak
> =20
>  SPARC
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

