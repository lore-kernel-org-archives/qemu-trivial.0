Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8aEQ-0001xt-E8
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 13:14:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T8aEO-0001rs-0T
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:14:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T8aEN-0001NC-3I
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 13:14:35 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:53490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T8aEH-0001Ly-7s; Mon, 03 Sep 2012 13:14:29 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4904C728002D; Mon,  3 Sep 2012 19:14:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id myHsFZTh7enP; Mon,  3 Sep 2012 19:14:27 +0200 (CEST)
Received: from [192.168.178.20] (p5086F8C8.dip.t-dialin.net [80.134.248.200])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A30DD7280029; Mon,  3 Sep 2012 19:14:27 +0200 (CEST)
Message-ID: <5044E573.7010300@weilnetz.de>
Date: Mon, 03 Sep 2012 19:14:27 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1346496778-15014-1-git-send-email-sw@weilnetz.de>
	<20120903134129.74b4a264@doriath.home>
	<5044E092.4030300@weilnetz.de>
In-Reply-To: <5044E092.4030300@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] json-parser: Fix potential
 NULL pointer segfault
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
X-List-Received-Date: Mon, 03 Sep 2012 17:14:36 -0000

Am 03.09.2012 18:53, schrieb Stefan Weil:
> Am 03.09.2012 18:41, schrieb Luiz Capitulino:
>> On Sat,  1 Sep 2012 12:52:58 +0200
>> Stefan Weil <sw@weilnetz.de> wrote:
>>
>>> Report from smatch:
>>> json-parser.c:474 parse_object(62) error: potential null derefence 
>>> 'dict'.
>>> json-parser.c:553 parse_array(75) error: potential null derefence 
>>> 'list'.
>>>
>>> Label out can be called with list == NULL.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>   json-parser.c |    8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/json-parser.c b/json-parser.c
>>> index 457291b..c31c759 100644
>>> --- a/json-parser.c
>>> +++ b/json-parser.c
>>> @@ -471,7 +471,9 @@ static QObject *parse_object(JSONParserContext 
>>> *ctxt, va_list *ap)
>>>     out:
>>>       parser_context_restore(ctxt, saved_ctxt);
>>> -    QDECREF(dict);
>>> +    if (dict) {
>>> +        QDECREF(dict);
>>> +    }
>>
>> I prefer changing QDECREF() to a nop if obj is NULL.
>
> That's fine for me, too. If everybody agrees, I'll send two new
> patches: one to change QDECREF, one to remove the if statements
> from other code locations which use the same pattern as
> my original patch.
>
> Cheers,
>
> - sw
>
>

What about modifying QOBJECT to return NULL if called with a NULL pointer?
That would be a more generic fix for the same problem.

In either case, the code will be a little larger and slower,
but that should not matter because it is not time critical.

Regards,

Stefan W.


