Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yan6O-0007qd-HX
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 11:20:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan6I-0007dy-9O
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan6C-0007vi-Le
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:20:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yan68-0007jV-0Y; Wed, 25 Mar 2015 11:20:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3770642654;
	Wed, 25 Mar 2015 18:19:59 +0300 (MSK)
Message-ID: <5512D220.2020303@msgid.tls.msk.ru>
Date: Wed, 25 Mar 2015 18:20:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1426945498-29777-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1426945498-29777-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-tricore: Fix check which was
	always false
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
X-List-Received-Date: Wed, 25 Mar 2015 15:20:14 -0000

21.03.2015 16:44, Stefan Weil wrote:
> With a mask value of 0x00400000, the result will never be 1.
> This fixes a Coverity warning.

Might be a bit risky if the whole thing wasn't a complete no-op.
I wonder maybe the whole this if statement should be removed..

But anyway, applied to -trivial, thank you!

/mjt

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-tricore/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> index 0e7b4e8..b7d18b2 100644
> --- a/target-tricore/op_helper.c
> +++ b/target-tricore/op_helper.c
> @@ -2593,7 +2593,7 @@ void helper_rslcx(CPUTriCoreState *env)
>          /* CSU trap */
>      }
>      /* if (PCXI.UL == 1) then trap(CTYP); */
> -    if ((env->PCXI & MASK_PCXI_UL) == 1) {
> +    if ((env->PCXI & MASK_PCXI_UL) != 0) {
>          /* CTYP trap */
>      }
>      /* EA = {PCXI.PCXS, 6'b0, PCXI.PCXO, 6'b0}; */
> 


