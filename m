Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjK0z-0001Vp-Iv
	for mharc-qemu-trivial@gnu.org; Sun, 10 Mar 2024 10:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjK0n-0001TI-M9
 for qemu-trivial@nongnu.org; Sun, 10 Mar 2024 10:18:52 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjK0k-0005PH-R1
 for qemu-trivial@nongnu.org; Sun, 10 Mar 2024 10:18:49 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d4141c4438so50902571fa.3
 for <qemu-trivial@nongnu.org>; Sun, 10 Mar 2024 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710080323; x=1710685123; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qwCFGX+5luWlu3CN3CepFmsc5aJK6fPfIFQpj0DyARU=;
 b=OJSVEPnXor9mmbK9u+CQ1o8HciCRQOfpjcbzTq/5yyLzYcx9YoC2wcYrTONYsK/SJN
 w0PQXLH+F5EPZ/+SyD9oNYFPQy9jkM/4NfjxONwKgPhOu9PJ+kXlqa3pO9PAC/UtNdFu
 1mfmpqwXNxTD90tya82X6nbhFSsu3L/iAZbXEHnVfiGKhFJZP8dMvtliCmDLWXoXm4Yn
 YDSTPt+M3XgS9Fkacus+kouYoVhaJEp2a89wwT9mxTkmCxpg/ZbI7/rEa3GYRP+B7Olr
 TcUHuGsFgmrzRKCdxqvM8RUZ+9jHtcxV+Iplpt6OIAOf1FGw4NsXCOn6soAM9kyT0Hwo
 5sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710080323; x=1710685123;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwCFGX+5luWlu3CN3CepFmsc5aJK6fPfIFQpj0DyARU=;
 b=gcLA/ZUwjqZSthOh07Y/Cpry41nG1NMVzQApP36Prrr7ijVTquJMur+ERtUISMWFCk
 THdk8g59RXsymcG+YfCQcrEwProMetUMCRCwcc87AwUdOldhIsjFU0JpOhl+0iSnl6wQ
 977vyWT9KEbuQ4jk8xiQw1NIz1H6oSqCL3o8FWfLUUeAxPFuIOwTYbjgUY3Lvxoe/Po6
 GjBDaxjYil63cAIDTHWMhW6HFZ6x1wPfrxDOZ358UhAKmQ7uPhb88cJylS0hIrtHxfaq
 LzHeEOmiD8JGbtWC20FNzFXAggA+4/C60JP0qkxEVkim+FIh1IOFRK6gIi8PIprYghei
 ip0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8tiaL9FhIvu+K9DAm4JSiAGuhEMQjZuwxTlWKv6FyWbOBglicSF2Z2ripnpkFxRESsYBquildb8YiSN538pakI62g1/ngAA==
X-Gm-Message-State: AOJu0YwZxzUoAmw3/iAxj2Y9AGF1xrOUqWNjfd9spwercL3HC0AQQOwN
 r/IuQFbcDOmP0dDxs1Mi8dF2zpRLUxSBujpDPEPMBj6o2Jq8b9Y0/SeOR/SjRIhwNGfQtuOsDP9
 p0fe11ZNsEsFpI2GulaS4WsZ5l6K7zlXPOND4/A==
X-Google-Smtp-Source: AGHT+IHfNGUw4QsGJJHb99eLOVhaIBtqkyPPg7t4jFPCJfqgcLHf3rOLO7R9g8BPRqydbvcNBPjGlV+wzbmjPa7y24Q=
X-Received: by 2002:a05:651c:1986:b0:2d2:3c88:cd57 with SMTP id
 bx6-20020a05651c198600b002d23c88cd57mr3017936ljb.32.1710080323165; Sun, 10
 Mar 2024 07:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240309155729.1694607-1-mjt@tls.msk.ru>
In-Reply-To: <20240309155729.1694607-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Mar 2024 14:18:32 +0000
Message-ID: <CAFEAcA_ffM2pbgWXjpzZscDk2O0uzoaRCbKUg-LQ2yWqi1NJ6Q@mail.gmail.com>
Subject: Re: [PULL 00/11] Trivial patches for 2024-03-09
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
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
X-List-Received-Date: Sun, 10 Mar 2024 14:18:56 -0000

On Sat, 9 Mar 2024 at 15:59, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 84644ac1b0f80d41b8a2f66547b83b2ad4a98576:
>
>   Merge tag 'darwin-20240305' of https://github.com/philmd/qemu into staging (2024-03-08 18:19:25 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to d65f1ed7de1559534d0a1fabca5bdd81c594c7ca:
>
>   docs/acpi/bits: add some clarity and details while also improving formating (2024-03-09 18:56:37 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-03-09
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

