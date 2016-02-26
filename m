Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZJyR-0005Fs-TF
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 10:06:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZJyO-0005Ep-VL
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:06:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZJyO-0001Jf-5O
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:06:28 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZJyM-0001JE-Ud
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:06:28 -0500
Received: by mail-vk0-x235.google.com with SMTP id k196so80212853vka.0
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 07:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4kkYup5S9CLVLf8g/YI7cUzPtDywLNjSAmiOH9X/YVo=;
	b=QgjzZUZTF9LG9vS3LBmZHpQkzXEm8CLUpGGetdpf+wXOvacJ2t+uX+xOZocmYpdhuZ
	TfS1Qy2mgB3ySZuG9Q1lDS+8fmHbrUek83v/lqq6u1JsyEfx28ofWDOUAv583k1ARA4v
	OFkZT39ONov3QBFTZMM91z3Y8+FNZ1/UXxwSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4kkYup5S9CLVLf8g/YI7cUzPtDywLNjSAmiOH9X/YVo=;
	b=SBHFk0JHTWIbOEnbVW0cPitrQ3GqWj3LR6cO/idlCvIk9kDdNpPIF+gXCf5pR+kXG1
	wLsOytAb0peXNTlKjwVdoix8UNTP/bKJbsl4j8R05Bhm7cwLLDQiz71wBwhJmdvcePzx
	517LycCRFhDr88ejwlWegOtTHd66I2dskpGQ2R5/Orh6rDbn88lV82Yt0E+WjSmu1qIr
	ZT1niF5BOjhXedafEZC3qLQGhtYqADll3+pqaUZar3aEGaWWN+A+JuTslBudA54LOukF
	MtprzHhLGs5SYtxZ/wk4ptaNKfD5BUMnUuqXI7pLBMrVLMo61BNx3n005qPRYncLHcIf
	AKOA==
X-Gm-Message-State: AD7BkJK1ZRccrFkjqh8IQAFZ3Gl8wujX6AY3bC9pLkRp13c/gRpxcAEssqdutBxxZsTV7TgX9+Yh4Xji1bH/Bze5
X-Received: by 10.31.1.6 with SMTP id 6mr1272234vkb.139.1456499186316; Fri, 26
	Feb 2016 07:06:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 07:06:06 -0800 (PST)
In-Reply-To: <56D06712.2030607@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com> <56D04596.7010205@huawei.com>
	<CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
	<56D06712.2030607@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 15:06:06 +0000
Message-ID: <CAFEAcA8DE2Sx4+Rm8cg-tLktW0hz9VcV_7O2jWN5OeA9CwyF4w@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Wei Huang <wei@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] arm: virt: change GPIO
 trigger interrupt to pulse
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
X-List-Received-Date: Fri, 26 Feb 2016 15:06:30 -0000

On 26 February 2016 at 14:54, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> On 2016/2/26 20:53, Peter Maydell wrote:
>> I don't understand why a 500ms pulse is better than a short one.
>>
> Oh, I just pick a value which seems like a real latency for pressing a
> button. What's your suggestion?

I would prefer to avoid the pain of having a timer whose state
needs to be migrated. It's unclear to me why a 500ms pulse
will solve anything that an instantaneous pulse does not,
so I'd like to better understand the problem first.

thanks
-- PMM

