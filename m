Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQNgg-0005MK-O3
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 16:33:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VQNgZ-00058L-V9
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VQNgV-0007f0-88
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:33:47 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=33100
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VQNgL-0007eE-1I; Sun, 29 Sep 2013 16:33:33 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	295BE72809F1; Sun, 29 Sep 2013 22:33:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id orm1f1lMZX0b; Sun, 29 Sep 2013 22:33:29 +0200 (CEST)
Received: from [192.168.178.35] (p54AD8DCF.dip0.t-ipconnect.de
	[84.173.141.207])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E049372809F0; Sun, 29 Sep 2013 22:33:28 +0200 (CEST)
Message-ID: <52488E98.3060505@weilnetz.de>
Date: Sun, 29 Sep 2013 22:33:28 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
	<52488A00.6000405@msgid.tls.msk.ru>
In-Reply-To: <52488A00.6000405@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] migration: Fix compiler warning ('caps'
 may be used uninitialized)
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
X-List-Received-Date: Sun, 29 Sep 2013 20:33:53 -0000

Am 29.09.2013 22:13, schrieb Michael Tokarev:
> 29.09.2013 19:41, Stefan Weil wrote:
>> The QEMU buildbot default_i386_debian_6_0 shows this warning:
>>
>>    CC    migration.o
>> migration.c: In function 'qmp_query_migrate_capabilities':
>> migration.c:149: warning:
>>   'caps' may be used uninitialized in this function
>
> Gah, how disgusting.  The code is correct, yet gcc complains
> needlessly...

That's not the first time where we help the compiler by modifying the code.

>
>> While changing this code, I also replaced g_malloc0
>> by the type safe g_new0.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> Buildbot URL:
>> http://buildbot.b1-systems.de/qemu/builders/default_i386_debian_6_0/builds/775/steps/compile/logs/stdio
>>
>>
>>   migration.c |   12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/migration.c b/migration.c
>> index 200d404..8dcb6ce 100644
>> --- a/migration.c
>> +++ b/migration.c
>> @@ -145,17 +145,15 @@ uint64_t migrate_max_downtime(void)
>>
>>   MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error
>> **errp)
>>   {
>> -    MigrationCapabilityStatusList *head = NULL;
>> -    MigrationCapabilityStatusList *caps;
>> +    MigrationCapabilityStatusList *head =
>> +        g_new0(MigrationCapabilityStatusList, 1);
>> +    MigrationCapabilityStatusList *caps = head;
>>       MigrationState *s = migrate_get_current();
>>       int i;
>>
>>       for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
>> -        if (head == NULL) {
>> -            head = g_malloc0(sizeof(*caps));
>> -            caps = head;
>> -        } else {
>> -            caps->next = g_malloc0(sizeof(*caps));
>> +        if (i > 0) {
>> +            caps->next = g_new0(MigrationCapabilityStatusList, i);
>>               caps = caps->next;
>>           }
>
> But this assumes that MIGRATION_CAPABILITY_MAX > 0 ! ;)
> Ie, that there's at least one entry (head) in the list.
> Do we care?

I thought of MIGRATION_CAPABILITY_MAX == 0, too. In current QEMU it's
defined in

qapi-types.h:    MIGRATION_CAPABILITY_MAX = 4,

If there will be no MigrationCapability at all in the future,
we should care about removing the code, not handle the 0 case.
But of course we could add an assertion (feel free to add one,
or I send an update).

Should we fix the callers, too? Today, they assume that the function
might return NULL (= no MigrationCapabilityexists).

>
> Previous code was more natural, so to say...
>
> I'd just initialize `caps' to the same NULL as `head'
> initially...  Or maybe change for() into do..while()..
> Dunno, somehow I don't like the new code much, either ;)
>
> Thanks,
>
> /mjt


