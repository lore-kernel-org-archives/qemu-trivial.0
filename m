Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQwqJ-0006Iq-08
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 07:47:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aQwq9-00066a-SE
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 07:47:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aQwq8-0006M4-Jj
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 07:47:21 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:25857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aQwq3-0006H8-08; Wed, 03 Feb 2016 07:47:15 -0500
Received: from 172.24.1.50 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAV83241; Wed, 03 Feb 2016 20:46:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Wed, 3 Feb 2016
	20:46:37 +0800
Message-ID: <56B1F6AC.1070902@huawei.com>
Date: Wed, 3 Feb 2016 20:46:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, <qemu-devel@nongnu.org>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
In-Reply-To: <1454359775-25959-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56B1F6BB.00E8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d55ffef02e2b294055ba3e7f851eff49
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, shannon.zhao@linaro.org,
	imammedo@redhat.com
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
X-List-Received-Date: Wed, 03 Feb 2016 12:47:27 -0000

Hi Wei,

This still has a problem as I said before.

If we execute "virsh reboot xxx" during VM booting(i.e. before the PL061
driver loaded), then after VM booting, the VM will not have any reaction
to the "virsh reboot xxx".

On 2016/2/2 4:49, Wei Huang wrote:
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
> +
> +static void pl061_state_reset(DeviceState *dev)
> +{
> +    PL061State *s = PL061(dev);
> +
> +    pl061_reset(s);
>  }
>  
>  static void pl061_set_irq(void * opaque, int irq, int level)
> @@ -343,6 +370,7 @@ static void pl061_class_init(ObjectClass *klass, void *data)
>  
>      k->init = pl061_initfn;
>      dc->vmsd = &vmstate_pl061;
> +    dc->reset = &pl061_state_reset;
>  }
>  
>  static const TypeInfo pl061_info = {
> 

-- 
Shannon


