Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z28R5-0003bo-Fz
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2015 21:34:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z28R2-0003Yz-KE
	for qemu-trivial@nongnu.org; Mon, 08 Jun 2015 21:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z28R1-0003x7-Nx
	for qemu-trivial@nongnu.org; Mon, 08 Jun 2015 21:34:36 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:22135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z28Qv-0003wR-7D; Mon, 08 Jun 2015 21:34:29 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHJ88124; Tue, 09 Jun 2015 09:34:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Jun 2015
	09:34:04 +0800
Message-ID: <5576428A.4030603@huawei.com>
Date: Tue, 9 Jun 2015 09:34:02 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1431477807-12220-1-git-send-email-arei.gonglei@huawei.com>
	<555AEA20.3090501@huawei.com> <556C0B7A.3070601@huawei.com>
	<20150601122437-mutt-send-email-mst@redhat.com>
	<556C429F.3070802@redhat.com>
In-Reply-To: <556C429F.3070802@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.55764299.00B0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: dc0be77c511b63bda9b254bcd654b2f6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, "mjt@tls.msk.ru >>
	Michael Tokarev" <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
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
X-List-Received-Date: Tue, 09 Jun 2015 01:34:37 -0000

On 2015/6/1 19:31, Paolo Bonzini wrote:
> 
> 
> On 01/06/2015 12:25, Michael S. Tsirkin wrote:
>>>> Hi, Michael, Paolo
>>>>
>>>> Can you please ack or review those patches?
>>>>
>>>> Regards,
>>>> -Gonglei
>> I think this belongs in the QOM tree, not mine.
> 
> Recently Gerd at least has taken similar patches, so I guess it belongs
> all over the place, including Xen, KVM and PC trees.
> 
> Let's say it belongs in qemu-trivial (CCed)...
> 
OK.

/mjt, what's your opinion? Thanks

Regards,
-Gonglei


