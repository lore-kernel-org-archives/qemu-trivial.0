Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7JBo-00043I-NE
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 04:04:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7JBn-00040f-2M
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7JBj-0006jT-1a
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 04:04:14 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:51640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7JBi-0006hj-FK; Tue, 23 Jun 2015 04:04:10 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNK28288; Tue, 23 Jun 2015 16:03:55 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 16:03:41 +0800
Message-ID: <558912DD.3060509@huawei.com>
Date: Tue, 23 Jun 2015 16:03:41 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1435021270-7768-1-git-send-email-arei.gonglei@huawei.com>
	<87si9izxkq.fsf@blackfin.pond.sub.org>
In-Reply-To: <87si9izxkq.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ossaudio: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 08:04:16 -0000

On 2015/6/23 15:35, Markus Armbruster wrote:
> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Variable "conf" going out of scope leaks the storage
>> it points to in line 856.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  audio/ossaudio.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/audio/ossaudio.c b/audio/ossaudio.c
>> index 11e76a1..7dbe333 100644
>> --- a/audio/ossaudio.c
>> +++ b/audio/ossaudio.c
>> @@ -853,6 +853,7 @@ static void *oss_audio_init (void)
>    static void *oss_audio_init (void)
>    {
>        OSSConf *conf = g_malloc(sizeof(OSSConf));
>        *conf = glob_conf;
>>  
>>      if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
>>          access(conf->devpath_out, R_OK | W_OK) < 0) {
>> +        g_free(conf);
>>          return NULL;
>>      }
>>      return conf;
>    }
> 
> Simpler (untested):
> 
>    static void *oss_audio_init (void)
>    {
>        if (access(globconf.devpath_in, R_OK | W_OK) < 0 ||
>            access(globconf.devpath_out, R_OK | W_OK) < 0) {
>            return NULL;
>        }
>        return g_memdup(&glob_conf, sizeof(glob_conf));
>    }
> 
I think your approach is better :)
Do you want to submit a patch? Or let me post v2 for this?

Regards,
-Gonglei


