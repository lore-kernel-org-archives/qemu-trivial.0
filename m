Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZwA6-00077m-G4
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 12:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rZw9v-00072o-4o
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 12:01:27 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rZw9t-0002US-FU
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 12:01:26 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5610c233b95so5061481a12.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 09:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707843683; x=1708448483; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L+aAXYeki9xBd9oatwJmd5E9UpeWCyJZmUJlybO1WlU=;
 b=FzoeZf92VzdXdOOnGtPXXaKKpbV063zZZvCQP8bqAyz9TYmttIXENIYCcV8fVPE+/B
 M1LX3dQgGHhkCJbqVx33R3EiD9NLlPQZymKbGuNrGxOMAtdofCQGxjblhtlIa0ZObq3T
 D7c95od4s2ORLfA80myu98BrcugQLlXleo/E1kcLVuVQwEHADQ0lrOUsgA3uOtkijcLc
 Noatm2JyFQBJfM4orUzl4TDHVh3OFmM1gx4tC3OEPWt6/B//I6FXTlqPQtJMah+rCDyU
 lib+o2I8Omunro7TBdXllZaG3KmmuryjbKUGQ5usClIVx39ehzYmBPLwQTITxglJl11d
 Vq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707843683; x=1708448483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+aAXYeki9xBd9oatwJmd5E9UpeWCyJZmUJlybO1WlU=;
 b=meHI0lgYB5kz4nUBG4IkSRFn8bxY0oWyGPNjttsyY5mIhSDC0UPWajABJ2D/hfyGaU
 /hB1XFouedff47xhsc/DR7cqf7ftw0LPu5neL1Gy1Uhh8dV78gq/oKrI+QeamIYrkXVd
 VXx7FVLCNmeeh1n1RACaaYaVgW9hMcjX1V4eKcp971u4obaDKw1yq2JlO4jS8ObT6zr1
 xks5cPp1tkWP+yv+Fctv0qoc2VN6O8DAEIEBQM/Okj2xof9vj7sLPyjEa62TyvcZ74HP
 RR70TxeQ/iJDPUi7PVgPYHajdqwDAahWXslJ7ZSnKfD2KzHSYCPeQdg/Joi0EMRG6TmT
 S+3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW69yCKR1w2U/i+YJdiIDN1onSiZNV5Fn6RTLquM2qKX4FTrngoDO4pDfa6CDCZB5xD9kNfkQfx5UwF+zy7/QAES2QxIndHnw==
X-Gm-Message-State: AOJu0YzXlYwagSGmW/7TATVGQRf2/LDi573NfLC6Cy70efpdZuvPsMF5
 zmCWH1WH6fuiM0bDFHW0dFEzjYgfS+QCck2/yN0XRgOJjlsF6724eAXdWTEd+4W8EIaf7PiEt/0
 j0GxIyrkpRD8Ef5KN30fpVf6H1xIMyY2jdbX31g==
X-Google-Smtp-Source: AGHT+IFGzb5RgwAog4RDF9x2MfA2V1xohXdugLSuO4IHVW4Imgxr5R06zrz/5EwDbul6/99LoH1/hbIg/fSuxGoL0m0=
X-Received: by 2002:aa7:d9d8:0:b0:560:c77f:a120 with SMTP id
 v24-20020aa7d9d8000000b00560c77fa120mr182400eds.8.1707843683025; Tue, 13 Feb
 2024 09:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20240213080151.160839-1-mjt@tls.msk.ru>
In-Reply-To: <20240213080151.160839-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2024 17:01:11 +0000
Message-ID: <CAFEAcA-Cqyz=1Cr1baUFjcSqy-m77ucqELnR72zzt+=nv=KBbw@mail.gmail.com>
Subject: Re: [PULL 00/15] Trivial patches for 2024-02-13
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Feb 2024 17:01:27 -0000

On Tue, 13 Feb 2024 at 08:03, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 5005aed8a7e728d028efb40e243ecfc2b4f3df3a:
>
>   Merge tag 'pull-maintainer-updates-090224-1' of https://gitlab.com/stsquad/qemu into staging (2024-02-12 14:14:10 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to f6e33708bbb824d493863bc936d3c86fc86f2004:
>
>   monitor/target: Include missing 'exec/memory.h' header (2024-02-13 10:59:25 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-02-13
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

