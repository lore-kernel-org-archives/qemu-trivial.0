Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOW1D-0003Fe-Dk
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 13:35:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOW15-00034f-M8
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 13:35:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOW0z-0004LQ-DR
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 13:35:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOW0m-0004Gi-La; Fri, 14 Mar 2014 13:35:12 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E709241C8B;
	Fri, 14 Mar 2014 21:35:11 +0400 (MSK)
Message-ID: <53233DCF.3010706@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 21:35:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Fabien Chouteau <chouteau@adacore.com>
References: <1394815901-7153-1-git-send-email-chouteau@adacore.com>
In-Reply-To: <1394815901-7153-1-git-send-email-chouteau@adacore.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH] FSL eTSEC: Fix typo in rx ring
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
X-List-Received-Date: Fri, 14 Mar 2014 17:35:38 -0000

14.03.2014 20:51, Fabien Chouteau wrote:

>  hw/net/fsl_etsec/rings.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 7760272..31e6f58 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -592,7 +592,7 @@ void etsec_walk_rx_ring(eTSEC *etsec, int ring_nbr)
>  
>                  /* TODO: Broadcast and Multicast */
>  
> -                if (bd.flags | BD_INTERRUPT) {
> +                if (bd.flags & BD_INTERRUPT) {
>                      /* Set RXFx */
[..etc..]

Hm.  Has this code _ever_ worked?? :(

Thanks, applied to -trivial.

/mjt

