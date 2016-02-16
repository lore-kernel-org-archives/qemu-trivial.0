Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVgj0-0000Ri-VI
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 09:35:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgiu-0000IT-NP
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:35:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgit-0000Fa-Cs
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:35:28 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVgit-0000F2-3i
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 09:35:27 -0500
Received: by mail-vk0-x22b.google.com with SMTP id k196so135237009vka.0
	for <qemu-trivial@nongnu.org>; Tue, 16 Feb 2016 06:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=f3+vxIAgED1tFuSifiU0hKUGOlbbspasHyePGHRk1o8=;
	b=ASgD2Cj/vfpzrDsDjeOT0E6rBkYXEA+xaFE5upwf04SfcLdtLLJT8VVILzFMUZfny6
	Y1N2WdX8hjj8f6/2EadVMFaTi141cDftCrh9heZsEl30KKPj59lb9UFJ4YDqdZ2ntQGZ
	cihrg+XMWIccU/YVFgEnYp0TMCFKNdLXFlHHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f3+vxIAgED1tFuSifiU0hKUGOlbbspasHyePGHRk1o8=;
	b=mI6gZ4xWVoK0tQrh6NveGchyhVjQfAZ6Dc+VU32FVgEq0edOKF7bTsuemDdR5BOzj3
	kSONV+Vr+6BYyaNCH8r/zGWnKGiVm3mp2o8m3pmRq6T/aZDC+LdkEYtjz2w8CtEk53j+
	dfNEtIeCQWXAcXWvQYdanB+RqN5n0iW/+vzqHKQilwmi4eX+IV7CJEQi1Arf1wwHsREU
	fE2Isd7JQlGGuqocsrGHI65eg6HYo0xsybJxMlBd3hWTKJKE7vVknles+MX440skd6TO
	/gSj15sUVWDSctUvoxyrc19CKhjFByAMMxk3knn9HvGbx7TPfLnmJCDO35Ywac7EVZlX
	l/6A==
X-Gm-Message-State: AG10YOQ6bI9qmMRaArMwnHuxkRzC7ltL9/8rfzSrslsGH4yenaeUqqW32jXV6+yhehqnIlpZKC8f0MbaqUCL0kRP
X-Received: by 10.31.141.2 with SMTP id p2mr18052791vkd.37.1455633326530; Tue,
	16 Feb 2016 06:35:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 06:35:07 -0800 (PST)
In-Reply-To: <1454359775-25959-1-git-send-email-wei@redhat.com>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 14:35:07 +0000
Message-ID: <CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
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
X-List-Received-Date: Tue, 16 Feb 2016 14:35:33 -0000

On 1 February 2016 at 20:49, Wei Huang <wei@redhat.com> wrote:
> Current QEMU doesn't clear PL061 state after reset. This causes a
> weird issue with guest reboot via GPIO. Here is the device state
> description with two reboot requests:
>
>   (PL061State fields)           data   old_in_data   istate
> VM boot                         0      0             0
> After 1st ACPI reboot request   8      8             8
> After VM PL061 driver ACK       8      8             0
> After VM reboot                 8      8             0
> ------------------------------------------------------------
> 2nd ACPI reboot request         8
>
> In the second reboot request above, because old_in_data field is 8,
> QEMU decides that there is a pending edge IRQ already (see
> pl061_update()) in input; so it doesn't raise up IRQ again. As a result
> the second reboot request is lost. The correct way is to clear PL061
> device state after reset.
>
> NOTE: The reset state is found from the following documentation:
>  - PL061 Technical Reference Manual
>  - Stellaris LM3S8962 Microcontroller Data Sheet
>  - Stellaris LM3S5P31 Microcontroller Data Sheet
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/gpio/pl061.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index e5a696e..342a70d 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -284,8 +284,35 @@ static void pl061_write(void *opaque, hwaddr offset,
>
>  static void pl061_reset(PL061State *s)
>  {
> -  s->locked = 1;
> -  s->cr = 0xff;
> +    /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
> +    s->data = 0;
> +    s->old_out_data = 0;
> +    s->old_in_data = 0;
> +    s->dir = 0;
> +    s->isense = 0;
> +    s->ibe = 0;
> +    s->iev = 0;
> +    s->im = 0;
> +    s->istate = 0;
> +    s->afsel = 0;
> +    s->dr2r = 0xff;
> +    s->dr4r = 0;
> +    s->dr8r = 0;
> +    s->odr = 0;
> +    s->pur = 0;
> +    s->pdr = 0;
> +    s->slr = 0;
> +    s->den = 0;
> +    s->locked = 1;
> +    s->cr = 0xff;
> +    s->amsel = 0;
> +}

These reset values are all OK...

> +
> +static void pl061_state_reset(DeviceState *dev)
> +{
> +    PL061State *s = PL061(dev);
> +
> +    pl061_reset(s);
>  }

...but you don't need to have this wrapper function.
You can just do the reset in a function called pl061_reset()
with the function signature we need for dc->reset.
The only place that currently calls the existing pl061_reset()
is the device's init function, and you can delete that call
because the Device framework automatically calls the dc->reset
function after device initialization.

thanks
-- PMM

