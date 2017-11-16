Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eFQOW-0000KG-Mu
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2017 15:04:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eFQOS-0000HS-8p
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 15:04:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eFQOR-0006n9-Jd
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 15:04:12 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33597)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eFQOM-0006ai-Ep; Thu, 16 Nov 2017 15:04:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B1A120FA8;
	Thu, 16 Nov 2017 15:04:04 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Thu, 16 Nov 2017 15:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=xNcI4X7Lrgdi70yLffGs8rMfRKJ6g55x2WyfIM2v/Ns=; b=Igi0n
	Y+GFm/YUWe1SXe4WmVnG85c24rVJjcfSLIrywULv+2Ro6pX9V0j/spM2VRVMPnk7
	PqAf0sObZa2fqByz9NgQG6pbkkcIlRQi989jMK9sX/yXJxuitK9nUljzMgWRcU9T
	cmiaFaGhu/rl/rGRiTy85oz7YOc8DlvHo9AvvA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=xNcI4X7Lrgdi70yLffGs8rMfRKJ6g
	55x2WyfIM2v/Ns=; b=XRNE5ipbNroKOuGZU4gVBJkn/afrNC856GFWQavQy+blQ
	FLtCnMZ3OeX5catnwVqTwldVvj1uYF6O2shtWsF4uuWGC0WvmNqLhtoHpaqEU+uS
	5rrJB10zxpITQ3zbQFHmB+dskMzdNaDMTYRJg3aUgs3XB1212jTfwfmOcCo1ba/Q
	z8g03WMiMfByDvS26zIowrdJCvK6LBSen3h3pFTfkEj9VV/6MC/H2hLqL81I1dHy
	A/KJAIuVEJ55dFI15wi72O7b342LKKDLVwz9Um2sZl+yKeq+NhM9ND1ZyhAHVGSq
	1zLcbKfeiwODqcHyL5u47PH1mOw2zpLF4N7HqjjFQ==
X-ME-Sender: <xms:NO8NWr022-AOcw73P-VsU7ZIxAKgbX-xkBilqt7dvoKmqxSe4QVZbA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3AEB07E804;
	Thu, 16 Nov 2017 15:04:04 -0500 (EST)
Date: Thu, 16 Nov 2017 15:04:03 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20171116200403.GA9824@flamenco>
References: <1508364103-16131-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508364103-16131-1-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-trivial] [PATCH 0/4] Some trivial fixes,
 mostly comment typos
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
X-List-Received-Date: Thu, 16 Nov 2017 20:04:16 -0000

On Wed, Oct 18, 2017 at 18:01:39 -0400, Emilio G. Cota wrote:
> A few trivial fixes that I embedded in a previous (unrelated) patchset.
> Better to submit them separately as a standalone "trivial" patchset.

*ping*

Can someone please pick up patches 1, 3 and 4?

Thanks,

		Emilio

