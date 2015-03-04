Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT54V-00028H-PP
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 03:54:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YT54T-00027j-OJ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 03:54:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YT54R-0000Eu-1W
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 03:54:25 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:32553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YT54Q-0000Em-EP; Wed, 04 Mar 2015 03:54:22 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHZ31769; Wed, 04 Mar 2015 16:54:13 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 4 Mar 2015
	16:54:00 +0800
Message-ID: <54F6C826.1010209@huawei.com>
Date: Wed, 4 Mar 2015 16:53:58 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <1425376508-12632-1-git-send-email-zhang.zhanghailiang@huawei.com>	<54F5ECE2.80603@redhat.com>
	<874mq144ks.fsf@blackfin.pond.sub.org>
In-Reply-To: <874mq144ks.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] error: Replace
 error_report() & error_free() with error_report_err()
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
X-List-Received-Date: Wed, 04 Mar 2015 08:54:26 -0000

On 2015/3/4 15:14, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
>
>> On 03/03/2015 02:55 AM, zhanghailiang wrote:
>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>> ---
>>
>> Might have been nice to mention this was a continuation of the work
>> started in commit 565f65d27.
>
> Yes.  Perhaps the -trivial maintainer can stick in a reference on
> commit.
>

:), i will send v2, to make his life easy. Thanks.

>>>   hw/arm/virt.c | 2 +-
>>>   savevm.c      | 3 +--
>>>   2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>
>



