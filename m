Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T2pZ2-0004TK-7P
	for mharc-qemu-trivial@gnu.org; Sat, 18 Aug 2012 16:24:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T2pYz-0004Lm-Pg
	for qemu-trivial@nongnu.org; Sat, 18 Aug 2012 16:24:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T2pYy-0001Fe-Vp
	for qemu-trivial@nongnu.org; Sat, 18 Aug 2012 16:24:05 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T2pYw-0001Ev-OE; Sat, 18 Aug 2012 16:24:03 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	46556728002D; Sat, 18 Aug 2012 22:24:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 4RpObP-l5OR4; Sat, 18 Aug 2012 22:24:01 +0200 (CEST)
Received: from [188.193.95.82] (188-193-95-82-dynip.superkabel.de
	[188.193.95.82])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A39D07280027; Sat, 18 Aug 2012 22:24:01 +0200 (CEST)
Message-ID: <502F8164.2060701@weilnetz.de>
Date: Sat, 18 Aug 2012 13:49:56 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
	<87obm9mwxn.fsf@blackfin.pond.sub.org>
	<20120817112111.1231d0f6@doriath.home>
	<87d32plgwx.fsf@blackfin.pond.sub.org>
	<20120817120235.7a725482@doriath.home>
In-Reply-To: <20120817120235.7a725482@doriath.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Fix warning from
	clang
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
X-List-Received-Date: Sat, 18 Aug 2012 20:24:06 -0000

Am 17.08.2012 17:02, schrieb Luiz Capitulino:
> On Fri, 17 Aug 2012 16:41:34 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Luiz Capitulino <lcapitulino@redhat.com> writes:
>>
>>> On Fri, 17 Aug 2012 16:10:12 +0200
>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>>> Stefan Weil <sw@weilnetz.de> writes:
>>>>
>>>>> ccc-analyzer reports these warnings:
>>>>>
>>>>> monitor.c:3532:21: warning: Division by zero
>>>>>                  val %= val2;
>>>>>                      ^
>>>>> monitor.c:3530:21: warning: Division by zero
>>>>>                  val /= val2;
>>>>>                      ^
>>>>>
>>>>> Rewriting the code fixes this (and also a style issue).
>>>>
>>>> I'm afraid this doesn't actually fix anything, because...
>>>>
>>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>>> ---
>>>>>   monitor.c |    7 ++++---
>>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/monitor.c b/monitor.c
>>>>> index 0c34934..0ea2c14 100644
>>>>> --- a/monitor.c
>>>>> +++ b/monitor.c
>>>>> @@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
>>>>>               break;
>>>>>           case '/':
>>>>>           case '%':
>>>>> -            if (val2 == 0)
>>>>> +            if (val2 == 0) {
>>>>>                   expr_error(mon, "division by zero");
>>>>> -            if (op == '/')
>>>>> +            } else if (op == '/') {
>>>>>                   val /= val2;
>>>>> -            else
>>>>> +            } else {
>>>>>                   val %= val2;
>>>>> +            }
>>>>>               break;
>>>>>           }
>>>>>       }
>>>>
>>>> ... expr_error() longjmp()s out.  The expression evaluator commonly
>>>> exploits that.
>>>
>>> And that's correct. As far far I understood it's fixing clang, not qemu.
>>>
>>>> If expr_error() returned, the code would be just as wrong after your
>>>> patch as before.
>>>
>>> Hmm, how? It checks for val2 == 0 first.
>>
>> It would evaluate A % 0 into A, which is wrong.
>
> Oh, you're talking about the result that would be returned by expr_prod().
> I thought you were saying that val2 == 0 was still possible.
>
>>
>>>> Perhaps the checker can be shut up by making expr_error() QEMU_NORETURN.
>>>
>>> That's indeed a better solution.
>>
>> Stefan, could you try that for us?


Adding QEMU_NORETURN to function expr_error also
fixes the warning from ccc-analyzer.

I'll send a patch series which adds this and some more
QEMU_NORETURN attributes.

What about using above patch in addition? IMHO it
improves readability, and it fixes the coding style.

Regards,

Stefan W.



