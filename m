Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fk5gw-0008R9-Ll
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jul 2018 06:46:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk5gu-0008Qi-J1
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 06:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk5gt-0000nw-On
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 06:46:16 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:38882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fk5gt-0000ng-Ih
	for qemu-trivial@nongnu.org; Mon, 30 Jul 2018 06:46:15 -0400
Received: by mail-oi0-x241.google.com with SMTP id v8-v6so20346038oie.5
	for <qemu-trivial@nongnu.org>; Mon, 30 Jul 2018 03:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=duIn/EmDcBZIjDDT6TR9ru4ppWesA1Y7krRUiQcwExk=;
	b=kKeseT/jGE6kdwbNN+YKuJP9a0/j/8Qd16etVIRaDtcIiTOyylz8rsOSYHYESe2CUq
	ct5drDw3mEIt/3RzrhP/o0I94TuJxBjBv/uEdEyH1SwUPll5itPAseHJ9cQ5Ya4J69ji
	ZwrQ/ahqbSIbBNMKo5cNx0Bzpp/JMm0GInHUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=duIn/EmDcBZIjDDT6TR9ru4ppWesA1Y7krRUiQcwExk=;
	b=tuumO4hPBI/XMJHhJS214uP7jR8NrQ6XQmHU+hIUB1ECFbY+tOZunbX+CzPn7Wn8Ro
	bdlr3F71kvWbQloBioPPixUazV+XEV0vHVRcAQYVEm3NdeBVaAvASiCALAJx2EmLK8HU
	B5Ht1hJZi75gvjxRjJBIeCJwIaJdY3HOOWOpj2hpDICyteN+znuCCTn3XHN0AG7pI1uZ
	5woIFnWYGpTxwN+CKGphdBnwhjC0dQp6jpFuxQwnZ5Y56+ZPXLNFtZOyyPOEjWM8uQF7
	yRaE418243Rrq1YRwmQSFOTuDcEJij8YfRVv+akNqWfA61DfSHSxT8w3yNmpCHm+2Vrh
	rzjw==
X-Gm-Message-State: AOUpUlFHkk/0rokA3rkNADwthseuqfCta3S+GvBbdFDjmzevxAQTaCTA
	zXuhI4KEXJIMH6RiCZNTn9jo2cBvK2IA4Oesr+M6ng==
X-Google-Smtp-Source: AAOMgpeu9vypcXnqwHOw0H7v7MLEEr4Mbp412dVJOzxH3grzaRUvwSFWBNiAydM0w6Y0L+S09GxGqqFsiUe0Sm/gFJM=
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr16265754oib.337.1532947574824; 
	Mon, 30 Jul 2018 03:46:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 03:45:54
	-0700 (PDT)
In-Reply-To: <83728e91-de69-c376-a768-0aad501ff64e@twiddle.net>
References: <1527229488-49822-1-git-send-email-mjc@sifive.com>
	<83728e91-de69-c376-a768-0aad501ff64e@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 11:45:54 +0100
Message-ID: <CAFEAcA-hOTPOfW7ruRsSYt32Ahu707iMJtXdXkUREpLyHdFwJQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Cc: Michael Clark <mjc@sifive.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	RISC-V Patches <patches@groups.riscv.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] RISC-V: Correct typo in
 RV32 perf counters
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
X-List-Received-Date: Mon, 30 Jul 2018 10:46:17 -0000

On 25 May 2018 at 14:17, Richard Henderson <rth@twiddle.net> wrote:
> On 05/24/2018 11:24 PM, Michael Clark wrote:
>> This patch enables mhpmcounter3h through mhpmcounter31h on RV32.
>> Previously the RV32 h versions (high 32-bits of 64-bit counters)
>> of these counters would trap with an illegal instruction instead
>> of returning 0 as intended.
>>
>> Reported-by: Richard Henderson <rth@twiddle.net>
>> Signed-off-by: Michael Clark <mjc@sifive.com>
>> ---
>>  target/riscv/op_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Fixes: Coverity CID 1390849
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Ping -- Coverity is still complaining about this -- did this
patch get lost?

thanks
-- PMM

