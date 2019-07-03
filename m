Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1higVs-0003qs-Tz
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2019 10:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1higVo-0003pn-AF
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 10:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1higVm-0000NB-CQ
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 10:45:32 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1higVm-0000AK-5g
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 10:45:30 -0400
Received: by mail-oi1-x241.google.com with SMTP id w196so2270363oie.7
 for <qemu-trivial@nongnu.org>; Wed, 03 Jul 2019 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2/XGZvCPj7K96o7rOY0bGH9oK+Uknf6IZgXh3Qfk9WY=;
 b=rIXhx5WA7MHcPT4hY5+mg5HspTF775At5sD88jIfIwcFIXsqgl8eLxhSS5Plw7HTH6
 /1sHRJYJRyf+BtKbY0xMtDEfbUBQRPhAIg9NnYUV18CK/+Ol9APAWSW/TaRRbhfd+UEj
 sWkHvMuVAFMG28NX++8UrhDEiJNNl9VsQixgaoomvWVO88F+Oyimn36pwH3CURqtsLFV
 ZweDmuhDOhQvPBu56QF0j51GbuD6QfGUybCpcAvFZgnxZDU8o1LdyNVb75m1nmltfy5k
 iRUHEd338J/o21MAT2u7qt9vXsD7ptgcm0fAjR/ka/q4xGw+SqGJf3ljYRIiofzl2ElM
 K0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/XGZvCPj7K96o7rOY0bGH9oK+Uknf6IZgXh3Qfk9WY=;
 b=qQEcy+RcQTqnz9sClJLdFdG+XjG0/+O/puDfI0d2TVJqCHLnck1ELVuKVe5ZkE+FBx
 50Bn+oxg8XMYM5Lk4603bf6KZt/VV1OSvai+OLSVZqSYu3NAdL//ikjuPOfi4coybm0l
 SGv2xlQ4oehREVogcWXqbDYFVT+70TGr1nKri6FDMWPqHTnXTSr08a3W75wES7nQOSZN
 sL+C3+m01DT3T8aW15x98v4Qise5EeMRnejybzK18MmLy15XZylXAru9lWgerpcZlenr
 LXihyOSKbdzhVGE+gWsHprgl1f8AjDV9rlvpM4gR7FNpEHGDHD/6CQer46FuXyJvJPVA
 KohA==
X-Gm-Message-State: APjAAAXuPnnXGMDaO8fGDvoICI0M1ieKXMmXu1JMOCKBXqrD2dIU48WW
 HEDB5eBe0JPoFudpmTWrMUnb/LOOsET96GG7KL6Pfw==
X-Google-Smtp-Source: APXvYqx//7rzWKljqJKbLEEs7YbT5pI9JtaLHniKm3GTLwqT/w1X2wZWeCF9dQhtNBV3s74OCMBPf54MlEahUg3Dxd0=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr6874606oie.48.1562165117371; 
 Wed, 03 Jul 2019 07:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123713.14396-1-laurent@vivier.eu>
In-Reply-To: <20190702123713.14396-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jul 2019 15:45:06 +0100
Message-ID: <CAFEAcA_Zu0X1zLfKtBkQdi25KCkjf_PNu8zKWE5Dx7uzzLEzBA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Amit Shah <amit@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/3] Trivial branch patches
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
X-List-Received-Date: Wed, 03 Jul 2019 14:45:34 -0000

On Tue, 2 Jul 2019 at 13:39, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7d0e02405fc02a181319b1ab8681d2f72246b7c6:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-patches-pull-request' into staging (2019-07-01 17:40:32 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 7c955080d40ccc7952a0479bc160f2b048c0af53:
>
>   docs/devel/testing: Fix typo in dockerfile path (2019-07-02 10:12:32 +0200)
>
> ----------------------------------------------------------------
> Fix typo, fix sys_cache_info() on FreeBSD/powerpc,
> change virtio-rng default to urandom
>
> ----------------------------------------------------------------

Hi; this makes 'make check' fail on OSX:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
tests/test-char -m=quick -k --tap < /dev/null |
./scripts/tap-driver.pl --test-name="test-char"
Assertion failed: ((isize & (isize - 1)) == 0), function
init_cache_info, file
/Users/pm215/src/qemu-for-merges/util/cacheinfo.c, line 179.

I guess this is the sys_cache_info change.

thanks
-- PMM

