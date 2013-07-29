Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3giT-00019P-Ej
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2013 02:13:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V3giM-0000xS-N5
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 02:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V3giG-0005me-Mu
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 02:13:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V3gi5-0005lS-Ps; Mon, 29 Jul 2013 02:13:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 71E744313A;
	Mon, 29 Jul 2013 10:13:32 +0400 (MSK)
Message-ID: <51F6080B.30904@msgid.tls.msk.ru>
Date: Mon, 29 Jul 2013 10:13:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Aurelien Jarno <aurelien@aurel32.net>
References: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
	<20130728223710.GF10155@hall.aurel32.net>
In-Reply-To: <20130728223710.GF10155@hall.aurel32.net>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Remove assignment to a
 variable which is never used
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
X-List-Received-Date: Mon, 29 Jul 2013 06:13:55 -0000

On 29.07.2013 02:37, Aurelien Jarno wrote:
> On Thu, Jul 25, 2013 at 10:10:31PM +0200, Stefan Weil wrote:
>> This assignment causes a compiler warning for compilations with the compiler
>> option -Wunused-but-set-variable (which is included with -Wextra).
>>
>> Removing it allows using -Wextra for QEMU code without suppressing too many
>> extra warnings.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   target-mips/op_helper.c |    1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
>> index 5cf1c3f..b828375 100644
>> --- a/target-mips/op_helper.c
>> +++ b/target-mips/op_helper.c
>> @@ -1735,7 +1735,6 @@ target_ulong helper_evpe(CPUMIPSState *env)
>>   void helper_fork(target_ulong arg1, target_ulong arg2)
>>   {
>>       // arg1 = rt, arg2 = rs
>> -    arg1 = 0;
>>       // TODO: store to TC register
>>   }
>
> Thanks, applied.

FWIW, you're applying this (and "linux-user: correct argument number ..")
3 days after I sent a pull request for trivial-patches which includes
these patches.

Should I rebase and re-issue my pull request now?

Thanks,

/mjt

