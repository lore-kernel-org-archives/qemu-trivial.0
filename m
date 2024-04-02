Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rreH3-0001p1-V4
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 09:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rreGq-0001hs-LO
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 09:33:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rreGo-0003Jf-77
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 09:33:48 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so5970271a12.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712064824; x=1712669624; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dZaM+0gpcer9rrkxwrVQDkyNdPl6hTnle0VkE5xixrE=;
 b=UjsdDdTlPIgupIBkMwBvSwFB9lxBEI2CSqgbXfiry1tMRmdRKMrmD9Zbw2cjzRD9nh
 SQv6FrMbRAAa/eTh9P7k4WZ3pUvs0VAljjNlKuseyptAvrc6Moh6VfPgkrxt51K4P9bo
 s8ILbaEaGW2Ot3LBSx/8d3T+Y/rUX79Lgn+Pfq70e3U/gtZOcjiOCaUPhrxE9Otv+db3
 0kGeucGxQ3LfNrq3dNuTUBq8jovSbyjEaQrdFyJ2mnReWctEKvEMfkBSIBuBBzqAdf1M
 2WOlwGwOP0fBeIrl304kVpyWOX2uTX6+ZclpNCqXi6+trn2VExRLkpjQ52J8x8AthF5w
 x8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712064824; x=1712669624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZaM+0gpcer9rrkxwrVQDkyNdPl6hTnle0VkE5xixrE=;
 b=ORqxjBCxuR3AfJlT+48fYau5MlIDgTNfYMwSq83EmTd+g2uYo+4KPOiwlJQZWIlle6
 FdFKHkpjzF5Cc/alU4IwVoC5g96MtfLoGVL//ketovJyxL/W3Jsr+SZfLsRIPR6o9NZK
 MOq/cazYa1/AJnndur6qdUqIJVMXcw470GCY4gp4la2Zzr6MsG7CILm9RU9H/fwUDMMB
 ULzPP3fEFXjmum0fIvgpPIi5X7E9yQQZqh+BM+S63evwMoxNk9oYr/T89YlhNxzgfi3U
 DeQxfviATPdF4LPSM6t5SUuslbutYxj8psL/n/L10ZXTOlnc19dUr7Xm6v56X9VsyVeQ
 pSVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJXuGXkthHQR91jykUW8WSuJDuheQnI7jEJKi6XZ6/d4QE6UBeLhPlBJGcJy2mIGB1elP2ye/3WzWxqTyhnuRxAbMGZmf8wg==
X-Gm-Message-State: AOJu0YzaTGPMoMPQ0MHLPXPm1EjZ7fAYcuLjrVBP3s7FlkpugRfzQQaY
 dp7II4Uz69yWkopazVMfC6X7LukYOOmrm/NNY/pvAs2cOWOE8skxCz+u6t6+HzdPcQ+UHmbgNZl
 5w0cKgy5Brk3H6ubbxyZ7OElu/NX+pm1yrStJJ0CmZVk2UEF6
X-Google-Smtp-Source: AGHT+IEYgj6FPkVmklqwFq3/MlkfAHEfPJaaqQ8VTfOD7qP7hoCd+padMmFJL2UBrqcMny1/uriRQKBYZ3TiNp89NcI=
X-Received: by 2002:a50:d65b:0:b0:568:3378:8fd4 with SMTP id
 c27-20020a50d65b000000b0056833788fd4mr8710754edj.11.1712064824473; Tue, 02
 Apr 2024 06:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402104106.2933247-1-mjt@tls.msk.ru>
In-Reply-To: <20240402104106.2933247-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 14:33:33 +0100
Message-ID: <CAFEAcA8674ZQgWPWV_XD0EjJXdwPGbj9Py+2PEPgZ-3PFFatww@mail.gmail.com>
Subject: Re: [PULL v2 0/4] Trivial patches for 2024-04-02
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Tue, 02 Apr 2024 13:33:52 -0000

On Tue, 2 Apr 2024 at 11:42, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 6af9d12c88b9720f209912f6e4b01fefe5906d59:
>
>   Merge tag 'migration-20240331-pull-request' of https://gitlab.com/peterx/qemu into staging (2024-04-01 13:12:40 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 7805132bc30b2619355b10bbfb67217ac838c677:
>
>   hmp: Add help information for watchdog action: inject-nmi (2024-04-02 13:38:51 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-04-02
>
> spelling fixes for the release, minor doc fixes and usb-audio fix.
>
> v2: fix Stefan Weil email
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

