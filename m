Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCLmm-0002H6-1a
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 02:55:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bCLmk-0002FD-3g
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 02:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bCLmi-0000rI-5V
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 02:55:45 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:39875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1bCLme-0000qR-KS; Mon, 13 Jun 2016 02:55:40 -0400
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <aurelien@aurel32.net>)
	id 1bCLmV-0004yo-W0; Mon, 13 Jun 2016 08:55:32 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.87)
	(envelope-from <aurelien@aurel32.net>)
	id 1bCLmN-0003Tj-Cd; Mon, 13 Jun 2016 08:55:23 +0200
Date: Mon, 13 Jun 2016 08:55:22 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org
Message-ID: <20160613065522.GA7847@aurel32.net>
References: <1465575021-3774-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465575021-3774-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [PATCH] hw/sh4/sh_pci.c: Use ldl_le_p() and
 stl_le_p()
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
X-List-Received-Date: Mon, 13 Jun 2016 06:55:47 -0000

On 2016-06-10 17:10, Peter Maydell wrote:
> Use ldl_le_p() and stl_le_p() instead of le32_to_cpup() and
> cpu_to_le32w(); the former handle misaligned addresses and don't
> need casts, and the latter are deprecated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sh4/sh_pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index e820a32..1747628 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -55,7 +55,7 @@ static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
>  
>      switch(addr) {
>      case 0 ... 0xfc:
> -        cpu_to_le32w((uint32_t*)(pcic->dev->config + addr), val);
> +        stl_le_p(pcic->dev->config + addr, val);
>          break;
>      case 0x1c0:
>          pcic->par = val;
> @@ -85,7 +85,7 @@ static uint64_t sh_pci_reg_read (void *p, hwaddr addr,
>  
>      switch(addr) {
>      case 0 ... 0xfc:
> -        return le32_to_cpup((uint32_t*)(pcic->dev->config + addr));
> +        return ldl_le_p(pcic->dev->config + addr);
>      case 0x1c0:
>          return pcic->par;
>      case 0x1c4:

Thanks for the patch. I confirm it builds and works fine.

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

