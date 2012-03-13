Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S7OOv-0007gq-Qt
	for mharc-qemu-trivial@gnu.org; Tue, 13 Mar 2012 05:52:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1S7OOo-0007Kz-Hr
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 05:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1S7OOi-0001rV-9W
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 05:52:10 -0400
Received: from goliath.siemens.de ([192.35.17.28]:16996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1S7OOE-0001nQ-CK; Tue, 13 Mar 2012 05:51:34 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q2D9pTxG017534;
	Tue, 13 Mar 2012 10:51:29 +0100
Received: from mchn199C.mchp.siemens.de ([139.22.123.60])
	by mail1.siemens.de (8.13.6/8.13.6) with SMTP id q2D9pTYT008811;
	Tue, 13 Mar 2012 10:51:29 +0100
Message-ID: <4F5F18A0.8080700@siemens.com>
Date: Tue, 13 Mar 2012 10:51:28 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1331410853-23217-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1331410853-23217-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] slirp: Fix compiler warning for w64
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
X-List-Received-Date: Tue, 13 Mar 2012 09:52:16 -0000

On 2012-03-10 21:20, Stefan Weil wrote:
> Casting a pointer to an integer value must use uintptr_t or intptr_t
> (not long) for portable code. MinGW-w64 requires this because
> sizeof(long) != sizeof(void *) for w64 hosts, so casting to long
> raises a compiler warning.
> 
> I use uintptr_t instead of intptr_t because changing the sign does not
> matter here and casting pointers to unsigned values seems more
> reasonable (the unsigned value is a non negative offset.
> 
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  slirp/cksum.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/slirp/cksum.c b/slirp/cksum.c
> index e43867d..6328660 100644
> --- a/slirp/cksum.c
> +++ b/slirp/cksum.c
> @@ -75,7 +75,7 @@ int cksum(struct mbuf *m, int len)
>  	/*
>  	 * Force to even boundary.
>  	 */
> -	if ((1 & (long) w) && (mlen > 0)) {
> +	if ((1 & (uintptr_t)w) && (mlen > 0)) {
>  		REDUCE;
>  		sum <<= 8;
>  		s_util.c[0] = *(uint8_t *)w;

Thanks, I picked this up for the slirp queue for which I will send a
pull request later today.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

