Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XuH15-0001fN-Sv
	for mharc-qemu-trivial@gnu.org; Fri, 28 Nov 2014 03:35:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XuH0y-0001eo-TR
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 03:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XuH0u-0005ID-2y
	for qemu-trivial@nongnu.org; Fri, 28 Nov 2014 03:34:56 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:62033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XuH0t-0005HF-DL; Fri, 28 Nov 2014 03:34:52 -0500
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDC36342; Fri, 28 Nov 2014 16:34:38 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 28 Nov 2014 16:34:29 +0800
Message-ID: <54783392.60505@huawei.com>
Date: Fri, 28 Nov 2014 16:34:26 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
	<5476FD18.9000403@huawei.com> <547832E7.1090508@redhat.com>
In-Reply-To: <547832E7.1090508@redhat.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 0/2] virtfs-proxy-helper: Fix Coverity
	warning
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
X-List-Received-Date: Fri, 28 Nov 2014 08:35:02 -0000

On 2014/11/28 16:31, Paolo Bonzini wrote:

> 
> 
> On 27/11/2014 11:29, Gonglei wrote:
>> On 2014/11/13 20:17, Gonglei (Arei) wrote:
>>
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> Gonglei (2):
>>>   virtfs-proxy-helper: Fix possible socket leak.
>>>   virtfs-proxy-helper: Fix handle leak to make Coverity happy
>>>
>>>  fsdev/virtfs-proxy-helper.c | 16 ++++++++++++----
>>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>
>> Ping...
> 
> Hi Gonglei---thanks, I had missed this and Michael is probably not
> sending qemu-trivial patches because we're so close to the release.
> I'll pick up patch 1.
> 
> Paolo

Thanks.
As Markus's suggestion, we drop patch 2.  :)

Regards,
-Gonglei


