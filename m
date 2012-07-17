Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrDRu-00015C-0K
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 15:28:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrDRq-00012k-NZ
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrDRp-0004jO-NE
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:28:42 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:62651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrDRp-0004j8-Fh
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 15:28:41 -0400
Received: by bkcji1 with SMTP id ji1so702576bkc.4
	for <qemu-trivial@nongnu.org>; Tue, 17 Jul 2012 12:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=nkZm8JE6v1be522UXIIlZttGYGZcuuGXa0rCu0ok2m8=;
	b=dCwlAi2fb8wkEcuPl/z13/9XwwpUB1vrQnFVHFix1CDRZmaEUP+Hacw0k85BtUP2qx
	gNBPGB/0oMq6+PwsO9wfvtxU90s+rTgJHp68zjf4gZ/E3JRNY9Fs1Y0GvqkUSTs2uqlv
	JSyjFXyXxahInqVkH8Hl/wM6QnE9xnh6X4aTl/1mOIJJl9TQv9p+uNRH668OPmPfg5Vn
	jzTXCW7QffF2IBg+I9yVSWZnvmmAQTHAt1/ai9wSPD0kB3QX7ENfhXu90FJFt7lKsvbg
	qaP7hUi5OcEezpdmlFhqW4GhGkB8FJXJo4oJEs3Vbrs+FPiWvNdO+HssUR03aNYlA6Ds
	6NqA==
MIME-Version: 1.0
Received: by 10.204.129.27 with SMTP id m27mr21267bks.115.1342553320367; Tue,
	17 Jul 2012 12:28:40 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Tue, 17 Jul 2012 12:28:40 -0700 (PDT)
In-Reply-To: <5005BBD7.1000905@weilnetz.de>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
	<5005BBD7.1000905@weilnetz.de>
Date: Tue, 17 Jul 2012 20:28:40 +0100
Message-ID: <CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkd2DmeBP2bUl7PTgRAbO6CTlLruLlhlM18nWEEBSfIUXURAo1yVr7ka3OA8lnEEfZ7Cp3A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix ALSA
	configure test
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
X-List-Received-Date: Tue, 17 Jul 2012 19:28:43 -0000

On 17 July 2012 20:24, Stefan Weil <sw@weilnetz.de> wrote:
> The arguments why -Werror is a bad idea for some configure tests
> are reasonable.
>
> Nevertheless the QEMU community was able to produce thousands of
> lines of code which compile without a warning, so we should be able
> to create warning and error free code for a handful of configure
> tests.

The trouble is that the warnings and errors here don't cause the
build to fail noisily; that's a big distinction IMHO.
I suppose we could make compile_prog do something like:
 * run the compile test
 * if it fails => test failure as now
 * if it succeeds (and we're doing a Werror build at all),
   rerun the same test with -Werror
 * if that fails, abort configure with an error message
Then we would have the same "make the problem obvious" effect
that plain -Werror provides for our main compilation.

> The 4 patches above are valid and can be applied with or without
> -Werror, therefore qemu-trivial or whoever does not have to wait for
> Peter's patch.

Yes, I agree we might as well fix these errors since we've now
noticed them, regardless of whether or not we apply my patch
(which I've just sent).

-- PMM

