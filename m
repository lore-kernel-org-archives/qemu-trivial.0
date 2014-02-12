Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDfgO-0008T7-7m
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2014 14:41:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WDfgH-0008Rj-O9
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 14:41:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WDfgB-00045u-It
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 14:41:13 -0500
Received: from mail-la0-f43.google.com ([209.85.215.43]:65102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WDfgB-00045f-BM
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 14:41:07 -0500
Received: by mail-la0-f43.google.com with SMTP id pv20so7603173lab.30
	for <qemu-trivial@nongnu.org>; Wed, 12 Feb 2014 11:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fI/luT+J1Dhi/spuBB7NVcN7ojppB02SNxWjucxEsIo=;
	b=fs6AWdGureu3UPMnf6iOf3itpcm9MMeRrIkKsco9MUGadZJtOZkhMLtrUOZ9wnS1pI
	73g+rRTz72L4HigS8QBbwadwqyhE0NPpH/NnEEHfxvfjPjk+jTe47VpiNktzBmW3ckWa
	2TMM8zOY7iH8N3o5LnIwC8hDn75DtuNEFMaTz6sShzLX2p1OHuKpWmDFS8/N2fUaaoQF
	erKWh7RnPC2fg0ugsgnIToriEkhKarA7P6kIOsN79ZTd3ho9v9spnWACsAOJP7Il6rg1
	OyHX4bSTodcNsn+O4p50P/IE27Qhjbt8yrRSTwA/rb7OQlui5tNwSOGxpBkOXHnvdn/y
	y/xg==
X-Gm-Message-State: ALoCoQmvnsqlvoQw77h7jdhU8nXD6avzS4u5mMcNGSzL0lYrKe3mbivd2j3jCcJhkq4BNGkbEHQL
X-Received: by 10.112.132.102 with SMTP id ot6mr30845759lbb.27.1392234066275; 
	Wed, 12 Feb 2014 11:41:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Wed, 12 Feb 2014 11:40:46 -0800 (PST)
In-Reply-To: <1391669798-23577-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391669798-23577-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Feb 2014 19:40:46 +0000
Message-ID: <CAFEAcA-Fc1YvgnGWA9Zkc6FXSnk4Cpwe+0MuQOspDvJ6C4ACSw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.43
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: simplify/refactor socketcall
	implementation
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
X-List-Received-Date: Wed, 12 Feb 2014 19:41:18 -0000

On 6 February 2014 06:56, Michael Tokarev <mjt@tls.msk.ru> wrote:
> socketcall is just a dispatcher, it accepts an array of ulongs and should
> call the right socket function.  We tried to handle arguments for every
> function case, and did that differently, which in the past caused errors
> due to wrong types or sizes used.  So instead of extracting args in every
> case, do it once (based on a small mapping of function num. to argument count)
> and once this is done, just call the right function passing it the extracted
> args in a ready to use form.  This also simplifies the function alot.
> +    /* first extract args from vptr according to ac[num] if num is correct */
> +    if (num >= 0 && num < ARRAY_SIZE(ac)) {
> +        unsigned i;

I think it would be nice to have here:
    assert(ac[num] <= ARRAY_SIZE(a));

just as a reminder to bump the ac[] array size if anybody adds a 7-argument
function in future.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Incidentally this is how the kernel itself handles socketcall, so
putting everything into abi_ulongs is semantically correct. (The
kernel's mechanism for looking up the number of arguments for
each call type is IMHO uglier and less maintainable though :-))

thanks
-- PMM

