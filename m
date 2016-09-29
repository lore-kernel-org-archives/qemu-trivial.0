Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpjbi-0002CQ-3A
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 18:15:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpjbg-0002Ao-Ip
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 18:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpjbe-0001Yl-LO
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 18:15:07 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpjbe-0001YC-A0
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 18:15:06 -0400
Received: by mail-vk0-x22d.google.com with SMTP id z126so88291379vkd.0
	for <qemu-trivial@nongnu.org>; Thu, 29 Sep 2016 15:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FCs8LV+f7ky9/Mvli3c9EbzWQCyY7J8rWFQBizuwTEY=;
	b=GjmFG795+8I+6nTA09Hvo1ag9E6hCKnaJMCNVL/oY3ROp5MOcR/6DPHKFg2VbS4b0W
	hrM6Pd4uv1Zu0vawBqoT6/w3Yjeuxqs3rWnxP5qZx8wxQxXk9NgapMx5Kz/K/xcwziG4
	zHEnrrWrYyDex4fgvmLi6bofUma1CSYRhMCTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FCs8LV+f7ky9/Mvli3c9EbzWQCyY7J8rWFQBizuwTEY=;
	b=VwfcRnNid0O+jfBfto/3H6/D2OgVrzMu1cG8aXTIWxBQ4yCC4qPplFVqAJzCdwv8ti
	tTlowYj3qqLSMFT2C4kH9KChQ93S0dmPazcV5E8SmWXEiyF0eFBmQMj6jGp6iZ6RyeX7
	/M3ntQVR1s0n+aUz977fJ+OSyCQ25rPuxIGh1rCCjFAS29/qpZO09HoEK5WIrBkrdmD2
	kta9kIZYcMzDlK8H5ddSz9zeRxwxwirRGqHsrJP3oufC3fN3U5koVJK9TRYQlZIs4R2E
	4tAaCJPp8D9e72t7uY0qdve663ucwFLtPQF18ISH89hb3qtG8jkaxImujslTw7yMEPF/
	oeow==
X-Gm-Message-State: AA6/9RnQpcP4Eb491VEk+O1yoB36CZy9CpTGo2PNz3OZGW57SmSDDeXuNlFDhlkAC5mno2itPGbH6jMys/SMOIFL
X-Received: by 10.31.0.67 with SMTP id 64mr3186933vka.173.1475187305810; Thu,
	29 Sep 2016 15:15:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 15:14:45 -0700 (PDT)
In-Reply-To: <20160929204647.23526-1-j.neuschaefer@gmx.net>
References: <20160929204647.23526-1-j.neuschaefer@gmx.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 15:14:45 -0700
Message-ID: <CAFEAcA8z+inpOA25CEF3YRVzS7ShGveoPYJUem8bGB7zAmyttQ@mail.gmail.com>
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Fix a typo
 ("Many a flamewar")
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
X-List-Received-Date: Thu, 29 Sep 2016 22:15:09 -0000

On 29 September 2016 at 13:46, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  CODING_STYLE | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/CODING_STYLE b/CODING_STYLE
> index e7fde15..a03a994 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -9,7 +9,7 @@ patches before submitting.
>  Of course, the most important aspect in any coding style is whitespace.
>  Crusty old coders who have trouble spotting the glasses on their noses
>  can tell the difference between a tab and eight spaces from a distance
> -of approximately fifteen parsecs.  Many a flamewar have been fought and
> +of approximately fifteen parsecs.  Many flamewars have been fought and
>  lost on this issue.

Should be "Many a flamewar has been fought and lost".
(This is slightly poetic phrasing but it has a nice ring to it;
the complement does have to be singular, not plural, though.)

thanks
-- PMM

