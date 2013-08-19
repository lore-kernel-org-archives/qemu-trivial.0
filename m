Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBKoK-0004bl-AJ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 04:27:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBKoE-0004Nk-1o
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBKo8-0005rm-TK
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:27:29 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:37721
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VBKnu-0005nx-0o; Mon, 19 Aug 2013 04:27:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id A02B1265C189;
	Mon, 19 Aug 2013 10:27:09 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM-SqxUrUBSR; Mon, 19 Aug 2013 10:27:09 +0200 (CEST)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 8C3C1265C179;
	Mon, 19 Aug 2013 10:27:09 +0200 (CEST)
Message-ID: <5211D6DE.1000706@adacore.com>
Date: Mon, 19 Aug 2013 10:27:10 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
In-Reply-To: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Improve Monitor disas
	with symbol lookup
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
X-List-Received-Date: Mon, 19 Aug 2013 08:27:35 -0000

Any comments?

Regards,

On 08/02/2013 02:48 PM, Fabien Chouteau wrote:
> Part of M731-018.
> 
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  disas.c |   16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/disas.c b/disas.c
> index 71007fb..3ffb3ae 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -480,11 +480,19 @@ void monitor_disas(Monitor *mon, CPUArchState *env,
>  #endif
>  
>      for(i = 0; i < nb_insn; i++) {
> -	monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
> +        const char *sym = lookup_symbol(pc);
> +
> +        monitor_printf(mon, "0x" TARGET_FMT_lx " ", pc);
> +        if (sym[0] != '\0') {
> +            monitor_printf(mon, "<%s>:  ", sym);
> +        } else {
> +            monitor_printf(mon, ":  ");
> +        }
>          count = print_insn(pc, &s.info);
> -	monitor_printf(mon, "\n");
> -	if (count < 0)
> -	    break;
> +        monitor_printf(mon, "\n");
> +        if (count < 0) {
> +            break;
> +        }
>          pc += count;
>      }
>  }
> 


-- 
Fabien Chouteau

