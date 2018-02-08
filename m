Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejpRo-0003O8-WA
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2018 11:53:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejpRi-0003Hu-BT
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 11:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejpRh-0005iv-GI
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 11:53:14 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:38003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ejpRh-0005i9-B7
	for qemu-trivial@nongnu.org; Thu, 08 Feb 2018 11:53:13 -0500
Received: by mail-ot0-x241.google.com with SMTP id h14so4937014otj.5
	for <qemu-trivial@nongnu.org>; Thu, 08 Feb 2018 08:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z23TvmUzvPRYx2qQ+UDFbqfZswvLmd4TjrWmw8R9NS0=;
	b=b4ifC2RJHmodsfoRLv89M81INz9qqxBX352JTZ6JKnsCZSFN0an5/30K5riGsUt1V9
	axmAgIVm/AXB1/SoxQ5B4LTiuP2tF3XNhuWpM4jqwSpkQGw6bIcxwRFsULVMnxhPvuas
	z2cD5X1uSvy7GBdbaulWtQv5mzBkpk40bY0UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z23TvmUzvPRYx2qQ+UDFbqfZswvLmd4TjrWmw8R9NS0=;
	b=bGju9omHXs1AIdXEg+5ZV8p4KLe1zOaa8MzLPGgvG9kVNY0rWjWkeVqGTECRmgKUFx
	9lOv0HiNqwSPV80DVOqITKWPBHXws6k0s++XEui/L4ppzIBvk1jlo7wd1hJxSNOCgdBq
	hb4mqs6YIl0ta4ObKZa1guN8TLpSjRaKn4fi5NkNQEnZxJutybNE5ecL9sCxduHuLXKD
	M7Ivf4leN1Ms4q0O6s7MC8iyb1lSFb8vdNfcMlZnuPi+Vlb++y+P8/yUe2/cjaQZr+ry
	2NlA+2N91OsifF8H7RqaN1cI5g1dK7YRrIIakORd2oVWTlGt23NPI0nFMv5Jsh9FkFYJ
	Jysg==
X-Gm-Message-State: APf1xPBAK1Z+pxZxJEfTZ1bQHckYDQ4WMOe43+7/P5m6E0SMgo+dIsM2
	O1NS/Ex85xbS3jqWfjya3e8hsK/bHJ8FQy3J+Yk+IQ==
X-Google-Smtp-Source: AH8x226Jw0FQnPsW41D1zgyckqH0bCE2WCThbMdBvru+NhIKt5P5jf8j6moDdOMvH9P6U37UQhV1hphBjsslJRcqedI=
X-Received: by 10.157.29.211 with SMTP id w19mr993969otw.24.1518108792319;
	Thu, 08 Feb 2018 08:53:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Thu, 8 Feb 2018 08:52:51 -0800 (PST)
In-Reply-To: <20180208162447.10851-1-marcandre.lureau@redhat.com>
References: <20180208162447.10851-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2018 16:52:51 +0000
Message-ID: <CAFEAcA_WixzeBt-pJtgpqptd47nAq40GYPxqH4r0VpH8V6qENQ@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: fix spelling
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
X-List-Received-Date: Thu, 08 Feb 2018 16:53:19 -0000

On 8 February 2018 at 16:24, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> s/pupulate/populate
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/qemu-coroutine-lock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index 846ff9167f..3d0152ebec 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -87,7 +87,7 @@ void qemu_co_queue_run_restart(Coroutine *co)
>       * invalid memory.  Therefore, use a temporary queue and do not touc=
h
>       * the "co" coroutine as soon as you enter another one.
>       *
> -     * In its turn resumed "co" can pupulate "co_queue_wakeup" queue wit=
h
> +     * In its turn resumed "co" can populate "co_queue_wakeup" queue wit=
h
>       * new coroutines to be woken up.  The caller, who has resumed "co",
>       * will be responsible for traversing the same queue, which may caus=
e
>       * a different wakeup order but not any missing wakeups.
> --
> 2.16.1.73.g5832b7e9f2
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

