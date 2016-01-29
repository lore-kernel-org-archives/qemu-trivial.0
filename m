Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aP65W-00051G-Sy
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 05:15:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aP62p-0004jJ-2J
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 05:15:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aP60o-0007KX-9E
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 05:12:46 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:32824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aP60n-0007Jr-FQ
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 05:10:42 -0500
Received: by mail-wm0-x233.google.com with SMTP id l66so60565421wml.0
	for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2016 02:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yTSpydWMuVNYL0t0Vx8jK8G0RJ4vjtMr3iX8Tz+kOB0=;
	b=fEei87ZYaEy4O71wuonNRSe/CfxxE1roQcOwuVwT5luxLDSNoWcf+55kImEWEcyw6U
	O8MaTcu3iichhtwOF///FcMwf0PJtUsAqHcqkZPpWQI/fy5QZjKMaOfSJlC8j6hUZuBl
	bHvVPRQLusS3++z7ikJR3X08t2LYQ4RDwdDoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yTSpydWMuVNYL0t0Vx8jK8G0RJ4vjtMr3iX8Tz+kOB0=;
	b=aRS1laYiBvduDGQ19rKNF/D6L7X0dZ9qBgXG9XOu3JUBvFCVnya4m5RJdRYuvFvQ3r
	cctEq/rnOiLFLzdWfnQXPHkEC7ytrbVi4ZFzpaNwgG8chw4j6/yfG8wYtyKrai5kS+2+
	0qtbg9R9woSNmfAx+W1xNOwyWhrX48iPomNZ2G66Dm5mQibA8AX6xtVEH89Ya6XOZYGM
	NGxO0ZgG3/K8IZNEnr2oIC2865UaArxqpFrBLSKCxdXoDbv2spvXgv0Qloi7JwIxgeeF
	e593ASnU6S6C91eUALbWsUQkVYuMQaYVsJNifmz5F3fAOnHObk42zPEXg0FawwfQI+8W
	pdiA==
X-Gm-Message-State: AG10YOSRI7eqpIm4r7F/wVHRn40GlcwYoCKr/OlaYiJeQoEcbyCjO8h8YmJBcL2MUuEyaDmERcaN04cP45T9L7g9
MIME-Version: 1.0
X-Received: by 10.28.9.67 with SMTP id 64mr8109696wmj.10.1454062240478; Fri,
	29 Jan 2016 02:10:40 -0800 (PST)
Received: by 10.194.38.134 with HTTP; Fri, 29 Jan 2016 02:10:40 -0800 (PST)
In-Reply-To: <1454005340-15682-1-git-send-email-wei@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
Date: Fri, 29 Jan 2016 18:10:40 +0800
Message-ID: <CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
From: Shannon Zhao <shannon.zhao@linaro.org>
To: Wei Huang <wei@redhat.com>
Content-Type: multipart/alternative; boundary=001a11441f64535f26052a763fa2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
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
X-List-Received-Date: Fri, 29 Jan 2016 10:15:32 -0000

--001a11441f64535f26052a763fa2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C

This makes ACPI work well but makes DT not work. The reason is systemd or
acpid open /dev/input/event0 failed. So the interrupt could be injected and
could see under /proc/interrupts but guest doesn't have any action. I'll
investigate why it opens failed later.

2016=E5=B9=B41=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94=EF=BC=8CWei H=
uang <wei@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A

> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
> request will succeed; but the following shutdown/reboot requests
> fail to trigger VMs to react. Notice that in mach-virt machine
> model GPIO is defined as edge-triggered and active-high in ACPI.
> This patch changes the behavior of powerdown notifier from PULLUP
> to PULSE. It solves the problem described above (i.e. reboot
> continues to work).
>
> Signed-off-by: Wei Huang <wei@redhat.com <javascript:;>>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 05f9087..b5468a9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -546,7 +546,7 @@ static DeviceState *pl061_dev;
>  static void virt_powerdown_req(Notifier *n, void *opaque)
>  {
>      /* use gpio Pin 3 for power button event */
> -    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
> +    qemu_irq_pulse(qdev_get_gpio_in(pl061_dev, 3));
>  }
>
>  static Notifier virt_system_powerdown_notifier =3D {
> --
> 1.8.3.1
>
>

--001a11441f64535f26052a763fa2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C<div><br></div><div>This makes ACPI work well but makes DT not w=
ork. The reason is systemd or acpid=C2=A0open /dev/input/event0 failed. So =
the interrupt could be injected and could see under /proc/interrupts but gu=
est doesn&#39;t have any action. I&#39;ll investigate why it opens failed=
=C2=A0<span></span>later.<br><br>2016=E5=B9=B41=E6=9C=8829=E6=97=A5=E6=98=
=9F=E6=9C=9F=E4=BA=94=EF=BC=8CWei Huang &lt;<a href=3D"mailto:wei@redhat.co=
m">wei@redhat.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">When QEMU is hook&#39;ed up with libvirt/virsh, the first ACP=
I reboot<br>
request will succeed; but the following shutdown/reboot requests<br>
fail to trigger VMs to react. Notice that in mach-virt machine<br>
model GPIO is defined as edge-triggered and active-high in ACPI.<br>
This patch changes the behavior of powerdown notifier from PULLUP<br>
to PULSE. It solves the problem described above (i.e. reboot<br>
continues to work).<br>
<br>
Signed-off-by: Wei Huang &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;wei@redhat.com&#39;)">wei@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/virt.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/arm/virt.c b/hw/arm/virt.c<br>
index 05f9087..b5468a9 100644<br>
--- a/hw/arm/virt.c<br>
+++ b/hw/arm/virt.c<br>
@@ -546,7 +546,7 @@ static DeviceState *pl061_dev;<br>
=C2=A0static void virt_powerdown_req(Notifier *n, void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* use gpio Pin 3 for power button event */<br>
-=C2=A0 =C2=A0 qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);<br>
+=C2=A0 =C2=A0 qemu_irq_pulse(qdev_get_gpio_in(pl061_dev, 3));<br>
=C2=A0}<br>
<br>
=C2=A0static Notifier virt_system_powerdown_notifier =3D {<br>
--<br>
1.8.3.1<br>
<br>
</blockquote></div>

--001a11441f64535f26052a763fa2--

