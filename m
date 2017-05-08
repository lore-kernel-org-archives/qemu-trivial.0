Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sV0-0000E4-F8
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:55:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1d7sUy-0000Ba-5R
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:55:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1d7sUx-0000ap-Ba
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:55:28 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:60790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1d7sUv-0000aE-7X; Mon, 08 May 2017 19:55:25 -0400
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1d7sUs-0001Yj-Mh; Tue, 09 May 2017 01:55:22 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1d7sUq-0004O1-17; Tue, 09 May 2017 01:55:20 +0200
Date: Tue, 9 May 2017 01:55:20 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>
Message-ID: <20170508235520.clhgs5erpofurtlt@aurel32.net>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20170508233918.9043-6-f4bug@amsat.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/11] hw/mips: add missing
 include
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
X-List-Received-Date: Mon, 08 May 2017 23:55:29 -0000

On 2017-05-08 20:39, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  include/hw/mips/mips.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
> index e0065ce808..16412dc150 100644
> --- a/include/hw/mips/mips.h
> +++ b/include/hw/mips/mips.h
> @@ -6,6 +6,7 @@
>  #define INITRD_PAGE_MASK (~((1 << 16) - 1))
> =20
>  #include "exec/memory.h"
> +#include "hw/irq.h"
> =20
>  /* gt64xxx.c */
>  PCIBus *gt64120_register(qemu_irq *pic);

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

