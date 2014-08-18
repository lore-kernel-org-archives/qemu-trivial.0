Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJAtG-000177-Uc
	for mharc-qemu-trivial@gnu.org; Sun, 17 Aug 2014 20:33:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJAtA-0000wp-F2
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJAt6-00056r-4r
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:33:32 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:12315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJAsw-00056Q-S3; Sun, 17 Aug 2014 20:33:19 -0400
Received: from 172.24.2.119 (EHLO szxeml448-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATE69714; Mon, 18 Aug 2014 08:32:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml448-hub.china.huawei.com
	(10.82.67.191) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 08:32:10 +0800
Message-ID: <53F14986.3030600@huawei.com>
Date: Mon, 18 Aug 2014 08:32:06 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-9-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103231.GG31346@redhat.com>
In-Reply-To: <20140814103231.GG31346@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.53F1499B.0022,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 92e2304cc9b5e885153e3fb63af994bc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 08/10] tests/bios-tables-test: check
 the value returned by fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 00:33:37 -0000

On 2014/8/14 18:32, Michael S. Tsirkin wrote:
> On Thu, Aug 14, 2014 at 03:29:19PM +0800, zhanghailiang wrote:
>> The function fopen() may fail, so check its return value.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Li Liu<john.liuli@huawei.com>
>> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
>> ---
>>   tests/bios-tables-test.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
>> index 045eb27..28ec28d 100644
>> --- a/tests/bios-tables-test.c
>> +++ b/tests/bios-tables-test.c
>> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
>>       const char *arch = qtest_get_arch();
>>       FILE *f = fopen(disk, "w");
>>       int ret;
>> +
>> +    if (f == NULL) {
>
> if (!f) please
>

OK, i will modify it, thanks.

>> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(errno));
>> +        return -1;
>> +    }
>>       fwrite(boot_sector, 1, sizeof boot_sector, f);
>>       fclose(f);
>>
>> --
>> 1.7.12.4
>>
>
> .
>



