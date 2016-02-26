Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGhh-0003Pn-8R
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:37:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGhe-0003KR-Ka
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:36:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGhd-0000cI-SG
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:36:58 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:32960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZGhd-0000c9-Oj
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:36:57 -0500
Received: by mail-vk0-x234.google.com with SMTP id k196so75237437vka.0
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yUUwuvm7lD2ZcbzRej6Jau6FTD1cPIBouprdKX/i9So=;
	b=ShzgwJhWs4QPxjzVRrIZ9RjQ9pDlJCYfGQ2twyc8Vvd8qjJbuTjtYW/3m53bGyLgXv
	pp83i4wELIcAdVbB1TEWRrbF2U0zMR2xLOHGmcknM4OvM2PO3kkskfUe9/b/BkibQRiF
	NmSvqkJCDjSz8bhhiGpAJev0z+fntVpDusEWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yUUwuvm7lD2ZcbzRej6Jau6FTD1cPIBouprdKX/i9So=;
	b=KjWe6nFGd6Wy2/1By5Oh7DaEQxgW343NlQY3Nwrg1jMPTrnJsietfQuhP7KwXPeOz5
	mMyt7QmwMhq4KaZr/8Dhf+iuGqyD1QbeomMOBkM5b3tW2gHf11CAgXPVcrhoXztdIF7o
	Xk2W2PS9VUnHFSxP9O//CJTJ0KYZ8rtKGz/yjBhaCqDKJ4Am/2JS9O0vLDi6l9hH/Ln4
	9Pkv0jwtqdh37soz9BSgKEBhrmNq8pctkyZUYc73iyEyt4N3yWAueCWwT6BHuHr4Fq1P
	AX8jqcY/xkIzPjmZ8T7tSqs3IHjCeOYf85TxkK4X2Dl4Imoc6UKEspNMBOB6CJlidi6q
	q2wg==
X-Gm-Message-State: AD7BkJKU/9PWQjCb3yQAUJCApW/E33uqxyE1ICJSy75SGjjCVgEdAT8af4z5gCXdtHTsNqSxqECJIn5SMPn1kwYs
X-Received: by 10.31.52.147 with SMTP id b141mr705681vka.82.1456486617380;
	Fri, 26 Feb 2016 03:36:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 03:36:38 -0800 (PST)
In-Reply-To: <1456486178-8074-3-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1456486178-8074-3-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 11:36:38 +0000
Message-ID: <CAFEAcA9PD6PTr74rF4ZudpG7GGbmuvjd7Hn6pVexh+mE+XAwDQ@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/2] doc/memory: remove
	the stray extra '-'
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
X-List-Received-Date: Fri, 26 Feb 2016 11:36:59 -0000

On 26 February 2016 at 11:29, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  docs/memory.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/memory.txt b/docs/memory.txt
> index 306280e..d5c216c 100644
> --- a/docs/memory.txt
> +++ b/docs/memory.txt
> @@ -185,8 +185,8 @@ an MMIO region mapped at 0x0, size 0x6000, priority 2. B currently has two
>  of its own subregions: D of size 0x1000 at offset 0 and E of size 0x1000 at
>  offset 0x2000. As a diagram:
>
> -        0      1000   2000   3000   4000   5000   6000   7000    8000
> -        |------|------|------|------|------|------|------|-------|
> +        0      1000   2000   3000   4000   5000   6000   7000   8000
> +        |------|------|------|------|------|------|------|------|
>    A:    [                                                       ]
>    C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
>    B:                  [                          ]
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

