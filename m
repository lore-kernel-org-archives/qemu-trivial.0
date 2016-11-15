Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c6ZlF-0001yW-TZ
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2016 04:10:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c6ZlD-0001xe-RK
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 04:10:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c6ZlD-0006J3-3b
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 04:10:35 -0500
Received: from [59.151.112.132] (port=59255 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1c6Zl8-0006Cp-JJ; Tue, 15 Nov 2016 04:10:30 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12987128"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2016 17:10:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9F95A4670068;
	Tue, 15 Nov 2016 17:10:27 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 15 Nov 2016 17:10:26 +0800
To: Hailiang Zhang <zhang.zhanghailiang@huawei.com>, Laurent Vivier
	<laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
	<0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
	<2a0125c8-bbc1-6b03-9204-dc7caf776e97@cn.fujitsu.com>
	<582ACF7E.4020201@huawei.com>
CC: <qemu-trivial@nongnu.org>, <armbru@redhat.com>, <qemu-devel@nongnu.org>,
	<dgilbert@redhat.com>, Amit Shah <amit.shah@redhat.com>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <8c21e141-c78e-ed01-8bf1-31b9c38cdcdc@cn.fujitsu.com>
Date: Tue, 15 Nov 2016 17:10:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <582ACF7E.4020201@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 9F95A4670068.A8164
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qapi-schema: clarify
 'colo' state for MigrationStatus
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2016 09:10:36 -0000



On 11/15/2016 05:03 PM, Hailiang Zhang wrote:
> On 2016/11/15 16:58, Zhang Chen wrote:
>>
>>
>> On 11/15/2016 04:44 PM, Laurent Vivier wrote:
>>> Le 14/11/2016 à 14:54, Stefan Hajnoczi a écrit :
>>>> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>>>>> ping ?
>>>>>
>>>>> Anyone pick this up?
>>>> The original patch that added these lines went through Amit Shah and
>>>> David Gilbert.  I have CCed them.
>>> If it is needed, I can also send a pull request through my
>>> trivial-patches branch.
>>>
>>> Laurent
>>
>> The pull request for this patch has been sent by Jason.
>> Thanks for your attention, and thank Stefan.
>>
>
> Er, It seems that you made a mistake, Jason's pull request doesn't
> contain this patch. no ?
>
> Thanks,
> Hailiang
>

Oh...Sorry....I was wrong.
Please ignore this....

Thanks
Zhang Chen

>> Zhang Chen
>>
>>
>
>
>
> .
>

-- 
Thanks
zhangchen




