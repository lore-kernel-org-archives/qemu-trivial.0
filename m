Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c679G-0004ei-Oa
	for mharc-qemu-trivial@gnu.org; Sun, 13 Nov 2016 21:37:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c679E-0004d7-Ui
	for qemu-trivial@nongnu.org; Sun, 13 Nov 2016 21:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c679E-0002t1-8g
	for qemu-trivial@nongnu.org; Sun, 13 Nov 2016 21:37:28 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:35518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c6797-0002qj-Tg; Sun, 13 Nov 2016 21:37:22 -0500
Received: from 172.24.1.60 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CLH25962; Mon, 14 Nov 2016 10:36:54 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 14 Nov 2016 10:36:47 +0800
To: Eric Blake <eblake@redhat.com>, <armbru@redhat.com>
References: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <5829233D.8080709@huawei.com>
Date: Mon, 14 Nov 2016 10:36:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <f1f826e3-49b6-1755-24fe-ea96d8d484b1@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-trivial] [PATCH v2] qapi-schema: clarify 'colo' state for
 MigrationStatus
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
X-List-Received-Date: Mon, 14 Nov 2016 02:37:29 -0000

ping ?

Anyone pick this up?

On 2016/11/2 22:04, Eric Blake wrote:
> On 11/02/2016 02:44 AM, zhanghailiang wrote:
>> VM can not get into colo state unless users enable 'x-colo'
>> capability for migration, Here it is necessary to clarify
>> this.
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>> v2:
>> - Clarify colo state for RunState too as Eric suggested.
>> ---
>>   qapi-schema.json | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
>


