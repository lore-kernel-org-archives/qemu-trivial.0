Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwsc-0006SG-6X
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:25:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwsX-0006HQ-UC
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxwsT-0001Bh-Hz
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:25:41 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:47693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxwsS-0001B5-Un; Thu, 28 May 2015 08:25:37 -0400
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA93850; Thu, 28 May 2015 20:25:01 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 28 May 2015 20:25:00 +0800
Message-ID: <5567091A.5050901@huawei.com>
Date: Thu, 28 May 2015 20:24:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-2-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_ya9V+kLVCrqU-wuG7cbJNf4ZX+xS9OsLgmzBveyXT1g@mail.gmail.com>
In-Reply-To: <CAFEAcA_ya9V+kLVCrqU-wuG7cbJNf4ZX+xS9OsLgmzBveyXT1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 01/29] hw/ide/ahci.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:25:43 -0000



On 2015/5/28 20:16, Peter Maydell wrote:
> On 28 May 2015 at 13:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> >
>> > valgrind complains about:
>> > ==23381== 8 bytes in 1 blocks are definitely lost in loss record 438 of 2,785
>> > ==23381==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
>> > ==23381==    by 0x35478F: malloc_and_trace (vl.c:2556)
>> > ==23381==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> > ==23381==    by 0x3ED98B: qemu_extend_irqs (irq.c:55)
>> > ==23381==    by 0x3EDA17: qemu_allocate_irqs (irq.c:64)
>> > ==23381==    by 0x43D767: ahci_init (ahci.c:1356)
>> > ==23381==    by 0x43DAC5: sysbus_ahci_realize (ahci.c:1520)
>> > ==23381==    by 0x3EA4CC: device_set_realized (qdev.c:1058)
>> > ==23381==    by 0x516CD2: property_set_bool (object.c:1514)
>> > ==23381==    by 0x5155CC: object_property_set (object.c:837)
>> > ==23381==    by 0x5178EE: object_property_set_qobject (qom-qobject.c:24)
>> > ==23381==    by 0x51583B: object_property_set_bool (object.c:905)
>> >
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/ide/ahci.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
>> > index 9e5d862..4702a05 100644
>> > --- a/hw/ide/ahci.c
>> > +++ b/hw/ide/ahci.c
>> > @@ -1367,6 +1367,7 @@ void ahci_init(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
>> >          ad->port.dma->ops = &ahci_dma_ops;
>> >          ide_register_restart_cb(&ad->port);
>> >      }
>> > +    g_free(irqs);
>> >  }
> Freeing the return value of qemu_allocate_irqs()
> directly rather than using qemu_free_irqs() looks
> dubious to me.

qemu_free_irqs() will free the return value self of qemu_allocate_irqs()
and also will free all the contents of this array while some of them are
still in use.

-- 
Shannon


