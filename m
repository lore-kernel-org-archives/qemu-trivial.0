Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YaA7p-0002eA-EY
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2015 17:43:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YaA7j-0002Sy-37
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 17:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YaA7i-0007dT-92
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 17:43:03 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=51456
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YaA7Y-0007cA-T2; Mon, 23 Mar 2015 17:42:53 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	53EF911810A8; Mon, 23 Mar 2015 22:42:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1GdPoG6Hskab; Mon, 23 Mar 2015 22:42:39 +0100 (CET)
Received: from [192.168.178.24] (p54AC84F7.dip0.t-ipconnect.de
	[84.172.132.247])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A5ED01180041; Mon, 23 Mar 2015 22:42:39 +0100 (CET)
Message-ID: <551088CF.1050001@weilnetz.de>
Date: Mon, 23 Mar 2015 22:42:39 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1426919232-20813-1-git-send-email-cota@braap.org>
In-Reply-To: <1426919232-20813-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: pack TCGTemp to reduce
	size by 8 bytes
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
X-List-Received-Date: Mon, 23 Mar 2015 21:43:07 -0000

Am 21.03.2015 um 07:27 schrieb Emilio G. Cota:
> This brings down the size of the struct from 56 to 48 bytes.
>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   tcg/tcg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index add7f75..3276924 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -429,8 +429,8 @@ typedef struct TCGTemp {
>       int val_type;
>       int reg;
>       tcg_target_long val;
> -    int mem_reg;
>       intptr_t mem_offset;
> +    int mem_reg;
>       unsigned int fixed_reg:1;
>       unsigned int mem_coherent:1;
>       unsigned int mem_allocated:1;

Reviewed-by: Stefan Weil <sw@weilnetz.de>

TCGContext includes an array of TCGTemp, so it is even reduced by 4 KiB 
(good for caching),
and tcg.o now uses 55364 instead of 56116 bytes (maybe faster, too).

Further optimizations are possible. TCGTemp can be reduced to 32 bytes 
as the output
of pahole shows:

struct TCGTemp {
         TCGTempVal                 val_type:8; /*     0:24  4 */
         unsigned int               reg:8; /*     0:16  4 */
         unsigned int               mem_reg:8; /*     0: 8  4 */

         /* Bitfield combined with next fields */

         _Bool                      fixed_reg:1; /*     3: 7  1 */
         _Bool                      mem_coherent:1; /*     3: 6  1 */
         _Bool                      mem_allocated:1; /*     3: 5  1 */
         _Bool                      temp_local:1; /*     3: 4  1 */
         _Bool                      temp_allocated:1; /*     3: 3  1 */

         /* XXX 3 bits hole, try to pack */

         TCGType                    base_type:16; /*     4:16  4 */
         TCGType                    type:16; /*     4: 0  4 */
         tcg_target_long            val; /*     8     8 */
         intptr_t                   mem_offset; /*    16     8 */
         const char  *              name; /*    24     8 */

         /* size: 32, cachelines: 1, members: 13 */
         /* bit holes: 1, sum bit holes: 3 bits */
         /* last cacheline: 32 bytes */
};

Here I used a new enum type for val_type and reduced some values to 8 or 
16 bit.
I also put the two most often used values at the beginning, so they can be
addressed without or with a small offset ("often" in the code, no runtime
data available).

Are such optimizations useful?

Stefan


