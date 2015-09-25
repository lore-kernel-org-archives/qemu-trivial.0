Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfZHK-0007Xh-V1
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 16:07:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZHI-0007UX-7k
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZHH-0000TK-B5
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:07:32 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=40614
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZfZHB-0000RO-Ko; Fri, 25 Sep 2015 16:07:25 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	56DB711810B3; Fri, 25 Sep 2015 22:07:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id q3heb_KhysL7; Fri, 25 Sep 2015 22:07:21 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC9FC4.dip0.t-ipconnect.de
	[84.172.159.196])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EF54E11810A4; Fri, 25 Sep 2015 22:07:20 +0200 (CEST)
Message-ID: <5605A978.1060102@weilnetz.de>
Date: Fri, 25 Sep 2015 22:07:20 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1423406458-31957-1-git-send-email-sw@weilnetz.de>
	<54DA613D.3080407@msgid.tls.msk.ru>
In-Reply-To: <54DA613D.3080407@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Remove type casts to union
	type
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
X-List-Received-Date: Fri, 25 Sep 2015 20:07:33 -0000

Am 10.02.2015 um 20:51 schrieb Michael Tokarev:
> 08.02.2015 17:40, Stefan Weil wrote:
>> Casting to a union type is a gcc (and clang) extension. Other compilers
>> might not support it. This is not a problem today, but the type casts
>> can be removed easily. Smatch now no longer complains like before:
>>
>> linux-user/syscall.c:3190:18: warning: cast to non-scalar
>> linux-user/syscall.c:7348:44: warning: cast to non-scalar
>>
>> Cc: Riku Voipio <riku.voipio@iki.fi>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  linux-user/syscall.c |   10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 852308e..ec137db 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -2663,8 +2663,9 @@ static inline abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
>>  }
>>  
>>  static inline abi_long do_semctl(int semid, int semnum, int cmd,
>> -                                 union target_semun target_su)
>> +                                 abi_ulong target_arg)
>>  {
>> +    union target_semun target_su;
>>      union semun arg;
>>      struct semid_ds dsarg;
>>      unsigned short *array = NULL;
>> @@ -2673,6 +2674,8 @@ static inline abi_long do_semctl(int semid, int semnum, int cmd,
>>      abi_long err;
>>      cmd &= 0xff;
>>  
>> +    target_su.buf = target_arg;
> 
> 
> Can we use c99 initializers at declaration, something like
> 
>    union target_semun target_su = { .buf = target_arg }
> 
> ?  Or is it also some gcc/clang extension? :)
> 
> But I'd like to hear from Riku at least...
> 
> Thanks,
> 
> /mjt
> 

Ping. This patch is still missing.

Hello Michael,

using a c99 initializer is a good idea. We already have lots
of them, it's not a gcc extension but C standard.

Should I send an updated patch, or do you want to modify
the code before applying it?

Regards,
Stefan

