Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUCcn-0001gd-5W
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2013 05:01:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UUCcj-0001g7-QT
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 05:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UUCci-0001IS-HJ
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 05:01:21 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:48519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UUCci-0001IC-9w
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 05:01:20 -0400
Received: by mail-lb0-f182.google.com with SMTP id v20so241371lbc.13
	for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2013 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=wC4tXNWagZRNCOEI3F+F6hlH0qsFGn2AhdIN1rVH2mk=;
	b=eXLhv4QU2gDnVGnDk4pm+tVpZ52fV7RrmEmCxSSwa8oUK5aj8cRQO3AnjIuJoYppHs
	3NQRxwteovNlgF9BN907Wy3wmGcSE2xJLFES8nXIYkXYuRwoHvDydms/bvtrLstdxmMe
	xN0QfPoVyPQxPJxHQfkV2j5cn78jZLYfn6oANmTl0XzIyQ1mhL2O8UGpzSst6QYNtWS9
	+lEoj4craG2f0hytCOOYaWdsRstbWQ36AxLSC6QTOOYmYbHWFHZLB3hgdb0JhCmXa7j4
	p8/X3OuW78icvt33cTLAyq50RW5GTilAQP8vgZG3JcdipIx2Nd3CuTwKVIbrCZRZI0aQ
	MkEQ==
X-Received: by 10.112.125.33 with SMTP id mn1mr12814561lbb.89.1366621278513;
	Mon, 22 Apr 2013 02:01:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Mon, 22 Apr 2013 02:00:58 -0700 (PDT)
In-Reply-To: <1366616571-4321-1-git-send-email-aik@ozlabs.ru>
References: <1366616571-4321-1-git-send-email-aik@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Apr 2013 10:00:58 +0100
Message-ID: <CAFEAcA9szMz8X-XfehpR4CZrJ5SaQpPeRHD-5Auja=WMk=GxQg@mail.gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkix8LGcO3cTshHIN5fXxbNtOjQSNdYlZMnM/uV6584Yc2U8VHXeLuiuTmMT8xINrsAL4Hc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.182
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate-all: fix compiler
 warning and linked error
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
X-List-Received-Date: Mon, 22 Apr 2013 09:01:24 -0000

On 22 April 2013 08:42, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> The code did use profile_getclock() but did not include
> include/qemu/timer.h where this function is defined. The patch fixes this.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

NB that this compile failure only happens if you configure
with --enable-profiler.

thanks
-- PMM

