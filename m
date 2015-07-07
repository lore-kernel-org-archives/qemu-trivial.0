Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZCI0c-000185-4u
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jul 2015 21:49:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1ZCI0Z-00017l-4I
	for qemu-trivial@nongnu.org; Mon, 06 Jul 2015 21:49:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1ZCI0V-00073Z-11
	for qemu-trivial@nongnu.org; Mon, 06 Jul 2015 21:49:15 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:42816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1ZCI0Q-00071A-N3
	for qemu-trivial@nongnu.org; Mon, 06 Jul 2015 21:49:10 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COE27512; Tue, 07 Jul 2015 09:48:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1; Tue, 7 Jul 2015
	09:48:39 +0800
Message-ID: <559B2FF3.70001@huawei.com>
Date: Tue, 7 Jul 2015 09:48:35 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Scott Feldman <sfeldma@gmail.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAE4R7bAXEXtHKsKHnFqbqXOf8sdHBSH_Mq4XyOXbZN4+G6aDpw@mail.gmail.com>
	<559B296C.2080608@huawei.com>
	<CAE4R7bABiPUSj+XRNoz2mn_x2Yt-xy6+QhU06z3nsLRP3Ger4A@mail.gmail.com>
In-Reply-To: <CAE4R7bABiPUSj+XRNoz2mn_x2Yt-xy6+QhU06z3nsLRP3Ger4A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 07 Jul 2015 01:49:16 -0000

On 2015/7/7 9:33, Scott Feldman wrote:
> On Mon, Jul 6, 2015 at 6:20 PM, zhanghailiang
> <zhang.zhanghailiang@huawei.com> wrote:
>> ping ?
>>
>> Will anyone pick this up ?
>
> Hi zhanghailiang, Stefan picked up a similar version which uses g_new0:
>
> http://lists.nongnu.org/archive/html/qemu-devel/2015-06/msg06584.html
> http://lists.nongnu.org/archive/html/qemu-devel/2015-06/msg06686.html
>

OK, i didn't notice it, thanks.

>
>>
>> On 2015/6/23 14:06, Scott Feldman wrote:
>>>
>>> On Mon, Jun 22, 2015 at 6:31 PM, zhanghailiang
>>> <zhang.zhanghailiang@huawei.com> wrote:
>>>>
>>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>>
>>>
>>> Acked-by: Scott Feldman <sfeldma@gmail.com>
>>>
>>>
>>
>>
>
>



