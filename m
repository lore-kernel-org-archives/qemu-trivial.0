Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3MFO-0002NB-Nw
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 03:18:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T3MFL-0002Ef-Gc
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 03:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T3MFK-0008Vw-GF
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 03:17:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1T3MFH-0008V2-O1; Mon, 20 Aug 2012 03:17:55 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7K7HrkG018000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 20 Aug 2012 03:17:53 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7K7Hqmq008424; Mon, 20 Aug 2012 03:17:52 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6E3892005D; Mon, 20 Aug 2012 09:17:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
	<87obm9mwxn.fsf@blackfin.pond.sub.org>
	<20120817112111.1231d0f6@doriath.home>
	<87d32plgwx.fsf@blackfin.pond.sub.org>
	<20120817120235.7a725482@doriath.home> <502F8164.2060701@weilnetz.de>
Date: Mon, 20 Aug 2012 09:17:51 +0200
In-Reply-To: <502F8164.2060701@weilnetz.de> (Stefan Weil's message of "Sat, 18
	Aug 2012 13:49:56 +0200")
Message-ID: <877gsuav6o.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
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
X-List-Received-Date: Mon, 20 Aug 2012 07:18:00 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 17.08.2012 17:02, schrieb Luiz Capitulino:
>> On Fri, 17 Aug 2012 16:41:34 +0200
>> Markus Armbruster <armbru@redhat.com> wrote:
>>
>>> Luiz Capitulino <lcapitulino@redhat.com> writes:
>>>
>>>> On Fri, 17 Aug 2012 16:10:12 +0200
>>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>>
>>>>> Stefan Weil <sw@weilnetz.de> writes:
>>>>>
>>>>>> ccc-analyzer reports these warnings:
>>>>>>
>>>>>> monitor.c:3532:21: warning: Division by zero
>>>>>>                  val %= val2;
>>>>>>                      ^
>>>>>> monitor.c:3530:21: warning: Division by zero
>>>>>>                  val /= val2;
>>>>>>                      ^
>>>>>>
>>>>>> Rewriting the code fixes this (and also a style issue).
>>>>>
>>>>> I'm afraid this doesn't actually fix anything, because...
>>>>>
>>>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>>>> ---
>>>>>>   monitor.c |    7 ++++---
>>>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/monitor.c b/monitor.c
>>>>>> index 0c34934..0ea2c14 100644
>>>>>> --- a/monitor.c
>>>>>> +++ b/monitor.c
>>>>>> @@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
>>>>>>               break;
>>>>>>           case '/':
>>>>>>           case '%':
>>>>>> -            if (val2 == 0)
>>>>>> +            if (val2 == 0) {
>>>>>>                   expr_error(mon, "division by zero");
>>>>>> -            if (op == '/')
>>>>>> +            } else if (op == '/') {
>>>>>>                   val /= val2;
>>>>>> -            else
>>>>>> +            } else {
>>>>>>                   val %= val2;
>>>>>> +            }
>>>>>>               break;
>>>>>>           }
>>>>>>       }
>>>>>
>>>>> ... expr_error() longjmp()s out.  The expression evaluator commonly
>>>>> exploits that.
>>>>
>>>> And that's correct. As far far I understood it's fixing clang, not qemu.
>>>>
>>>>> If expr_error() returned, the code would be just as wrong after your
>>>>> patch as before.
>>>>
>>>> Hmm, how? It checks for val2 == 0 first.
>>>
>>> It would evaluate A % 0 into A, which is wrong.
>>
>> Oh, you're talking about the result that would be returned by expr_prod().
>> I thought you were saying that val2 == 0 was still possible.
>>
>>>
>>>>> Perhaps the checker can be shut up by making expr_error() QEMU_NORETURN.
>>>>
>>>> That's indeed a better solution.
>>>
>>> Stefan, could you try that for us?
>
>
> Adding QEMU_NORETURN to function expr_error also
> fixes the warning from ccc-analyzer.
>
> I'll send a patch series which adds this and some more
> QEMU_NORETURN attributes.

Thanks!

> What about using above patch in addition? IMHO it
> improves readability, and it fixes the coding style.

Readability: debatable.  The code depends on expr_error() not returning.
The current code makes that fairly obvious locally.  I think your patch
makes it less obvious.  Moreover, it changes the way exp_error() is used
in just one place, making it inconsistent with all the other places.

Coding style: we generally make coding style changes only to code we
touch anyway, not just for the sake of it.

TL;DR: let's drop this patch.

