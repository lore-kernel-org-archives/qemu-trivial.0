Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sE9Mk-0004Uz-27
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2024 11:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sE9Mh-0004Gy-O1
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 11:12:51 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sE9Me-0004io-0A
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 11:12:51 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52b83225088so4203779e87.3
 for <qemu-trivial@nongnu.org>; Mon, 03 Jun 2024 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717427566; x=1718032366; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFUcXpOs8LuKXpB3xp1QT8gFCh40XjLHsjXXilpajs8=;
 b=po4xbwkOwoM1QPSJmnRLYG+yNpmE/88wpSxscLJAoB3oI6NfjsJL5tFQI3/IFEM04J
 feIY2LEzbaT42QvOL2Uu8514yVBqDTQLWrDqNBDk1Zf/LV7+ZhccfIIGiOuFvEOu5HwO
 x7gXupt8kX3sQQalAP9ncwsJK10ZvPs2wTu33WVdPRCQoVCtSeDu9udOxltmnTMV+oPi
 fbBCfrzYlOlyDmHmDq0Dur1cwR9nEM/fZFG35kTcd64KQiSA4a06Ag9WG3UKKQIQE7V4
 Z2jiF9UfxymSNBJKaRtpXp8/3ydDPVh4i0yW0S2eQZCEzBAsqbu/GxSN/pMYCZWkr14U
 YCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717427566; x=1718032366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFUcXpOs8LuKXpB3xp1QT8gFCh40XjLHsjXXilpajs8=;
 b=uEBeH6AIQ6IyeTS1Z7v6UI3M+1E3+cgOke5BD89DEGvoMmpnJC3jzeIv8GlwH1CEE+
 srHoqdMcDTIYUoB2SFNzroANlb8GyET+EZXjIaJLU7OZZc0M0FJJ5CdFgDMjfkyHYkUM
 t7gnrvW9rt+J5iLmxN1BitQyywkXBU4ecYZ5/7NFpScIQAVtg3YRmYDMkAV6R1RnQJCv
 eGCLegovvJ2hxuxLvW2aPZNtsNDX827dUuaoRX7t14Xd88vuzNT4hHE8UiyaSJUuCnES
 wJW96eTkU9vgHoeHizNZRiDmNuslP+YVOGULHj4U3JShhsOKYY+ABaTuEu50tXBo1Bh9
 ryjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkrOwxUE87mHhwOuL0oU3Bke4ggXMOoiAY4EOP/uhEAFBjWkgnhFQXWbs/R4CYOsAjTHpbGqfULBm4nGYHQfVss9p79cUR0A==
X-Gm-Message-State: AOJu0YySLdyvl9TMMtwl4gz5tYfF9TXVKTIO0lPuUWfmVJiNmjQVAwqv
 9Z8QmuZ2BNCCMVEe78lXIniPJFLLlsLUlo2YmwkmosmZV0rMa8RrT/cAjER4G7zM4Qow/uRMS1D
 GHyQGF/HWB5nL2ag0U3lYvDax/layuh2zDTwQsw==
X-Google-Smtp-Source: AGHT+IGF3RQ6/gcXnucJvEqL++Dv/CC5Ck7dKEkOpBDMEm/H3ScxQ5/9Unho7ZcPInyoDxXMiM/lUbRKeLwNSYblbrQ=
X-Received: by 2002:a05:6512:2385:b0:51e:147d:bd2d with SMTP id
 2adb3069b0e04-52b896b47f5mr8367070e87.39.1717427565777; Mon, 03 Jun 2024
 08:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240529133106.1224866-1-thuth@redhat.com>
 <CAFEAcA8yOgGS8VdFRmJJKaUZe9Q=jDDh7itK6Q7vUH4TtEbFnw@mail.gmail.com>
 <Zl27orDnp8hOqgKo@redhat.com>
 <844ed2cb-9f91-439f-bd6a-73003acfdef1@redhat.com>
 <Zl3YBQQ5yWdQoH4y@redhat.com>
 <CAFEAcA_kkM6VgeVKxbSB_=UHOn0a6aFFUTUOeNP4otEoboYtvg@mail.gmail.com>
In-Reply-To: <CAFEAcA_kkM6VgeVKxbSB_=UHOn0a6aFFUTUOeNP4otEoboYtvg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Jun 2024 16:12:34 +0100
Message-ID: <CAFEAcA_QPwi093sB3jSD9EcJ43q2vvZMHwJ58NWqWL2-4soo8Q@mail.gmail.com>
Subject: Re: [PATCH] io/channel-socket: Fix -fsanitize=undefined problem with
 latest Clang
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2024 15:12:52 -0000

On Mon, 3 Jun 2024 at 15:58, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Mon, 3 Jun 2024 at 15:49, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> > We can't rely on the sanitizers to catch all cases where we're casting
> > functions, as we don't have good enough code coverage in tests to
> > identify all places that way.
> >
> > Unless there's a warning flag we can use to get diagnosis of this
> > problem at compile time and then fix all reported issues, I won't have
> > any confidence in our ability to remove -fsanitize-cfi-icall-generalize=
-pointers
> > for CFI.
>
> You might think that -Wcast-function-type would detect them at compile
> time, but that has two loopholes:
>  1. void(*) (void)  matches everything
>  2. any parameter of pointer type matches any other pointer type
>
> It seems to me rather inconsistent that the sanitizers do
> not match up with the warning semantics here. I think I
> would vote for raising that with the compiler folks --
> either the sanitizer should be made looser so it matches
> the -Wcast-function-type semantics, or else a new tighter
> warning option that matches the sanitizer should be
> provided. Ideally both, I think. But it's definitely silly
> to have a runtime check that flags up things that the
> compiler perfectly well could detect at compile time but
> is choosing not to.

Slightly further investigation suggests clang 16 and later
have -Wcast-function-type-strict for the "report all the
same casts that the sanitizer does". gcc doesn't I think have
that yet. I didn't spot any option in the sanitizer to
loosen the set of things it considers mismatched function
pointers.

-- PMM

