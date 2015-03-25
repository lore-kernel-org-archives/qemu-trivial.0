Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yage3-0005Pl-KE
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 04:26:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1Yage0-0005Ma-Ph
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 04:26:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1Yagdz-0001xt-W5
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 04:26:32 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:58385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1Yagdu-0001wB-PO; Wed, 25 Mar 2015 04:26:26 -0400
Message-ID: <5512712C.5000206@mail.uni-paderborn.de>
Date: Wed, 25 Mar 2015 09:26:20 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1426945498-29777-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1426945498-29777-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.2.0.2453472, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2015.3.25.81822
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: mjt@tls.msk.ru, QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-tricore: Fix check
 which was always false
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
X-List-Received-Date: Wed, 25 Mar 2015 08:26:33 -0000

Hi mjt,

On 03/21/2015 02:44 PM, Stefan Weil wrote:
> With a mask value of 0x00400000, the result will never be 1.
> This fixes a Coverity warning.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   target-tricore/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> index 0e7b4e8..b7d18b2 100644
> --- a/target-tricore/op_helper.c
> +++ b/target-tricore/op_helper.c
> @@ -2593,7 +2593,7 @@ void helper_rslcx(CPUTriCoreState *env)
>           /* CSU trap */
>       }
>       /* if (PCXI.UL == 1) then trap(CTYP); */
> -    if ((env->PCXI & MASK_PCXI_UL) == 1) {
> +    if ((env->PCXI & MASK_PCXI_UL) != 0) {
>           /* CTYP trap */
>       }
>       /* EA = {PCXI.PCXS, 6'b0, PCXI.PCXO, 6'b0}; */

are you picking this one up? It looks good to me.

Cheers,
Bastian

