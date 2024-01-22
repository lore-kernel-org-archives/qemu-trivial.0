Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rRxDX-00039e-7M
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jan 2024 11:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rRxDV-00039E-LD
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 11:32:09 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rRxDU-0000sm-0N
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 11:32:09 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a86795a3bso2713016a12.1
 for <qemu-trivial@nongnu.org>; Mon, 22 Jan 2024 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705941126; x=1706545926; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aRqqPsRwutXvH3Q/tTeNT7jLNeUi1kXxJEpnBZ7Di78=;
 b=O7/P68SrS8R7hGeewEYqnHcZoTszmvzZsxr5f9ww3DBnBFQVWyiNN42Ur7X4YlyLNa
 J+2MFnepnoUaSas5dqMmjVf1ShoOcTLD79mfr44nEh0ghqX1QXrbFlDZgqPxJnb/QIjG
 +rEgoGfcjcqa44WrL7Wl6pjkqEDOtYtI8nvqlhwTNi3rp73leegPl7EHQDk97OFIPvAR
 ucata09zAPYSi+NI0ErDUnrbZoCsv+amwthORcxYmmY59OmkKjADaXUJPGhur2kZG2TI
 7JLbZegDzMaSrzFzAAFaTax9bVh7fQ5Z91menV/o23xTULgUZb1zuLmNchjaOGQjJZp5
 dQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705941126; x=1706545926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aRqqPsRwutXvH3Q/tTeNT7jLNeUi1kXxJEpnBZ7Di78=;
 b=ExAj14rtYlz9Eq6jD41QAQIDTzqG2DfmXpRoVafeW2s+y+B3U1ZKeKQ01BO4ysexOz
 QNlCqbtHOcz6sPFBoMBU5puR0ugkhsJtdHAlchetqpl1phRyZ8WtQxu/UYWmcazqC4by
 w0rLr85FYG9QxvjwiQJFJvGtWg3T9oHIBILHStmXJI5tFSqTc6MiFMg3ysxdBI9Ilql8
 iCNdpekbQTK22XVdRIggwK9jhj/LtKsi9GRbwxyrz99fcsxXvrr3SxVIqRX1uGjqS2W6
 gqJjTUTqhQqJc5i0uWZqnc0Pe8tPQcili4m83xWoxIQ1+KuiFR0hlfWCoLwck8QGMeaz
 bOkw==
X-Gm-Message-State: AOJu0YxsEgCtXzkBTL3xnasT3jAD+c4Saaf/+wj9OL/JzTmv7GAdlg/e
 W0HYdkZtY6SbbxWeYbV8NEmG65CleAvNT1KmimnYOHAnCzJ7SDaAb4J1JIRdQ1I/MFT0OFQArLs
 7vjJJdFy3+gxnRhyR9zUpdKPFtaXF94lQwOOflQ==
X-Google-Smtp-Source: AGHT+IHeY9XQwB+ov7Y2kXI+LX0ZeyCvDaaUHmjMChioXHoC3cE/xDOrhfxqHW647Mi/yLWfAPiIJtOEmYJ1UpA3Q0U=
X-Received: by 2002:a05:6402:51d0:b0:55b:fe4f:eed2 with SMTP id
 r16-20020a05640251d000b0055bfe4feed2mr68762edd.121.1705941126403; Mon, 22 Jan
 2024 08:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20240122134334.91411-1-gustavo.romero@linaro.org>
In-Reply-To: <20240122134334.91411-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2024 16:31:55 +0000
Message-ID: <CAFEAcA8e+2MCpohL_EU7NA=1jgyC7-QTdgEJiqAosBL6RiiJYg@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm/virt.rst: Add note on CPU features off by
 default
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Mon, 22 Jan 2024 16:32:09 -0000

On Mon, 22 Jan 2024 at 13:43, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Add a note on CPU features off by default on `virt` machines. These CPU
> features will remain off even if `-cpu max` is given so the user must
> turn on them explicitly on `virt` machines.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Hi -- it looks like you forgot to cc qemu-devel on this;
could you do that on the next version, please? (All our
automated patch tooling looks at qemu-devel only. The
idea is that for other mailing lists you cc the other
list plus qemu-devel.)

> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -69,6 +69,17 @@ Supported guest CPU types:
>  Note that the default is ``cortex-a15``, so for an AArch64 guest you must
>  specify a CPU type.
>
> +Also, please note that passing ``max`` CPU (i.e. ``-cpu max``) won't
> +enable all the CPU features for a given ``virt`` machine. Some CPU
> +features are ``off`` by default (e.g. MTE) -- see machine-specific list
> +below or check them for a given machine passing ``help``. For instance,
> +for the ``virt`` machine pass ``-machine virt,help`` to QEMU.
> +
> +For example, because MTE CPU feature is ``off`` by default it's
> +necessary to turn  MTE ``on`` explicitly to have this CPU feature
> +available on the ``virt`` machine, even when ``max`` CPU is specified:
> +``-machine virt,mte=on -cpu max`` .

I think I would phrase this as:

Where a CPU architectural feature requires support in
both the CPU itself and in the wider system, it may
not be enabled by default, but instead require a machine
option to enable it. For instance MTE support must be
enabled with ``-machine virt,mte=on``, as well as by
selecting an MTE-capable CPU with the ``-cpu`` option.
See the list of machine-specific options below.

> +
>  Graphics output is available, but unlike the x86 PC machine types
>  there is no default display device enabled: you should select one from
>  the Display devices section of "-device help". The recommended option

thanks
-- PMM

