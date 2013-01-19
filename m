Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwYzO-0002TS-7c
	for mharc-qemu-trivial@gnu.org; Sat, 19 Jan 2013 09:01:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TwYzL-0002Lb-O8
	for qemu-trivial@nongnu.org; Sat, 19 Jan 2013 09:01:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TwYzJ-0006oW-Dz
	for qemu-trivial@nongnu.org; Sat, 19 Jan 2013 09:01:39 -0500
Received: from mail-pa0-f53.google.com ([209.85.220.53]:56750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TwYzF-0006nW-CW; Sat, 19 Jan 2013 09:01:33 -0500
Received: by mail-pa0-f53.google.com with SMTP id hz1so2616494pad.40
	for <multiple recipients>; Sat, 19 Jan 2013 06:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=BpdWfw+VlgG+ucADT0Wu7lxqphJUNRDUFgWejG/EqOo=;
	b=Ko02mH7utRVQ31Nn9R9kP61eBp9HYWpqyAQo0NXCgHYnHHyadttKUqLfUjA0BCGfMl
	j5k6g96ecgRn5iwqf03N6FUAxGBneRKbxUWaWik/WmCXCYjrpQoYPfv3rRdJkjkYX1el
	ZxjR8F3WMsgsYpdwS0e0GP+hmA5YWsjxUaPCGkVQ37YSextU6K4iDItdB9HiNT8zjAZ+
	TyfHCYjr6LfIun0E3y4zFRehLhL1oWG0nUJzTLZ04A19G8gfRYVpaoUR5ir3a90KgmPm
	o2aKbMwOeHBUVDOvg8aoZs8WVbnOaMp52tGsEQb/RVCYXPoLXw0B3dbXqTujDdi5y2Pa
	Qi3Q==
X-Received: by 10.66.80.70 with SMTP id p6mr32821605pax.23.1358604092399; Sat,
	19 Jan 2013 06:01:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.208.168 with HTTP; Sat, 19 Jan 2013 06:01:12 -0800 (PST)
In-Reply-To: <1358549290-23228-1-git-send-email-sw@weilnetz.de>
References: <1358549290-23228-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 19 Jan 2013 14:01:12 +0000
Message-ID: <CAAu8pHstADBWUNPpHreLEpTgw+r9Xzr=iWM0_y0f-Sg=inn9Cg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.53
Cc: qemu-trivial@nongnu.org, Wenchao Xia <xiawenc@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Fix compilation for
	MinGW (regression)
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
X-List-Received-Date: Sat, 19 Jan 2013 14:01:40 -0000

Thanks, applied.

On Fri, Jan 18, 2013 at 10:48 PM, Stefan Weil <sw@weilnetz.de> wrote:
> 84f2d0ea added an argument to function usb_host_info.
> The stub function must match the declaration in usb.h.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/usb/host-stub.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
> index 58423a0..8affba7 100644
> --- a/hw/usb/host-stub.c
> +++ b/hw/usb/host-stub.c
> @@ -35,7 +35,7 @@
>  #include "hw/usb.h"
>  #include "monitor/monitor.h"
>
> -void usb_host_info(Monitor *mon)
> +void usb_host_info(Monitor *mon, const QDict *qdict)
>  {
>      monitor_printf(mon, "USB host devices not supported\n");
>  }
> --
> 1.7.10.4
>
>

