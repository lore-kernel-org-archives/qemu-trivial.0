Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtbKn-0003V1-Fy
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 07:32:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtbKh-0003Op-MH
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 07:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtbKc-0000Gz-Sk
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 07:32:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WtbKS-0000D9-SS; Sun, 08 Jun 2014 07:32:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1776840DD7;
	Sun,  8 Jun 2014 15:31:59 +0400 (MSK)
Message-ID: <539449AE.4090909@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 15:31:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1402159924-13853-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1402159924-13853-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/net/eepro100: Implement read-only
 bits in MDI registers
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
X-List-Received-Date: Sun, 08 Jun 2014 11:32:20 -0000

07.06.2014 20:52, Peter Maydell wrote:
> Although we defined an eepro100_mdi_mask[] array indicating which bits
> in the registers are read-only, we weren't actually doing anything with
> it. Make the MDI register-read code use it rather than manually making
> registers 2 and 3 totally read-only and the rest totally read-write.

s/register-read/register-write/ -- can be fixed when applying.

I'm not sure this is "trivial enough", because the side effect is
not obvious, at least not to someone not familiar with eepro100
registers and their usage.

Besides, the description does not seem to be very accurate too.
From the code I see that the original code makes register 0
"semi-writable", register 1 is unwritable and the rest fully
writable.

In this context, apparently we're losing the ability to write to
register 0 completely, since its mask is 0 but the original code
allows writing something to it.

Also, maybe updating the "missing()" calls according to the
bitmask is a good idea...

Thanks,

/mjt

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This seemed a better fix for the unused variable than just deleting it...
> 
>  hw/net/eepro100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index 3b891ca..9c70cce 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -1217,7 +1217,6 @@ static void eepro100_write_mdi(EEPRO100State *s)
>                  break;
>              case 1:            /* Status Register */
>                  missing("not writable");
> -                data = s->mdimem[reg];
>                  break;
>              case 2:            /* PHY Identification Register (Word 1) */
>              case 3:            /* PHY Identification Register (Word 2) */
> @@ -1230,7 +1229,8 @@ static void eepro100_write_mdi(EEPRO100State *s)
>              default:
>                  missing("not implemented");
>              }
> -            s->mdimem[reg] = data;
> +            s->mdimem[reg] &= eepro100_mdi_mask[reg];
> +            s->mdimem[reg] |= data & ~eepro100_mdi_mask[reg];
>          } else if (opcode == 2) {
>              /* MDI read */
>              switch (reg) {
> 


