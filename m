Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLiDH-0006q2-3h
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 20:05:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLiDD-0006pU-T0
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 20:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLiDA-0007rI-Mc
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 20:04:59 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:63919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLiDA-0007qO-3Y; Wed, 11 Feb 2015 20:04:56 -0500
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHE47554; Thu, 12 Feb 2015 09:04:48 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 12 Feb 2015 09:04:44 +0800
Message-ID: <54DBFC1D.6020901@huawei.com>
Date: Thu, 12 Feb 2015 09:04:29 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1423635971-9928-1-git-send-email-arei.gonglei@huawei.com>
	<87386c8uy4.fsf@blackfin.pond.sub.org>
In-Reply-To: <87386c8uy4.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Fix Resource leak
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
X-List-Received-Date: Thu, 12 Feb 2015 01:05:01 -0000

On 2015/2/11 21:00, Markus Armbruster wrote:
> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Coverity spot:
>> qemu_using_spice allocates memory that is stored into err,
>> but not freed before return.
>>
>> Cc:Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  monitor.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/monitor.c b/monitor.c
>> index c3cc060..137d23f 100644
>> --- a/monitor.c
>> +++ b/monitor.c
>> @@ -1095,12 +1095,13 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
>>      const char *subject  = qdict_get_try_str(qdict, "cert-subject");
>>      int port             = qdict_get_try_int(qdict, "port", -1);
>>      int tls_port         = qdict_get_try_int(qdict, "tls-port", -1);
>> -    Error *err;
>> +    Error *err = NULL;
>>      int ret;
>>  
>>      if (strcmp(protocol, "spice") == 0) {
>>          if (!qemu_using_spice(&err)) {
>>              qerror_report_err(err);
>> +            error_free(err);
>>              return -1;
>>          }
> 
> Your commit message is incomplete.  The resource leak is real, but it's
> the less serious bug here.  The serious one is missing initialization of
> err.
> 
> If using_spice, qemu_using_spice() returns true without touching err.
> All fine.
> 
> Else, if err is null by chance, qemu_using_spice()'s error_set() creates
> an error object and stores it in err.  We leak it.
> 
> If err is not null, error_set() fails its assertion.
> 
Thanks for your explanation, I haven't a global inspection TBH.
> Broken in commit b25d81b by yours truly.  Thanks for cleaning up my
> mess!
> 
> Let's fix up the commit message:
> 
>     monitor: Fix missing err = NULL in client_migrate_info()
> 
>     When SPICE isn't used, we either fail an assertion in error_set(),
>     or leak an error object.  Broken in commit b25d81b.
> 
OK, will fix.
> With such a fixup:
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
Thanks.

Regards,
-Gonglei


