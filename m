Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXAqa-000541-O0
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 10:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXAqU-0004xR-3y
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXAqJ-00035T-7Y
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:48:21 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:44789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXAqJ-00035E-0e
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:48:11 -0400
Received: by mail-la0-f49.google.com with SMTP id mc6so4768870lab.8
	for <qemu-trivial@nongnu.org>; Mon, 07 Apr 2014 07:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9CgqU+hwhD4aqnUKdiIMGcgwUd9H3a6zOlzjQmI0YT4=;
	b=fE66q2wrBXgOxPLjQblC+0QQ061a31JKna+bGM1UHqibBdP3bkBxhIqRcdQYRq2gHN
	XXZ7g2b6U93Sd8OPFkDYlFC47CFKcZv/Frt1oYdZP2wbGFPFcSX4aL4DGD9vF58Idg/w
	d4FtC8wbW/hiJtYtc6OOxO3ZImRI4iSWdCZqLlwrr1UGQbKX/S6XMYYXA1TmbyDQMKMx
	VacgJz7TzF8YuNgtPciJS+gNmw1dMehFOwVAeEKWoyxKpaL3VI/AmR5ZKx9ALpcUeKEA
	qaPihzHhqkSwrOEsqHQeh0GNaCJ4++LcvNfOSwqQIYH/gexR4gHu11LysBJAWysmE6y5
	YGMA==
X-Gm-Message-State: ALoCoQk/C1Ww4RIsl///FwHRnnC0RD/4W/lql536RjRKbTfAMXXOTHAYMYABudKD9fUnMrwRgOn3
X-Received: by 10.112.119.208 with SMTP id kw16mr20446477lbb.19.1396882089808; 
	Mon, 07 Apr 2014 07:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 7 Apr 2014 07:47:49 -0700 (PDT)
In-Reply-To: <5342B540.4050005@twiddle.net>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<53416107.1080709@msgid.tls.msk.ru>
	<CAFEAcA8sr69XWzFjvBg8VN_ih2O=S78jWrXLrshmQAoWXhTQWw@mail.gmail.com>
	<5342B540.4050005@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Apr 2014 15:47:49 +0100
Message-ID: <CAFEAcA_fp604HJ22hX6MWfjCHEjDCdqBh5-wNb3JX_923iuLew@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 2/3] int128.h: Avoid undefined behaviours
 involving signed arithmetic
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
X-List-Received-Date: Mon, 07 Apr 2014 14:48:27 -0000

On 7 April 2014 15:25, Richard Henderson <rth@twiddle.net> wrote:
> On 04/06/2014 08:27 AM, Peter Maydell wrote:
>> (if C compilers had a "behave
>> like a sane 2s complement system for signed arithmetic"
>> option I'd be advocating for us using it...)
>
> -fwrapv.

Well, we should use that then :-)

thanks
-- PMM

