Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UbzRa-0001k3-Hh
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2013 16:34:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1UbzRX-0001gi-8o
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 16:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1UbzRW-0001pT-6Z
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 16:33:59 -0400
Received: from mail-oa0-f45.google.com ([209.85.219.45]:38851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1UbzRR-0001oS-OP; Mon, 13 May 2013 16:33:53 -0400
Received: by mail-oa0-f45.google.com with SMTP id j6so7130572oag.18
	for <multiple recipients>; Mon, 13 May 2013 13:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=WsWJ1+Au8P/vBO0DCB477edxAqBwUb1YxVM76QTZ9N4=;
	b=tSJIlU4ZtwAQT7G9wg6ZCACLnE4DpJ9UXcjLF8Gy6LlIBv5v+8ZdLtWIVrSj6lhv9C
	65VBypru6hZSBRZd+LUY9fICnC8NaQOIDEMFzs9DCHlYZ1NAr65gdGxg9/68YXOfbPSQ
	SBjHxcs6QAaP7Z6r89pmh8GPdLN2jU2O2K5wH1RDzWBLGVyH5Q+QpV3Ggjm1+omz1pps
	D1Y4XjZM/JZev9xMvYNajCzzXqTQ2ojuC/ylE+b/SafrPRa/NyhZW11nnVVkILXFSf9K
	sz8UZa1tN3EnyLT2ZfzuTLeSQDfeJJC/CysKscvn6sgpN1mGPGaJBEsaAsggCevE+mmA
	nw3w==
MIME-Version: 1.0
X-Received: by 10.60.92.41 with SMTP id cj9mr13969721oeb.31.1368477232116;
	Mon, 13 May 2013 13:33:52 -0700 (PDT)
Received: by 10.76.9.194 with HTTP; Mon, 13 May 2013 13:33:52 -0700 (PDT)
In-Reply-To: <1368475464-3116-1-git-send-email-green@moxielogic.com>
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
Date: Tue, 14 May 2013 00:33:52 +0400
Message-ID: <CAMo8BfJiF3YkzxhRZXsSnh7BsGMMMLzis__OhDvfEEpH_fFPCQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: Anthony Green <green@moxielogic.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH moxie] Fix bug in tlb_fill.
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
X-List-Received-Date: Mon, 13 May 2013 20:34:00 -0000

On Tue, May 14, 2013 at 12:04 AM, Anthony Green <green@moxielogic.com> wrote:
> Fix a simple bug in tlb_fill for moxie.  The port was mostly working
> before, which is why I only really noticed it recently.  Thanks to
> @jcmvbkbc for tracking it down.
>
> Signed-off-by: Anthony Green <green@moxielogic.com>
> ---
>  target-moxie/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-moxie/helper.c b/target-moxie/helper.c
> index 6e0ac2a..6c36c49 100644
> --- a/target-moxie/helper.c
> +++ b/target-moxie/helper.c
> @@ -55,8 +55,8 @@ void tlb_fill(CPUMoxieState *env, target_ulong addr, int is_write, int mmu_idx,
>          if (retaddr) {
>              cpu_restore_state(env, retaddr);
>          }
> +       cpu_loop_exit(env);
>      }
> -    cpu_loop_exit(env);
>  }


Hi Anthony,

that bug only revealed that some instructions (in that particular case jsra)
issue memory access while they have inconsistent registers state:

        case 0x03: /* jsra */
            {
                TCGv t1 = tcg_temp_new_i32();
                TCGv t2 = tcg_temp_new_i32();

                tcg_gen_movi_i32(t1, ctx->pc + 6);

                /* Make space for the static chain and return address.  */
                tcg_gen_subi_i32(t2, REG(1), 8);
                tcg_gen_mov_i32(REG(1), t2);
(1)-->                tcg_gen_qemu_st32(t1, REG(1), ctx->memidx);

                /* Push the current frame pointer.  */
                tcg_gen_subi_i32(t2, REG(1), 4);
                tcg_gen_mov_i32(REG(1), t2);
(2)-->                tcg_gen_qemu_st32(REG(0), REG(1), ctx->memidx);

                /* Set the pc and $fp.  */
                tcg_gen_mov_i32(REG(0), REG(1));

                gen_goto_tb(env, ctx, 0, cpu_ldl_code(env, ctx->pc+2));

                tcg_temp_free_i32(t1);
                tcg_temp_free_i32(t2);

                ctx->bstate = BS_BRANCH;
                length = 6;
            }

memory access at points (1) and (2) can abort the instruction (it did so
b/o the bug, but it may do so legitimately when you add MMU support),
but it has modified REG(1) at those points, which will not be restored.
It's probably worth carrying register modifications in some temporary
until after the point (2).

-- 
Thanks.
-- Max

