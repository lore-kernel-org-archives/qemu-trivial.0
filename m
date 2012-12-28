Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TogEl-0001ZU-A0
	for mharc-qemu-trivial@gnu.org; Fri, 28 Dec 2012 15:08:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TogEj-0001Ta-9H
	for qemu-trivial@nongnu.org; Fri, 28 Dec 2012 15:08:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TogEi-0005M1-9C
	for qemu-trivial@nongnu.org; Fri, 28 Dec 2012 15:08:57 -0500
Received: from mail-da0-f54.google.com ([209.85.210.54]:54449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TogEg-0005Le-8x; Fri, 28 Dec 2012 15:08:54 -0500
Received: by mail-da0-f54.google.com with SMTP id n2so4895663dad.13
	for <multiple recipients>; Fri, 28 Dec 2012 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0RBWSvHyajiSGrsE/rO+UvcDTeVyFmv1I4ospIBCFW0=;
	b=imQ43IiRQTp1MjwOJ8/gHHE3Al7EDn0r5BFmbnwswjhqP8PBgpHtviXWXp2MHSBRJT
	DHsKWhQ7BirkuhTV9+GyAorQVjrXf9SN4sykvRpN7PLRAWXhnIWRxPP8DtqlWpCjlCf8
	3ZzLLmP631PykfLW1AELJh6uMog33XOceb/a006LThsFXVK+d4/sBUxhI4J75bc+ZQXW
	A2IQQ7dRQhUPN1lm6KaJllnlmySc5tYO5psy/jMeEUVrQ3D5vdOFQ7Thwp0ija7U2BXa
	UJ/bUsBZ8bOCsDpGJLWIs5oOBeycWZD7teUK15xYJp5c+Z7uwp63J3uU9PiBIXJBkKS5
	2fRg==
Received: by 10.68.235.71 with SMTP id uk7mr107814691pbc.10.1356725333384;
	Fri, 28 Dec 2012 12:08:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.49.101 with HTTP; Fri, 28 Dec 2012 12:08:33 -0800 (PST)
In-Reply-To: <1356297909-4446-1-git-send-email-alevy@redhat.com>
References: <1356297909-4446-1-git-send-email-alevy@redhat.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Fri, 28 Dec 2012 20:08:33 +0000
Message-ID: <CAAu8pHv3xYP2fTFFRf=-t8U4_HWL59YrCYTC4ygJY34RWV79yw@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.54
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb/redirect.c: unbreak
	compilation due to include/char/char.h
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
X-List-Received-Date: Fri, 28 Dec 2012 20:08:58 -0000

Thanks, applied.

On Sun, Dec 23, 2012 at 9:25 PM, Alon Levy <alevy@redhat.com> wrote:
> Broken since:
>
> commit 927d4878b0ff319ed87fed9363f314613b0a5ed9
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Mon Dec 17 18:20:05 2012 +0100
>
>     softmmu: move remaining include files to include/ subdirectories
>
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  hw/usb/redirect.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index b65e868..0abe1ff 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -30,6 +30,7 @@
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/iov.h"
> +#include "char/char.h"
>
>  #include <dirent.h>
>  #include <sys/ioctl.h>
> --
> 1.8.0.1
>
>

