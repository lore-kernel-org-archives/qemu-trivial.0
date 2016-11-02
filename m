Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1pxe-0003VB-60
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 03:27:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1pxb-0003Sk-Cl
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1pxY-0007wV-8b
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:27:47 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:40422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c1pxX-0007uZ-K8; Wed, 02 Nov 2016 03:27:44 -0400
Received: from 172.24.1.136 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DUL23535; Wed, 02 Nov 2016 15:27:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.24.212) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Wed, 2 Nov 2016
	15:26:59 +0800
To: Eric Blake <eblake@redhat.com>, <quintela@redhat.com>,
	<amit.shah@redhat.com>
References: <1477979405-16264-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<142defcb-88bd-727f-70e4-0c8ace3f2e76@redhat.com>
CC: <qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>, <dgilbert@redhat.com>
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Message-ID: <58199541.2040909@huawei.com>
Date: Wed, 2 Nov 2016 15:26:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <142defcb-88bd-727f-70e4-0c8ace3f2e76@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: fix missing
 assignment for has_x_checkpoint_delay
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
X-List-Received-Date: Wed, 02 Nov 2016 07:27:48 -0000

On 2016/11/1 22:27, Eric Blake wrote:
> On 11/01/2016 12:50 AM, zhanghailiang wrote:
>> We forgot to assign true to params->has_x_checkpoint_delay parameter
>> in qmp_query_migrate_parameters.
>>
>> Without this, qmp command 'query-migrate-parameters' doesn't show the
>> default value for x-checkpoint-delay option.
>> It doesn't influence output of hmp command 'info migrate_parameters'.
>
> Well, only because the current code doesn't forcefully assign missing
> optional parameters to any other value.  But HMP was relying on
> unspecified behavior, that could have broken with any other qapi change.
>
> I might word the commit message:
>
> This also fixes the fact that HMP was relying on unspecified behavior by
> reading x_checkpoint_delay without checking has_x_checkpoint_delay.
>
> Up to the maintainer, though, since the patch itself is fine.
>

OK, thanks, I'd like to fix the message as your said :)

>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   hmp.c                 | 1 +
>>   migration/migration.c | 1 +
>>   2 files changed, 2 insertions(+)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>


