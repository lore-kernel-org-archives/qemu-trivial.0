Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c7GpC-0003OH-NC
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2016 02:09:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c7GpA-0003O7-Gn
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 02:09:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c7Gp7-0002Uf-CS
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2016 02:09:32 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:41823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c7Gp7-0002Pr-0h; Thu, 17 Nov 2016 02:09:29 -0500
Received: from 172.24.1.137 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DVH10980; Thu, 17 Nov 2016 15:09:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Nov 2016 15:09:07 +0800
To: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
	<5829233D.8080709@huawei.com>
	<20161114135451.GB26198@stefanha-x1.localdomain>
	<0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <armbru@redhat.com>,
	<dgilbert@redhat.com>, Amit Shah <amit.shah@redhat.com>, Eric Blake
	<eblake@redhat.com>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <582D576B.7000804@huawei.com>
Date: Thu, 17 Nov 2016 15:08:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <0ea043b8-532f-04a6-c4f8-b5a9ce6c16ef@vivier.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
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
X-List-Received-Date: Thu, 17 Nov 2016 07:09:33 -0000

Hi Laurent,

On 2016/11/15 16:44, Laurent Vivier wrote:
> Le 14/11/2016 à 14:54, Stefan Hajnoczi a écrit :
>> On Mon, Nov 14, 2016 at 10:36:45AM +0800, Hailiang Zhang wrote:
>>> ping ?
>>>
>>> Anyone pick this up?
>>
>> The original patch that added these lines went through Amit Shah and
>> David Gilbert.  I have CCed them.
>
> If it is needed, I can also send a pull request through my
> trivial-patches branch.
>

I think this patch can go through your trivial branch if Amit or Dave
didn't pick it up.

Thanks,
Hailiang

> Laurent
>


