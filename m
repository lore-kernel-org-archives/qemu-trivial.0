Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrbTh-0004nz-Tz
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 06:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrbTe-0004mL-JZ
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 06:34:50 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrbTb-0000r8-GE
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 06:34:50 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56dcf805aa1so1846111a12.1
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712054085; x=1712658885; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0fWSw8Zfklxrr366aXJa5UIRuYeW/GOUTB9RnMk6wM=;
 b=VPG622hZuEBrbf/9gUe5hqV+9JPwUAGD2JQu/kg9v2IGuPq6PuJcRZ8eWSR70xFcuA
 eulTvYMMAB+IjTcZN/6UKqDMSWUhtf2kx/X3TZPXCxNaZ3NqdRwfvhEwoZ/1HJvmVYoJ
 4sxYHKw54gJnLOuAJIcOfZ7ZM4sFhXTNdDRBvmfewa1bCOGl7ZhA2pg+lr3hz4UR01cM
 yznppTjTWE1vANyVcWIV8nTMrAvZ/5aw16YfUNpPTel5vrAofZX1kpwqOyVSqs/axJHN
 JmPidhsrmyVeDKYdTBKzxaE6CmVQFndHR3x8/Wx2xau7dq5vOF8v8m8rPUgUoDikhKAc
 cx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712054085; x=1712658885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0fWSw8Zfklxrr366aXJa5UIRuYeW/GOUTB9RnMk6wM=;
 b=h1LFvGokAeILK/FzYRFnsTTm21AjQSPDdm5Yb8bfLjki6Y5sK2OHlYCpzPahNqBC71
 RTgZ+0vKFo7RsYCdeHLQ7H3yqZf4X2mk4KlH5QkJzdYHj/zHo+Bvsas1NHFX6oI2lISB
 KFNQFTYkT99Adn0hLnZGsp6I++S0UkthwfZFblj7Jlj4LIJeYimwcULsnE346y6Br8Cp
 OEltV5nyEH/zLV3hiDIs5ICkmKHKZy62vX7VubrOmwIzDx3WVWALYQ9MTBRfAL25Dz3R
 P+BqNP3lDp23TPwqhU9aI4H53AqL8LOpD9Zj0N7SQDFucWNqUhQekBjAlXiuCzrmvNo2
 g2BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyZTB3aA6LvCAqbWdtk5xVCYapRdvi+XkFRihAH1NPiusAwwdFtXpG5aEk93kl5FIP6HPcZzhnV3URmTkoFGTdCKhht1JNqA==
X-Gm-Message-State: AOJu0Yx1XSzokw1NtbD7njeW3fHH43qaSmR6jfOYq5KZyPNJZOSisLgZ
 +iROjLQbN25qr3O8x3+jAhVEihb5bmLme0NP8TfhzeV7Pa94uZ82jXX/1d8P6O5NrKs4VF5ZE5N
 FG1Lz1TL47XzHSEK1RbQWkBuA/SVGDsKXGjJ3mw==
X-Google-Smtp-Source: AGHT+IHUnOz+gfD89hWWSVWwSywWhTXE5Zox1XTo3JZDr4tGFf0nkeQJAtcXJQTlfnbAooWKPLLeAZMDVy0skOF9ZaM=
X-Received: by 2002:a05:6402:40c2:b0:567:fb9b:37d5 with SMTP id
 z2-20020a05640240c200b00567fb9b37d5mr7482424edb.32.1712054085419; Tue, 02 Apr
 2024 03:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240402093157.2931117-1-mjt@tls.msk.ru>
In-Reply-To: <20240402093157.2931117-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 11:34:34 +0100
Message-ID: <CAFEAcA8UBewAHriNkbJNO9CFKgf5bBGRHntbb_y11JdfoNTvcQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial patches for 2024-04-02
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Apr 2024 10:34:50 -0000

On Tue, 2 Apr 2024 at 10:33, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 6af9d12c88b9720f209912f6e4b01fefe5906d=
59:
>
>   Merge tag 'migration-20240331-pull-request' of https://gitlab.com/peter=
x/qemu into staging (2024-04-01 13:12:40 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to dd5b28de4ed04e0c750022f31b529e4fea7ab478:
>
>   hmp: Add help information for watchdog action: inject-nmi (2024-04-01 1=
9:52:14 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-04-02
>
> spelling fixes for the release, minor doc fixes and usb-audio fix.
>
> ----------------------------------------------------------------
> Dayu Liu (1):
>       hmp: Add help information for watchdog action: inject-nmi
>
> Joonas Kankaala (1):
>       usb-audio: Fix invalid values in AudioControl descriptors
>
> Philippe Mathieu-Daud=C3=A9 (1):
>       fpu/softfloat: Remove mention of TILE-Gx target
>
> Stefan Weil (1):
>       Fix some typos in documentation (found by codespell)

Hi -- could you fix the Author line for this patch not to have
the mailing list address, please?

commit 33fc0dcc8aa1bc7800074e28243b5ba339b277a9
Author: Stefan Weil via <qemu-trivial@nongnu.org>
Date:   Sun Mar 31 18:15:26 2024 +0200

    Fix some typos in documentation (found by codespell)

(you'll need to tell git log "--no-mailmap" to not get confused
by the mapping we have for the last time one of these slipped
through...)

thanks
-- PMM

