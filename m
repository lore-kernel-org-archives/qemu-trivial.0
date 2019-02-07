Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grk7V-00050O-Nv
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 08:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grk7S-0004wz-Pa
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:53:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grk7N-00031g-MR
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:53:33 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grk7D-0002ui-BH
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:53:22 -0500
Received: by mail-ot1-x342.google.com with SMTP id u16so18259829otk.8
	for <qemu-trivial@nongnu.org>; Thu, 07 Feb 2019 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=URxoLqtevMMTtcw9GydALZADv7MtnliQLhojZyZXI9I=;
	b=KZC/UAjNS5LmfGzxLZyO0FfaedeUpLQzipKnUWiZJ32YRb/dESbzP/8abGt3uMAIJF
	Q25nbZP5lnCaKoDuvOPQJzOrWAeOJ8uj6GwCuwXJgt2VgGZH1bNpsYDg69znEpfHwPiS
	W9g8t8bNVtIPYwUZwHI+Pa7EvWzqP/x0Istl9hcdywAZ6fYFTM6g2LREjUbp1G4tp9sP
	wXu/ZRcSNIA++6VhGQK0kUGWVxfBqi1O7Z2SnU6Wui/N927o9W/XegGdTlSG1zv3c/kL
	mgaFTiYczsgJkW65awbRSDN+oagC8qXyZyPoUxIZykip1NtB97+S2LjhfLsSyXsfdjDE
	hHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=URxoLqtevMMTtcw9GydALZADv7MtnliQLhojZyZXI9I=;
	b=IMx/uK5b2cpNhs/T2RUMS+shDU1M/nkkavFy5t/+eP97fYtfZaOzzR+VBricEfOjiK
	QbFfZ6Zj9vxmEpWAhRo6B+boy6Ubi6bIrk6HosOTy8KTtg/U5NPGc4nVHOmNtyIaYXGq
	TFRmK+GDCsHjqv1oLVss9cC5bMptRjoEojR4rydF/0KJjwD9M0AaCEa56CRB5A+hg03C
	InrATX0hTaAdrMTYrZQRRrdAWhKwFbR5PuaJdbtB1X9KWeuJZz99tzCKZItCaNEXA/rJ
	qOmhqv3iH+FR5O6TDDC1TnUme332WPWoFoxYjXybHwjo1WgbEVCqFPhDfheCveRPhwGq
	/I+A==
X-Gm-Message-State: AHQUAuYHD//+AHpf7EoaRGcj0zBnR2qXelWpfxoa/tOTAXn9EpFyN6k2
	7x3M28cheawMTGSLw7u46/OiqwYskQunAUwHuvkByg==
X-Google-Smtp-Source: AHgI3IaT2yhl7YRfPxQXokbDZyHyWu1ib00D+LdwtNzHIdEz0N35Qyy8UuDTIGY7Hg/Hx2AzN3qVv7aAlDNYlhGQqZc=
X-Received: by 2002:aca:2801:: with SMTP id 1mr362831oix.98.1549547590591;
	Thu, 07 Feb 2019 05:53:10 -0800 (PST)
MIME-Version: 1.0
References: <1549545296-18903-1-git-send-email-thuth@redhat.com>
	<1549545296-18903-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1549545296-18903-2-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 13:52:59 +0000
Message-ID: <CAFEAcA8ROQPX5SXFOTEzpdmx+RQXbQTN_Cj3JcUHZ3RbSGwq=w@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH 1/2] qemu-deprecated: Remove
 -virtioconsole and -no-frame for good
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
X-List-Received-Date: Thu, 07 Feb 2019 13:53:35 -0000

On Thu, 7 Feb 2019 at 13:15, Thomas Huth <thuth@redhat.com> wrote:
>
> The two sections have accidentally been added again during the
> merge of Paolo's and Gerd's trees.
>
> Fixes: 3e29da9fd81002a0c03041aaa26dea6d9dd9bd65
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-deprecated.texi | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 80b0702..90e5860 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -37,18 +37,6 @@ would automatically enable USB support on the machine type.
>  If using the new syntax, USB support must be explicitly
>  enabled via the ``-machine usb=on'' argument.
>
> -@subsection -virtioconsole (since 3.0.0)
> -
> -Option @option{-virtioconsole} has been replaced by
> -@option{-device virtconsole}.
> -
> -@subsection -no-frame (since 2.12.0)
> -
> -The @code{--no-frame} argument works with SDL 1.2 only. The other user
> -interfaces never implemented this in the first place. So this will be
> -removed together with SDL 1.2 support.
> ->>>>>>> remotes/bonzini/tags/for-upstream
> -
>  @subsection -clock (since 3.0.0)
>
>  The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
> --

This was a mismerge on my part -- particularly egregious since
I left the >>>>> conflict marker in...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

PS: do we have a document where we list the options that have
entirely gone away, so that when a user of QEMU 4.1 tries
"-virtioconsole" and it doesn't work they know what the replacement is ?

thanks
-- PMM

