Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDtKX-0001oH-9I
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 07:24:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aDtKU-0001lW-Hv
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 07:24:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aDtKT-0005l2-P9
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 07:24:42 -0500
Received: from [59.151.112.132] (port=57464 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aDtKO-0005k3-PW; Tue, 29 Dec 2015 07:24:37 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2065564"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Dec 2015 20:24:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0190A4092565;
	Tue, 29 Dec 2015 20:24:22 +0800 (CST)
Received: from [10.167.226.86] (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 29 Dec 2015 20:27:47 +0800
To: Stefan Weil <sw@weilnetz.de>, <qemu-devel@nongnu.org>
References: <1451384035-29691-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5682605F.100@weilnetz.de>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56827C1B.5040504@cn.fujitsu.com>
Date: Tue, 29 Dec 2015 20:27:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5682605F.100@weilnetz.de>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: 0190A4092565.AB688
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, xen-devel@lists.xensource.com,
	stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] xen/Makefile.objs:
	simplify
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
X-List-Received-Date: Tue, 29 Dec 2015 12:24:43 -0000



On 12/29/2015 06:28 PM, Stefan Weil wrote:
> Am 29.12.2015 um 11:13 schrieb Cao jin:
>> merge three lines into one line
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   hw/xen/Makefile.objs | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
>> index a9ad7e7..77806f0 100644
>> --- a/hw/xen/Makefile.objs
>> +++ b/hw/xen/Makefile.objs
>> @@ -1,6 +1,4 @@
>>   # xen backend driver support
>>   common-obj-$(CONFIG_XEN_BACKEND) += xen_backend.o xen_devconfig.o
>>
>> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
>> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o
>> -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o xen_pt_graphics.o
>> +obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o xen_pt_graphics.o xen-host-pci-device.o
>
> Obviously commit 798141799ccd5235a928b8fc0411d7d74e706489
> added duplicate .o entries which of course should be removed.
>
> I suggest to keep the first line separate instead of merging it.
> That preserves the alphabetic order and avoids a long line.

Ok, v2 is coming soon:)

> Regards,
> Stefan
>
>

-- 
Yours Sincerely,

Cao Jin



