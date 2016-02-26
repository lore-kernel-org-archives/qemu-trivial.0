Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZKXA-0001zf-QT
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 10:42:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZKX8-0001uk-9W
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:42:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZKX7-0005eT-Ah
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:42:22 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZKX6-0005dN-4Q
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 10:42:21 -0500
Received: by mail-vk0-x22f.google.com with SMTP id k196so81224298vka.0
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 07:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zla3eJUD4S3ZSZLCHfG5g1KtRU7TkDoWBe15YSsgr+w=;
	b=aWV4LzOuTN3wKlQFymn0Uhz8Yl2YQjyXj7DPw75I4SGjrcz5sczXuw8YryVj8XdohD
	JGjVhzF2lwDsDMCUkKPo/F7ePSBTlUZenK6m0Jm2Q6WwTT4bc+IsTgXENgKlyxjTTThr
	rln57agp8G2IcHGtub9L7a0517KiQQr7PvNAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zla3eJUD4S3ZSZLCHfG5g1KtRU7TkDoWBe15YSsgr+w=;
	b=kb/KZPwJ32Bw66pVEVpLusZ9PNjZVnZgtusXDUUQarfjMsv+bNNCu8lxggvewZ8FFc
	uZ6bWaex6SJ9b4N9uLu8BPp4KtVKZauw1Vdxqn4BqDHkUu/ooXVgELlq/hHAcnU15iwD
	RLveXixx+0hCRhin1rrC571Mt/czY12fYk3TN6jY0IJrba1RnjSwVZpkKEn6G5T1HHfX
	T79AaKwR6D+RQFKLzNKiUcZcz3woI5c+R/n5MQWCA+8ykN16dpNzgPlsHMcllfl4bpxm
	1M/L12+1UoRsb2Rn3DmSZ2RSkKOqJ0VYUmoN6eYYqhrx1ifVSrrXuppJBXNKRBi9Kzir
	Al4w==
X-Gm-Message-State: AD7BkJIB6z6rsuKkPv5kI8JdpezyNFafk34GH1ZFOZ28cGPVU7g82izdl2xDpXcbrSInF78XtUP2+DbSRz+L1N/H
X-Received: by 10.31.141.2 with SMTP id p2mr1687909vkd.37.1456501339690; Fri,
	26 Feb 2016 07:42:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 07:42:00 -0800 (PST)
In-Reply-To: <56D06F29.7040106@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com> <56D04596.7010205@huawei.com>
	<CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
	<56D06712.2030607@linaro.org>
	<CAFEAcA8DE2Sx4+Rm8cg-tLktW0hz9VcV_7O2jWN5OeA9CwyF4w@mail.gmail.com>
	<56D06F29.7040106@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 15:42:00 +0000
Message-ID: <CAFEAcA8_bP64H0EOnx_gSWmMXcQvHFy8L+ervvgDkJE1xqtkbA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
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
X-List-Received-Date: Fri, 26 Feb 2016 15:42:23 -0000

On 26 February 2016 at 15:28, Wei Huang <wei@redhat.com> wrote:
>
>
> On 02/26/2016 09:06 AM, Peter Maydell wrote:
>> On 26 February 2016 at 14:54, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>>> On 2016/2/26 20:53, Peter Maydell wrote:
>>>> I don't understand why a 500ms pulse is better than a short one.
>>>>
>>> Oh, I just pick a value which seems like a real latency for pressing a
>>> button. What's your suggestion?
>>
>> I would prefer to avoid the pain of having a timer whose state
>> needs to be migrated. It's unclear to me why a 500ms pulse
>> will solve anything that an instantaneous pulse does not,
>> so I'd like to better understand the problem first.
>
> The problem we found with pulse was: only the last state change in GPIO
> is received by guest VM. In other words, with 0(L)->1(H)->0(L) or
> 1(H)->0(L)->1(0), PL061 only sees the last state (0 and 1). I guess this
> is because QEMU is non-preemptive. The solution is to have the following
> steps:
>   * qemu_set_irq(gpio_in, 1)
>   * yeild to guest VM
>   * qemu_set_irq(gpio_in, 0)
>
> Is there any way to do so in QEMU without using timer?

You have no guarantee that the guest VM will necessarily
make any progress even with a 500ms pulse length, so I don't
think increasing the length of the pulse is going to solidly
fix this.

As usual with any kind of interrupt you either need to
trigger on an edge (and latch the trigger in the interrupt
controller until the guest picks it up), or trigger on a
level, and keep the level high until the guest acknowledges
by writing back to the original device to tell it to drop
the level.

thanks
-- PMM

