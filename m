Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAJGu-0002RD-E4
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 13:27:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAJGs-0002Qu-FN
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAJGq-0003ZD-5m
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:27:14 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:49360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAJGp-0003Yh-Tl
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:27:12 -0400
Received: by mail-wr0-x241.google.com with SMTP id g90so264211wrd.6
	for <qemu-trivial@nongnu.org>; Thu, 02 Nov 2017 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q/ah/Ti1TiePuipWfiZI0+YnDYoLWQEg07KOkXta664=;
	b=h/z3eD0imsZo7m0tkQxiHYXmqlSNNOkTpcLFd87V+jKl+W2icdO0XKWMNWIs4Zjf8N
	GYC1Fj2KFLxkguNwK9v0b9cSYhK+n0/KUdWkWTQAJD8Ft6mMChOzaKOiH/G9Myw30vHB
	fL1TMh9Yb2FqYs44G0ZCGiCuNd+MpPkaHjF9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q/ah/Ti1TiePuipWfiZI0+YnDYoLWQEg07KOkXta664=;
	b=UXFuaSiUiyMW7Tv+oJ/SyON0KXHq9kO1vWi+ptk07wsLNf4aONk2WXjqnjVUeMPloC
	kPnEGN8aOW1deK7mQv4KCU0AbolKmBSX0bgK9EY9l+P25y64tCasnTSv8AH+HMW/q6dK
	kLXzeXQBV6Aok+Sn4jn0nRVx9Ne8K8nE4MzYschtJiUo54fQyjJy8d4LbSiBxl2eQEyw
	SkU7SMhQVZlpZPad9gFJxM1TBViRszyhtBIbdUedJzCIB4IDkcrXJhBAOaDKFKlSQZF6
	0fTwjZb9YUwbEqu/CxswJ20lBx7L75pSgWkg0JMBfXWEr8tTcrQOk1ayRTaIwesBE9Mn
	6YCQ==
X-Gm-Message-State: AMCzsaXby41wdFfQn/3rKhr7sHiGWCPg3cBYw3vvm7fCjS9km+pLw8YM
	MVkWTzrbKfJxX8I5d+DZd0zJ0/z7rgWuY/jfr/dc1w==
X-Google-Smtp-Source: ABhQp+TOEIdMRicHcfYiMjL6FU2U5MP/IjuwFwV/Q0IdPReir/vacImiOItDKw1yNgJTrhA71ZS8M2SKkhXcJg/2JPY=
X-Received: by 10.223.143.54 with SMTP id p51mr3452500wrb.138.1509643630740;
	Thu, 02 Nov 2017 10:27:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 10:26:50 -0700 (PDT)
In-Reply-To: <20171102171846.21445-1-lyan@suse.com>
References: <20171102171846.21445-1-lyan@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 17:26:50 +0000
Message-ID: <CAFEAcA8JDVKBE1pFssTwFTybT=Kamc+_ra8qRF-DGSpb7=7QZA@mail.gmail.com>
To: Liang Yan <lyan@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/display/xenfb:
 Simulate auto-repeat key events
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 17:27:15 -0000

On 2 November 2017 at 17:18, Liang Yan <lyan@suse.com> wrote:
> New tigervnc changes the way to send long pressed key,
> from "down up down up ..." to "down down ... up", it only
> affects xen pv console mode. I send a patch to latest
> kernel side, but it may have a fix in qemu backend for
> back compatible becase guest VMs may use very old kernel.
> This patch inserts an up event after each regular key down
> event to simulate an auto-repeat key event for xen keyboard
> frontend driver.
>
> Signed-off-by: Liang Yan <lyan@suse.com>
> ---
> v2:
> - exclude extended key
> - change log comment
>
>  hw/display/xenfb.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index 8e2547ac05..1bc5b41ab7 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -292,6 +292,11 @@ static void xenfb_key_event(void *opaque, int scancode)
>      }
>      trace_xenfb_key_event(opaque, scancode2linux[scancode], down);
>      xenfb_send_key(xenfb, down, scancode2linux[scancode]);
> +
> +    /* insert an up event for regular down key event */
> +    if (down && !xenfb->extended) {
> +        xenfb_send_key(xenfb, 0, scancode2linux[scancode]);
> +    }
>  }

This doesn't look to me like the right place to fix this bug.
The xenfb key event handler is just one QEMU keyboard backend
(in a setup where there are many possible sources of keyboard
events: vnc, gtk, SDL, cocoa UI frontends; and many possible
sinks: xenfb's key handling, ps2 keyboard emulator, etc etc).

We need to be clear in our definition of generic QEMU key
events how key repeat is supposed to be handled, and then
every consumer and every producer needs to follow that.
In the specific case of the vnc UI frontend, we need to
also look at what the VNC protocol specifies for key repeat.
That then tells us whether the bug to be fixed is in QEMU,
or in a particular VNC client.

thanks
-- PMM

