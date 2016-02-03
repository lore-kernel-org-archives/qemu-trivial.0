Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQrf7-00025n-H0
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 02:15:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQrf4-000242-V1
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 02:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQrf4-0002YN-1v
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 02:15:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aQrex-0002X0-C2; Wed, 03 Feb 2016 02:15:27 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A240403C7;
	Wed,  3 Feb 2016 10:15:27 +0300 (MSK)
To: Wei Huang <wei@redhat.com>, qemu-devel@nongnu.org
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56B1A90E.3000506@msgid.tls.msk.ru>
Date: Wed, 3 Feb 2016 10:15:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454005340-15682-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, shannon.zhao@linaro.org,
	zhaoshenglong@huawei.com
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
X-List-Received-Date: Wed, 03 Feb 2016 07:15:36 -0000

28.01.2016 21:22, Wei Huang wrote:
> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
> request will succeed; but the following shutdown/reboot requests
> fail to trigger VMs to react. Notice that in mach-virt machine
> model GPIO is defined as edge-triggered and active-high in ACPI.
> This patch changes the behavior of powerdown notifier from PULLUP
> to PULSE. It solves the problem described above (i.e. reboot
> continues to work).

So, what's the outcome of this? :)

Thanks,

/mjt

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
>  static Notifier virt_system_powerdown_notifier = {
> 


