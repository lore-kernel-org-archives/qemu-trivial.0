Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8T2I-0003I8-IK
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 12:33:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g8T2G-0003GK-DV
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 12:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g8T2F-0006nb-Pp
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 12:33:04 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:46573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g8T2F-0006nI-DF
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 12:33:03 -0400
Received: by mail-ot1-x330.google.com with SMTP id o21so12978137otb.13
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TVzF6hCwO8d9bUYDt2DGC1A/kTe3uYt/qwaII4VHcsw=;
	b=Fe3IcIfZAAvswoG6Q5tzfshfLo5RdpKlW3zlmYPjOdopIN/4pwL1G6R1BP7AjmfK5M
	JNisFvrsbwlnmjcw+/JKes8puWYvM6A6BigKJX3HtOGZuCcrtNFZ/1z3Xr5mgbOrnqP3
	IUuRL6nMzTEql5U9lrdxNBpmbi6P9QZ3ypB+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TVzF6hCwO8d9bUYDt2DGC1A/kTe3uYt/qwaII4VHcsw=;
	b=YzEMGy87cbDjmeiUBe5jyEPLhz20cR0nZEb+oLvHCWz4IB456YGXd9C55jxyVebVN6
	M3/oqRpMpJDeL8TsQtAlAWhhbToL9kb8P+HOQi/iEZlLKtRFbzo0J5R313sQHtGxB2O5
	zn1RkLvmira0wgkHakuH2i7mfaMlmBYYWWqyxomvo0pi9cYYEzMVTzIsUjDct4g5JGFq
	CRFpwNLV0W9U3pRMdgjCnqjDW28nRHuZMfONzNiMmOaFxzB3jYHrQ4h2D31+qsqXqbGP
	9j4jEx2P6DWb4tUra/LZaOrk7brIwh4+8t/HbZWPBqbyDsEiOETBgQIuz/d09xV2lxbD
	CidA==
X-Gm-Message-State: ABuFfoipC0XjGwE0uFVz9b5rOOUxg2dgtbgaI5Rh7lPaf7BkT2FzbGj9
	lcL/lKPf2r4T0z5zq9sOY6JaPNzqJDwR8ORBxVXKBA==
X-Google-Smtp-Source: ACcGV6157s4JgVzapE8cl0RlOgu/QBb/D8yHdpsoH/sflj8IWUZd+bGWLjGPzu1RaVTEhFhox7IUsYs8daeKYKRrfe0=
X-Received: by 2002:a9d:420c:: with SMTP id q12mr289585ote.317.1538757182304; 
	Fri, 05 Oct 2018 09:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Fri, 5 Oct 2018 09:32:41 -0700 (PDT)
In-Reply-To: <1538732546-2284-1-git-send-email-thuth@redhat.com>
References: <1538732546-2284-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Oct 2018 17:32:41 +0100
Message-ID: <CAFEAcA_W9ioV5qDFV6jNY6t-W3MfEkuUXZeZCAST8_tOe=k9wg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/generic-loader: Set
 a category for the generic-loader device
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
X-List-Received-Date: Fri, 05 Oct 2018 16:33:05 -0000

On 5 October 2018 at 10:42, Thomas Huth <thuth@redhat.com> wrote:
> Each device that is instantiatable by the users should be marked with
> a category.

Presumably we could assert() this somewhere (at which
point we'd find that we have dozens of devices that
fail to set a category bit, I imagine) ?

thanks
-- PMM

