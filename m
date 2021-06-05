Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpbzL-0005qu-EH
	for mharc-qemu-trivial@gnu.org; Sat, 05 Jun 2021 15:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbzJ-0005q1-2M; Sat, 05 Jun 2021 15:29:41 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbzH-0008CY-9U; Sat, 05 Jun 2021 15:29:40 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N63JO-1lIQv03a6C-016RO6; Sat, 05 Jun 2021 21:29:19 +0200
Subject: Re: [PATCH 2/3] target/mips: Fix 'Uncoditional' typo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210602170759.2500248-1-f4bug@amsat.org>
 <20210602170759.2500248-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2d0815f4-fe20-09e0-e52c-0e51a817f9bd@vivier.eu>
Date: Sat, 5 Jun 2021 21:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602170759.2500248-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yi5u+piVb/Z1VBzZCE5Jc+d3u3oJIXStcJxqpeq6lxxFQrFe288
 7lBmB0TNN8IswOvZjbKQftDkOgRLlRooVLUAzrEUSan8MUuER1xbQH2TnHJ/X+PutjIWcHm
 oAtTVXe2IwMK2mDpur9jh5YJ4El8OGLFHKkYyRXZFMvBeSb3/Yvr1N0uTRDnXLbsxyPUuCY
 1Xo159kqpVBzaHZRTVx+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PD48snWU8UA=:+24N+J8rG4XQpp0eBaDILh
 YJeNV7hVhuhHu/haToCqC+xvTa2CsXddmbjS8QYNR/5gD4d9CAGCF6wmh126Yf6fu14JSUwuz
 0hb/aKZl46y93W9qaANazQLGoz/t9ZBfd2DBwvs5g/0IJXDu5Ad6XYq8XmSwmno+E6WrpEFOt
 SSYWTPAazAc/3B2I4KV1SaNWbVuAwUBCESRGB7WKhVcxuEEQnc8tBgOgIv5NPJ9BvKk9DQKYW
 fVtLqCaYfn7KST76RduWJDmKyr6jXE9yMRg0kCTJU3DxIfzV6Hoee+asx/0mdX3aut30+WG07
 bzUtJvoGDU7O7uOiqt/tvNmw/6/Q8jGAnsI/pXfPGLs8ZShiFk+MqL4jrtZzUPW1Z8k5FlxqU
 zLfayfKcTxKY/jtwk4aJB58gcAqTsUhsA/gUXmDdw6P4+3HxYBedjxzi9K2xFKpJaL4jj1Dey
 IolzvlftCiFcmw302/ifz4NWaCxSL3naE9AH9GqoMIQvbMMHaCo9gAFK3fDcz9NlCgML4iTbn
 qSH2x4RLv04MWHoXpwmyWA=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jun 2021 19:29:41 -0000

Le 02/06/2021 à 19:07, Philippe Mathieu-Daudé a écrit :
> Fix Uncoditional -> Unconditional typo.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index c03a8ae1fed..797eba44347 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -12238,7 +12238,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
>      }
>  
>      if (bcond_compute == 0) {
> -        /* Uncoditional compact branch */
> +        /* Unconditional compact branch */
>          switch (opc) {
>          case OPC_JIALC:
>              tcg_gen_movi_tl(cpu_gpr[31], ctx->base.pc_next + 4 + m16_lowbit);
> @@ -19092,7 +19092,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
>      ctx->base.is_jmp = DISAS_NORETURN;
>  
>      if (cond == TCG_COND_ALWAYS) {
> -        /* Uncoditional compact branch */
> +        /* Unconditional compact branch */
>          gen_goto_tb(ctx, 0, ctx->btarget);
>      } else {
>          /* Conditional compact branch */
> @@ -19201,7 +19201,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
>      }
>  
>      if (bcond_compute == 0) {
> -        /* Uncoditional compact branch */
> +        /* Unconditional compact branch */
>          switch (opc) {
>          case OPC_BC:
>              gen_goto_tb(ctx, 0, ctx->btarget);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


