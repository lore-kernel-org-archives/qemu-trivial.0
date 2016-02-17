Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aW6I7-0006bS-NE
	for mharc-qemu-trivial@gnu.org; Wed, 17 Feb 2016 12:53:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aW6I5-0006a7-HB
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 12:53:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aW6I4-0003AT-Mu
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 12:53:29 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aW6I4-0003AA-Ij
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 12:53:28 -0500
Received: by mail-vk0-x230.google.com with SMTP id e185so21561328vkb.1
	for <qemu-trivial@nongnu.org>; Wed, 17 Feb 2016 09:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=llIrLtjNvZS5E1B2kU7cUYylqW36ywV+TLzVMZWseSQ=;
	b=jv2LkqBDHhK1DnW5YroeS/qzf1ulNr4RlZWRwSCAA7Rd3DTSYWfO8g6hUWrbsjxcFw
	98qAi1cM5ImYewHOyowq+fvdxMzr7lv8dvuGzBZN/HQHkXgkOZLMmubhchv2BtCaohJW
	g+AG1uBd530XfQt5MmTQCBIfMeB+rG+slZy8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=llIrLtjNvZS5E1B2kU7cUYylqW36ywV+TLzVMZWseSQ=;
	b=BUtUK0tYxjobXMiGLK1JH46tAUumaQEGcAs8q2otySSVy8AvjobP+YpcgmCxUlCzQ+
	02Jm06S3GNmuGtUNljXfhaJyga0O7MBm1rlssofifWqxf3fgj6t1E3OcABXx9bDrkbzH
	2d1ZrULm+znDDLRYUuqQYcyaqjM04nlXOGs5gjgxO0bH7tiGgIR2jfClkPro5nIS+tDT
	lW0HeYA4V9Pyl8T26OHsui5/yQuHByGlI+CYwTdHhBNDKsYEif1Ngpz0bR0Y4tg41V3E
	Zhu7CtYrDV42KulLUKjISa5dtn2Xq54DNRYHiEWTX9kdlEmufX+cl5C7S5KHkn2czBdu
	0XaQ==
X-Gm-Message-State: AG10YOQTQJ/VHF0+8dAth1KjTxyK341KDV9eoKrjKrr3GKZMaTG9Bp9GmxnecjBhgpSIBQFTt0UX+mL1hAd5YNlw
X-Received: by 10.31.180.85 with SMTP id d82mr2083609vkf.83.1455731606966;
	Wed, 17 Feb 2016 09:53:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 17 Feb 2016 09:53:07 -0800 (PST)
In-Reply-To: <56C4AF0D.9070803@redhat.com>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
	<CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
	<CAFEAcA8oUBe+mZ+2Lq0RO2eq_-H+atamp=gBCnxS2OWdkyza0w@mail.gmail.com>
	<56C4AF0D.9070803@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2016 17:53:07 +0000
Message-ID: <CAFEAcA-0+HLS4vgG3DqgUqsBNEt=J3M9Fy89uOtTQAtbt5noCQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH V2 1/2] ARM: PL061: Clear PL061 device
	state after reset
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
X-List-Received-Date: Wed, 17 Feb 2016 17:53:30 -0000

On 17 February 2016 at 17:34, Wei Huang <wei@redhat.com> wrote:
> On 02/16/2016 08:39 AM, Peter Maydell wrote:
>> Side note: half our "PL061" behaviour is actually specific
>> to the TI variant in the Luminary, and for our plain old PL061
>> we ought to restrict access to the registers that are Stellaris
>> only. But that's a different bug and not a very major one.
>
> Thanks for your suggestion. I was trying to fix it. The plan was to add
> a new field rsvd_addr in "struct PL061State". Then in pl061_read() and
> pl061_write(), we can check offset against [rsvd_addr, 0xfcc] (ignored
> if inside).
>
> While I was working on it, I realized that this is a benign issue. It is
> true that PL061 device can access Luminary registers in the reserved
> memory area. However QEMU doesn't use these Luminary registers anywhere
> else other than pl061_read() and pl061_write(). It basically passes the
> read/write requests through. I don't see a malicious driver can damage
> device state. Thoughts?

It's not a "malicious guest can do bad things" bug, it's a "modelled
hardware doesn't behave like the real thing" bug. A non-Luminary PL061
should act like the hardware, which means that the registers that don't
exist should be RAZ/WI (and should log guest-errors if the guest tries
to access them), the same way we do in the "default" case of the
case statements for other reserved registers.

thanks
-- PMM

