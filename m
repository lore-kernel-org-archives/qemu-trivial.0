Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buO8O-0002ht-3E
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 14:20:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buO8J-0002e7-SP
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 14:20:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buO8H-0005uR-Pe
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 14:20:02 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buO8H-0005tw-Cy
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 14:20:01 -0400
Received: by mail-vk0-x236.google.com with SMTP id 83so30194368vkd.0
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eT837URWTXForYqZe6KZtv5xVyV8p3PTYY8jdzEIfa8=;
	b=A5F1NthfsVntIqzMrVwkM20Re5czqCFdZKr6aDWTxtVrRnG7QjQncEJNfKkGg6Ecuq
	c7NXiitBzTf0Iwt0oDQBJV0EUoVP/6YcSjoCDEzIsEXNn5axR8LFn+c9H449iDoQ8B8G
	gGEZoRNCf6NjjNNDDHONbiu0kwxK5PhOec/3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eT837URWTXForYqZe6KZtv5xVyV8p3PTYY8jdzEIfa8=;
	b=Itoiyl5JFBCS+uT9RV6vfR2fi49u5ZC/TlNh9dh3MRaITuAWOlm/CCkhl6L/86pnkh
	LNbqJkO3eqzc0tmb3/zvnytT6FIbYTRHEfIwGJ6dkE04sHDasgSk0VIDS+FzwUOruhY1
	lpma1Ar1MxYjbURB0ToORhn3z3gQUNe1UeE7H9ietW3FuOvggl8t6gIhq5efmyxvR79E
	AKUKoJ7gBHpWso7z08ViUwV5Kjx+RoXuBfYkM1lSJTKyuyt8uKjETJCmSfw6f9QGtddb
	Yhe3GkB0tL2kOQk1wjkVbuS4VR4cTlEWOazEQtgCzZS9Cr6gS3DRIaNR5OLVSIblgk6d
	JXmQ==
X-Gm-Message-State: AA6/9RmN18vnZuSr0VkOfM6L3mHQz41yn07Md0GzVLFnqTcI9+C4UBU7KvWR7TS4V4JIElb95NnOnZYcfuTIW7ZD
X-Received: by 10.31.165.74 with SMTP id o71mr1533182vke.95.1476296400900;
	Wed, 12 Oct 2016 11:20:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 11:19:40 -0700 (PDT)
In-Reply-To: <1476292505-19542-1-git-send-email-michael@walle.cc>
References: <1476292505-19542-1-git-send-email-michael@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 19:19:40 +0100
Message-ID: <CAFEAcA9SE4iCY521YpRZN=o+8JiJTEOY3MyffweHWpzrbrHJSw@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-trivial] [PATCH] target-lm32: fix LOG_DIS operand order
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
X-List-Received-Date: Wed, 12 Oct 2016 18:20:04 -0000

On 12 October 2016 at 18:15, Michael Walle <michael@walle.cc> wrote:
> The order of most opcodes with immediates was wrong (according to the
> reference manual) in the (debug) logging. Additionally, one operand for the
> andhi instruction was completly wrong. Fix these.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

PS: the wcsr disassembly also looks to be wrong:
    LOG_DIS("wcsr r%d, %d\n", dc->r1, dc->csr);
where the manual says this is "wcsr csr, rX"
(separate bug though really).

thanks
-- PMM

