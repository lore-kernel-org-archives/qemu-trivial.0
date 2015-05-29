Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yy9lo-0006we-Qs
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 22:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yy9lm-0006vx-AU
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 22:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yy9lj-0005De-52
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 22:11:34 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:50503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yy9li-0005Bb-HR; Thu, 28 May 2015 22:11:31 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COQ57689; Fri, 29 May 2015 10:11:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 29 May 2015 10:11:08 +0800
Message-ID: <5567CAB9.1010405@huawei.com>
Date: Fri, 29 May 2015 10:11:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-22-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_StGyawua1BVOxBXAVgbjQSR5OmpmdWg7fuEWm7zjoWg@mail.gmail.com>
In-Reply-To: <CAFEAcA_StGyawua1BVOxBXAVgbjQSR5OmpmdWg7fuEWm7zjoWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 21/29] hw/sh4/r2d.c: Fix memory leak
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
X-List-Received-Date: Fri, 29 May 2015 02:11:35 -0000



On 2015/5/28 20:46, Peter Maydell wrote:
> On 28 May 2015 at 13:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> >
>> > valgrind complains about:
>> > ==29844== 1,364 (104 direct, 1,260 indirect) bytes in 1 blocks are definitely lost in loss record 2,143 of 2,205
>> > ==29844==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
>> > ==29844==    by 0x25096F: malloc_and_trace (vl.c:2556)
>> > ==29844==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
>> > ==29844==    by 0x2C7CDB: qemu_extend_irqs (irq.c:55)
>> > ==29844==    by 0x2C7D67: qemu_allocate_irqs (irq.c:64)
>> > ==29844==    by 0x2167ED: r2d_fpga_init (r2d.c:191)
>> > ==29844==    by 0x2169CC: r2d_init (r2d.c:263)
>> > ==29844==    by 0x254D3A: main (vl.c:4249)
>> >
>> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/sh4/r2d.c | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> >
>> > diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
>> > index 4221060..594c733 100644
>> > --- a/hw/sh4/r2d.c
>> > +++ b/hw/sh4/r2d.c
>> > @@ -287,6 +287,16 @@ static void r2d_init(MachineState *machine)
>> >      sysbus_mmio_map(busdev, 1, 0x1400080c);
>> >      mmio_ide_init_drives(dev, dinfo, NULL);
>> >
>> > +    /* free unused irq */
>> > +    qemu_free_irq(irq[CF_CD]);
>> > +    qemu_free_irq(irq[KEY]);
>> > +    qemu_free_irq(irq[RTC_A]);
>> > +    qemu_free_irq(irq[RTC_T]);
>> > +    qemu_free_irq(irq[SDCARD]);
>> > +    qemu_free_irq(irq[EXT]);
>> > +    qemu_free_irq(irq[TP]);
>> > +    g_free(irq);
>> > +
> Yuck. We should just save the irq pointer in some state structure
> and g_free_irqs() it all in deinit.

Ok, will try to use this way for those which allocate a few irqs. But
the modifications for the ones which only allocate one irq are ok I
guess, I use qemu_allocate_irq to replace qemu_allocate_irqs.

-- 
Shannon


