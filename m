Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SyO7T-0007wP-Vj
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2012 10:17:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SyO7N-0007lO-5i
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 10:17:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SyO7I-0003Ia-E2
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 10:17:13 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:53028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SyO7I-0003IR-7Z
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 10:17:08 -0400
Received: by wibhm2 with SMTP id hm2so1302718wib.10
	for <qemu-trivial@nongnu.org>; Mon, 06 Aug 2012 07:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=cdJa3jdeHJ8ubaXoWT3uWIPI5wurpkAfbCCtLg7VDvI=;
	b=Mz9dtDmW4BfZpJoikleLS8X0lgZwS+4Evmi31O1mBnke1J92NF+nimtc+OV7WDRMO0
	K1jD4I/mWEvYgJzSX5uyTzqO5NspY6V0jFLZAVDJr71Z+qFUpTz44Eg63Z4ln1aRg9+W
	b1xgfbLs5tGAYAEUJ0j8+Q5AWqff1TMPfDssbzNDAl7pDMxhVPypkDvDmDU36oP5kqVK
	Yye1HtSVuRIhtWvZTHfxX5ddKGStTVIRum/usvlQ1efvcSgzWQ7OounnoYr5s7+RkV4G
	rx5eDXXAQu8gSqTmPWMXO9sYDBeD6mjGPMGzB7y6kA1yt/pJmbpzdWUpqJWkfZt7OI1X
	GpJQ==
MIME-Version: 1.0
Received: by 10.50.157.163 with SMTP id wn3mr5514236igb.33.1344262626342; Mon,
	06 Aug 2012 07:17:06 -0700 (PDT)
Received: by 10.50.237.41 with HTTP; Mon, 6 Aug 2012 07:17:06 -0700 (PDT)
In-Reply-To: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
References: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
Date: Mon, 6 Aug 2012 15:17:06 +0100
Message-ID: <CAFEAcA91dywJCq-s=wS0TRN6cone4fLf4h099O4UPd-zOku9Gw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkiHdoH45bEFf9httMZTSbBrp8P+Os2w6ny23pQ37cfOIN2MdhF8QJdpzdhKkTBXFJyzCmr
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] arm: translate: comment typo -
	s/middel/middle/
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
X-List-Received-Date: Mon, 06 Aug 2012 14:17:19 -0000

On 6 August 2012 08:05, Peter A. G. Crosthwaite
<peter.crosthwaite@petalogix.com> wrote:
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> ---
>  target-arm/translate.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 29008a4..494c682 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -9892,7 +9892,7 @@ static inline void gen_intermediate_code_internal(CPUARMState *env,
>      } else {
>          /* While branches must always occur at the end of an IT block,
>             there are a few other things that can cause us to terminate
> -           the TB in the middel of an IT block:
> +           the TB in the middle of an IT block:
>              - Exception generating instructions (bkpt, swi, undefined).
>              - Page boundaries.
>              - Hardware watchpoints.
> --
> 1.7.0.4
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Happy for this to go via the trivial queue.

-- PMM

