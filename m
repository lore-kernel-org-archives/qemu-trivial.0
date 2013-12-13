Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VrYyM-0005KC-Tu
	for mharc-qemu-trivial@gnu.org; Fri, 13 Dec 2013 15:04:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VrYyI-0005Hq-G6
	for qemu-trivial@nongnu.org; Fri, 13 Dec 2013 15:04:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VrYyC-0002f1-4X
	for qemu-trivial@nongnu.org; Fri, 13 Dec 2013 15:04:26 -0500
Received: from mail-pb0-f43.google.com ([209.85.160.43]:59239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VrYyB-0002eX-Ur
	for qemu-trivial@nongnu.org; Fri, 13 Dec 2013 15:04:20 -0500
Received: by mail-pb0-f43.google.com with SMTP id rq2so3013033pbb.2
	for <qemu-trivial@nongnu.org>; Fri, 13 Dec 2013 12:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QSICL7W9rQlJjovaNbv4KtGJU4fSuSd6KJJbSXl5pnw=;
	b=OL2MLGTX0iSq2kdd3ohwQx9MDN5AEjuVSG429VPSyZjcHR/6XlD1LIVLc4WxPae/Ti
	SGX5Hq0cwQqOb2chwiHK6hZCMmpAWP0NgohO4PsgqAJXMSD7uqp2ohWPNCtwgGN0v3F/
	oNc9PP37dL/dNrgbBe4RyDb48G9Pt2EXWu7qEE7psJCXmk7XxfDyCQa+3wUj7Fj1UmpW
	+yr/w6J1joc4gkPWgCsyWmJq419JOuF9HZuMNi4v9E2emj8qqDqObV0GdJJKRK8K/pZY
	Pc4T9ihV2fQ1mjzjSyNBBN+S82v1LPRchwdSvCy5TzEiK6Rl+VjLhWj5FMmrWj5T0i0d
	IZUg==
X-Gm-Message-State: ALoCoQkHwHvPh1RAJP9sTzJMmBAK81ECu41Hm//LdgYvE5wXDceG/bYI7pM5+kul4RzPwOEMe/yd
X-Received: by 10.66.218.226 with SMTP id pj2mr5426553pac.62.1386965057909;
	Fri, 13 Dec 2013 12:04:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Fri, 13 Dec 2013 12:03:57 -0800 (PST)
In-Reply-To: <1386964198-10981-1-git-send-email-sw@weilnetz.de>
References: <1386964198-10981-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Dec 2013 20:03:57 +0000
Message-ID: <CAFEAcA9re0nADLkRU2-aZLGBMuUmKP=Hi=2gMZWKo0zgFJvnRQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.43
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cocoa: Fix typo (aditional
	-> additional)
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
X-List-Received-Date: Fri, 13 Dec 2013 20:04:30 -0000

On 13 December 2013 19:49, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/cocoa.m |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index be49179..6569326 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -204,7 +204,7 @@ int keymap[] =
>      200,//  126     0x7E    0xc8    E0,48   U ARROW QZ_UP
>  /* completed according to http://www.libsdl.org/cgi/cvsweb.cgi/SDL12/src/video/quartz/SDL_QuartzKeys.h?rev=1.6&content-type=text/x-cvsweb-markup */
>
> -/* Aditional 104 Key XP-Keyboard Scancodes from http://www.computer-engineering.org/ps2keyboard/scancodes1.html */
> +/* Additional 104 Key XP-Keyboard Scancodes from http://www.computer-engineering.org/ps2keyboard/scancodes1.html */
>  /*

Please don't put this in -trivial, it will conflict
with the patch in my recent cocoa fixes set which
fixes this and other typos:
http://patchwork.ozlabs.org/patch/298905/

thanks
-- PMM

