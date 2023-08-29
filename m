Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qb2aw-0001or-Ac
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2023 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1qb2au-0001jA-W2
 for qemu-trivial@nongnu.org; Tue, 29 Aug 2023 13:33:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1qb2ar-0003XS-Sr
 for qemu-trivial@nongnu.org; Tue, 29 Aug 2023 13:33:36 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B0A1D1DB26;
 Tue, 29 Aug 2023 20:34:02 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 21BB5243FA;
 Tue, 29 Aug 2023 20:33:32 +0300 (MSK)
Message-ID: <162b4238-1d33-e6d8-e9f3-e754510a4b4e@tls.msk.ru>
Date: Tue, 29 Aug 2023 20:33:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] Fix addressing with ramp registers
Content-Language: en-US
To: sam.morgan44@gmail.com, qemu-trivial@nongnu.org
References: <20230825152342.1470-1-sam.morgan44@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230825152342.1470-1-sam.morgan44@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2023 17:33:37 -0000

25.08.2023 18:23, sam.morgan44@gmail.com wrote:
> From: Sam Morgan <sam.morgan44@gmail.com>
> 
> Signed-off-by: Sam Morgan <sam.morgan44@gmail.com>
> ---
>   target/avr/translate.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index ef2edd7415..b1c4bb17a1 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -1459,8 +1459,10 @@ static void gen_set_zaddr(TCGv addr)
>   static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
>   {
>       TCGv addr = tcg_temp_new_i32();
> +    TCGv shifted_H = tcg_temp_new_i32();
>   
> -    tcg_gen_deposit_tl(addr, M, H, 8, 8);
> +    tcg_gen_shri_tl(shifted_H, H, 16);
> +    tcg_gen_deposit_tl(addr, M, shifted_H, 8, 8);
>       tcg_gen_deposit_tl(addr, L, addr, 8, 16);
>   
>       return addr;

Please re-send this to qemu-devel@, Cc'ing addresses from
  ./scripts/get_maintainer.pl -f target/avr/translate.c
the way you sent your submission, no one noticed it, and
it is not a trivial change.

/mjt

