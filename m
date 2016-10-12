Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buN5B-0001z9-P8
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 13:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buN59-0001ws-LL
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buN58-0006hd-Hj
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:12:43 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buN58-0006hV-DJ
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:12:42 -0400
Received: by mail-vk0-x22a.google.com with SMTP id b186so51867420vkb.1
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SbtY/ybyPHg81W7Sn7iEcO5g+hJE6E1qI9A2sHs4+J8=;
	b=ERJBZRrYxMEt1BQAUWVJ9h0JhsAKVDeJ5iWgjSN6/1uyyIPvxun37KH9VlJwwd5Uc9
	i4aRjmObUO225171w9CRL/GGgcIs8UVxWZd0zIx896DLUK8apmie+kTQjDPDTmHfTcUF
	See3NGuf7x9TUlRE6sEn2b7C2r5wQh/IIfJa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SbtY/ybyPHg81W7Sn7iEcO5g+hJE6E1qI9A2sHs4+J8=;
	b=XD5rwYTLtwLBPtyfPUwOdKOdBgltkxfb2rrI8sIQEqVF9mZPmjgEwlo7pzqK8FHKBB
	fIN7jekVVAmt3HJER56erx/domLyHTOQ4VjMhIJLv2sA/1LkKJziCVfHB9/XCQS7aOX2
	Dh5LfTnWoGTiMQHjhnC4ZDPH0zKinbBe4qct5VsCHXDBtrAyIbxHox+w4kIrAHA8DfLU
	WDZLPeieMiaDdjrTMZOO8pSx6/hvFTSnufWF9fQdR29q+6f3M0VITPzB2Kwf2eVkvXV1
	YI+oBu2ynA+lzYqolyc0KD9waeQwTKyhDQX1laBRJVajH3CR7FOu4EboesdqJpWPFG2O
	3+dg==
X-Gm-Message-State: AA6/9RkUXz9mSkqVQGrM+0DVNloUHoFsJ3Hr9bsgTh4iccFvja38A/ebtrTw4lZCpohH57MDZtAdCmVu5jpWHwqi
X-Received: by 10.31.11.138 with SMTP id 132mr1284927vkl.165.1476292362009;
	Wed, 12 Oct 2016 10:12:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 10:12:21 -0700 (PDT)
In-Reply-To: <c4eb04a6bf726106a69eb58eee39933e@walle.cc>
References: <1476289396-10780-1-git-send-email-michael@walle.cc>
	<CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
	<c4eb04a6bf726106a69eb58eee39933e@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 18:12:21 +0100
Message-ID: <CAFEAcA_nrVEvU1GPLu=zgNw0xkUMh77UX6rySW35EGv4z4fD2A@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <huth@tuxfamily.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
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
X-List-Received-Date: Wed, 12 Oct 2016 17:12:44 -0000

On 12 October 2016 at 17:42, Michael Walle <michael@walle.cc> wrote:
> Am 2016-10-12 18:35, schrieb Peter Maydell:
>>
>> but I noticed while doing the review that our LOG_DIS
>> is wrong for the compare-immediates:
>>
>>         LOG_DIS("cmpei r%d, r%d, %d\n", dc->r0, dc->r1,
>>                 sign_extend(dc->imm16, 16));
>>
>> but the processor reference manual says cmpei's mnemonic
>> should have dc->r1 first and dc->r0 second.
>>
>> (Similarly for the logging for the other immediate compares.)
>
>
> Argh, you're eyes are too good ;) I'll have a look.

If you're looking at lm32 bugs in general, you might also
be interested in the one coverity report for lm32, which
is that in hw/display/milkymist-tmu2.c this code from tmu2_start()

    fb_len = 2*s->regs[R_TEXHRES]*s->regs[R_TEXVRES];

is reported as a potential overflow, because the s->regs[]
fields are 32 bits and so the multiplies are done as
32*32 (truncating) but fb_len is 64 bit. Changing the
2 to 2ULL is probably the simplest fix...

thanks
-- PMM

