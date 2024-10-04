Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swn0p-0002WN-D7
	for mharc-qemu-trivial@gnu.org; Fri, 04 Oct 2024 14:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swn0k-0002VX-0x
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 14:26:42 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swn0i-0002ps-9f
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 14:26:41 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53993c115cfso3206956e87.2
 for <qemu-trivial@nongnu.org>; Fri, 04 Oct 2024 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728066398; x=1728671198; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2yEjesP4qQwFvs3HmZf4KN/MQveFZrQn2HjkTmy5WOc=;
 b=BLjUptsDZTjytVsLKBNfLkRE0Qom9Ea5Degdhb84GPdPJENYSvJAW19geLvjd426du
 WbqxS6zl8TjGqjBaOQG/8GmfZAdXh8IUNAJ52pG0/Cdpk2A9o4M0ZfuncDUu37xPymqh
 nrPUW0Z2u3mnsWEpLLUyPxEIJMnTMvuL9KffzzMn8mfdh65wMt7qlaUmbMDQI22qtU5s
 q1GiJFGaXRbS/6yIoQ/rEr8guQBwlaYWWzFkpHGsVi3+/pFpK4atG/f0iimlXHDBQUga
 4XV1jTf8VfLljbys4+tzTm4c3yqFaoL+Vqb8oQAyTrRjxm4PjzaF+2Osz7IuFzoja2LK
 m97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728066398; x=1728671198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2yEjesP4qQwFvs3HmZf4KN/MQveFZrQn2HjkTmy5WOc=;
 b=NbE41GWef52wQUiCyTx1dYJissGSdAwB1kSeDYYFfHUa5+yjdmBQdHxZwzskHyxsFP
 y7zhO83U8wq5fefZGDWFQLDz2LpxETunMyNnBP5W1x6sJsngqgR/MiIs7YgqT1kZYaGC
 WV2JDmWWM14ngM9KwnG2j1TqxSz7tKGgOZ01VFWAUMXMpboy3F1Nq/K+c5A7SZwttK24
 FJ3vCwpqFOP1VApFestODN6z0yiDa8OyVmmknO2RKKC7gk4A7YA8yXGcKXyz40eRrIdg
 ctcH9PXzYuDAaVtPH7bxhbfIY6+UHu1NHmh5FBOZ7nrOgDU5E379qVOJDAW9MFApdatE
 Diqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhrl6CfF1jOxwV0z2/HFw4Rv+zEDsHQKiGDwAMl3Zjl6KMqvgR9vAaqm/Lg8/Wo1Mu/Bk8bPA8bYsfi9A=@nongnu.org
X-Gm-Message-State: AOJu0YxnzU9L+Tf6Lv1smH1kAFmiujpdi6pCXFMHp8atwKw8A7ZfX5bL
 zk2WE8S4sjwzbBp89xDcw+t/2RjHPXHWImgiXJlBVEFZGYIg9zefsO69YyNuXhpy4E58mM4JF4J
 nc1DQsHBQ82Z2jfRMTh+7SH2k8LtMp3QdYecjrjzxxD6qpoKZ
X-Google-Smtp-Source: AGHT+IEnO7qfCP1Jwtwc3yRwMmCi45qn91QDIo/eIoIxF5BWJ7azQmBL0S3B2SHBtSibSERW+cxcqZZnrrBPOd+Filg=
X-Received: by 2002:a05:6512:3c97:b0:52e:91ff:4709 with SMTP id
 2adb3069b0e04-539ab87757amr2503893e87.21.1728066397895; Fri, 04 Oct 2024
 11:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241004160331.1282441-1-mjt@tls.msk.ru>
In-Reply-To: <20241004160331.1282441-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 19:26:27 +0100
Message-ID: <CAFEAcA-pBSDX=p7pqAHuA_B_yFnCi_-VhdAbec=HiETAe=ZWYA@mail.gmail.com>
Subject: Re: [PULL 00/23] Trivial patches for 2024-10-04
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 04 Oct 2024 18:26:43 -0000

On Fri, 4 Oct 2024 at 17:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 423be09ab9492735924e73a2d36069784441ebc6:
>
>   Merge tag 'warn-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2024-10-03 10:32:54 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 6b7d2f6e1896fb675e8518ed61c792d4dd92e034:
>
>   MAINTAINERS: Add myself as maintainer of e500 machines (2024-10-04 18:57:38 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-10-04
>
> - many dead code removals by Dr. David Alan Gilbert
> - forgotten minor bugfixes (vnc, resource freeing in qemu-keymap)
> - some more..


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM

