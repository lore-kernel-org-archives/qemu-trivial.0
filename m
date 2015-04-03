Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ydwjf-000678-1x
	for mharc-qemu-trivial@gnu.org; Fri, 03 Apr 2015 04:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ydwjc-00063b-DQ
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 04:13:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ydwjb-0002S3-8o
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 04:13:48 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:46981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YdwjV-0002Qm-LW; Fri, 03 Apr 2015 04:13:41 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E525211810A5; Fri,  3 Apr 2015 10:13:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id XHOyHmcn0UyH; Fri,  3 Apr 2015 10:13:37 +0200 (CEST)
Received: from [192.168.178.24] (p54AC87CE.dip0.t-ipconnect.de
	[84.172.135.206])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	0D5511180041; Fri,  3 Apr 2015 10:13:36 +0200 (CEST)
Message-ID: <551E4BB0.1090407@weilnetz.de>
Date: Fri, 03 Apr 2015 10:13:36 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>
References: <5518E291.6020708@weilnetz.de>
	<1428019673-920-1-git-send-email-cota@braap.org>
In-Reply-To: <1428019673-920-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Laurent Desnogues <laurent.desnogues@gmail.com>,
	=?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH v2] tcg: optimise memory layout of TCGTemp
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
X-List-Received-Date: Fri, 03 Apr 2015 08:13:49 -0000

Am 03.04.2015 um 02:07 schrieb Emilio G. Cota:
> This brings down the size of the struct from 56 to 32 bytes on 64-bit,
> and to 20 bytes on 32-bit. This leads to memory savings:
>
> Before:
> $ find . -name 'tcg.o' | xargs size
>     text    data     bss     dec     hex filename
>    41131   29800      88   71019   1156b ./aarch64-softmmu/tcg/tcg.o
>    37969   29416      96   67481   10799 ./x86_64-linux-user/tcg/tcg.o
>    39354   28816      96   68266   10aaa ./arm-linux-user/tcg/tcg.o
>    40802   29096      88   69986   11162 ./arm-softmmu/tcg/tcg.o
>    39417   29672      88   69177   10e39 ./x86_64-softmmu/tcg/tcg.o
>
> After:
> $ find . -name 'tcg.o' | xargs size
>     text    data     bss     dec     hex filename
>    40883   29800      88   70771   11473 ./aarch64-softmmu/tcg/tcg.o
>    37473   29416      96   66985   105a9 ./x86_64-linux-user/tcg/tcg.o
>    38858   28816      96   67770   108ba ./arm-linux-user/tcg/tcg.o
>    40554   29096      88   69738   1106a ./arm-softmmu/tcg/tcg.o
>    39169   29672      88   68929   10d41 ./x86_64-softmmu/tcg/tcg.o
>
> Note that using an entire byte for some enums that need less than
> that wastes a few bits (noticeable in 32 bits, where we use
> 20 bytes instead of 16) but avoids extraction code, which overall
> is a win--I've tested several variations of the patch, and the appended
> is the best performer for OpenSSL's bntest by a very small margin:
>
> Before:
> $ taskset -c 0 perf stat -r 15 -- x86_64-linux-user/qemu-x86_64 img/bntest-x86_64 >/dev/null
> [...]
>   Performance counter stats for 'x86_64-linux-user/qemu-x86_64 img/bntest-x86_64' (15 runs):
>
>        10538.479833 task-clock (msec)         #    0.999 CPUs utilized            ( +-  0.38% )
>                 772 context-switches          #    0.073 K/sec                    ( +-  2.03% )
>                   0 cpu-migrations            #    0.000 K/sec                    ( +-100.00% )
>               2,207 page-faults               #    0.209 K/sec                    ( +-  0.08% )
>        10.552871687 seconds time elapsed                                          ( +-  0.39% )
>
> After:
> $ taskset -c 0 perf stat -r 15 -- x86_64-linux-user/qemu-x86_64 img/bntest-x86_64 >/dev/null
>   Performance counter stats for 'x86_64-linux-user/qemu-x86_64 img/bntest-x86_64' (15 runs):
>
>        10459.968847 task-clock (msec)         #    0.999 CPUs utilized            ( +-  0.30% )
>                 739 context-switches          #    0.071 K/sec                    ( +-  1.71% )
>                   0 cpu-migrations            #    0.000 K/sec                    ( +- 68.14% )
>               2,204 page-faults               #    0.211 K/sec                    ( +-  0.10% )
>        10.473900411 seconds time elapsed                                          ( +-  0.30% )
>
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Suggested-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   tcg/tcg.h | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index add7f75..7f95132 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -417,20 +417,19 @@ static inline TCGCond tcg_high_cond(TCGCond c)
>       }
>   }
>   
> -#define TEMP_VAL_DEAD  0
> -#define TEMP_VAL_REG   1
> -#define TEMP_VAL_MEM   2
> -#define TEMP_VAL_CONST 3
> +typedef enum TCGTempVal {
> +    TEMP_VAL_DEAD,
> +    TEMP_VAL_REG,
> +    TEMP_VAL_MEM,
> +    TEMP_VAL_CONST,
> +} TCGTempVal;
>   
> -/* XXX: optimize memory layout */
>   typedef struct TCGTemp {
> -    TCGType base_type;
> -    TCGType type;
> -    int val_type;
> -    int reg;
> -    tcg_target_long val;
> -    int mem_reg;
> -    intptr_t mem_offset;
> +    unsigned int reg:8;
> +    unsigned int mem_reg:8;
> +    TCGTempVal val_type:8;
> +    TCGType base_type:8;
> +    TCGType type:8;
>       unsigned int fixed_reg:1;
>       unsigned int mem_coherent:1;
>       unsigned int mem_allocated:1;
> @@ -438,6 +437,9 @@ typedef struct TCGTemp {
>                                     basic blocks. Otherwise, it is not
>                                     preserved across basic blocks. */
>       unsigned int temp_allocated:1; /* never used for code gen */
> +
> +    tcg_target_long val;
> +    intptr_t mem_offset;
>       const char *name;
>   } TCGTemp;

Thanks for doing those tests. There are some smaller cosmetics which
might be changed, too (uint8_t for unsigned int with 8 bit, bool for
boolean bit values), but I think your patch is a real gain.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


