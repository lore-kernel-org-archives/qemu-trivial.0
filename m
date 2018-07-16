Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffAJM-0005ve-1m
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2018 16:41:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffAJK-0005vU-EQ
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 16:41:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffAJJ-000071-MF
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 16:41:34 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffAJJ-00006m-HY
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 16:41:33 -0400
Received: by mail-oi0-x244.google.com with SMTP id k81-v6so77345719oib.4
	for <qemu-trivial@nongnu.org>; Mon, 16 Jul 2018 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SUTo9yM2pJjew+CghpTrcyYIuwuAegCKWhnJ8JckWAc=;
	b=OqISAduBuOHwoi61Zr8bPWSXugPjzmrax0TLFTabgg8dDmqAePW8M4xkqxoOCMpKMA
	TmEraZzT+jvrUfXyNhloF2pw0Pmy/3ByE+Om4xmgcjwM3NXrwAw2FmFRTAHoAqgrWmZy
	oQQNcopyb+eF0Qt0ZFvjZtTx9IIbK23Ss2Fug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SUTo9yM2pJjew+CghpTrcyYIuwuAegCKWhnJ8JckWAc=;
	b=Ga5Dxbu5M4kbKh/nZHZK/Y5FSLfzj4x7aQ62boA4EjR5tA8kYkfeJDzDAeGsu5d53B
	180spuUhowXa6Z64Ff0FmLLs8xOrtNvYynoHeQHCSTn5WoCCeBc01FgEQ9y8BaPvzuqU
	L5SDxCN+oUPfUV/u2aMffY+Dz27ofXI+dNk0XUWZ3wf4c4Oc5n+CxnLj676Q5A9uFGVa
	rb4HrjwbsUFZw2mD7h3HmD+klz8lWHAA3sPPg7FuNBWymhfmn+s0VnziIb41ggATCxgu
	jS+1rCC8eOLVYjKfSoDLe1XKD1iJm5eq5pyWsZL/45kowmGtmlDq85adE3g21bXuiiEM
	fz5g==
X-Gm-Message-State: AOUpUlEU/Rq4jjUSrnQdsvtUYqvYRJVxNOujhJUwxMYTYndJ9fa/fDZa
	2nDW2xFa5q9nT4/XzJ8+aZgXQRholAlnfiBtTqGKJA==
X-Google-Smtp-Source: AAOMgpfeBxQRzF4+8lCFgQsmkHYb0wGFYqsRANdoOZRRQm4Pltakabxkmwu48MRz+sMsxoCbCvo0tLIgfw89uwW3U8o=
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr976879oic.252.1531773692797; 
	Mon, 16 Jul 2018 13:41:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 13:41:12
	-0700 (PDT)
In-Reply-To: <20180716195851.0FE177456B7@zero.eik.bme.hu>
References: <20180716195851.0FE177456B7@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 21:41:12 +0100
Message-ID: <CAFEAcA-Lu=gZWQOROa+oEwaWP8FWSY__=jneDQZVK=mFXAcFMw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Do not enable QOM debugging
 by default
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 20:41:35 -0000

On 16 July 2018 at 20:47, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Commit 3556c233d 5 years ago added an option to disable QOM debugging,
> noting that it can have high performance cost but left the default to on.
> Change the default to off and only enable it when debugging is requested
> to avoid the performance penalty for those compiling without debug options.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Looking at the code, doesn't this disable all the type checking
on the QOM casts? That is not something I think we should drop,
in the same way that we do not disable assert()s even in the
non-debug build.

Is this coming up as significant in profiling? In the past we've
done some special casing if there are particular QOM casts in
hot paths that use significant runtime.

thanks
-- PMM

