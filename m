Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYZnF-0007aY-UF
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 11:24:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZnD-0007aI-Sf
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:24:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYZnD-0008QF-5o
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:24:39 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:33590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYZnC-0008Pt-Ur
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 11:24:39 -0400
Received: by mail-wr0-x230.google.com with SMTP id v105so53600256wrb.0
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jic6A2idB1ZYpE9sA91sZwu19tYphuMqegWCTQFFLfI=;
	b=Qx7bYPhkNt1bM07UuXLvJnFC04wmX2MxWFDpjbmubjHljH5WgSBE3C+50UNC4/F1iL
	N+TCW5tamQobvcu7SYZ2/7g1VWimFJkFOQxPbKEyqBMOuD3x6/AaEdHbM0kTenyetzkg
	qkx5msdnqcZr4zHwl6BnMEJgFB+Tsr+bfNg2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jic6A2idB1ZYpE9sA91sZwu19tYphuMqegWCTQFFLfI=;
	b=Z0Mj/EojmW9r4lMJ8cG8d8ykQp0+17JSQTxV+OOx5ax78zcQJqdg33sDb7tbHjTW3b
	A6cofjQE1LujLkMGCRV6XH0xg8l644BGAL7930zLfldJsDPkcfpB4JSZytfdSQUIGgRj
	myKqsP9aCRkW0hcoJlGrWsYLgkayUB59KnzNIGRgs6Y9jJphSyvSiAHtEDk2PB6kcj09
	sz4/yDOOZobwCjB3nsN29JwaLz/FdpVa2OqXxRJ3t/bOTx7IrwTrW5GCy2xMcbdXLiVp
	PwoFygoJ+littlsGHHcpySEW/dMvud51DILDfzw4/vyH3XbSoXX89ALXyLJ1QMNWqYeT
	3rKQ==
X-Gm-Message-State: AIVw110dtnj7FuFx2mUdKNEgj+IYH5YGpuZ9HXvwH+anO4tCdzCSRn1W
	75FRdxJzT+nSlIdulwgh8cARGgCEJZ08
X-Received: by 10.223.163.16 with SMTP id c16mr10967481wrb.173.1500650677903; 
	Fri, 21 Jul 2017 08:24:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 08:24:17 -0700 (PDT)
In-Reply-To: <1499955697-28045-1-git-send-email-peter.maydell@linaro.org>
References: <1499955697-28045-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 16:24:17 +0100
Message-ID: <CAFEAcA_KWA=c0O7t5L+V3LngEUauRJREKFm8UyTnrMMhnTyBjQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: "patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Drop ancient
 Solaris 9 and earlier support
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
X-List-Received-Date: Fri, 21 Jul 2017 15:24:40 -0000

On 13 July 2017 at 15:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> Solaris 9 was released in 2002, its successor Solaris 10 was
> released in 2005, and Solaris 9 was end-of-lifed in 2014.
> Nobody has stepped forward to express interest in supporting
> Solaris of any flavour, so removing support for the ancient
> versions seems uncontroversial.
>
> In particular, this allows us to remove a use of 'uname'
> in configure that won't work if you're cross-compiling.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not a big thing, but it's a start on cleaning out some
> of the untested and untestable cruft from configure...
>

Applied to master, thanks.

-- PMM

