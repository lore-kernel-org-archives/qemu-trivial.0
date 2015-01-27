Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8Ob-0004Sc-Lz
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 10:49:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YG8OU-0004ID-2F
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YG8OQ-0000uJ-T0
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:49:33 -0500
Received: from mail-la0-f45.google.com ([209.85.215.45]:38225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YG8OQ-0000sM-N2
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 10:49:30 -0500
Received: by mail-la0-f45.google.com with SMTP id gd6so13969435lab.4
	for <qemu-trivial@nongnu.org>; Tue, 27 Jan 2015 07:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/NRvTyQn5pJjWbRAItJiFBjyfgmFKtX9p6PQRpumTIg=;
	b=U5v3hM5N0KMl84jJWz8gdUadufKsxiABpx7tx2e0SGP1MaKKlfS6Lk0uPEor3ecvuA
	kAy7d7q4SRr5dCm2k7K8tQfFDGL9qKj6jq25SFPriz9AsL7T1AjlwAz35Rt3/y0KlZA2
	DD9Qya9GseWR6ldhoMp8sI3TgWsPfQAkC8VmKqwHBw6RwbxRYWCguCxFdkaY3fPfD4qJ
	wCnAn6ZxXxunpaqzoZmlrkpjG3I5lyWzKJ3VDRToi7cz2EjcoQ80SdsMSzB/lPdkSF2U
	VvXG5/A8hkr/5nDl2bCd91xyQcB6F44iW357yeQiNiHtl+kIc6EP4x9RQPc1zEPVDYup
	RhSQ==
X-Gm-Message-State: ALoCoQnXwk7xOIYhWUwiXNW444SRkMSbrHLUK00D5rZgTV5b7gfqFBSBJQxD/TnX9HYFM3yyMCpz
X-Received: by 10.153.5.35 with SMTP id cj3mr2494641lad.49.1422373769726; Tue,
	27 Jan 2015 07:49:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Tue, 27 Jan 2015 07:49:09 -0800 (PST)
In-Reply-To: <54C7B30D.4060204@msgid.tls.msk.ru>
References: <54C4D51E.4030408@sunrus.com.cn>
	<54C7B30D.4060204@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2015 15:49:09 +0000
Message-ID: <CAFEAcA_0AJNCkhRwm5B1KroDRaF2ks-n3wf09tQzKTeOqNRHnQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	Chen Gang S <gang.chen@sunrus.com.cn>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/main.c: Use TARGET_SIG*
	instead of SIG*
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
X-List-Received-Date: Tue, 27 Jan 2015 15:49:40 -0000

On 27 January 2015 at 15:47, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 25.01.2015 14:35, Chen Gang S wrote:
>> In main.c, all SIG* need be change to TARGET_SIG*, since the related
>> next call are all for TARGET_SIG*: queue_signal() and gdb_handlesig().
>
> In main.c, all SIG* should be TARGET_SIG*, since the relevant functions
> (queue_signal() and gdb_handlesig()) expects TARGET_SIG*.

"expect", if you want to be picky about the grammar...

-- PMM

