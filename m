Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2Hku-00049c-3r
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2015 07:31:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z2Hkj-0003wn-HE
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 07:31:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z2Hki-0007Fn-Pk
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 07:31:33 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:2505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z2HkZ-0006xQ-4w; Tue, 09 Jun 2015 07:31:26 -0400
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMT69856; Tue, 09 Jun 2015 19:31:07 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Jun 2015
	19:25:06 +0800
Message-ID: <5576CD07.6030302@huawei.com>
Date: Tue, 9 Jun 2015 19:24:55 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1431477807-12220-1-git-send-email-arei.gonglei@huawei.com>
	<555AEA20.3090501@huawei.com> <556C0B7A.3070601@huawei.com>
	<20150601122437-mutt-send-email-mst@redhat.com>
	<556C429F.3070802@redhat.com> <5576428A.4030603@huawei.com>
	<5576C74D.1050906@msgid.tls.msk.ru>
In-Reply-To: <5576C74D.1050906@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 0/6] pci/isa: QOMify
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
X-List-Received-Date: Tue, 09 Jun 2015 11:31:34 -0000

On 2015/6/9 19:00, Michael Tokarev wrote:
> 09.06.2015 04:34, Gonglei wrote:
>> /mjt, what's your opinion? Thanks
> 
> Somehow I thought it is a single patch, and tried to find
> it @patchwork.  But it is a series of 6 patches (which I
> deleted from my inbox due to routine cleanup procedure).
> 
It's okay.
I can resend this series to qemu-trivial adding some acks tag.

>> Gonglei (6):
>>   pci-assign: QOMify
>>   piix: piix3 QOMify
>>   piix4: QOMify
>>   wdt_i6300esb: QOMify
>>   xen_pt: QOMify
>>   vt82c686: QOMify
> 
> Do we care about pci-assign?
> Maybe it's better to drop this code completely instead of
> fixing it?
> 
IIRC, supporting vfio needs the host kernel is above 3.10,
but this condition is harsh. On the other hand, pci-assign is
simple to use, for testing purpose.

> Other than that, I think it's okay to apply this series
> to -trivial.
> 
Thanks.

Regards,
-Gonglei


