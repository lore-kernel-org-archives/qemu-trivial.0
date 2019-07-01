Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hi3Qv-0001yf-3T
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2019 17:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48813)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3Qr-0001ry-Ql
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 17:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3Qo-0001Xp-GE
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 17:01:47 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3Qn-0001Wz-Pa
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 17:01:46 -0400
Received: by mail-oi1-f195.google.com with SMTP id e189so11107959oib.11
 for <qemu-trivial@nongnu.org>; Mon, 01 Jul 2019 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WggpwXlDzNRUoFUK2Oir8Ae9RI3n4nXwyIR6nC4YlQ=;
 b=P3v8Z0fSwaskP6Q75nnw+a2cRSAgT8Sm8bFZl3LJ4HMcsil6Ll1g/P70Kv5A5Y3ydq
 fimNUd0sTkY1NJcbqVeknFb1VMGtg21dFljamJ42sNmU6yiOkXz//+8q7qsBtUaLmBeM
 c50rM6fuyryDDQ99p8veL6Fk0apuaKSongpBtoLSZvffiuJdwtkFgbdt2tdVKfV5asEx
 kG/nQO1lQj+IEOBJNo2O6ydb4Xu1edla1ZyTjC7l0FlnKPo/crgMk0Zt+eVX+gTkgChU
 DQKcAygNePBkLojakEPla8qjfOg/QUQoVvOsIaN0SuRhPuuIw6ZbkVwRCe1n+CltuqLL
 qwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WggpwXlDzNRUoFUK2Oir8Ae9RI3n4nXwyIR6nC4YlQ=;
 b=rrRRpnfQlA7TuQW1MgcUeU7ntzs5b96r+pcv4CJeXG6tb2M1zEWPibOGP1ux+r1xYO
 fRfLtlmiXNLUKGPgBd8X5BbuPUj9u7tVL2JaQFQ86Cto0V9w+FFBq3Q1kqWRjCWmHKJD
 lS+Zn/6I6qaKrx2CrGuMCs7CWf8dXJnrBMjRcWb9Bx0f/L1uVUy2TDV3CmIM3pDBr0uN
 1Toce/XRz+KJ7XdYfkDZtsEyaIJ8XCab1H+3Dw1UOUhXZFUDg61lyWXkwOqpM3fUhFZu
 hV7zs4LdOgTssrrJmWaK2TcI0qyqN4RnowtNfqd32bm1rzIv6Rpjl2QfrxD/r86lDHrW
 q3kg==
X-Gm-Message-State: APjAAAXqnIWEeoLpLhVTX+/fdQyseE5fIZpo0RvlftvH4e+XLq8x9I+O
 LvqfsApe9o3FfwHdcIUiatVz46eOM9PrqqcWOqZB4Dsg5Ls=
X-Google-Smtp-Source: APXvYqyKqAllzlOXtFrs7pLk9OQB2tedJY5vDpEuQHRTJj08K4D6sqdgaZwd+gwEuNnqi0Jw/sXUtu4PCBZMaJKgUiE=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr218073oij.98.1562001196658; 
 Mon, 01 Jul 2019 10:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190626200252.30220-1-laurent@vivier.eu>
In-Reply-To: <20190626200252.30220-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 18:13:05 +0100
Message-ID: <CAFEAcA8PU2Tt9nXUA70vP6g6zRwROTMro16Tu+gPz_ihOimyyg@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.195
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/4] Trivial patches patches
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
X-List-Received-Date: Mon, 01 Jul 2019 21:01:51 -0000

On Wed, 26 Jun 2019 at 21:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to b827891d73778eaf962b0536f955194cf4faa424:
>
>   MAINTAINERS: Change maintership of Xen code under hw/9pfs (2019-06-26 18:30:03 +0200)
>
> ----------------------------------------------------------------
> configure improvements and fixes
> MAINTAINERS update
>
> ----------------------------------------------------------------
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

