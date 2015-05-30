Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YybEJ-0004hq-Ek
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybEH-0004hi-5m
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YybEC-0007W0-Rn
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:30:49 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:12937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YybEC-0007TB-85; Sat, 30 May 2015 03:30:44 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGU03433; Sat, 30 May 2015 15:27:15 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 30 May 2015 15:27:10 +0800
Message-ID: <5569664B.5030403@huawei.com>
Date: Sat, 30 May 2015 15:27:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Cornelia Huck <cornelia.huck@de.ibm.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>	<1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
	<20150528151118.78bed6a5.cornelia.huck@de.ibm.com>
In-Reply-To: <20150528151118.78bed6a5.cornelia.huck@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.55696654.00F1, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6bd1fe203a08a2f85cfd8034f6bdb689
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 29/29] hw/s390x/sclpcpu.c:
 Fix memory leak spotted by valgrind
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
X-List-Received-Date: Sat, 30 May 2015 07:30:50 -0000



On 2015/5/28 21:11, Cornelia Huck wrote:
> On Thu, 28 May 2015 20:08:52 +0800
> Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> 
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > valgrind complains about:
>> > ==1413== 188 (8 direct, 180 indirect) bytes in 1 blocks are definitely lost in loss record 951 of 1,199
>> > ==1413==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
>> > ==1413==    by 0x262D8B: malloc_and_trace (vl.c:2556)
>> > ==1413==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> > ==1413==    by 0x2C7ACF: qemu_extend_irqs (irq.c:55)
>> > ==1413==    by 0x2C7B5B: qemu_allocate_irqs (irq.c:64)
>> > ==1413==    by 0x2168F4: irq_cpu_hotplug_init (sclpcpu.c:84)
>> > ==1413==    by 0x21623F: event_realize (event-facility.c:385)
>> > ==1413==    by 0x2C4610: device_set_realized (qdev.c:1058)
>> > ==1413==    by 0x317DDA: property_set_bool (object.c:1514)
>> > ==1413==    by 0x3166D4: object_property_set (object.c:837)
>> > ==1413==    by 0x3189F6: object_property_set_qobject (qom-qobject.c:24)
>> > ==1413==    by 0x316943: object_property_set_bool (object.c:905)
>> > 
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/s390x/sclpcpu.c | 9 ++++++---
>> >  1 file changed, 6 insertions(+), 3 deletions(-)
>> > 
>> > diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
>> > index 2fe8b5a..1090e2f 100644
>> > --- a/hw/s390x/sclpcpu.c
>> > +++ b/hw/s390x/sclpcpu.c
>> > @@ -25,13 +25,13 @@ typedef struct ConfigMgtData {
>> >      uint8_t event_qualifier;
>> >  } QEMU_PACKED ConfigMgtData;
>> > 
>> > -static qemu_irq *irq_cpu_hotplug; /* Only used in this file */
>> > +static qemu_irq irq_cpu_hotplug; /* Only used in this file */
>> > 
>> >  #define EVENT_QUAL_CPU_CHANGE  1
>> > 
>> >  void raise_irq_cpu_hotplug(void)
>> >  {
>> > -    qemu_irq_raise(*irq_cpu_hotplug);
>> > +    qemu_irq_raise(irq_cpu_hotplug);
>> >  }
>> > 
>> >  static unsigned int send_mask(void)
>> > @@ -81,7 +81,10 @@ static void trigger_signal(void *opaque, int n, int level)
>> > 
>> >  static int irq_cpu_hotplug_init(SCLPEvent *event)
>> >  {
>> > -    irq_cpu_hotplug = qemu_allocate_irqs(trigger_signal, event, 1);
>> > +    qemu_irq irq = qemu_allocate_irq(trigger_signal, event, 0);
>> > +
>> > +    irq_cpu_hotplug = irq;
>> > +    qemu_free_irq(irq);
> This looks... odd. But then, the whole code structure here with its
> global variable and its roundabout way of triggering the notification
> looks weird. We'd probably be better off looking up the sclp event for
> cpu hotplug and triggering the interrupt directly.
> 

Yeah, it's odd and　I don't find who calls raise_irq_cpu_hotplug().

-- 
Shannon


