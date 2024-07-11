Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sRtVd-0006CW-QU
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jul 2024 09:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1sRndV-0004NM-7S
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2024 02:50:37 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1sRndS-0003Kb-Nf
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2024 02:50:36 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2c927152b4bso451546a91.2
 for <qemu-trivial@nongnu.org>; Wed, 10 Jul 2024 23:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1720680632; x=1721285432; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPgMjfksUIjXSL1ShTlJg87xhI3lwLC1qofvujd4npU=;
 b=DwM9F6a9Ki6+q7WCZlaD7/IAyIhkPITTP9ArnRAQQErQjkdV8v7SAM0sxY1bUIPTuL
 zaxHkg548lHWOqTAUGKtaEqS6P4r932rrlfC6aWwCzhnlnonSl5DyTBtFEExrFfWPhl/
 gTZuIH3m8pwgjdpro0lx3ENbMPY4eBlM8lmK/3bmvEc1zIwNJCmH4rnFA7ItqkNEISAg
 suW9p67tFxRGgXqNHLoI1XgWcyy/Iill7TJfjsLwsPuOamRVc7Dq0YWCxv3umKWT6dOA
 auX+uYG2506cLq6CLGgv2/0d+Sy1XTDZ4Ch4I46RU4M6GQhlanBavY0nxNmUpJdWw2Xa
 jnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720680632; x=1721285432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPgMjfksUIjXSL1ShTlJg87xhI3lwLC1qofvujd4npU=;
 b=LDoQRS7hryaeyPJXEY26o+9HVVhpDnilJLlzU+nUp72VvPyYVSCsRUJAeG4YgoBNgg
 4ZxK/yr3ilbEsdXTvx2vjCCk/21SInmEA6fTzeIWdL9Pdzeil7xj9QHai3ikDpSla82n
 ojDImoVjPl5CdjgRkvpN6lJn8O+OI1SVDkoRk3FzhZ30Vy1Ca6+uvgzVO5yVWS1i4Bey
 EmMlD00e3FZKx9FfLCBYlegzNQw+qZiKbLG2mcEK8P9Jhc5IPt8UC9reXgA6WK3rD/Tp
 +R90yVuYNSN6MWKej1h8toJy08663iFhAiYJYrPIKSRJTeJaXgoAX3WOo9eOEOSBltVL
 navw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnnsI4RHbERgdbqF5QEX+s1iqH/Eoj+5wB9HG2IuMEG6YbA8vYe+liLvBIuK/WvA9xHNGVXlZBXl2bEUb9cyicOVI8EK0+5Q==
X-Gm-Message-State: AOJu0Yyv1REGkG+gaXzTfRV2zGQkqweiPJPMxc21x98ISkw7gjAvRLMq
 TZ2oOsseVpDXG+H5zMZ7aQ+t1hJXwNUw5PiO0dS9qDkgMWKilokfG+bC+fNs8jivmTC8kEbbgVk
 nk3eaORT5BDietI2OVBNgQvNUPrximj++7TY6
X-Google-Smtp-Source: AGHT+IGu4+luV3xLpp4/1IsalKUaN84DkU0A38LTMngkousXTmp52VdDn8L3ecH9xp5v5QszprwLVrLlyDhzf7ioTEc=
X-Received: by 2002:a17:90a:bd82:b0:2c4:aa78:b48b with SMTP id
 98e67ed59e1d1-2ca35d486cbmr6474048a91.38.1720680631968; Wed, 10 Jul 2024
 23:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240710111755.60584-1-thuth@redhat.com>
 <87o775qnfm.fsf@draig.linaro.org>
In-Reply-To: <87o775qnfm.fsf@draig.linaro.org>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Thu, 11 Jul 2024 08:50:20 +0200
Message-ID: <CAJ307EhFr2HODXGBCxZHxiHFtkmGRVjidRuwxrOMbaBqFO5zTw@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: Remove non-working sparc leon3 test
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=chigot@adacore.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Jul 2024 09:06:52 -0400
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
X-List-Received-Date: Thu, 11 Jul 2024 06:50:37 -0000

On Wed, Jul 10, 2024 at 5:25=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > The test has been marked as broken more than 4 years ago, and
> > so far nobody ever cared to fix it. Thus let's simply remove it
> > now ... if somebody ever needs it again, they can restore the
> > file from an older version of QEMU.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Yeah, it's been on my todo list for far too long but I still didn't
find time to work on it.

Reviewed-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

