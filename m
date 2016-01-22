Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aMg3r-0000of-NL
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jan 2016 13:03:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aMg3p-0000oR-7d
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 13:03:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aMg3o-0005gY-8O
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 13:03:49 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aMg3n-0005gU-RA
	for qemu-trivial@nongnu.org; Fri, 22 Jan 2016 13:03:48 -0500
Received: by mail-vk0-x229.google.com with SMTP id e185so45330294vkb.1
	for <qemu-trivial@nongnu.org>; Fri, 22 Jan 2016 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MJT/F5/YM9t6//zGCp81rDqIA3wW2wMdCNwpO6nk3bQ=;
	b=X1XV0mL6VbyFQPiV/GY3Uwb7Kh9nR8yhH5A+CLBNGCwNOR5gD9UP9R8Ni5ER8WkcG7
	3Oj0RfQRsyHhbtBkGJ9TVodK4b+jtrwDs5KDzqLTb9mDD8sCnpY4IfJk6u28xa12DR/0
	RqgwbQlvvEId3Al1j1Okn9hhjkiIptRHdLTgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MJT/F5/YM9t6//zGCp81rDqIA3wW2wMdCNwpO6nk3bQ=;
	b=bgSDnCtW4AAB9P/vwlFgQqoIKux/K3GZnrFrFtOx3GiB9BV8uRNtu2sUBPCdNPHNJ1
	pCAzS3y6dRdJ5RJ8Y47FIFyrD8c8piPWBKbEFMA3IYOgXDm76sRCr9ppPFvDTQz6n/KZ
	9cGrkWnIcwNiA0cr5tBSLHgmIlChn2slf7vTIYnQX5qAGD3kgqTWwpjBlf7EeM64ywJb
	cCafKHQZAoCVj+vMC4LGthRCoGRUiGHqOfuG+Gj2VNACqtxeL9JB9cv+VZljGQgdkSDv
	2/TeQqj/zCM8cj+/NMDa0zVfIq2kQypM3UPEJMNQuDHkTlZ+sICSxFDBEdyQOEm67cRY
	qDag==
X-Gm-Message-State: AG10YORWLsffvBj49FOcLeQgKWVyg9g+xO/lz+CHgga/L3rV2+bSaOe5dJ84fSqYbcXVQsiSVNjhA/0LQIGYM1WC
X-Received: by 10.31.180.145 with SMTP id d139mr2490047vkf.83.1453485827113;
	Fri, 22 Jan 2016 10:03:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 22 Jan 2016 10:03:27 -0800 (PST)
In-Reply-To: <1453484125-4064-1-git-send-email-berrange@redhat.com>
References: <1453484125-4064-1-git-send-email-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2016 18:03:27 +0000
Message-ID: <CAFEAcA-VPR+WbdM_R3-t-NQo7DkSpr6k-XiBknfDviy1Qmc2Gg@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Bruno <sbruno@freebsd.org>
Subject: Re: [Qemu-trivial] [PATCH] char: fix parameter name / type in BSD
	codepath
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
X-List-Received-Date: Fri, 22 Jan 2016 18:03:50 -0000

You typoed the qemu-devel address...

thanks
-- PMM

On 22 January 2016 at 17:35, Daniel P. Berrange <berrange@redhat.com> wrote:
> The BSD impl of qemu_chr_open_pp_fd had mis-declared
> its parameter type as ChardevBackend instead of
> ChardevCommon. It had also mistakenly used the variable
> name 'common' instead of 'backend'.
>
> Tested-by: Sean Bruno <sbruno@freebsd.org>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  qemu-char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index e133f4f..aa2e660 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1835,12 +1835,12 @@ static int pp_ioctl(CharDriverState *chr, int cmd, void *arg)
>  }
>
>  static CharDriverState *qemu_chr_open_pp_fd(int fd,
> -                                            ChardevBackend *backend,
> +                                            ChardevCommon *backend,
>                                              Error **errp)
>  {
>      CharDriverState *chr;
>
> -    chr = qemu_chr_alloc(common, errp);
> +    chr = qemu_chr_alloc(backend, errp);
>      if (!chr) {
>          return NULL;
>      }
> --
> 2.5.0
>

