Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPAOG-0007l7-GC
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 09:51:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPAOE-0007hy-4e
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPAOD-00018A-14
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:51:10 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPAOC-000184-Tq
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:51:08 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e64so43335574vkg.0
	for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2016 06:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Pb1iD1kn9J4ICgCM7kvtgcoG3D08RnfDncLqr+OjBPc=;
	b=QAgOkh0nKZgU2fYH7US0zrm6Oo+nVnqdBHA9XCzYDsDnvm16zEeO9oiYS6GoeR8NHu
	e51jX6hBPCKGK2YGhp6KBEWFC7i/DMazfAU0yXMyddR1P3r4bzVr2O/u0CQ9+W/f6DqZ
	Gb+F9cafLB8A0QqdKGlr868W9fD8DPKSk+4ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pb1iD1kn9J4ICgCM7kvtgcoG3D08RnfDncLqr+OjBPc=;
	b=OBN8QciIk/b7cOnId9/KHlNbAeM8fB4WFggnZpS8GJExmYqJo6V2fMFhLJfgBrBDPs
	bCNqgrwr20a0J1bnP46hVQ1TV0h6LeHSVswe0rN9+QXGJb0R00ppkB03MOjAmxuvlP+Y
	E/QiNeku4eZOfzav87zZDU5N4cEzgDXAtFnHDXKi2wqRigxZJjcWDGuOScpa/qCHAwpa
	r1Lj0PSOVUPt8nucmMwCYNZBewfGMeutTT9+oqGVkodQ5a7VmYUhaO9pwxkuJaMTvO9T
	mbFALZlnl+/zEIg6rjBGC0xiWNCkox3et1IJrLsUhJI6PU2svVeXRk4aRKdbRX00jvIA
	lRhA==
X-Gm-Message-State: AG10YOQaPsDcuuHBI+m28matPsl0C7U2TCJSUtumz+ij7a3pHTknvSKQmX8IwnD3Plfi5fm63uQON0VrcXJ4Bap+
X-Received: by 10.31.141.2 with SMTP id p2mr6217438vkd.37.1454079068460; Fri,
	29 Jan 2016 06:51:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 29 Jan 2016 06:50:49 -0800 (PST)
In-Reply-To: <56AB7B48.9020007@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2016 14:50:49 +0000
Message-ID: <CAFEAcA9MYCFf-GCTnzHWUkaf6=_QCh=dsceaSg+4j8m3qgucpw@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Wei Huang <wei@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"zhaoshenglong@huawei.com" <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger
	interrupt to pulse
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
X-List-Received-Date: Fri, 29 Jan 2016 14:51:11 -0000

On 29 January 2016 at 14:46, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> On 2016/1/29 22:35, Wei Huang wrote:
>> On 01/29/2016 04:10 AM, Shannon Zhao wrote:
>>> This makes ACPI work well but makes DT not work. The reason is systemd or
>>> acpid open /dev/input/event0 failed. So the interrupt could be injected
>>> and
>>> could see under /proc/interrupts but guest doesn't have any action. I'll
>>> investigate why it opens failed later.
>>
>>
>> That is interesting. Could you try it with the following? This reverses
>> the order to down-up and worked on ACPI case.
>>
> Yeah, that's very weird.
>
>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>
> I'll try this tomorrow. But even if this works, it's still weird.

I wonder if we should be asserting the GPIO pin in the powerdown-request
hook and then deasserting it on system reset somewhere...

thanks
-- PMM

