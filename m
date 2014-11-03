Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xl7sJ-00006D-Nl
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 22:00:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xl7sD-0008Ms-RR
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 22:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xl7s9-0001RJ-0h
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 22:00:05 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:50519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xl7rv-0001Pc-Lf; Sun, 02 Nov 2014 21:59:51 -0500
Received: from 172.24.2.119 (EHLO szxeml401-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWN55600; Mon, 03 Nov 2014 10:59:42 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by szxeml401-hub.china.huawei.com
	(10.82.67.31) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 3 Nov 2014 10:59:34 +0800
Message-ID: <5456EF95.5050502@huawei.com>
Date: Mon, 3 Nov 2014 10:59:33 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-trivial@nongnu.org>
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1414806603-22556-2-git-send-email-zhang.zhanghailiang@huawei.com>
	<5455BE99.1000400@msgid.tls.msk.ru>
In-Reply-To: <5455BE99.1000400@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020207.5456EF9F.01AA, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ff07307acfda96368830a5ae97942597
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 1/4] qemu-char: fix parameter check for
 qemu_chr_open_pipe
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
X-List-Received-Date: Mon, 03 Nov 2014 03:00:10 -0000

On 2014/11/2 13:18, Michael Tokarev wrote:
> 01.11.2014 04:50, zhanghailiang wrote:
>> The filename parameter never to be NULL, because in qemu_chr_parse_pipe
>> it is return value of g_strdup(device), where device will not be
>> NULL.
>>
>> We should check its length.
>> After this patch, when run command:
>>   qemu-system-x86_64 -chardev pipe,id=pipe1,path=
>> It will report error:
>>   chardev: pipe: no filename given
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   qemu-char.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-char.c b/qemu-char.c
>> index bd0709b..42b1d8f 100644
>> --- a/qemu-char.c
>> +++ b/qemu-char.c
>> @@ -1084,7 +1084,7 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
>>       char filename_out[CHR_MAX_FILENAME_SIZE];
>>       const char *filename = opts->device;
>>
>> -    if (filename == NULL) {
>> +    if (filename == NULL || strlen(filename) == 0) {
>>           fprintf(stderr, "chardev: pipe: no filename given\n");
>>           return NULL;
>>       }
>
> and chr_parse_pipe() looks like:
>
>
> static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
>                                  Error **errp)
> {
>      const char *device = qemu_opt_get(opts, "path");
>
>      if (device == NULL) {
>          error_setg(errp, "chardev: pipe: no device path given");
>          return;
>      }
>
> Maybe we should combine the two checks into one in chr_parse_pipe,
> and remove the check in chr_open_pipe entirely?

Good idea, This is just like what qemu_chr_parse_udp does ;) Thanks.

> .
>


