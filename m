Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wpzyx-00044z-OQ
	for mharc-qemu-trivial@gnu.org; Thu, 29 May 2014 09:02:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wpzyq-0003ew-CN
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 09:02:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WpzyN-0003xH-Oa
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 09:02:48 -0400
Received: from mail-la0-f43.google.com ([209.85.215.43]:64929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WpzyN-0003t7-I6
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 09:02:19 -0400
Received: by mail-la0-f43.google.com with SMTP id mc6so167462lab.16
	for <qemu-trivial@nongnu.org>; Thu, 29 May 2014 06:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NUoUsfy24UI5eDOJRgLxJsIg/TTXELNaNkJYQPJteug=;
	b=cUwb6ftgskPQq24mqANi04bjFnw3SoWGNGLIbuUDaTwSwMjsMygjJHhzMqk2beHbqY
	MsJcaF1UaAN0tL57v/t5//nP/9QznyzMdX7lv30lCv1SECPEFlbRp2ZH0mxSiSfqTlBt
	GfZIeZh2GOgXkJdD0yMyvLW6tiJBDYfpmCG8O5DOLXhs8wg+nxW23b8zP/ktCSOhOrxx
	UkMRQ7aCQXMrsUfCAkYVB5c/KaTIN0r4S/u5cNhZDTYRy8JoEyWpSXxwyUT8Ur+G0Xua
	byeZEq+JcVdvkhEYGHoUDoZBlsu8m2xG30JibntF3eYMtx4F7W8JxtA4rQWKPTQ9wf4R
	+IuA==
X-Gm-Message-State: ALoCoQlNjJVISBVl847Mbkj+aYb1msif1w75KODhe9AJQcaqQAPrYj6cMP3WYm1V0Js6/VGQSRTE
X-Received: by 10.112.55.5 with SMTP id n5mr2526393lbp.71.1401368537517; Thu,
	29 May 2014 06:02:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Thu, 29 May 2014 06:01:57 -0700 (PDT)
In-Reply-To: <53872D8F.2060308@weilnetz.de>
References: <1401361215-25752-1-git-send-email-peter.maydell@linaro.org>
	<53872D8F.2060308@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 May 2014 14:01:57 +0100
Message-ID: <CAFEAcA8V7Bs5RCN=C4rEFyrZuRBRrYoMe66pZjCgk9aAmuuTBw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.43
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Remove unused
	zero_ethaddr[] variable
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
X-List-Received-Date: Thu, 29 May 2014 13:02:55 -0000

On 29 May 2014 13:52, Stefan Weil <sw@weilnetz.de> wrote:
> I can add some more:
>
> * Missing 'static' attributes for local variables and functions

Those seem worth fixing.

> * Use of 0 instead of NULL for pointers (do we want to fix those?)

I wouldn't bother personally.

There's also still a tail of coverity issues.

thanks
-- PMM

