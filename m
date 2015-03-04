Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT4wk-0005sm-JJ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 03:46:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YT4wf-0005h9-M6
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 03:46:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YT4wc-0006fT-9z
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 03:46:21 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:26970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YT4wS-0006ea-OH; Wed, 04 Mar 2015 03:46:09 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHZ30685; Wed, 04 Mar 2015 16:46:02 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1; Wed, 4 Mar 2015
	16:45:50 +0800
Message-ID: <54F6C63C.1070609@huawei.com>
Date: Wed, 4 Mar 2015 16:45:48 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, <qemu-trivial@nongnu.org>
References: <1425376508-12632-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<54F5ECE2.80603@redhat.com>
In-Reply-To: <54F5ECE2.80603@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-devel@nongnu.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
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
X-List-Received-Date: Wed, 04 Mar 2015 08:46:25 -0000

On 2015/3/4 1:18, Eric Blake wrote:
> On 03/03/2015 02:55 AM, zhanghailiang wrote:
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>
> Might have been nice to mention this was a continuation of the work
> started in commit 565f65d27.
>

OK, will send v2 with this message added, Thanks.

>>   hw/arm/virt.c | 2 +-
>>   savevm.c      | 3 +--
>>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>



