Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buMbm-0001Bq-RJ
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 12:42:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buMbk-00019K-9K
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buMbj-000692-Dx
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:42:20 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:48359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buMbc-00064m-9z; Wed, 12 Oct 2016 12:42:12 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id C074422265;
	Wed, 12 Oct 2016 18:42:09 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476290529;
	bh=FIwL2krfgiaVa02VkTtwgl00mSB8DsZCbt3GnSxZWqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=noTeg6bZKjP50c0W/J7+i4a9Nh09X6Ct6vcuLHdfqiag5G5PmsR2b2UJpe3xRc90q
	ECwkMoNYqJIJx3L0aT9ZYo6Z8s6Kpzsp0S1Qssb/HSgJb5bMPQTYnP1Ho9s2ZlrSz2
	qdcmuKF+0zJsl1YXmpRhdznVqJtMkZ1RO8dwbIuk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Oct 2016 18:42:09 +0200
From: Michael Walle <michael@walle.cc>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Thomas Huth <huth@tuxfamily.org>
In-Reply-To: <CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
References: <1476289396-10780-1-git-send-email-michael@walle.cc>
	<CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
Message-ID: <c4eb04a6bf726106a69eb58eee39933e@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.5
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-lm32: fix style issue
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
X-List-Received-Date: Wed, 12 Oct 2016 16:42:21 -0000

Am 2016-10-12 18:35, schrieb Peter Maydell:
> but I noticed while doing the review that our LOG_DIS
> is wrong for the compare-immediates:
> 
>         LOG_DIS("cmpei r%d, r%d, %d\n", dc->r0, dc->r1,
>                 sign_extend(dc->imm16, 16));
> 
> but the processor reference manual says cmpei's mnemonic
> should have dc->r1 first and dc->r0 second.
> 
> (Similarly for the logging for the other immediate compares.)

Argh, you're eyes are too good ;) I'll have a look.

-michael

