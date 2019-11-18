Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWeu5-00005D-De
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 06:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWeu2-0008RG-5G
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 06:09:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWeu0-0003WN-US
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 06:09:05 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWeu0-0003W0-Ok
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 06:09:04 -0500
Received: by mail-ot1-x341.google.com with SMTP id f10so14145516oto.3
 for <qemu-trivial@nongnu.org>; Mon, 18 Nov 2019 03:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KbOVYI+ydVbw+ayeWHjOmyxuU9+KfHJGy84vYvqdy9s=;
 b=hSLu42dWg+4ySTpZ2I4mGW4pAAeTzFTUAAa83tYa9VD0jog+kuZE1CvsyT2Kx2bff4
 ANbPfEKiz67XlBMgmTYa+z4TPD8DffVadWv7GL/4zQl1/a6WAKMrYWyEuTElW9tD/xB3
 eA+B4QdYQzdEvpCiILlGAAx5HNNr47PDEeRFOiCfwqTGaOgGMTWl+jdHZORoP+hIzGfP
 DBUeS+xPoMQ9EGFMpF9bOR/Xlt1MIvQjdcM7mbN1A6a7bSuDjuJMpV/EUr/xZjbSkaSa
 wA7B5BB2RookBpOTluNE4P/a5ey3sya0IfvZMun1KstLHzUC5bhCpLlI/jLlfnc8ioHB
 3qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KbOVYI+ydVbw+ayeWHjOmyxuU9+KfHJGy84vYvqdy9s=;
 b=t7+wi/fU7hTXYEqFbCM2KSbkjDOvfAq/3GEo8fRorjS5TZgIIlwAYioHDR7EZgpt7n
 vb0tlh1WCqj3+oIHPSkViC6QLsVx9mXrYIAR5HtNbmvKi3ZDv+pEJj7izyD/IQCCwLwc
 Lu6etf8zCbQIGA5yRqpbxjoS5QAB+Tp9itkEA/+xh9p3LFNEktsu0H7WRkSL7eepRU4B
 rcEnG8VI+2lJcJ3G6MUeiAZLx0nObFZyA2N6sjeK+UUVjPYLUmMkxFvXtjy4XTY3pGxz
 9OlgddVm2cbKH4UFwEg9l0qn0fPmgn9onOWkGwLydEYrBjQZ9O/0dAh4aMw4QMQjnM47
 amcQ==
X-Gm-Message-State: APjAAAXxA4FQMGefR47NTXCVCF0uTdTwTwjsc6rQiwl0Vc6OFgfTKu04
 h3za9Xes9M4eIaI07UeIoc3yWvTgz4DO/PYgXNJw6w==
X-Google-Smtp-Source: APXvYqyUh19/Z0u4lDrtc79M/2whl5pbMNjbHkZkA2bvc5AEZdmux02VVcsEWgIaHd6btvg4Adp13zGOQNiMWuXc6ZE=
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr22073430otn.135.1574075343680; 
 Mon, 18 Nov 2019 03:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20191023101956.19120-1-kraxel@redhat.com>
 <ba8b74e7-8c37-dc76-a77e-33448b698777@redhat.com>
 <87blt9y2c4.fsf@dusky.pond.sub.org>
In-Reply-To: <87blt9y2c4.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 11:08:52 +0000
Message-ID: <CAFEAcA8yQm7B7Cdif8GtzL_67io_-DvHZzV6H+Aiy+L0CaP2Rg@mail.gmail.com>
Subject: Re: [PATCH] buildfix: update texinfo menu
To: Markus Armbruster <armbru@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 11:09:07 -0000

On Mon, 18 Nov 2019 at 09:13, Markus Armbruster <armbru@redhat.com> wrote:
>
> Laszlo Ersek <lersek@redhat.com> writes:
>
> > On 10/23/19 12:19, Gerd Hoffmann wrote:
> >> Build error message:
> >> qemu-doc.texi:34: node `Top' lacks menu item for `Recently removed features' despite being its Up target
> >>
> >> Fixes: 3264ffced3d0 ("dirty-bitmaps: remove deprecated autoload parameter")
> >> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >> ---
> >>  qemu-doc.texi | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/qemu-doc.texi b/qemu-doc.texi
> >> index 3c5022050f0f..3ddf5c0a6865 100644
> >> --- a/qemu-doc.texi
> >> +++ b/qemu-doc.texi
> >> @@ -44,6 +44,7 @@
> >>  * Security::
> >>  * Implementation notes::
> >>  * Deprecated features::
> >> +* Recently removed features::
> >>  * Supported build platforms::
> >>  * License::
> >>  * Index::
> >>
> >
> > Can this patch be included in v4.2.0-rc2 please?
>
> Cc'ing qemu-trivial again, might be a workable path into -rc2.

I've just applied it directly to master. (Not sure why none
of my build test machines complain about the error.)

thanks
-- PMM

