Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTycm-00077n-3w
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2011 11:55:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1QTycj-00076i-1Z
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 11:55:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1QTych-0002Qv-P5
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 11:55:20 -0400
Received: from thoth.sbs.de ([192.35.17.2]:25552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1QTycd-0002P9-3e; Tue, 07 Jun 2011 11:55:15 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p57Ft1Xm002988;
	Tue, 7 Jun 2011 17:55:01 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p57Ft1ue020878;
	Tue, 7 Jun 2011 17:55:01 +0200
Message-ID: <4DEE49D5.7010301@siemens.com>
Date: Tue, 07 Jun 2011 17:55:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Aurelien Jarno <aurelien@aurel32.net>
References: <4DB6AD38.50307@siemens.com>
	<20110514224427.GG13600@volta.aurel32.net>
In-Reply-To: <20110514224427.GG13600@volta.aurel32.net>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] virtio: Move virtio-pci to hw library
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
X-List-Received-Date: Tue, 07 Jun 2011 15:55:22 -0000

On 2011-05-15 00:44, Aurelien Jarno wrote:
> On Tue, Apr 26, 2011 at 01:32:08PM +0200, Jan Kiszka wrote:
>> This module has no target dependencies (except for target_phys_addr_t
>> size) and can thus be built as part of libhw.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>  Makefile.objs   |    1 +
>>  Makefile.target |    1 -
>>  2 files changed, 1 insertions(+), 1 deletions(-)
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Will you or qemu-trivial pick it up?

Jan

> 
>> diff --git a/Makefile.objs b/Makefile.objs
>> index fad1dce..3192bf5 100644
>> --- a/Makefile.objs
>> +++ b/Makefile.objs
>> @@ -171,6 +171,7 @@ user-obj-y += cutils.o cache-utils.o
>>  hw-obj-y =
>>  hw-obj-y += vl.o loader.o
>>  hw-obj-$(CONFIG_VIRTIO) += virtio.o virtio-console.o
>> +hw-obj-$(CONFIG_VIRTIO_PCI) += virtio-pci.o
>>  hw-obj-y += fw_cfg.o
>>  hw-obj-$(CONFIG_PCI) += pci.o pci_bridge.o
>>  hw-obj-$(CONFIG_PCI) += msix.o msi.o
>> diff --git a/Makefile.target b/Makefile.target
>> index cfc7091..5da9e59 100644
>> --- a/Makefile.target
>> +++ b/Makefile.target
>> @@ -191,7 +191,6 @@ obj-y = arch_init.o cpus.o monitor.o machine.o gdbstub.o balloon.o
>>  # need to fix this properly
>>  obj-$(CONFIG_NO_PCI) += pci-stub.o
>>  obj-$(CONFIG_VIRTIO) += virtio-blk.o virtio-balloon.o virtio-net.o virtio-serial-bus.o
>> -obj-$(CONFIG_VIRTIO_PCI) += virtio-pci.o
>>  obj-y += vhost_net.o
>>  obj-$(CONFIG_VHOST_NET) += vhost.o
>>  obj-$(CONFIG_REALLY_VIRTFS) += virtio-9p.o
>> -- 
>> 1.7.1
>>
>>
> 

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

