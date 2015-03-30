Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcZzj-00063N-A3
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2015 09:44:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1YcWQ6-0004qP-TU
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 05:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1YcWQ5-0000sx-TE
	for qemu-trivial@nongnu.org; Mon, 30 Mar 2015 05:55:46 -0400
Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c]:36351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1YcWQ2-0000qu-5V; Mon, 30 Mar 2015 05:55:42 -0400
Received: by obbps3 with SMTP id ps3so3783160obb.3;
	Mon, 30 Mar 2015 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=EDPNrEjox14OoLbRPU37gCuMYrmvez4f8bhbrcI+MqU=;
	b=wQYsQtF7Fw9td1GF1yqM3YJYkafbaWyGqc059ardVN8O6w/MncmvwL3vpQZzUtYtWl
	lskozBa/0xOr9nnkapEBGGIklvL2V4sMznWwK1E6rLdbBd/URIMaHcM7BR5D4nu8bCdi
	vfCd/Tk8esixxeJ4vm4uxtyzHBdYsnzc50ej4iTHqgCIBcxVLn5Wik3pjhGWUTRCRKdS
	T71PK6WgoD9Ng1vS2hNBnNkMMiFXk70zNsqGamXqxkmXe5v4z/5HV9hZDCortTCiz+6S
	1bZmeoCmoH/iZEEJbd/FH+4/lCrZd46vdhCpOvTuway2DW6OdKUBqI7nf7IPLQC4yBW0
	zL7A==
MIME-Version: 1.0
X-Received: by 10.182.87.74 with SMTP id v10mr25808677obz.50.1427709341300;
	Mon, 30 Mar 2015 02:55:41 -0700 (PDT)
Received: by 10.182.53.195 with HTTP; Mon, 30 Mar 2015 02:55:41 -0700 (PDT)
In-Reply-To: <20150327210932.GA17458@flamenco>
References: <55156FFE.9050806@twiddle.net> <87y4mibw94.fsf@linaro.org>
	<20150327210932.GA17458@flamenco>
Date: Mon, 30 Mar 2015 11:55:41 +0200
Message-ID: <CABoDooNJXw9gvASSuOwa7LY1Qr5KQu_naSy8e5JpDnfvH06n6w@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22c
X-Mailman-Approved-At: Mon, 30 Mar 2015 09:44:45 -0400
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
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
X-List-Received-Date: Mon, 30 Mar 2015 09:55:48 -0000

Hello,

On Fri, Mar 27, 2015 at 10:09 PM, Emilio G. Cota <cota@braap.org> wrote:
> On Fri, Mar 27, 2015 at 09:55:03 +0000, Alex Benn=C3=A9e wrote:
>> Have you been able to measure any performance improvement with these new
>> structures? In theory, if aligned with cache lines, performance should
>> improve but real numbers would be nice.
>
> I haven't benchmarked anything, which makes me very uneasy. All
> I've checked is that the system boots, and FWIW I appreciate no
> difference in boot time.
>
> Is there a benchmark suite to test TCG changes?
>
> Until proper benchmarking I wouldn't want to see this merged. For now I
> propose to merge the initial change (remove 8-byte hole in 64-bit),
> which is uncontroversial.

I tested the patch attached to your mail and saw no performance
difference on an ARM image booting Linux and then running
Sunspider with Google v8.  I also tested on one of the 176.gcc
inputs with QEMU ARM user mode and again saw no difference.

Thanks,

Laurent

>> > The appended adds macros to prevent us from mistakenly overflowing
>> > the bitfields when more elements are added to the corresponding
>> > enums/macros.
>>
>> I can see the defines but I can't see any checks. Should we be able to
>> do a compile time check if TCG_TYPE_COUNT doesn't fit into
>> TCG_TYPE_NR_BITS?
>
>> > +#define TEMP_VAL_NR_BITS 2
>>
>> A similar compile time check could be added here.
>
> Ack, addressed below.
>
> On Fri, Mar 27, 2015 at 07:58:06 -0700, Richard Henderson wrote:
>> On 03/25/2015 12:50 PM, Emilio G. Cota wrote:
>> > +#define TCG_TYPE_NR_BITS 1
>>
>> I'd rather you moved TCG_TYPE_COUNT out of the enum and into a define.  =
Perhaps
>> even as (1 << TCG_TYPE_NR_BITS).
> (snip)
>> > +#define TEMP_VAL_NR_BITS 2
>>
>> And make this an enumeration.
>>
>> >  typedef struct TCGTemp {
> (snip)
>> > +    unsigned int base_type:TCG_TYPE_NR_BITS;
>> > +    unsigned int type:TCG_TYPE_NR_BITS;
>>
>> And do *not* change these from the enumeration to an unsigned int.
>>
>> I know why you did this -- to keep the compiler from warning that the TC=
GType
>> enum didn't fit in the bitfield, because of TCG_TYPE_COUNT being an enum=
erator,
>> rather than an unrelated number.  Except that's exactly the warning we w=
ant to
>> keep, on the off-chance that someone modifies the enums without modifyin=
g the
>> _NR_BITS defines.
>
> Agreed, please see below.
>
> Thanks,
>
>                 E.
>
> [No signoff due to lack of provable perf improvement, see above.]
>
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index add7f75..afd3f94 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -193,7 +193,6 @@ typedef struct TCGPool {
>  typedef enum TCGType {
>      TCG_TYPE_I32,
>      TCG_TYPE_I64,
> -    TCG_TYPE_COUNT, /* number of different types */
>
>      /* An alias for the size of the host register.  */
>  #if TCG_TARGET_REG_BITS =3D=3D 32
> @@ -217,6 +216,10 @@ typedef enum TCGType {
>  #endif
>  } TCGType;
>
> +/* used for bitfield packing to save space */
> +#define TCG_TYPE_NR_BITS       1
> +#define TCG_TYPE_COUNT         BIT(TCG_TYPE_NR_BITS)
> +
>  /* Constants for qemu_ld and qemu_st for the Memory Operation field.  */
>  typedef enum TCGMemOp {
>      MO_8     =3D 0,
> @@ -417,20 +420,21 @@ static inline TCGCond tcg_high_cond(TCGCond c)
>      }
>  }
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
> +
> +#define TEMP_VAL_NR_BITS 2
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
> +    TCGTempVal val_type:TEMP_VAL_NR_BITS;
> +    TCGType base_type:TCG_TYPE_NR_BITS;
> +    TCGType type:TCG_TYPE_NR_BITS;
>      unsigned int fixed_reg:1;
>      unsigned int mem_coherent:1;
>      unsigned int mem_allocated:1;
> @@ -438,6 +442,9 @@ typedef struct TCGTemp {
>                                    basic blocks. Otherwise, it is not
>                                    preserved across basic blocks. */
>      unsigned int temp_allocated:1; /* never used for code gen */
> +
> +    tcg_target_long val;
> +    intptr_t mem_offset;
>      const char *name;
>  } TCGTemp;
>
>

