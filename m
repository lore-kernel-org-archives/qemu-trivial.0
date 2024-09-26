Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1stlHI-00051m-Ux
	for mharc-qemu-trivial@gnu.org; Thu, 26 Sep 2024 05:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1stlHH-00050P-Ut
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2024 05:59:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1stlHE-0005eV-09
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2024 05:59:15 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c876ed9c93so773790a12.2
 for <qemu-trivial@nongnu.org>; Thu, 26 Sep 2024 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727344750; x=1727949550; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kE+xQ2mZaipeurpR6JeNsttlF4pSYhRTtpRYC9WWWKc=;
 b=J1QRMeladfsq68JqjksMvdG9RvJn5b6MnKg0jH/7PwZbvXblVkOQ4e93TNp3dlqL15
 rlUwlU2Iq29payFIn8rkj4P9FgntyszcP8kvZZI7aYTMeZ1fI6EFfy7ZllADButM3jbb
 7RMwIIXO1qnaNhehhp9XmOVTAr7xM/sAZ+hW1JIXM4MoUdnma67RPRxlFun/e5HbvnYc
 RMieI7AnOxm3fv5SQ/9bX6AA1Hlyzc2XacJ7rpQkERwU4qFGPvixI3aJatNbWOuzyCXD
 AvKCkLZ14h7V8wtZqnqAxo5owYay0FtLDzbnLr9XIZq2YN6rk0x4zQx7PNxnxYUDgTYv
 i/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727344750; x=1727949550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kE+xQ2mZaipeurpR6JeNsttlF4pSYhRTtpRYC9WWWKc=;
 b=tEQpgFcTCws0X6dNUAMxvfXsCZ2d8F8XPtohV5nl4sPp6UoTY4kXL8XV+UYQ+sTzrJ
 NzofxozKXNC1wdj8jCLJLVW+ff3JLKNaEV/GB2cUXbTyWKatVHefkoACsNEUl8vb+52w
 QZzDSZjMmpc6eMmhmoz2wvNaZFjAbcB0z0adHfSd25+y2njDrYVx26E0Dgzx5addrBC3
 YwL/GSGnfyI+8p5k9+O108hnK8XlD9te+RQ7bJriY+CftPPPHfAJSlhxV1b3pGAgGrrq
 xv0gXjhwE9zaCp6n8hf72vntriZRZZxlNl9Oyr0Yi5ErfdMihFHJsh8N6zN44ne3cDc/
 OCrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtM8ZefTOzEOglo+YTy96AoOkxk74cm7CrKQVkalGClkuyHsIXKuJoM118uR6l99Uv5Wlo9ef7zRElqs4=@nongnu.org
X-Gm-Message-State: AOJu0YzHCzm/LnUS3mN0XxxBiVTUZ2eknh/WDc6AZ1RE8FIeyWqscuGo
 hHmu96eispmWacJk6m/HKxOni32nBdCS7ZDPbv4rOm5AZRhTSYqV2OUIxptNkq93uLER6l5drdQ
 jn9iyu4NxCXIr1kK9lwkSzXSMLXzvsEpdkX3NhQ==
X-Google-Smtp-Source: AGHT+IFHmkhOxplo2eMccxZnipGgtJ5kFrnj7yVojrjo7wRlg02kdfAHOS/PilypLUYHcNiI7bDg0dG2AM5WjqivWqA=
X-Received: by 2002:a05:6402:50cf:b0:5c7:2209:e709 with SMTP id
 4fb4d7f45d1cf-5c72209e850mr3421566a12.17.1727344749906; Thu, 26 Sep 2024
 02:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240920074134.664961-1-mjt@tls.msk.ru>
In-Reply-To: <20240920074134.664961-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2024 10:58:57 +0100
Message-ID: <CAFEAcA-FaykofbvGUupL2y3K9XpgwH8uLsWvzLs2pQ_eh21Hdg@mail.gmail.com>
Subject: Re: [PULL 00/22] Trivial patches for 2024-09-20
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 26 Sep 2024 09:59:16 -0000

On Fri, 20 Sept 2024 at 08:42, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 01dc65a3bc262ab1bec8fe89775e9bbfa627becb:
>
>   Merge tag 'pull-target-arm-20240919' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2024-09-19 14:15:15 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 06e2329636f9c05b046ccf8aa1b245bbdfb01263:
>
>   license: Update deprecated SPDX tag GPL-2.0 to GPL-2.0-only (2024-09-20 10:11:59 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-09-20
>
> Various things.  Including explicit-LFS usage removal for linux-user
> which allows qemu to be built on musl, some minor tests fixes, removals
> of unused functions, license tag fixes, and others.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM

