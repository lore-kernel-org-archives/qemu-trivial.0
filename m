Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tu3gZ-0001pg-Vg
	for mharc-qemu-trivial@gnu.org; Sat, 12 Jan 2013 11:11:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Tu3gV-0001ca-G0
	for qemu-trivial@nongnu.org; Sat, 12 Jan 2013 11:11:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Tu3gR-0003WX-3j
	for qemu-trivial@nongnu.org; Sat, 12 Jan 2013 11:11:51 -0500
Received: from mail-pb0-f52.google.com ([209.85.160.52]:60943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Tu3gJ-0003US-2Y; Sat, 12 Jan 2013 11:11:39 -0500
Received: by mail-pb0-f52.google.com with SMTP id ro2so1468098pbb.39
	for <multiple recipients>; Sat, 12 Jan 2013 08:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mA+mgBohGkgGlT9gWhcQA8X8wB+PD5PiAxNNfHPWrk8=;
	b=b4xqMOQfEtdS6lmCqPT5v88U6b4Kz7aNotoDbL5R4da+voPRQYlA3IXInphNaRYf/w
	aotPFItnGRzcK573h8saxx1aJvWe1n850R9FCJD64OsHHdItUWlqC//JR3OI/JRfZGci
	4Tmou760ir+Th7lHLRTst1iYAvtmgmls7w2Qc+FifW/K97EBzYBoNFfHI04clJDWZGmf
	gCYeDOVgSD3HrfjBrXUTl5tQDzlvdHGU/wJqA7bKO4tSkGGCwcC5wfIYGKNQHKY/fgT2
	1dVdkzDNtDglX+tYjzQss5A34P5JUOvLSubLxSBBiI73o5R65mNYwckqEurXY4AzDKNq
	qmJw==
Received: by 10.68.231.40 with SMTP id td8mr44272954pbc.48.1358007098336; Sat,
	12 Jan 2013 08:11:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.208.168 with HTTP; Sat, 12 Jan 2013 08:11:18 -0800 (PST)
In-Reply-To: <1357922503-20202-1-git-send-email-julien.grall@citrix.com>
References: <1357922503-20202-1-git-send-email-julien.grall@citrix.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 12 Jan 2013 16:11:18 +0000
Message-ID: <CAAu8pHt9Nifyzd-isnxU0z2VGanQUxTcvKsWourGQQYBEZLTow@mail.gmail.com>
To: Julien Grall <julien.grall@citrix.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.52
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pc.c: add ULL suffix in
 ioport80_read and ioportF0_read return value
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
X-List-Received-Date: Sat, 12 Jan 2013 16:11:54 -0000

Thanks, applied.

On Fri, Jan 11, 2013 at 4:41 PM, Julien Grall <julien.grall@citrix.com> wrote:
> The commit c02e1eac887b1b0aee7361b1fcf889e7d47fed9d broke the compilation
> for i386. ULL need to be specify for uint64_t value.
>
> Signed-off-by: Julien Grall <julien.grall@citrix.com>
> ---
>  hw/pc.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pc.c b/hw/pc.c
> index dfa3144..ba1f19d 100644
> --- a/hw/pc.c
> +++ b/hw/pc.c
> @@ -105,7 +105,7 @@ static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
>
>  static uint64_t ioport80_read(void *opaque, hwaddr addr, unsigned size)
>  {
> -    return 0xffffffffffffffff;
> +    return 0xffffffffffffffffULL;
>  }
>
>  /* MSDOS compatibility mode FPU exception support */
> @@ -130,7 +130,7 @@ static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
>
>  static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
>  {
> -    return 0xffffffffffffffff;
> +    return 0xffffffffffffffffULL;
>  }
>
>  /* TSC handling */
> --
> Julien Grall
>
>

