Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QsASw-0005Cs-5e
	for mharc-qemu-trivial@gnu.org; Sat, 13 Aug 2011 05:25:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QsASt-00050r-6R
	for qemu-trivial@nongnu.org; Sat, 13 Aug 2011 05:25:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QsASs-0006uS-6N
	for qemu-trivial@nongnu.org; Sat, 13 Aug 2011 05:25:11 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QsASq-0006u8-13; Sat, 13 Aug 2011 05:25:08 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5F4677283013; Sat, 13 Aug 2011 11:25:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ALUBOoaglkQj; Sat, 13 Aug 2011 11:25:06 +0200 (CEST)
Received: from flocke.fritz.box (p54AD9F10.dip.t-dialin.net [84.173.159.16])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B83EA7283012; Sat, 13 Aug 2011 11:25:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QsASo-0001IS-0p; Sat, 13 Aug 2011 11:25:06 +0200
Message-ID: <4E4642F1.5010600@mail.berlios.de>
Date: Sat, 13 Aug 2011 11:25:05 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110702 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Aurelien Jarno <aurelien@aurel32.net>
References: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
In-Reply-To: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sh4: Fix potential crash in debug code
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
X-List-Received-Date: Sat, 13 Aug 2011 09:25:12 -0000

Am 20.07.2011 20:56, schrieb Stefan Weil:
> cppcheck reports this error:
>
> qemu/hw/sh_intc.c:390: error: Possible null pointer dereference:
>   s - otherwise it is redundant to check if s is null at line 385
>
> If s were NULL, the printf() statement would crash.
> Setting braces fixes this bug.
>
> Signed-off-by: Stefan Weil<weil@mail.berlios.de>
> ---
>   hw/sh_intc.c |    9 +++++----
>   1 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/sh_intc.c b/hw/sh_intc.c
> index 0734da9..f73a4b0 100644
> --- a/hw/sh_intc.c
> +++ b/hw/sh_intc.c
> @@ -382,13 +382,14 @@ void sh_intc_register_sources(struct intc_desc *desc,
>
>   	sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
>   	s = sh_intc_source(desc, vect->enum_id);
> -	if (s)
> -	    s->vect = vect->vect;
> +        if (s) {
> +            s->vect = vect->vect;
>
>   #ifdef DEBUG_INTC_SOURCES
> -	printf("sh_intc: registered source %d ->  0x%04x (%d/%d)\n",
> -	       vect->enum_id, s->vect, s->enable_count, s->enable_max);
> +            printf("sh_intc: registered source %d ->  0x%04x (%d/%d)\n",
> +                   vect->enum_id, s->vect, s->enable_count, s->enable_max);
>   #endif
> +        }
>       }
>
>       if (groups) {
>    

Ping?


