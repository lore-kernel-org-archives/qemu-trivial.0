Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SEgwu-0000pa-1k
	for mharc-qemu-trivial@gnu.org; Mon, 02 Apr 2012 09:05:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgwn-0000Uy-Os
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgwh-0002XG-Di
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:05:25 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:48479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SEgwX-0002Uc-HV; Mon, 02 Apr 2012 09:05:09 -0400
Received: by wgbfm10 with SMTP id fm10so2399959wgb.10
	for <multiple recipients>; Mon, 02 Apr 2012 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lLMf8Mf4tEaFXpzOV+T/TqiiOtv1ilTwv9Cd8yMYPhM=;
	b=e6D2+2rf8t9d72SnvT6BBxBPyB+b4gHEIWt9zNvSEJB29/gDE7Q5lZAAsMsoelxjgv
	xT9fvOYw+ROc8GjAYi5vu9MiPZWS60amGcbdabb06bNzEDPJbTIykAivMXGwS8FCxXs1
	9sViClp2qhQiSuXQsg/Z1HCeiGsKLfeZFjZCjtqgLsbIIZOvFXPPsxwmw/oR4sNY3Nzb
	hEs9uPdHF1FD5r5FXTIG3XHEbM1LkvZc/Y3N3iX0swiFElDRp+i0YG2WDYg+YT2LGShh
	a8epOpN1VhcgVvtVPIVqPzV1mPWqXuLgSsGrDfjPjZA1F5rRodctNQv5zc17q81j/Q3z
	LW9w==
Received: by 10.180.107.132 with SMTP id hc4mr24651465wib.21.1333371906938;
	Mon, 02 Apr 2012 06:05:06 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	w10sm55093754wiy.3.2012.04.02.06.05.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 06:05:06 -0700 (PDT)
Date: Mon, 2 Apr 2012 14:05:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120402130504.GD11583@stefanha-thinkpad.localdomain>
References: <1333310850-28767-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333310850-28767-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qxl: Add missing GCC_FMT_ATTR and fix
 format specifier
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
X-List-Received-Date: Mon, 02 Apr 2012 13:05:30 -0000

On Sun, Apr 01, 2012 at 10:07:30PM +0200, Stefan Weil wrote:
> val is an uint64_t, therefore %d was not correct.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>

Waiting for Gerd's Ack.

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/qxl.c |    2 +-
>  hw/qxl.h |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/qxl.c b/hw/qxl.c
> index 47a162e..85028dd 100644
> --- a/hw/qxl.c
> +++ b/hw/qxl.c
> @@ -1370,7 +1370,7 @@ async_common:
>      case QXL_IO_DESTROY_SURFACE_WAIT:
>          if (val >= NUM_SURFACES) {
>              qxl_guest_bug(d, "QXL_IO_DESTROY_SURFACE (async=%d):"
> -                             "%d >= NUM_SURFACES", async, val);
> +                             "%" PRIu64 " >= NUM_SURFACES", async, val);
>              goto cancel_async;
>          }
>          qxl_spice_destroy_surface_wait(d, val, async);
> diff --git a/hw/qxl.h b/hw/qxl.h
> index 11a0db3..cbb1e2d 100644
> --- a/hw/qxl.h
> +++ b/hw/qxl.h
> @@ -127,7 +127,7 @@ typedef struct PCIQXLDevice {
>  
>  /* qxl.c */
>  void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
> -void qxl_guest_bug(PCIQXLDevice *qxl, const char *msg, ...);
> +void qxl_guest_bug(PCIQXLDevice *qxl, const char *msg, ...) GCC_FMT_ATTR(2, 3);
>  
>  void qxl_spice_update_area(PCIQXLDevice *qxl, uint32_t surface_id,
>                             struct QXLRect *area, struct QXLRect *dirty_rects,

For two unrelated fixes I would do separate commits but don't worry
about resending.

Stefan

