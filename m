Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRu5z-0000kO-BJ
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 05:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRu5x-0000ip-M7; Mon, 12 Oct 2020 05:26:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49290
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRu5w-0006kc-7J; Mon, 12 Oct 2020 05:26:17 -0400
Received: from host86-158-109-18.range86-158.btcentralplus.com
 ([86.158.109.18] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kRu5t-000452-Vs; Mon, 12 Oct 2020 10:26:17 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20201011200112.3222822-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a1181b86-cf4d-1b20-c741-4de6cbe96dc5@ilande.co.uk>
Date: Mon, 12 Oct 2020 10:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201011200112.3222822-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.18
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] target/sparc/int32_helper: Remove duplicated 'Tag
 Overflow' entry
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Oct 2020 09:26:17 -0000

On 11/10/2020 21:01, Philippe Mathieu-Daudé wrote:

> Commit 0b09be2b2f ("Nicer debug output for exceptions") added
> twice the same "Tag Overflow" entry, remove the extra one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sparc/int32_helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/sparc/int32_helper.c b/target/sparc/int32_helper.c
> index 9a71e1abd87..ba63c739c1e 100644
> --- a/target/sparc/int32_helper.c
> +++ b/target/sparc/int32_helper.c
> @@ -50,7 +50,6 @@ static const char * const excp_names[0x80] = {
>      [TT_EXTINT | 0xd] = "External Interrupt 13",
>      [TT_EXTINT | 0xe] = "External Interrupt 14",
>      [TT_EXTINT | 0xf] = "External Interrupt 15",
> -    [TT_TOVF] = "Tag Overflow",
>      [TT_CODE_ACCESS] = "Instruction Access Error",
>      [TT_DATA_ACCESS] = "Data Access Error",
>      [TT_DIV_ZERO] = "Division By Zero",

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

