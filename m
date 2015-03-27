Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YbQyQ-0006x4-Cf
	for mharc-qemu-trivial@gnu.org; Fri, 27 Mar 2015 05:54:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YbQyN-0006rp-0K
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 05:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YbQyL-0000tS-RY
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 05:54:38 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:35535 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YbQyG-0000sG-9t; Fri, 27 Mar 2015 05:54:32 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YbS3O-00012I-Uz; Fri, 27 Mar 2015 12:03:55 +0100
References: <5510B8C4.1050302@twiddle.net>
	<1427313048-26772-1-git-send-email-cota@braap.org>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
In-reply-to: <1427313048-26772-1-git-send-email-cota@braap.org>
Date: Fri, 27 Mar 2015 09:55:03 +0000
Message-ID: <87y4mibw94.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: optimise memory layout
	of TCGTemp
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
X-List-Received-Date: Fri, 27 Mar 2015 09:54:40 -0000


Emilio G. Cota <cota@braap.org> writes:

> This brings down the size of the struct from 56 to 32 bytes on 64-bit,
> and to 16 bytes on 32-bit.

Have you been able to measure any performance improvement with these new
structures? In theory, if aligned with cache lines, performance should
improve but real numbers would be nice.

>
> The appended adds macros to prevent us from mistakenly overflowing
> the bitfields when more elements are added to the corresponding
> enums/macros.

I can see the defines but I can't see any checks. Should we be able to
do a compile time check if TCG_TYPE_COUNT doesn't fit into
TCG_TYPE_NR_BITS?

>
> Note that reg/mem_reg need only 6 bits (for ia64) but for performance
> is probably better to align them to a byte address.
>
> Given that TCGTemp is used in large arrays this leads to a few KBs
> of savings. However, unpacking the bits takes additional code, so
> the net effect depends on the target (host is x86_64):
>
> Before:
> $ find . -name 'tcg.o' | xargs size
>    text    data     bss     dec     hex filename
>   41131   29800      88   71019   1156b ./aarch64-softmmu/tcg/tcg.o
>   37969   29416      96   67481   10799 ./x86_64-linux-user/tcg/tcg.o
>   39354   28816      96   68266   10aaa ./arm-linux-user/tcg/tcg.o
>   40802   29096      88   69986   11162 ./arm-softmmu/tcg/tcg.o
>   39417   29672      88   69177   10e39 ./x86_64-softmmu/tcg/tcg.o
>
> After:
> $ find . -name 'tcg.o' | xargs size
>    text    data     bss     dec     hex filename
>   41187   29800      88   71075   115a3 ./aarch64-softmmu/tcg/tcg.o
>   37777   29416      96   67289   106d9 ./x86_64-linux-user/tcg/tcg.o
>   39162   28816      96   68074   109ea ./arm-linux-user/tcg/tcg.o
>   40858   29096      88   70042   1119a ./arm-softmmu/tcg/tcg.o
>   39473   29672      88   69233   10e71 ./x86_64-softmmu/tcg/tcg.o
>
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Suggested-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  tcg/tcg.h | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index add7f75..71ae7b2 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -193,7 +193,7 @@ typedef struct TCGPool {
>  typedef enum TCGType {
>      TCG_TYPE_I32,
>      TCG_TYPE_I64,
> -    TCG_TYPE_COUNT, /* number of different types */
> +    TCG_TYPE_COUNT, /* number of different types, see TCG_TYPE_NR_BITS */
>  
>      /* An alias for the size of the host register.  */
>  #if TCG_TARGET_REG_BITS == 32
> @@ -217,6 +217,9 @@ typedef enum TCGType {
>  #endif
>  } TCGType;
>  
> +/* used for bitfield packing to save space */
> +#define TCG_TYPE_NR_BITS 1
> +
>  /* Constants for qemu_ld and qemu_st for the Memory Operation field.  */
>  typedef enum TCGMemOp {
>      MO_8     = 0,
> @@ -421,16 +424,14 @@ static inline TCGCond tcg_high_cond(TCGCond c)
>  #define TEMP_VAL_REG   1
>  #define TEMP_VAL_MEM   2
>  #define TEMP_VAL_CONST 3
> +#define TEMP_VAL_NR_BITS 2

A similar compile time check could be added here.

>  
> -/* XXX: optimize memory layout */
>  typedef struct TCGTemp {
> -    TCGType base_type;
> -    TCGType type;
> -    int val_type;
> -    int reg;
> -    tcg_target_long val;
> -    int mem_reg;
> -    intptr_t mem_offset;
> +    unsigned int reg:8;
> +    unsigned int mem_reg:8;
> +    unsigned int val_type:TEMP_VAL_NR_BITS;
> +    unsigned int base_type:TCG_TYPE_NR_BITS;
> +    unsigned int type:TCG_TYPE_NR_BITS;
>      unsigned int fixed_reg:1;
>      unsigned int mem_coherent:1;
>      unsigned int mem_allocated:1;
> @@ -438,6 +439,9 @@ typedef struct TCGTemp {
>                                    basic blocks. Otherwise, it is not
>                                    preserved across basic blocks. */
>      unsigned int temp_allocated:1; /* never used for code gen */
> +
> +    tcg_target_long val;
> +    intptr_t mem_offset;
>      const char *name;
>  } TCGTemp;

-- 
Alex Bennée

