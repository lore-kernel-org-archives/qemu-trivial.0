Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZRRJH-00033m-N4
	for mharc-qemu-trivial@gnu.org; Mon, 17 Aug 2015 16:47:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZRRJ9-0002vP-Pa
	for qemu-trivial@nongnu.org; Mon, 17 Aug 2015 16:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZRRJ8-0007ci-Nh
	for qemu-trivial@nongnu.org; Mon, 17 Aug 2015 16:47:03 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:34979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZRRJ6-0007bT-EG; Mon, 17 Aug 2015 16:47:00 -0400
Received: from [2001:7c0:dc15:72:2db:dfff:fe14:52d] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZRRJ5-0003tA-1h; Mon, 17 Aug 2015 22:46:59 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZRRJ3-0005M2-Ii; Mon, 17 Aug 2015 22:46:57 +0200
Date: Mon, 17 Aug 2015 22:46:57 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20150817204657.GB20321@aurel32.net>
Mail-Followup-To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, qemu-trivial@nongnu.org
References: <1439389236-22158-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439389236-22158-1-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sh4: Fix initramfs initialization for
 endiannes-mismatched targets
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
X-List-Received-Date: Mon, 17 Aug 2015 20:47:06 -0000

On 2015-08-12 07:20, Guenter Roeck wrote:
> If host and target endianness does not match, loding an initramfs does not work.
> Fix by writing boot parameters with appropriate endianness conversion.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/sh4/r2d.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 5e22ed7..3b0b2ec 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -338,9 +338,9 @@ static void r2d_init(MachineState *machine)
>          }
>  
>          /* initialization which should be done by firmware */
> -        boot_params.loader_type = 1;
> -        boot_params.initrd_start = INITRD_LOAD_OFFSET;
> -        boot_params.initrd_size = initrd_size;
> +        boot_params.loader_type = tswap32(1);
> +        boot_params.initrd_start = tswap32(INITRD_LOAD_OFFSET);
> +        boot_params.initrd_size = tswap32(initrd_size);
>      }
>  
>      if (kernel_cmdline) {

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Good catch. I have added it to my sh4-next queue:

http://git.aurel32.net/?p=qemu.git;a=shortlog;h=refs/heads/sh4-next

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

