Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVfXu-0001hM-Vv
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 06:06:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfXr-0001gD-UI
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfXp-0002A2-5n
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:06:23 -0400
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229]:51490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfXo-00029t-Ub
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:06:21 -0400
Received: by mail-bk0-f41.google.com with SMTP id i18so1695123bkv.0
	for <qemu-trivial@nongnu.org>; Fri, 26 Apr 2013 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nEVXfyE1vLLGqVdehATIV+X8o0seePdhI74Cxfo5m58=;
	b=M3XJIJz1eLISQDzUP9qoKy9/5rL1aYvJKRIm3Er1nkW4HaLfNHWmxFDlmbmXu8675N
	r/pOs3oed2dexBfVAu/zc8xRIqPVcEPjky3eTQQiD2suaL16UmRiXaA6il8iogVSCoty
	DRATktVhcEeVrPEXMjl/uH2YYqFM8yQOodfu7yJUYYcWHdvICWMu7L15jIEOpOUfz3vk
	tr8WQAVFNFm5Z843IvKokwH0B2lMSPr1S8lALCku9sgxS52aMXYkMzRRiajh2jARtchp
	T7+euRJ4/JTAlU7FhBB8MY0caMpZqtvzg7Bw9rqF25b/Kva6HRp341qfyzX01mGwvwEA
	bd2w==
X-Received: by 10.205.41.72 with SMTP id tt8mr18335039bkb.9.1366970779755;
	Fri, 26 Apr 2013 03:06:19 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id v6sm2897763bko.3.2013.04.26.03.06.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:06:18 -0700 (PDT)
Date: Fri, 26 Apr 2013 12:06:17 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Maksim Ratnikov <m.o.ratnikov@gmail.com>
Message-ID: <20130426100617.GC22315@stefanha-thinkpad.hitronhub.home>
References: <CAAWx3aQJh=nK5Tfi1nYTnREXzMRwOG6u4bUOd0Gx2n28OpG3pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAWx3aQJh=nK5Tfi1nYTnREXzMRwOG6u4bUOd0Gx2n28OpG3pg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::229
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] SMBUS module update.
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
X-List-Received-Date: Fri, 26 Apr 2013 10:06:25 -0000

On Thu, Apr 25, 2013 at 02:20:18AM +0400, Maksim Ratnikov wrote:
> Subject: [PATCH] SMBUS module update. Previous realization doesn't consider

Please choose a more specific commit message, "SMBUS module update" does
not say what this patch does.

> flags in the status register. In this patch processing of bits of DS and
> INTR of the register HST_STS is added. Mechanism of clearing bits value in
> the register HST_STS is updated. Error processing is updated: if DEV_ERR
> bit are set transaction isn't evaluated.
> Signed-off-by: Maksim Ratnikov <m.o.ratnikov@gmail.com>
> ---
>  hw/pm_smbus.c |   26 ++++++++++++++++++--------
>  1 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pm_smbus.c b/hw/pm_smbus.c
> index ea1380c..3a7b42d 100644
> --- a/hw/pm_smbus.c
> +++ b/hw/pm_smbus.c
> @@ -17,10 +17,10 @@
>   * License along with this library; if not, see
>   * <http://www.gnu.org/licenses/>.
>   */
> -#include "hw.h"
> -#include "pc.h"
> -#include "pm_smbus.h"
> -#include "smbus.h"
> +#include "hw/hw.h"
> +#include "hw/pc.h"
> +#include "hw/pm_smbus.h"
> +#include "hw/smbus.h"

Looks like this patch is against an outdated QEMU source tree.  Please
rebase onto qemu.git/master.

> 
>  /* no save/load? */
> 
> @@ -40,7 +40,6 @@
>  # define SMBUS_DPRINTF(format, ...)     do { } while (0)
>  #endif
> 
> -

Please do not make random whitespace changes.

>  static void smb_transaction(PMSMBus *s)
>  {
>      uint8_t prot = (s->smb_ctl >> 2) & 0x07;
> @@ -48,11 +47,16 @@ static void smb_transaction(PMSMBus *s)
>      uint8_t cmd = s->smb_cmd;
>      uint8_t addr = s->smb_addr >> 1;
>      i2c_bus *bus = s->smbus;
> -
> +
> +    if ( (s->smb_stat & 0x04) != 0) goto error;            // DEV_ERR
> evaluate
> +
> +
>      SMBUS_DPRINTF("SMBus trans addr=0x%02x prot=0x%02x\n", addr, prot);
>      switch(prot) {
>      case 0x0:
> -        smbus_quick_command(bus, addr, read);
> +        smbus_quick_command(bus, addr, read);
> +     s->smb_stat |= 0x82;            // set ByteDoneStatus = 1 (bit #7)
> and INTR = (bit #1)
> +

Indentation is off here.  Please use 4 spaces, see ./CODING_STYLE.

Line wrap is 80 characters, comments therefore usually look like this:

/* set ByteDoneStatus = 1 (bit #7) and INTR = (bit #1) */
s->smb_stat |= 0x82;

This particular comment suggests defining ByteDoneStatus and Intr
constants.  that way you don't need comments to explain the 0x82 magic
number.

> @@ -140,6 +149,7 @@ static uint64_t smb_ioport_readb(void *opaque, hwaddr
> addr, unsigned width)
>      switch(addr) {
>      case SMBHSTSTS:
>          val = s->smb_stat;
> +        //val = 0x1e;
>          break;
>      case SMBHSTCNT:
>          s->smb_index = 0;

Random commented out code that should be dropped?

