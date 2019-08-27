Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2WWv-0006Ps-Dq
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2019 04:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2WWt-0006Pc-3x
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2019 04:08:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2WWs-0001Zi-4h
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2019 04:08:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32827)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2WWr-0001Z1-UH
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2019 04:08:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id p23so13676348oto.0
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2019 01:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RiAzpzzr3+1GCbXuk+91ty8sppWP/KZ5taFt9exx4G4=;
 b=wPyu6NnXRuSTUEkm9B4QtgKVsNYdpoc6qZz32I7f9JZzd6Tm9drReixh6FgvvrNbMf
 TYwUiRnG4bsoVXXf5E0HUZDlEGF10U0Wu82pRcypCX7vtSnBe00E2Vn6uvezCMTuj/51
 9ifJ3Aj8Ml4lny1cvOZvmKNlzxsoL4O2SWmjNAAZqr4jhta1V/t+tJo3r8yo3uOM5TY9
 gjK5Gc9K/hGGB5qVHLQQ6rLeR0xw8dgWk0P9VyuDfhWvuvNScj8JhF4aGq5H0KtxdQYY
 lKd/lUzNwykt+ga8+dYMWpQn1dQo76DE7a5vH5e6wMKCUwSvn+9RSIY+SWZ0809ActtH
 RGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RiAzpzzr3+1GCbXuk+91ty8sppWP/KZ5taFt9exx4G4=;
 b=ClNjUF91qJC1duy6ecieH5byNrd8TROUa2mK7oHFtI5ndQ7AG6uQWrc55UPR+mUz8o
 Rzc6R77/rvwE3nYd17DVKBep1VzK1mNOO5SPUhlwcVbefbw8To2PSsEjrL32/71k8c6j
 uP2qv9vVP0V4OfRohkfM+DXdVdn98oorY86q0a3zNrAyPgmWoL38GRK8C97ilyBXqSdQ
 UjPTFgbSDNmkhtC1WvrGQer7HyUgox8SnIx1rN/434v4lEwm3kSdDQJ/GZHsOrWvbENW
 iS3HHetwdK3ikBBU5qaSY38RmsJocUs39EiDd+N7hFCSGz+WorNa9Io25MICj/ognU7Y
 XDYQ==
X-Gm-Message-State: APjAAAUjT9/JiGwUdVzy4SErTMnj15XJqYRZLDfqeeGHFoBZif3UZGJ6
 VvYdJmHN1UWnARimQb/B6V+G/Hnd6d2XP72E4Dihvg==
X-Google-Smtp-Source: APXvYqxDXObk3zt8G4+hwfjhUM0epWIF3JOOu1BDQ9KDpKtXZ276Mv9cO32ZAGE30iVXXSKo3tZ37LHnhkuUIMU07rM=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr2224889oti.91.1566893317285; 
 Tue, 27 Aug 2019 01:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <CADgy-2vznasvwaUwNSi96Sy=ucPC=-3e=O9irqc5DSpV_uhWUg@mail.gmail.com>
 <abf5f3b6-7c05-a85b-051f-9905b8f50041@vivier.eu>
 <CADgy-2va2xVmO_a1gDwg+zkpNcLJTW5D1j=2kk1TnRMxyPaLMg@mail.gmail.com>
In-Reply-To: <CADgy-2va2xVmO_a1gDwg+zkpNcLJTW5D1j=2kk1TnRMxyPaLMg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 09:08:26 +0100
Message-ID: <CAFEAcA_9G9WVhqozgJb1zUxkf_botd-Wq_=X26U3JdwCtMu4+g@mail.gmail.com>
To: Josh Kunz <jkz@google.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Marlies Ruck <marlies.ruck@gmail.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Shu-Chun Weng <scw@google.com>, 
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, 
 =?UTF-8?B?TWlsb8WhIFN0b2phbm92acSH?= <milos.stojanovic@rt-rk.com>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] patch to swap SIGRTMIN + 1 and
 SIGRTMAX - 1
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
X-List-Received-Date: Tue, 27 Aug 2019 08:08:40 -0000

On Mon, 26 Aug 2019 at 22:10, Josh Kunz <jkz@google.com> wrote:
> That said, overall, fixing the SIGRTMIN+1 issue using a more-generic sign=
al-multiplexing mechanism doesn't seem *that* much better to me. It adds a =
lot of complexity, and only saves a single signal (assuming glibc doesn't a=
dd more reserved signals). The "big win" is additional emulation features, =
like those introduced in MUX patch (being able to utilize signals outside o=
f the host range). If having those features in QEMU warrants the additional=
 complexity, then re-working this patch on-top of that infrastructure seems=
 like a good idea.

It has the huge advantage that it doesn't break existing working
binaries. That's the main reason we've never applied the 'just
swap another couple of signals' patch. The other possible
approach for avoiding binary breakage would be to silently
ignore attempts to set handlers for the signals QEMU uses,
rather than failing them. I'm not sure what fallout that
might have, though...

thanks
-- PMM

