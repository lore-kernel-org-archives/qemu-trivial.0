Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RV9pg-0004Ab-TS
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 17:37:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RV9pe-00044A-97
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 17:37:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RV9pc-0004pv-Qc
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 17:37:49 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:47347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RV9pZ-0004nR-Sg; Mon, 28 Nov 2011 17:37:45 -0500
Received: by yenq7 with SMTP id q7so3342185yen.4
	for <multiple recipients>; Mon, 28 Nov 2011 14:37:40 -0800 (PST)
Received: by 10.50.158.227 with SMTP id wx3mr51378262igb.52.1322519860003;
	Mon, 28 Nov 2011 14:37:40 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id mb4sm85350374igc.1.2011.11.28.14.37.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 14:37:38 -0800 (PST)
Message-ID: <4ED40D31.10903@codemonkey.ws>
Date: Mon, 28 Nov 2011 16:37:37 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1322172970-20616-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1322172970-20616-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Make
	flush_icache_range() inline
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
X-List-Received-Date: Mon, 28 Nov 2011 22:37:51 -0000

On 11/24/2011 04:16 PM, Stefan Weil wrote:
> This is standard for other tcg targets and improves tci, too.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   tcg/tci/tcg-target.c |    4 ----
>   tcg/tci/tcg-target.h |    4 ++++
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tcg/tci/tcg-target.c b/tcg/tci/tcg-target.c
> index 5011c43..f26bec7 100644
> --- a/tcg/tci/tcg-target.c
> +++ b/tcg/tci/tcg-target.c
> @@ -379,10 +379,6 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>   };
>   #endif
>
> -static void flush_icache_range(unsigned long start, unsigned long stop)
> -{
> -}
> -
>   static void patch_reloc(uint8_t *code_ptr, int type,
>                           tcg_target_long value, tcg_target_long addend)
>   {
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 449373d..c35786c 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -157,4 +157,8 @@ void tci_disas(uint8_t opc);
>   unsigned long tcg_qemu_tb_exec(CPUState *env, uint8_t *tb_ptr);
>   #define tcg_qemu_tb_exec tcg_qemu_tb_exec
>
> +static inline void flush_icache_range(unsigned long start, unsigned long stop)
> +{
> +}
> +
>   #endif /* TCG_TARGET_H */


