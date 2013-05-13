Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UblP9-0000MK-Fx
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2013 01:34:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UblP5-0000KR-TQ
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 01:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UblP4-0000KU-VL
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 01:34:31 -0400
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236]:58661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UblP4-0000KC-Pq
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 01:34:30 -0400
Received: by mail-bk0-f54.google.com with SMTP id it16so7167bkc.13
	for <qemu-trivial@nongnu.org>; Sun, 12 May 2013 22:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=UmLNv77HkQFXLqrCNNKD9g1V9rtQmHUFuxcYbU9W7Zw=;
	b=PePJibgYPvOE6vuJlmCGtOnmL55cZINcjCrckGjgFry27ZVXHEH66W9yclJUYCtcJU
	DRM1wmYtEJ5pkv9JUBQA5cJjaLe+7E1M4olJSiiL8isTcM6Gzky2P2dQ1gAoWMw2qUzo
	nVrZ3LAbmxAqt1Dlrym6pOm3qEuhy4xykA75HpMMklTEBUkFyO6KohVTgiJVH0rOdsrF
	c2Nobvpym/PZTmozGp2oTxcgVJV1c8eNwvLfBqEhwG/HZHQIvgrbpQQuEbkGTMJL/RPH
	A7DDN2Ggn5fxcbd/CpW9dndErAch21DUrshYaOMV+Ip26gIk5+Y90AaqaGgjrPPMpXOc
	4xKw==
MIME-Version: 1.0
X-Received: by 10.204.232.198 with SMTP id jv6mr5223393bkb.8.1368423269342;
	Sun, 12 May 2013 22:34:29 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.227.11 with HTTP; Sun, 12 May 2013 22:34:29 -0700 (PDT)
In-Reply-To: <1367987941-26040-1-git-send-email-qiaonuohan@cn.fujitsu.com>
References: <1367987941-26040-1-git-send-email-qiaonuohan@cn.fujitsu.com>
Date: Mon, 13 May 2013 15:34:29 +1000
X-Google-Sender-Auth: 4OC7yh1yQ_IzVz5_tGo12dyIe-A
Message-ID: <CAEgOgz6afh64GLhYdC8F-2uctiweayuZ3UCwxEgBeRUaHdogqQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qiaonuohan@cn.fujitsu.com
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQnWVl2/KIaBPLryNNjuNfq6JzyHKqaxQ8f6S+2OcgMkuj8HPFYZ5uiWbv6aqRicHOc5/Q+9
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove twice include of
	qemu-common.h
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
X-List-Received-Date: Mon, 13 May 2013 05:34:33 -0000

cc qemu-trivial

Thanks for the patch.

Regards,
Peter

On Wed, May 8, 2013 at 2:39 PM,  <qiaonuohan@cn.fujitsu.com> wrote:
> From: Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
>
> This patch is used to remove twice include of "qemu-common.h" in
> block/win32-aio.c
>
> Signed-off-by: Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
> ---
>  block/win32-aio.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/block/win32-aio.c b/block/win32-aio.c
> index 5d0fbbf..fcb7c75 100644
> --- a/block/win32-aio.c
> +++ b/block/win32-aio.c
> @@ -25,7 +25,6 @@
>  #include "qemu/timer.h"
>  #include "block/block_int.h"
>  #include "qemu/module.h"
> -#include "qemu-common.h"
>  #include "block/aio.h"
>  #include "raw-aio.h"
>  #include "qemu/event_notifier.h"
> --
> 1.7.1
>
>
>

