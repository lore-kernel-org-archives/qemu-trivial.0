Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYFVt-0001d9-O6
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 09:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VYFVn-0001V8-3h
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 09:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VYFVh-0003al-SJ
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 09:27:10 -0400
Received: from mail-la0-f52.google.com ([209.85.215.52]:36210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VYFVh-0003aW-GV
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 09:27:05 -0400
Received: by mail-la0-f52.google.com with SMTP id eh20so516307lab.25
	for <qemu-trivial@nongnu.org>; Mon, 21 Oct 2013 06:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SorSa8TOZ9XAm7uEv8OKIYsy7LNEkOyOR1wXm2+HSKY=;
	b=U2QdJqCrDwBb+e51WTfHf74LnrzyjFJgLp6lxNVPq7P5KSn0SmPQn2Ac0enEeL1WjS
	jFZOIbLKrKLKtXUiJ2/oEiNbFnWdBeCBj7eGq7le94EdJSFeP4AIeLGWmoK8XNt9cuSg
	U/b3SPiy3QB1xxL3dVcZLG9rl30KdruTE3Q5VV/tM9xelX+BmlbPkv+MU8edFjl4Ad9s
	8L9X3Rvf89fcZYVo4A0qrVokTieLS6kYOny323qcLq3RUhPR/1In5zfABiUVPPy1lkbd
	KCfCNtQoZX/KKoXIrEVGwnmRt0rMGST5JmGgWff39FjcyIVtcwOzlw5Ni53dnjWufk67
	uPdw==
X-Gm-Message-State: ALoCoQkDOFancXHQjbFBL7Buy8m+qPjmG54SajOB4VlfqLT1e0f/zWQzU0JLvrtL3pdMgWIdT23s
X-Received: by 10.152.28.105 with SMTP id a9mr1299973lah.41.1382362024528;
	Mon, 21 Oct 2013 06:27:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Mon, 21 Oct 2013 06:26:44 -0700 (PDT)
In-Reply-To: <56EA75BA695AE044ACFB41322F6D2BF44CCA356C@BADAG01.ba.imgtec.org>
References: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>
	<CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
	<56EA75BA695AE044ACFB41322F6D2BF40224FF76@BADAG02.ba.imgtec.org>
	<5264E9C3.6090001@msgid.tls.msk.ru>
	<56EA75BA695AE044ACFB41322F6D2BF44CCA356C@BADAG01.ba.imgtec.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2013 14:26:44 +0100
Message-ID: <CAFEAcA-ASmyrbDBCYaMPMUB-yKHAZ_QrYDevsyZEMYqGdG7OBQ@mail.gmail.com>
To: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Petar Jovanovic <petar.jovanovic@rt-rk.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
 parameter to do_shmctl()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 13:27:16 -0000

On 21 October 2013 11:49, Petar Jovanovic <Petar.Jovanovic@imgtec.com> wrote:
> From: Michael Tokarev [mjt@tls.msk.ru]
>> Shouldn't the two patches be applied together and be routed via some
>> other, "non-trivial" tree instead?
>
> This is what I originally did, but Peter suggested to separate it in two patches.
> Dividing that patch into two separate patches made this one trivial.

I meant, "divide this one patch into two patches and post them as
a single patch series [ie a cover letter with patches labelled 1/2 and
2/2, with the correct threading]". This is the standard way to submit
changes which are best split into multiple patches/commits for
ease of review but which combine to form a single feature/bugfix.

These patches should all go via linux-user, yes.

thanks
-- PMM

