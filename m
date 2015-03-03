Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSg47-0006pN-0Q
	for mharc-qemu-trivial@gnu.org; Tue, 03 Mar 2015 01:12:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YSg45-0006mf-1X
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 01:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YSg41-0003S3-5B
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 01:12:20 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:27202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YSg3z-0003RB-En; Tue, 03 Mar 2015 01:12:17 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKF27573; Tue, 03 Mar 2015 14:12:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1; Tue, 3 Mar 2015
	14:11:57 +0800
Message-ID: <54F550AB.4040607@huawei.com>
Date: Tue, 3 Mar 2015 14:11:55 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1425114327-12136-6-git-send-email-zhang.zhanghailiang@huawei.com>
	<874mq3hf0b.fsf@blackfin.pond.sub.org>
In-Reply-To: <874mq3hf0b.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, hangaohuai@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC 5/5] savevm: Replace
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
X-List-Received-Date: Tue, 03 Mar 2015 06:12:21 -0000

On 2015/3/2 18:26, Markus Armbruster wrote:
> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   savevm.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/savevm.c b/savevm.c
>> index ce2b6a2..c4f8c39 100644
>> --- a/savevm.c
>> +++ b/savevm.c
>> @@ -932,8 +932,7 @@ int qemu_loadvm_state(QEMUFile *f)
>>       int ret;
>>
>>       if (qemu_savevm_state_blocked(&local_err)) {
>> -        error_report("%s", error_get_pretty(local_err));
>> -        error_free(local_err);
>> +        error_report_err(local_err);
>>           return -EINVAL;
>>       }
>
> This one's good.  My commit 565f65d "error: Use error_report_err() where
> appropriate" cleaned up this pattern, but a few more instances have
> since crept in, and this is one.
>
> I can see another one in hw/arm/virt.c machvirt_init().
>
>

Er, do you mean the follow place ?

        /* Handle any CPU options specified by the user */
         cc->parse_features(CPU(cpuobj), cpustr[1], &err);
         if (err) {
             error_report("%s", error_get_pretty(err));
             exit(1);
         }


