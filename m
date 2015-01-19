Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDEjI-0000Si-H0
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jan 2015 10:59:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDEjF-0000OH-Is
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 10:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDEj7-00055g-4B
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 10:59:01 -0500
Received: from mail-la0-f44.google.com ([209.85.215.44]:55385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDEj6-00055b-TZ
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 10:58:53 -0500
Received: by mail-la0-f44.google.com with SMTP id hv19so2135124lab.3
	for <qemu-trivial@nongnu.org>; Mon, 19 Jan 2015 07:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vUxq3qlxkJz8NzORKTh5S6yIlWEVWR3qXTZwgDj9c+4=;
	b=i0vyOxv0mK7MexL1fFnX+6a67bOQGIvFXJFW6RrfTlInvvuttYvQpdNRo5SHv5mQGq
	BNEAComyF+NkroC/OsRGntAlet0Sg+91ggWsRGDAYeY7weNo7DMXmZgfQ+BJbzWBwiHq
	sEDf4Vimfu0XW3UsIwOVwdO7DzQCfyITNtlCaiQJM1Kq25z9gMKaJ4Q1Be6kMyUj3q3P
	b5D6USvv4aPwqHRVt1yWDisgFBqMgQNj14bYQ2n3omoXDqtdIJAZb/aerzdZrTTzvxyL
	edteYK6i2FpGUoxdpP+xJ46l0gdYUHNCoeT55K7yNiGJIRZSNB/VHRZ0t3Xfp2yVGQJk
	w7gQ==
X-Gm-Message-State: ALoCoQk+4j7trDdgKhKnl4/zXw/6tDL60aJ4frBMU0kGSlkgu/7spVFfjtYw3/HvuzmW3eFTKPWJ
X-Received: by 10.152.4.200 with SMTP id m8mr31888318lam.17.1421683130373;
	Mon, 19 Jan 2015 07:58:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Mon, 19 Jan 2015 07:58:30 -0800 (PST)
In-Reply-To: <54BD23F7.7010700@gmail.com>
References: <54BD23F7.7010700@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jan 2015 15:58:30 +0000
Message-ID: <CAFEAcA9a3msdQYp_2VTYdzT5JGmPtReLMYxtEuFGB=HqsaAxRw@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, "rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: Use macro instead of
 hard code number 0xffffffff for tcg_target_ulong using
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
X-List-Received-Date: Mon, 19 Jan 2015 15:59:04 -0000

On 19 January 2015 at 15:34, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> For tcg_target_ulong (include TCGArg), it often uses lower 32-bit mask
> and higher 32-bit mask, so define the related macro for it, so can let
> code simpler, and avoid various coding styles for them.
>
>  - For lower, some append 'u', some append 'U', and some no 'u' or 'U'.
>
>  - For higher, some append 'ull', some use type cast.
>
>  - For lower but may be used higher bits, append 'ull'.

Is this patch fixing any actual bugs? I think code-style-wise
I prefer what we have at the moment...

-- PMM

