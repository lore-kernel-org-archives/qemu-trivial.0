Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzFp5-0003ik-QM
	for mharc-qemu-trivial@gnu.org; Sun, 31 May 2015 22:51:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YzFp3-0003iL-85
	for qemu-trivial@nongnu.org; Sun, 31 May 2015 22:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YzFoy-0002te-4R
	for qemu-trivial@nongnu.org; Sun, 31 May 2015 22:51:29 -0400
Received: from mail-qg0-f54.google.com ([209.85.192.54]:34719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YzFoy-0002tW-0M
	for qemu-trivial@nongnu.org; Sun, 31 May 2015 22:51:24 -0400
Received: by qgdy38 with SMTP id y38so18449636qgd.1
	for <qemu-trivial@nongnu.org>; Sun, 31 May 2015 19:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NJ6NW0o/a2S+uCSOeETeZzatVZPaazK4i+CI+T9hwHE=;
	b=ODnWpuLXf9mWlu6LeaFBckvCbgifIHu7+mmCheW7i+LWJBJxb9x7YLXb9PnV4/jV1X
	bZdu3/EEyJ6Q1xfWjUCjUc4hFCX3p/EDisVsf+8ap8fqBnbkTCO3xujzCnm394AUf24U
	0RBGkByNlhJHMQ2cnHGIrW3sXO7mismIaIusnO5JneosnJhZmYqDWHz2jI5SqSqPDiNM
	OnLfeRUOLmBzviFr/R88g6i1oRXc4cycy664AyN74GUVz1aHBd/xRu5gbR926HWzDs9M
	b/J6OH4eIiHpJmVqVYagoawyF7+Z+xpzvbdTt4n1PYPRGOEv5k8oCCKcB11Y/AhstfDW
	41DQ==
X-Gm-Message-State: ALoCoQnCzlGCTLrjhfO9sL56CGR4h4V4lLxSwPkgOWYXjO30RehF/vefn1pfTR1XwegiZkGvhs36
MIME-Version: 1.0
X-Received: by 10.140.235.19 with SMTP id g19mr22306417qhc.52.1433127083442;
	Sun, 31 May 2015 19:51:23 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.45.2 with HTTP; Sun, 31 May 2015 19:51:23 -0700 (PDT)
In-Reply-To: <1432880555-21080-1-git-send-email-saipava@xilinx.com>
References: <1432880555-21080-1-git-send-email-saipava@xilinx.com>
Date: Sun, 31 May 2015 19:51:23 -0700
X-Google-Sender-Auth: nTEhKzYhYGMHIynApBdIkO9HsXU
Message-ID: <CAEgOgz5x9Yv7NZyv_aM6=xg=6Rt2M=kG+=5rdX9A5cbx=2iGZQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.54
Cc: Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	alistai@xilinx.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <pcrost@xilinx.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V1] cadence_gem: Fix Rx
	buffer size field mask
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
X-List-Received-Date: Mon, 01 Jun 2015 02:51:30 -0000

On Thu, May 28, 2015 at 11:22 PM, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
> This patch corrects the Rx buffer size field mask to mask bits 23 to 16
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Matches Xilinx UG585 documentation.

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Can this go via the trivial queue?

Regards,
Peter

> ---
>  hw/net/cadence_gem.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index dafe914..494a346 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -155,7 +155,7 @@
>  #define GEM_NWCFG_BCAST_REJ    0x00000020 /* Reject broadcast packets */
>  #define GEM_NWCFG_PROMISC      0x00000010 /* Accept all packets */
>
> -#define GEM_DMACFG_RBUFSZ_M    0x007F0000 /* DMA RX Buffer Size mask */
> +#define GEM_DMACFG_RBUFSZ_M    0x00FF0000 /* DMA RX Buffer Size mask */
>  #define GEM_DMACFG_RBUFSZ_S    16         /* DMA RX Buffer Size shift */
>  #define GEM_DMACFG_RBUFSZ_MUL  64         /* DMA RX Buffer Size multiplier */
>  #define GEM_DMACFG_TXCSUM_OFFL 0x00000800 /* Transmit checksum offload */
> --
> 1.7.4
>
>

