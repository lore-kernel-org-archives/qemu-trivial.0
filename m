Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCuew-0003ka-6S
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 12:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VCueo-0003Zi-2E
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VCuei-0003fo-QX
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:56:17 -0400
Received: from goliath.siemens.de ([192.35.17.28]:32753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1VCueT-0003XJ-0d; Fri, 23 Aug 2013 12:55:57 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id r7NGttMk031842;
	Fri, 23 Aug 2013 18:55:55 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.40.156])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r7NGtsR6014913;
	Fri, 23 Aug 2013 18:55:55 +0200
Message-ID: <5217941A.2090208@siemens.com>
Date: Fri, 23 Aug 2013 18:55:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1377275808-9017-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1377275808-9017-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] slirp/arp_table.c: Avoid shifting into
 sign bit of signed integers
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
X-List-Received-Date: Fri, 23 Aug 2013 16:56:24 -0000

On 2013-08-23 18:36, Peter Maydell wrote:
> "0xf << 28" shifts right into the sign bit, since 0xf is a signed
> integer. Use the 'U' suffix to force an unsigned shift to avoid
> this undefined behaviour and a clang sanitizer warning.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  slirp/arp_table.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/slirp/arp_table.c b/slirp/arp_table.c
> index bf698c1..ecdb0ba 100644
> --- a/slirp/arp_table.c
> +++ b/slirp/arp_table.c
> @@ -38,7 +38,7 @@ void arp_table_add(Slirp *slirp, uint32_t ip_addr, uint8_t ethaddr[ETH_ALEN])
>                  ethaddr[3], ethaddr[4], ethaddr[5]));
>  
>      /* Check 0.0.0.0/8 invalid source-only addresses */
> -    if ((ip_addr & htonl(~(0xf << 28))) == 0) {
> +    if ((ip_addr & htonl(~(0xfU << 28))) == 0) {
>          return;
>      }
>  
> @@ -74,7 +74,7 @@ bool arp_table_search(Slirp *slirp, uint32_t ip_addr,
>      DEBUG_ARG("ip = 0x%x", ip_addr);
>  
>      /* Check 0.0.0.0/8 invalid source-only addresses */
> -    assert((ip_addr & htonl(~(0xf << 28))) != 0);
> +    assert((ip_addr & htonl(~(0xfU << 28))) != 0);
>  
>      /* If broadcast address */
>      if (ip_addr == 0xffffffff || ip_addr == broadcast_addr) {
> 

Acked-by: Jan Kiszka <jan.kiszka@siemens.com>

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux

