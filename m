Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rVWdH-0003RW-DC
	for mharc-qemu-trivial@gnu.org; Thu, 01 Feb 2024 07:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVWdG-0003PR-CP
 for qemu-trivial@nongnu.org; Thu, 01 Feb 2024 07:57:30 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVWdE-000877-PG
 for qemu-trivial@nongnu.org; Thu, 01 Feb 2024 07:57:30 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d0512f6e32so11873121fa.1
 for <qemu-trivial@nongnu.org>; Thu, 01 Feb 2024 04:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706792247; x=1707397047; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tf8h3/gbSdNJTpt3E/ws1mjedr29y2lcAd5CCf0+6e8=;
 b=nLlwPU2lPjjixLEYqYkVA+OdMfjcasHj+a3wQgvNm7kaAdJNv5Iv8XdaDCcgqm8jXF
 nkfMabxDX1awW2kTexysit2Wi1dcIqn3J19dt9MDxTK2+hNLQXTzcdERbZKBowQjKOTb
 22jgVYORqTth+uWXBz59Wf9cPFK6daqc4E9YBhCwDC16NQcNkHv3NaSgFwFVdN/5ArlY
 qOg8pgBqAahvK7814SoCfaC+XHYirj8GjJfxMnoQCBtd5edyL2BXnoW36GpbEBjX07Yd
 JpPvPk+kot+HbV9FC4kj4dE5OGp2mb1P+1jo3gZGVSRPOHn1YrxErT0VevsSXvmyXC5m
 pVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706792247; x=1707397047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tf8h3/gbSdNJTpt3E/ws1mjedr29y2lcAd5CCf0+6e8=;
 b=cHurycXB1Tn5KrmZb56VJ5dhZTdcbU3X/E+2k8aW3kRaXJcxTpFAA9+Cpu+6FTECVv
 5kAC7gmg1P6Ee9TGH3zIxTAn6oTYU+sqjPbM5NIgAVUHIoj1+SpBFuJ1ZAsTCzUXP7a3
 gsNQKnJsbOx+MRkWYV1h/1QOomdMxX+7DhnbUgJIIAsRr22GWlLesp6VmhZnWhQCXQO4
 1wPf2dbZc3XFU9zXXvlpVgdfrZYAzHA1rhC6ubjPukcwrDGgRjq04YUmLmzMN26PWDgq
 DjeX6fYBcXihoVWK/ULsH0yE5O0QUlNrEFEQqPgCfgfivFnn1EP+NNHTp+WaSX2XdqrV
 En6w==
X-Gm-Message-State: AOJu0Yw/5WaD2ZmqCtzO5yC6+CnPGuiXdgaRwBOPtB/7/QyVkxeVyJSr
 OVGKRR2Pv97m+bi1R85Ku6CgtKFzU/xymZHCwQSqRPxmvM5PikwzvsELF2Zn/GVnJts9xUH7FQh
 dP3uh3+l83RlXA2bz5Ou0V923HaK5WBAuEmr7Hg==
X-Google-Smtp-Source: AGHT+IFQvoV9R2p/LXDg5qfKqHI1FsFopWTKT6MFILKjKRWvHRSZ7UGjw2vSBotpdjD6GmnhJOsW7JFXQPA1ghK8sFo=
X-Received: by 2002:a2e:7a0a:0:b0:2d0:5d79:7438 with SMTP id
 v10-20020a2e7a0a000000b002d05d797438mr1170968ljc.52.1706792246778; Thu, 01
 Feb 2024 04:57:26 -0800 (PST)
MIME-Version: 1.0
References: <94cf974b-05ec-41c2-8d0b-43ffbc8bdeac@gmail.com>
 <904ef958-0e3d-48da-a4a7-5c1514c04472@tls.msk.ru>
 <e441b771-0a08-4f2c-b7a7-f6fdd787bc1c@tls.msk.ru>
In-Reply-To: <e441b771-0a08-4f2c-b7a7-f6fdd787bc1c@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 12:57:15 +0000
Message-ID: <CAFEAcA-C-pGGYY1bfE0ZatZP-imGmq=4-579TEnEZWFLeLxZLQ@mail.gmail.com>
Subject: Re: building qemu on a system with libxkbcommon installed but not
 xkeyboard-config produces an core dump
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Zhang Wen <zhw2101024@gmail.com>, qemu-trivial@nongnu.org,
 pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com, 
 philmd@linaro.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22c.google.com
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
X-List-Received-Date: Thu, 01 Feb 2024 12:57:30 -0000

On Thu, 1 Feb 2024 at 12:50, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 01.02.2024 15:11, Michael Tokarev wrote:
> > 31.01.2024 11:13, Zhang Wen:
> >> With this patch, qemu requires keyboard-config when libxkbcommon is found on the system. So if the qemu is configured when libxkbcommon is installed
> >> but not keyboard-config, the configure stage will produce an error message, thus avoid coredump in the build stage.
> >
> > I'm not sure what you're talking about.  What *is* keyboard-config anyway?
> >
> > On a debian system there's no such thing.  There's keyboard-configuration
> > package but it has nothing to do with that.  It looks like if we apply
> > such patch, it will be impossible to build qemu on debian.
>
> Aha, I found it.  On debian it is /usr/share/pkgconfig/keyboard-config.pc,
> which is a part of xkb-data package.  And libxkbcommon Depends on xkb-data.
> It looks like the distribution here is wrong, there should be no libxkbcommon
> without xkb-data which includes keyboard-config.

Are we talking about "keyboard-config" or "xkeyboard-config" here?
The commit message says "keyboard-config" but the patch itself
says "xkeyboard-config".

Zhang: it would be helpful if you could tell us which distro
you are building on where you see this problem.

thanks
-- PMM

