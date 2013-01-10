Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtCZo-00078Q-4G
	for mharc-qemu-trivial@gnu.org; Thu, 10 Jan 2013 02:29:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adam@os.inf.tu-dresden.de>) id 1TtCZj-0006v9-Vs
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2013 02:29:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <adam@os.inf.tu-dresden.de>) id 1TtCZi-0004tT-LN
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2013 02:29:19 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:34903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adam@os.inf.tu-dresden.de>)
	id 1TtCZe-0004sx-ST; Thu, 10 Jan 2013 02:29:15 -0500
Received: from erwin.inf.tu-dresden.de ([141.76.48.80]
	helo=os.inf.tu-dresden.de)
	by os.inf.tu-dresden.de with esmtps (TLSv1:DHE-RSA-AES128-SHA:128)
	(Exim 4.80.1) id 1TtCZc-0008OC-If; Thu, 10 Jan 2013 08:29:12 +0100
Date: Thu, 10 Jan 2013 08:29:07 +0100
From: Adam Lackorzynski <adam@os.inf.tu-dresden.de>
To: Julien Grall <julien.grall@citrix.com>
Message-ID: <20130110072907.GA6805@os.inf.tu-dresden.de>
References: <1357755022-3572-1-git-send-email-julien.grall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1357755022-3572-1-git-send-email-julien.grall@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 141.76.48.99
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/pc.c: Fix converting of
 ioport_register* to MemoryRegion
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
X-List-Received-Date: Thu, 10 Jan 2013 07:29:21 -0000

On Wed Jan 09, 2013 at 18:10:22 +0000, Julien Grall wrote:
> The commit 258711 introduced MemoryRegion to replace ioport_region*
> for ioport 80h and F0h.
> A MemoryRegion needs to have both read and write callback otherwise a segfault
> will occur when an access is made.
> 
> The previous behaviour of this both ioport is to return 0xffffffffffffffff.
> So keep this behaviour.

Thanks, confirmed.

> Reported-by: Adam Lackorzynski <adam@os.inf.tu-dresden.de>
> Signed-off-by: Julien Grall <julien.grall@citrix.com>

Tested-by: Adam Lackorzynski <adam@os.inf.tu-dresden.de>

> ---
>  hw/pc.c |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/pc.c b/hw/pc.c
> index df0c48e..90b1bf7 100644
> --- a/hw/pc.c
> +++ b/hw/pc.c
> @@ -103,6 +103,11 @@ static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
>  {
>  }
>  
> +static uint64_t ioport80_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0xffffffffffffffff;
> +}
> +
>  /* MSDOS compatibility mode FPU exception support */
>  static qemu_irq ferr_irq;
>  
> @@ -123,6 +128,11 @@ static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
>      qemu_irq_lower(ferr_irq);
>  }
>  
> +static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0xffffffffffffffff;
> +}
> +
>  /* TSC handling */
>  uint64_t cpu_get_tsc(CPUX86State *env)
>  {
> @@ -960,6 +970,7 @@ static void cpu_request_exit(void *opaque, int irq, int level)
>  
>  static const MemoryRegionOps ioport80_io_ops = {
>      .write = ioport80_write,
> +    .read = ioport80_read,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .impl = {
>          .min_access_size = 1,
> @@ -969,6 +980,7 @@ static const MemoryRegionOps ioport80_io_ops = {
>  
>  static const MemoryRegionOps ioportF0_io_ops = {
>      .write = ioportF0_write,
> +    .read = ioportF0_read,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .impl = {
>          .min_access_size = 1,
> -- 
> Julien Grall
> 

Adam
-- 
Adam                 adam@os.inf.tu-dresden.de
  Lackorzynski         http://os.inf.tu-dresden.de/~adam/

