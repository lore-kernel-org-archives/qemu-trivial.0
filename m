Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxxb1-0005WQ-98
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 09:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1Yxxat-0005Tb-Ns
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 09:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1Yxxao-0000Z6-HS
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 09:11:31 -0400
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:43544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1Yxxao-0000YK-8x
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 09:11:26 -0400
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Thu, 28 May 2015 14:11:24 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 28 May 2015 14:11:21 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id CDB941B0806B; 
	Thu, 28 May 2015 14:12:12 +0100 (BST)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t4SDBK8F24707266; Thu, 28 May 2015 13:11:20 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t4SDBJ4o032070; Thu, 28 May 2015 07:11:20 -0600
Received: from gondolin (dyn-9-152-224-143.boeblingen.de.ibm.com
	[9.152.224.143])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t4SDBJqF032053; Thu, 28 May 2015 07:11:19 -0600
Date: Thu, 28 May 2015 15:11:18 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20150528151118.78bed6a5.cornelia.huck@de.ibm.com>
In-Reply-To: <1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15052813-0017-0000-0000-000004390863
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
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
X-List-Received-Date: Thu, 28 May 2015 13:11:37 -0000

On Thu, 28 May 2015 20:08:52 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> valgrind complains about:
> ==1413== 188 (8 direct, 180 indirect) bytes in 1 blocks are definitely lost in loss record 951 of 1,199
> ==1413==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==1413==    by 0x262D8B: malloc_and_trace (vl.c:2556)
> ==1413==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==1413==    by 0x2C7ACF: qemu_extend_irqs (irq.c:55)
> ==1413==    by 0x2C7B5B: qemu_allocate_irqs (irq.c:64)
> ==1413==    by 0x2168F4: irq_cpu_hotplug_init (sclpcpu.c:84)
> ==1413==    by 0x21623F: event_realize (event-facility.c:385)
> ==1413==    by 0x2C4610: device_set_realized (qdev.c:1058)
> ==1413==    by 0x317DDA: property_set_bool (object.c:1514)
> ==1413==    by 0x3166D4: object_property_set (object.c:837)
> ==1413==    by 0x3189F6: object_property_set_qobject (qom-qobject.c:24)
> ==1413==    by 0x316943: object_property_set_bool (object.c:905)
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/s390x/sclpcpu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
> index 2fe8b5a..1090e2f 100644
> --- a/hw/s390x/sclpcpu.c
> +++ b/hw/s390x/sclpcpu.c
> @@ -25,13 +25,13 @@ typedef struct ConfigMgtData {
>      uint8_t event_qualifier;
>  } QEMU_PACKED ConfigMgtData;
> 
> -static qemu_irq *irq_cpu_hotplug; /* Only used in this file */
> +static qemu_irq irq_cpu_hotplug; /* Only used in this file */
> 
>  #define EVENT_QUAL_CPU_CHANGE  1
> 
>  void raise_irq_cpu_hotplug(void)
>  {
> -    qemu_irq_raise(*irq_cpu_hotplug);
> +    qemu_irq_raise(irq_cpu_hotplug);
>  }
> 
>  static unsigned int send_mask(void)
> @@ -81,7 +81,10 @@ static void trigger_signal(void *opaque, int n, int level)
> 
>  static int irq_cpu_hotplug_init(SCLPEvent *event)
>  {
> -    irq_cpu_hotplug = qemu_allocate_irqs(trigger_signal, event, 1);
> +    qemu_irq irq = qemu_allocate_irq(trigger_signal, event, 0);
> +
> +    irq_cpu_hotplug = irq;
> +    qemu_free_irq(irq);

This looks... odd. But then, the whole code structure here with its
global variable and its roundabout way of triggering the notification
looks weird. We'd probably be better off looking up the sclp event for
cpu hotplug and triggering the interrupt directly.

>      return 0;
>  }
> 


