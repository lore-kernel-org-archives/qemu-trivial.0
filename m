Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJFzv-0001HV-6D
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 02:00:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJFzp-0001BH-5Z
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJFzk-000722-SA
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:00:45 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:13765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJFzY-0006gJ-1J; Mon, 18 Aug 2014 02:00:28 -0400
Received: from 172.24.2.119 (EHLO szxeml459-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATF07893; Mon, 18 Aug 2014 13:59:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml459-hub.china.huawei.com
	(10.82.67.202) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 13:59:42 +0800
Message-ID: <53F19652.8030009@huawei.com>
Date: Mon, 18 Aug 2014 13:59:46 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-6-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814101557.GB31346@redhat.com>
In-Reply-To: <20140814101557.GB31346@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.53F19656.009A,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 76ea53af6513fc7e2fc5cd84f25c4deb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 05/10] util/path: Use the GLib memory
	allocation routines
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
X-List-Received-Date: Mon, 18 Aug 2014 06:00:49 -0000

On 2014/8/14 18:15, Michael S. Tsirkin wrote:
> On Thu, Aug 14, 2014 at 03:29:16PM +0800, zhanghailiang wrote:
>> In this file, we don't check the return value of malloc/strdup/realloc which may fail.
>> Instead of using these routines, we use the GLib memory APIs g_malloc/g_strdup/g_realloc.
>> They will exit on allocation failure, so there is no need to test for failure,
>> which would be fine for setup.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
>> ---
>>   util/path.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/util/path.c b/util/path.c
>> index 5c59d9f..e152f2a 100644
>> --- a/util/path.c
>> +++ b/util/path.c
>> @@ -45,8 +45,8 @@ static struct pathelem *new_entry(const char *root,
>>                                     struct pathelem *parent,
>>                                     const char *name)
>>   {
>> -    struct pathelem *new = malloc(sizeof(*new));
>> -    new->name = strdup(name);
>> +    struct pathelem *new = g_malloc(sizeof(*new));
>> +    new->name = g_strdup(name);
>>       new->pathname = g_strdup_printf("%s/%s", root, name);
>>       new->num_entries = 0;
>>       return new;
>
> Would not we have to free name using g_free as well?
>

Yes, Good catch, i will do this, Thanks.

>> @@ -88,7 +88,7 @@ static struct pathelem *add_entry(struct pathelem *root, const char *name,
>>
>>       root->num_entries++;
>>
>> -    root = realloc(root, sizeof(*root)
>> +    root = g_realloc(root, sizeof(*root)
>>                      + sizeof(root->entries[0])*root->num_entries);
>>       e =&root->entries[root->num_entries-1];
>
>> --
>> 1.7.12.4
>>
>
> .
>



