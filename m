Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2IZA-00034A-Je
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2015 08:23:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z2IZ4-0002tL-2v
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 08:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z2IZ0-0001W8-3m
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 08:23:33 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:57611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z2IYr-0001PT-4i; Tue, 09 Jun 2015 08:23:21 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPG94107; Tue, 09 Jun 2015 20:23:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Jun 2015
	20:11:37 +0800
Message-ID: <5576D7F5.5070602@huawei.com>
Date: Tue, 9 Jun 2015 20:11:33 +0800
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
	<5576C74D.1050906@msgid.tls.msk.ru> <5576CD07.6030302@huawei.com>
	<5576CFCB.4000008@msgid.tls.msk.ru>
In-Reply-To: <5576CFCB.4000008@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
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
X-List-Received-Date: Tue, 09 Jun 2015 12:23:38 -0000

On 2015/6/9 19:36, Michael Tokarev wrote:
> 09.06.2015 14:24, Gonglei wrote:
>> On 2015/6/9 19:00, Michael Tokarev wrote:
>>> 09.06.2015 04:34, Gonglei wrote:
>>>> /mjt, what's your opinion? Thanks
>>>
>>> Somehow I thought it is a single patch, and tried to find
>>> it @patchwork.  But it is a series of 6 patches (which I
>>> deleted from my inbox due to routine cleanup procedure).
>>>
>> It's okay.
>> I can resend this series to qemu-trivial adding some acks tag.
> 
> Which ACKs do you mean?  I don't see any ACK in the whole series,
> maybe you collected some in private?
> 
Oh, sorry, it's not a ack, but Stefano's tested-by tag on patch 5. :)

On Wed, 13 May 2015, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>
> Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Tested-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

> I found and applied all 6 patches to -trivial.
> 
OK, thanks.

Regards,
-Gonglei

>>> Do we care about pci-assign?
>>> Maybe it's better to drop this code completely instead of
>>> fixing it?
>>>
>> IIRC, supporting vfio needs the host kernel is above 3.10,
>> but this condition is harsh. On the other hand, pci-assign is
>> simple to use, for testing purpose.
> 
> Fair enough.
> 
> Thanks,
> 
> /mjt
> 



