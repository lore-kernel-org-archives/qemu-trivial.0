Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sE98u-0004ZU-It
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2024 10:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sE98t-0004Z3-Lh
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 10:58:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sE98r-0001rr-T8
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 10:58:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57a52dfd081so1587812a12.2
 for <qemu-trivial@nongnu.org>; Mon, 03 Jun 2024 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717426711; x=1718031511; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYSMhdiBptCCxxftJKQ0L/QW7zUSoAmxXntOTKFaTm4=;
 b=gA0GKRxGOFjh1QzYPVja8WizMObxqJtqpBWT0Sm+4KmXhH0Ax64DjGZC4+f1BViSlb
 R4klU2GYkh8ciudeBl7ErNfL/azmTI1/0a8NkKw4yOT2Cr/EDbrXd0WBBU9qAKwMxagT
 9kS8IKSWh47yPbvWS4aEYMuswSCR5+II/88WsbQWb0D8McrCLqBVwAuZ6fiaV2XLJgGi
 6J90g/1cvXjpHR4j5nB2jFTYLBz0XjdD9v5Engmd6KBNLvRILqYFYPREc8TuCoAQEkiv
 ADWtulZU+r+c7iujuFCE8LD9VlRzat2Rg7MD1iBA+o6+pye2Qvn2NWhlKT1hnEcA9h8M
 Qt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717426711; x=1718031511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYSMhdiBptCCxxftJKQ0L/QW7zUSoAmxXntOTKFaTm4=;
 b=sTV/itxmkLZLF0IYbIslUFBpsZ+IrY6FSqQLOoaCmXcwQOKbJSMifYUy/D+x3y2h9N
 Dxw2GTpup5fxoBMyrhTlkLXO8XqMP84LzQQWhkYdATsUZUz4XQQ+Ip2J/nKa907sevG8
 XW/FVHGi8YjnQR8TZ+XTkGJFq1Er3cAHKAdRYMTQnx+olrRGPchyKBQW2zxs6diJs1T+
 A4kUwWjkmMF8O8eUr+ymnsLKNC74cRRMS+ne068DqnSJfst/45rjGSioDUM61r8K3tGc
 8NvT6kgWsjb8VzBsVurCuOpm2He3c2t/ZtQEhtApAof3qvDlqbWmKv58f7AtyHCVzZb2
 wYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwuZexMQBLIbsJiSn4k8ASPBmGEwt1vvpeYQe060sbN7RZ2+Vp39oiW0nQt4z0X+GgpOPp3CzQ4Q/wE3wUnp9g3idFckJ3WQ==
X-Gm-Message-State: AOJu0YwVXX72DESxNpvB5nGIzBEZHNKyKjRsVKlGAtX5731YTNdc3xZJ
 P2gT2/PRj+vC537zyft7D0K0Adn59Q8iDSmeQ4SaNRioxZlIjReuHvhuX5vxBCUCilIDtMEbHi4
 cEduRgQGBJqPItu+rhG8wc5zdvGiFJqbWv5aO5A==
X-Google-Smtp-Source: AGHT+IHa7IoYxrwvD6KFiyxGUiXC/QGYVvmox78BaSVnwZhVIJ7vK44NOe22rzEIwsa0+V/JbZkSKQf9i/bQ2tWVCZc=
X-Received: by 2002:a50:9313:0:b0:578:5a44:722b with SMTP id
 4fb4d7f45d1cf-57a363b4939mr5377170a12.7.1717426710937; Mon, 03 Jun 2024
 07:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240529133106.1224866-1-thuth@redhat.com>
 <CAFEAcA8yOgGS8VdFRmJJKaUZe9Q=jDDh7itK6Q7vUH4TtEbFnw@mail.gmail.com>
 <Zl27orDnp8hOqgKo@redhat.com>
 <844ed2cb-9f91-439f-bd6a-73003acfdef1@redhat.com>
 <Zl3YBQQ5yWdQoH4y@redhat.com>
In-Reply-To: <Zl3YBQQ5yWdQoH4y@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Jun 2024 15:58:19 +0100
Message-ID: <CAFEAcA_kkM6VgeVKxbSB_=UHOn0a6aFFUTUOeNP4otEoboYtvg@mail.gmail.com>
Subject: Re: [PATCH] io/channel-socket: Fix -fsanitize=undefined problem with
 latest Clang
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Mon, 03 Jun 2024 14:58:36 -0000

On Mon, 3 Jun 2024 at 15:49, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> We can't rely on the sanitizers to catch all cases where we're casting
> functions, as we don't have good enough code coverage in tests to
> identify all places that way.
>
> Unless there's a warning flag we can use to get diagnosis of this
> problem at compile time and then fix all reported issues, I won't have
> any confidence in our ability to remove -fsanitize-cfi-icall-generalize-p=
ointers
> for CFI.

You might think that -Wcast-function-type would detect them at compile
time, but that has two loopholes:
 1. void(*) (void)  matches everything
 2. any parameter of pointer type matches any other pointer type

It seems to me rather inconsistent that the sanitizers do
not match up with the warning semantics here. I think I
would vote for raising that with the compiler folks --
either the sanitizer should be made looser so it matches
the -Wcast-function-type semantics, or else a new tighter
warning option that matches the sanitizer should be
provided. Ideally both, I think. But it's definitely silly
to have a runtime check that flags up things that the
compiler perfectly well could detect at compile time but
is choosing not to.

thanks
-- PMM

