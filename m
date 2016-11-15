Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c6Zfc-0006sL-Qc
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2016 04:04:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c6Zfb-0006sF-Iz
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 04:04:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c6ZfX-0003uW-KG
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2016 04:04:47 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:55052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c6ZfX-0003tf-92; Tue, 15 Nov 2016 04:04:43 -0500
Received: from 172.24.1.136 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DQR41206; Tue, 15 Nov 2016 17:04:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Nov 2016 17:03:58 +0800
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, Laurent Vivier
	<laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
	<0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
	<2a0125c8-bbc1-6b03-9204-dc7caf776e97@cn.fujitsu.com>
CC: <qemu-trivial@nongnu.org>, <armbru@redhat.com>, <qemu-devel@nongnu.org>,
	<dgilbert@redhat.com>, Amit Shah <amit.shah@redhat.com>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <582ACF7E.4020201@huawei.com>
Date: Tue, 15 Nov 2016 17:03:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <2a0125c8-bbc1-6b03-9204-dc7caf776e97@cn.fujitsu.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
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
X-List-Received-Date: Tue, 15 Nov 2016 09:04:48 -0000

On 2016/11/15 16:58, Zhang Chen wrote:
>
>
> On 11/15/2016 04:44 PM, Laurent Vivier wrote:
>> Le 14/11/2016 à 14:54, Stefan Hajnoczi a écrit :
>>> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>>>> ping ?
>>>>
>>>> Anyone pick this up?
>>> The original patch that added these lines went through Amit Shah and
>>> David Gilbert.  I have CCed them.
>> If it is needed, I can also send a pull request through my
>> trivial-patches branch.
>>
>> Laurent
>
> The pull request for this patch has been sent by Jason.
> Thanks for your attention, and thank Stefan.
>

Er, It seems that you made a mistake, Jason's pull request doesn't
contain this patch. no ?

Thanks,
Hailiang

> Zhang Chen
>
>


