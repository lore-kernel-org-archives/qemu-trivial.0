Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2Hq1-0006D0-NP
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2015 07:37:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z2Hpx-00068l-Rv
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 07:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z2Hpx-0004Pd-1G
	for qemu-trivial@nongnu.org; Tue, 09 Jun 2015 07:36:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z2Hpl-0004Cx-8b; Tue, 09 Jun 2015 07:36:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7B3C940EA9;
	Tue,  9 Jun 2015 14:36:43 +0300 (MSK)
Message-ID: <5576CFCB.4000008@msgid.tls.msk.ru>
Date: Tue, 09 Jun 2015 14:36:43 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <1431477807-12220-1-git-send-email-arei.gonglei@huawei.com>
	<555AEA20.3090501@huawei.com> <556C0B7A.3070601@huawei.com>
	<20150601122437-mutt-send-email-mst@redhat.com>
	<556C429F.3070802@redhat.com> <5576428A.4030603@huawei.com>
	<5576C74D.1050906@msgid.tls.msk.ru> <5576CD07.6030302@huawei.com>
In-Reply-To: <5576CD07.6030302@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Tue, 09 Jun 2015 11:36:59 -0000

09.06.2015 14:24, Gonglei wrote:
> On 2015/6/9 19:00, Michael Tokarev wrote:
>> 09.06.2015 04:34, Gonglei wrote:
>>> /mjt, what's your opinion? Thanks
>>
>> Somehow I thought it is a single patch, and tried to find
>> it @patchwork.  But it is a series of 6 patches (which I
>> deleted from my inbox due to routine cleanup procedure).
>>
> It's okay.
> I can resend this series to qemu-trivial adding some acks tag.

Which ACKs do you mean?  I don't see any ACK in the whole series,
maybe you collected some in private?

I found and applied all 6 patches to -trivial.

>> Do we care about pci-assign?
>> Maybe it's better to drop this code completely instead of
>> fixing it?
>>
> IIRC, supporting vfio needs the host kernel is above 3.10,
> but this condition is harsh. On the other hand, pci-assign is
> simple to use, for testing purpose.

Fair enough.

Thanks,

/mjt

