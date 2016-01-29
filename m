Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPANp-0007B8-7M
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 09:50:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aPANl-00075H-VS
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:50:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aPANk-0000nt-TF
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:50:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aPANg-0000io-GL; Fri, 29 Jan 2016 09:50:36 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 03636C0B66CB;
	Fri, 29 Jan 2016 14:50:36 +0000 (UTC)
Received: from [10.10.49.93] (vpn-49-93.rdu2.redhat.com [10.10.49.93])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0TEoYOa000696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jan 2016 09:50:35 -0500
To: Shannon Zhao <shannon.zhao@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
From: Wei Huang <wei@redhat.com>
Message-ID: <56AB7C3A.2080806@redhat.com>
Date: Fri, 29 Jan 2016 08:50:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56AB7B48.9020007@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 29 Jan 2016 14:50:43 -0000



On 01/29/2016 08:46 AM, Shannon Zhao wrote:
>=20
>=20
> On 2016/1/29 22:35, Wei Huang wrote:
>>
>>
>> On 01/29/2016 04:10 AM, Shannon Zhao wrote:
>>> Hi=EF=BC=8C
>>>
>>> This makes ACPI work well but makes DT not work. The reason is
>>> systemd or
>>> acpid open /dev/input/event0 failed. So the interrupt could be
>>> injected and
>>> could see under /proc/interrupts but guest doesn't have any action. I=
'll
>>> investigate why it opens failed later.
>>
>> That is interesting. Could you try it with the following? This reverse=
s
>> the order to down-up and worked on ACPI case.
>>
> Yeah, that's very weird.
>=20
>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>
> I'll try this tomorrow. But even if this works, it's still weird.

To reproduce this case, do the following steps using current upstream
qemu: create vm =3D> reboot vm (succeed) =3D> reboot or shutdown vm (fail=
).
Apparently the last interrupt wasn't received correctly.

-Wei


>=20
>> Thanks,
>> -Wei
>>
>>>
>>> 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94=EF=BC=8C=
Wei Huang <wei@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>
>>>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>>>> request will succeed; but the following shutdown/reboot requests
>>>> fail to trigger VMs to react. Notice that in mach-virt machine
>>>> model GPIO is defined as edge-triggered and active-high in ACPI.
>>>> This patch changes the behavior of powerdown notifier from PULLUP
>>>> to PULSE. It solves the problem described above (i.e. reboot
>>>> continues to work).
>>>>
>>>> Signed-off-by: Wei Huang <wei@redhat.com <javascript:;>>
>>>> ---
>>>>   hw/arm/virt.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 05f9087..b5468a9 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -546,7 +546,7 @@ static DeviceState *pl061_dev;
>>>>   static void virt_powerdown_req(Notifier *n, void *opaque)
>>>>   {
>>>>       /* use gpio Pin 3 for power button event */
>>>> -    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>>> +    qemu_irq_pulse(qdev_get_gpio_in(pl061_dev, 3));
>>>>   }
>>>>
>>>>   static Notifier virt_system_powerdown_notifier =3D {
>>>> --=20
>>>> 1.8.3.1
>>>>
>>>>
>>>
>=20

