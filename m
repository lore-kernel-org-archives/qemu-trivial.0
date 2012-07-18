Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrXCO-0004e6-LC
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2012 12:34:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrXCL-0004ce-9y
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:34:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrXCK-0001Ke-CE
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:34:01 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrXCK-0001KJ-5R
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:34:00 -0400
Received: by bkcji1 with SMTP id ji1so1454291bkc.4
	for <qemu-trivial@nongnu.org>; Wed, 18 Jul 2012 09:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=AgltCMERWu9eBHNUPGJEEz4p+WNZqnABHTJ0B1Wft/M=;
	b=hKaKx5cJWQRHspMVTP43GsXov5qgubO8RR5sdC7o1eEnzfSXs0K7g6teqmzDxTN9Fr
	JgeGDgtQL5sirWsp4ih0ohsosgGKYi8Ow7Fvyr9lInOxG1Ycki0IfHoZsYAbEUCDo8mb
	MNXFcONvfnhef8TDJ82aCccrA5SAQuSSO/P+P/B28r24SDGDSlT1cN2oE18DsglusV2B
	ilphfC30t/zm/s4GtQvBoVT71JnNjUN8NUyo0ScU3htBxWRtFiGpRdiPIFbL7UXRIYh4
	2nZaZjnFkpPXgkKE8fpy+PynqyzaOvXTJetucX8WvKraZVKCAE4o3463WaW4PjG24aaA
	RYwA==
MIME-Version: 1.0
Received: by 10.205.135.6 with SMTP id ie6mr2051531bkc.139.1342629238286; Wed,
	18 Jul 2012 09:33:58 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Wed, 18 Jul 2012 09:33:58 -0700 (PDT)
In-Reply-To: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
References: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
Date: Wed, 18 Jul 2012 17:33:58 +0100
Message-ID: <CAFEAcA-Cg7HOU3okDFUOdD9iG3z4gYKQovoNoFRibVV-1_E3Mw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmY/9a58S6KGtFV6jiMV2Hli8baqYgEYfnoTZY0sp83sO+M8yBH/GSL6QRvFMcJqNl4WyHw
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use macro QEMU_PACKED for
	new packed structures
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
X-List-Received-Date: Wed, 18 Jul 2012 16:34:02 -0000

On 18 July 2012 17:12, Stefan Weil <sw@weilnetz.de> wrote:
> Since commit 541dc0d47f10973c241e9955afc2aefc96adec51,
> some new packed structures were added without using QEMU_PACKED.
>
> QEMU_PACKED is needed for compilations with MinGW.
> For other platforms nothing changes.
>
> The code was fixed using this command:
>
>     git grep -la '__attribute__ ((packed))'|xargs perl -pi -e 's/__attribute__ \(\(packed\)\)/QEMU_PACKED/'

There's one in tcg/tcg.c as well, which you missed because
it doesn't have a space between the "__attribute__" and
"((packed))".

(There are also some in some of the tcg-target.c files,
but those are cases of the packed attribute being applied
to individual struct members rather than a whole struct, so
I'm not entirely sure what we should do with those.)

-- PMM

