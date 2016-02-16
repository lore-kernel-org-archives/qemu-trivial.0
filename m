Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVgnH-0004B4-OD
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 09:39:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgnF-00049D-9P
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgnE-0001ag-DX
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:39:57 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgnE-0001aO-9d
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:39:56 -0500
Received: by mail-vk0-x234.google.com with SMTP id k196so135359305vka.0
	for <qemu-trivial@nongnu.org>; Tue, 16 Feb 2016 06:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/m9YrE4an1J2RQ7xQVwE9I99V78lVuSAKeQJQIYcffY=;
	b=UUPSSe7LavZNnvp4CD6pFmEjpO7IBWf/rVFiOfR7ABxMUCRPV//1MaMuHwiWh+XkN+
	hcegEZibP7TzEOjvsGYFKDwgCS4Rf6AE1WfoQtCUQFQArVRtsihi/03z8P1DJVPKlkMO
	vvDJk7j0bbzwGrroSjfxR0vlkgRF5Axp/iPUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/m9YrE4an1J2RQ7xQVwE9I99V78lVuSAKeQJQIYcffY=;
	b=PLq8t386x8YJfP1b3ihZQJaIXigUUioLL6O2yqKQbxHpl+kdanvY3PVxWtfKNU6RS4
	k5qqpYXTZgS8aVd0l78jEIQEPa+TPpmsZSQWdasrWbyiy8GJ28YxQRjy7xEn/7QyPJJW
	2ieCL1aalO3JT9ua4vXeEzFW7tKfxyYINTDFgIFye1yZDs/XZnSGuQMTEenDZwjtKefb
	8NVdVMGVdQ60OyqKLlYCNMhz3D8d6BePd0zl72A6LEdKy1NCv8ptGlc1TLYSgPrKjaIb
	PxseL06vAbdS2alv0v5v+plrq5K0yYnTatUGLSIPQTWBCZHhGvcSAxB1cIK4zjefhrsl
	dvog==
X-Gm-Message-State: AG10YOReN8gxUcGtdqNiMD4aqKbtJ67i85ts7jAa2OBFtU2o8PMTNCXGkaNPS+Rwtbgvrct2ue3IpHO4KpUFFAAo
X-Received: by 10.31.180.85 with SMTP id d82mr15823249vkf.83.1455633595903;
	Tue, 16 Feb 2016 06:39:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 06:39:36 -0800 (PST)
In-Reply-To: <CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
	<CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 14:39:36 +0000
Message-ID: <CAFEAcA8oUBe+mZ+2Lq0RO2eq_-H+atamp=gBCnxS2OWdkyza0w@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
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
X-List-Received-Date: Tue, 16 Feb 2016 14:39:58 -0000

On 16 February 2016 at 14:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 February 2016 at 20:49, Wei Huang <wei@redhat.com> wrote:
>> Current QEMU doesn't clear PL061 state after reset. This causes a
>> weird issue with guest reboot via GPIO. Here is the device state
>> description with two reboot requests:

>
> These reset values are all OK...
>
>> +
>> +static void pl061_state_reset(DeviceState *dev)
>> +{
>> +    PL061State *s = PL061(dev);
>> +
>> +    pl061_reset(s);
>>  }
>
> ...but you don't need to have this wrapper function.
> You can just do the reset in a function called pl061_reset()
> with the function signature we need for dc->reset.
> The only place that currently calls the existing pl061_reset()
> is the device's init function, and you can delete that call
> because the Device framework automatically calls the dc->reset
> function after device initialization.

I know this patch doesn't (by itself) fix the issues with guest
reboot, but I think it is worth having anyway because not resetting
the PL061 state is a genuine bug. Can you do a v3 and resend, please?

PS: please could you include a cover letter email next time round,
since this is a multi patch series?

Side note: half our "PL061" behaviour is actually specific
to the TI variant in the Luminary, and for our plain old PL061
we ought to restrict access to the registers that are Stellaris
only. But that's a different bug and not a very major one.

thanks
-- PMM

