Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xl7tK-0001c6-CC
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 22:01:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xl7tD-0001HY-Jo
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 22:01:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xl7t8-0001wG-Q0
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 22:01:07 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:13934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xl7sw-0001u2-EF; Sun, 02 Nov 2014 22:00:51 -0500
Received: from 172.24.2.119 (EHLO SZXEML455-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBT53073; Mon, 03 Nov 2014 11:00:42 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by SZXEML455-HUB.china.huawei.com
	(10.82.67.198) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 3 Nov 2014 11:00:34 +0800
Message-ID: <5456EFD1.3080209@huawei.com>
Date: Mon, 3 Nov 2014 11:00:33 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-trivial@nongnu.org>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1414806603-22556-3-git-send-email-zhang.zhanghailiang@huawei.com>
	<5455D423.2000008@msgid.tls.msk.ru>
In-Reply-To: <5455D423.2000008@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/4] spice-qemu-char: fix check for
	in-parameter
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
X-List-Received-Date: Mon, 03 Nov 2014 03:01:12 -0000

On 2014/11/2 14:50, Michael Tokarev wrote:
> 01.11.2014 04:50, zhanghailiang wrote:
>> For qemu_chr_open_spice_vmc and qemu_chr_open_spice_port, the in-parameter
>> never to be NULL, because the checks in qemu_chr_parse_spice_vmc
>> and qemu_chr_parse_spice_port have ensured this.
>>
>> So we should check the length of the in-parameter.
>
> The same applies here as to qemu_chr_open in patch 1/4.
> But here we've one more thing:
>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   spice-qemu-char.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/spice-qemu-char.c b/spice-qemu-char.c
>> index 8106e06..45e7d69 100644
>> --- a/spice-qemu-char.c
>> +++ b/spice-qemu-char.c
>> @@ -290,7 +290,7 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
>>   {
>>       const char **psubtype = spice_server_char_device_recognized_subtypes();
>>
>> -    if (type == NULL) {
>> +    if (type == NULL || strlen(type) == 0) {
>>           fprintf(stderr, "spice-qemu-char: missing name parameter\n");
>
> This is 'missing TYPE parameter' not name.  If we merge the check with
> qemu_chr_parse_* it will go away.
>

OK, will fix them in V2, Thanks:)

> Thanks,
>
> /mjt
>
>>           print_allowed_subtypes();
>>           return NULL;
>> @@ -315,7 +315,7 @@ CharDriverState *qemu_chr_open_spice_port(const char *name)
>>       CharDriverState *chr;
>>       SpiceCharDriver *s;
>>
>> -    if (name == NULL) {
>> +    if (name == NULL || strlen(name) == 0) {
>>           fprintf(stderr, "spice-qemu-char: missing name parameter\n");
>>           return NULL;
>>       }
>>
>
> .
>


