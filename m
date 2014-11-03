Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlJe4-00049e-O4
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 10:34:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlJdy-00040q-3I
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 10:34:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlJdr-0001iJ-TW
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 10:34:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XlJde-0001hY-MT; Mon, 03 Nov 2014 10:33:50 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA3FXf3Y015609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 3 Nov 2014 10:33:41 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA3FXdhI030614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 3 Nov 2014 10:33:40 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7670A3041186; Mon,  3 Nov 2014 16:33:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<545752D6.5020605@msgid.tls.msk.ru> <54576972.2030506@huawei.com>
Date: Mon, 03 Nov 2014 16:33:38 +0100
In-Reply-To: <54576972.2030506@huawei.com> (zhanghailiang's message of "Mon, 3
	Nov 2014 19:39:30 +0800")
Message-ID: <87wq7cti25.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/5] Trivial patch about
	qemu-char
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
X-List-Received-Date: Mon, 03 Nov 2014 15:34:15 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> On 2014/11/3 18:03, Michael Tokarev wrote:
>> 03.11.2014 12:44, zhanghailiang wrote:
>>> Patch 1~3 fix wrong check about in-parameter.
>>> The last two patches convert some open functions to use Error API.
>>>
>>> v2:
>>> - don't use error_setg when followed by exit(), it does not report
>>> an error (Eric Blake)
>>> - check the parameter in qemu_chr_parse_* functions and remove the
>>> check in qemu_chr_open_* functions. (Michael Tokarev)
>>>
>>> Thanks very much for their reviews and suggestions;)
>>
>> Thank you for doing all this.  I think I can apply this but with folding
>> patches 1 and 2 into one, -- it is better to see them both in the same
>> context, just like you did in patch 3.  If that's okay with you, I'll
>> just apply it like this.
>>
>
> Sure, I'm Ok with it;)
>
>> Speaking of Error API -- what is the general consensus of this?  We have
>> TONS of various way to report errors now, and we had several incarnations
>> of various error APIs too, are we going to use some common API finally,
>> or is the conversion endless, expecting new APIs to arrive?

I hope we're done screwing up error APIs, and now we "only" have to
convert code from the APIs we don't want used to the ones we do want
used.  Quote http://wiki.qemu.org/CodeTransitions#Error_reporting:

* Avoid ErrorClass values other than ERROR_CLASS_GENERIC_ERROR unless
  you have a specific reason.  Prefer error_setg() & friends over
  error_set() & friends.

* The QError macros QERR_ are a hack to help with the transition to the
  current error.h API (human-readable message rather than JSON argument,
  see commit df1e608).  Avoid them in new code, use simple message
  strings instead.

* qerror_report() is a transitional interface to help with converting
  existing HMP commands to QMP.  It should not be used elsewhere.  Use
  Error objects instead with error_propagate() and error_setg() instead.

* Use error_report() & friends instead of fprintf(stderr, ...).  Unlike
  fprintf(), it does the right thing in human monitor context.  It also
  adds program name and error location when appropriate, and supports
  timestamps (-msg timestamp=on).

End quote.  More questions?

> Yes, this confused me, besides, error_setg will add a '\n' in the end, but
> for example, print_allowed_subtypes where use fprintf(stderr,..)
> without '\n' in the middle places,
> IMHO, maybe it makes sense to return this to the higher caller.
>
>> And one more thing.  Patch 4 does this:
>>
>> @@ -1388,8 +1388,8 @@ static CharDriverState
>> *qemu_chr_open_pty(const char *id,
>>       ret->pty = g_strdup(pty_name);
>>       ret->has_pty = true;
>>
>> -    fprintf(stderr, "char device redirected to %s (label %s)\n",
>> -            pty_name, id);
>> +    error_report("char device redirected to %s (label %s)",
>> +                 pty_name, id);
>>
>>       s = g_malloc0(sizeof(PtyCharDriver));
>>       chr->opaque = s;
>>
>> This is not really correct.  First it is not really an error, it is
>> an informational message.  But also, there are many scripts out there
>> who expects this very format of this message to find the entry to
>> that char device.  Converting this message to error_report() changes
>> its format, so scrips will be unable to find the device anymore.
>>
>> Take a look at history of this place, -- I remember there was a rather
>> hot discussion when the last part, "(label %)", has been added (initial
>> message was without this label).  Initial suggestion was to change
>> wordin to 'char device $LABEL redirected to $DEVICE', but even if it
>> is much more readable and correct, we agreed to add that "label" part
>> to the end - not that it preserves original message, but at least it
>> makes less scripts to fail...
>>
>
> I got it, thanks very much for your explanation, and your patience;)

Please use error_printf(), so it prints to the monitor when running on
behalf of monitor command chardev-add.  Separate patch, because it's a
separate bug fix.

>> So at least this hunk should not be applied.  I think this place
>> deserves a comment.
>>
>> I'm sorry for being so picky, but I think I give enough reasons
>> explaining why, and these reasons are serious enough.
>
> It's okay, So what's your opinion about this series?
> Should i merge patch 1 and 2 into one patch in V3?
> Keep the other modifies except the incorrect modify in
> qemu_chr_open_pty for patch 4?
> If yes, i will send V3;)

Sounds like a plan to me.

