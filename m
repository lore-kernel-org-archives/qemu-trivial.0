Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN63X-0006Ji-SH
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:40:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WN63S-00069n-1W
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WN63N-0004Qp-9x
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:40:05 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=44889
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WN63B-0004Lq-4A; Mon, 10 Mar 2014 15:39:49 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	14BE172800CA; Mon, 10 Mar 2014 20:39:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Yb8KJdttE6Al; Mon, 10 Mar 2014 20:39:46 +0100 (CET)
Received: from [192.168.178.35] (p54ADBA8B.dip0.t-ipconnect.de
	[84.173.186.139])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	03F1172800C7; Mon, 10 Mar 2014 20:39:45 +0100 (CET)
Message-ID: <531E1501.5070608@weilnetz.de>
Date: Mon, 10 Mar 2014 20:39:45 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1394478649-9453-3-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/12] hw/intc/apic.c: Use
 uint32_t for mask word in foreach_apic
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
X-List-Received-Date: Mon, 10 Mar 2014 19:40:10 -0000

Am 10.03.2014 20:10, schrieb Peter Maydell:
> Use unsigned arithmetic for operations on the mask word
> in the foreach_apic() macro, to avoid relying on undefined
> behaviour when shifting into the sign bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/apic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 361ae90..e137882 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -201,12 +201,13 @@ static void apic_external_nmi(APICCommonState *s)
>  
>  #define foreach_apic(apic, deliver_bitmask, code) \
>  {\
> -    int __i, __j, __mask;\
> +    int __i, __j;\
> +    uint32_t __mask;\
>      for(__i = 0; __i < MAX_APIC_WORDS; __i++) {\
>          __mask = deliver_bitmask[__i];\
>          if (__mask) {\
>              for(__j = 0; __j < 32; __j++) {\
> -                if (__mask & (1 << __j)) {\
> +                if (__mask & (1U << __j)) {\
>                      apic = local_apics[__i * 32 + __j];\
>                      if (apic) {\
>                          code;\
> 


The declaration of __mask could be moved inside the for block and be
combined with the assignment, but that's not strictly necessary.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


