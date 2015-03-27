Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YbViI-0003MM-OK
	for mharc-qemu-trivial@gnu.org; Fri, 27 Mar 2015 10:58:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1YbViF-0003MD-NO
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 10:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1YbVi8-0000VC-Ao
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 10:58:19 -0400
Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e]:36042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1YbVi8-0000TC-5g; Fri, 27 Mar 2015 10:58:12 -0400
Received: by qgf60 with SMTP id 60so117350698qgf.3;
	Fri, 27 Mar 2015 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MLz2/xcQVIYsuzlLLPY+Zp2a4D2XzqY5lDdzWzxurkM=;
	b=ise31tlDO3LgVTs16j5MA9z9MuFgY+60/fNI8vLb1Wr5JYs4wjPJ1osBPT9+JTmmEo
	H5Ls4srTLeTJ3ozTeCILdRxclBy6hyLif9YzLYiOjwK7UIjmYCLThyz0/Nnfr/LOr29N
	qvA4+vbTLO1pMMob7X3uNH8ucYDMwicFg9Va8JHOUNmvpdVaCYNPq9bFyZ2+DdAPyssi
	v2YQNSF8kBvY2+70jSxykRrfrfk0G0MKVJgK/vaK6RIGXWIk0wXmRlupYrUMQu2aC/tn
	axkR403hsNJL3igTmjLhjHtAYwU7z3U28Bgn6faxO4VCfsN4iRy4h47icSlamP3iz8Ul
	HCTw==
X-Received: by 10.140.96.165 with SMTP id k34mr23905687qge.79.1427468290804;
	Fri, 27 Mar 2015 07:58:10 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	o186sm1606723qhb.10.2015.03.27.07.58.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2015 07:58:09 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <55156FFE.9050806@twiddle.net>
Date: Fri, 27 Mar 2015 07:58:06 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, Stefan Weil <sw@weilnetz.de>
References: <5510B8C4.1050302@twiddle.net>
	<1427313048-26772-1-git-send-email-cota@braap.org>
In-Reply-To: <1427313048-26772-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg: optimise memory layout of TCGTemp
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
X-List-Received-Date: Fri, 27 Mar 2015 14:58:20 -0000

On 03/25/2015 12:50 PM, Emilio G. Cota wrote:
> This brings down the size of the struct from 56 to 32 bytes on 64-bit,
> and to 16 bytes on 32-bit.
> 
> The appended adds macros to prevent us from mistakenly overflowing
> the bitfields when more elements are added to the corresponding
> enums/macros.
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

I'd rather you moved TCG_TYPE_COUNT out of the enum and into a define.  Perhaps
even as (1 << TCG_TYPE_NR_BITS).

> @@ -421,16 +424,14 @@ static inline TCGCond tcg_high_cond(TCGCond c)
>  #define TEMP_VAL_REG   1
>  #define TEMP_VAL_MEM   2
>  #define TEMP_VAL_CONST 3
> +#define TEMP_VAL_NR_BITS 2

And make this an enumeration.

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

And do *not* change these from the enumeration to an unsigned int.

I know why you did this -- to keep the compiler from warning that the TCGType
enum didn't fit in the bitfield, because of TCG_TYPE_COUNT being an enumerator,
rather than an unrelated number.  Except that's exactly the warning we want to
keep, on the off-chance that someone modifies the enums without modifying the
_NR_BITS defines.


r~

