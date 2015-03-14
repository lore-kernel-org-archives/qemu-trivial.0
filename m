Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWiAy-00059o-7P
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 05:16:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWiAs-0004x6-6t
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWiAl-0007ZK-N2
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 05:16:02 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:26867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWiAk-0007Yg-UU; Sat, 14 Mar 2015 05:15:55 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDC01998; Sat, 14 Mar 2015 17:15:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 14 Mar 2015 17:15:25 +0800
Message-ID: <5503FC2B.3090004@huawei.com>
Date: Sat, 14 Mar 2015 17:15:23 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, <qemu-devel@nongnu.org>
References: <1426304530-9600-1-git-send-email-zhaoshenglong@huawei.com>
	<5503DBDB.9040804@weilnetz.de>
In-Reply-To: <5503DBDB.9040804@weilnetz.de>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0C0205.5503FC35.00D4, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 443cf2996c8abcafe99e89fd747dc60f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/bt/sdp: Fix resource
	leak detect by coverity
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
X-List-Received-Date: Sat, 14 Mar 2015 09:16:06 -0000

On 2015/3/14 14:57, Stefan Weil wrote:
> Am 14.03.2015 um 04:42 schrieb Shannon Zhao:
>> Free data in function sdp_attr_write after use.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>   hw/bt/sdp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
>> index 218e075..8e6d5e3 100644
>> --- a/hw/bt/sdp.c
>> +++ b/hw/bt/sdp.c
>> @@ -735,6 +735,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
>>           record->attribute_list[record->attributes ++].len = len;
>>           data += len;
>>       }
>> +    g_free(data);
> 
> No, here more work is needed. data is no longer the original data,
> because two lines above it is modified.

Thanks for pointing out.

> 
>>         /* Sort the attribute list by the AttributeID */
>>       qsort(record->attribute_list, record->attributes,
> 
> 
> .
> 


