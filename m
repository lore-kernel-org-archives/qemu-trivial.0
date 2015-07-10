Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDVjP-0008A1-A5
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2015 06:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDVjI-00089X-4W
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 06:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDVjD-0004iy-O3
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 06:40:27 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:37933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ZDVjD-0004de-3P; Fri, 10 Jul 2015 06:40:23 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CRA48773; Fri, 10 Jul 2015 18:39:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Jul 2015 18:39:55 +0800
Message-ID: <559FA0EF.2060503@huawei.com>
Date: Fri, 10 Jul 2015 18:39:43 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Leon Alrae <leon.alrae@imgtec.com>, <qemu-devel@nongnu.org>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
	<1436489490-236-5-git-send-email-arei.gonglei@huawei.com>
	<559F9050.5080402@imgtec.com>
In-Reply-To: <559F9050.5080402@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] vl.c: fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 10:40:32 -0000

On 2015/7/10 17:28, Leon Alrae wrote:
> On 10/07/2015 01:51, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Failing to save or free storage allocated
>> by "g_strdup(cmd)" leaks it. Let's use a
>> variable to storage it.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  vl.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 3f269dc..399e816 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -1326,16 +1326,19 @@ static int add_semihosting_arg(void *opaque,
>>  static inline void semihosting_arg_fallback(const char *file, const char *cmd)
>>  {
>>      char *cmd_token;
>> +    char *cmd_str;
>>  
>>      /* argv[0] */
>>      add_semihosting_arg(&semihosting, "arg", file, NULL);
>>  
>> +    cmd_str = g_strdup(cmd);
>>      /* split -append and initialize argv[1..n] */
>> -    cmd_token = strtok(g_strdup(cmd), " ");
>> +    cmd_token = strtok(cmd_str, " ");
>>      while (cmd_token) {
>>          add_semihosting_arg(&semihosting, "arg", cmd_token, NULL);
>>          cmd_token = strtok(NULL, " ");
>>      }
>> +    g_free(cmd_str);
>>  }
>>  
>>  /***********************************************************/
>>
> 
> I don't think this is correct as there's no leak here. This duplicated string
> is modified (i.e. split into tokens) and each pointer to the beginning of a
> token is saved in the global semihosting.argv[] array which is used later in
> target semihosting code. It shouldn't be freed.
> 
Yep, I look over the logic, and you are right. :)
False positive report. NACK please.

Thanks,
-Gonglei




