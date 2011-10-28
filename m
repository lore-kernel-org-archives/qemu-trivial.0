Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJnb3-0002lF-8r
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 10:39:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJnaw-0002Pq-SJ
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 10:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJnav-0006uq-Pq
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 10:39:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RJnas-0006uK-MS; Fri, 28 Oct 2011 10:39:38 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9SEdat2029198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Oct 2011 10:39:36 -0400
Received: from blackfin.pond.sub.org (ovpn-116-20.ams2.redhat.com
	[10.36.116.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9SEdXqL024631; Fri, 28 Oct 2011 10:39:35 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id E2AC86006D; Fri, 28 Oct 2011 16:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
	<CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
	<m34nytsd99.fsf@blackfin.pond.sub.org>
	<CAJSP0QUX0TtQtrwsotPuGtMXnq=pH8srk-Bbyn6B2gu2YMt9hQ@mail.gmail.com>
	<m3y5w5nzma.fsf@blackfin.pond.sub.org>
	<CAJSP0QWd-aT6Hyj=dut+a_Va75zYMORzdjGit3pzU-PFzYWD+Q@mail.gmail.com>
Date: Fri, 28 Oct 2011 16:39:32 +0200
In-Reply-To: <CAJSP0QWd-aT6Hyj=dut+a_Va75zYMORzdjGit3pzU-PFzYWD+Q@mail.gmail.com>
	(Stefan Hajnoczi's message of "Fri, 28 Oct 2011 13:41:47 +0100")
Message-ID: <m3ehxxfae3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compiler warning
	(always return a value)
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
X-List-Received-Date: Fri, 28 Oct 2011 14:39:47 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Fri, Oct 28, 2011 at 12:07 PM, Markus Armbruster <armbru@redhat.com> w=
rote:
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>>> On Fri, Oct 28, 2011 at 9:59 AM, Markus Armbruster <armbru@redhat.com> =
wrote:
>>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>>>
>>>>> On Fri, Oct 28, 2011 at 8:40 AM, Markus Armbruster <armbru@redhat.com=
> wrote:
>>>>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
[...]
>>>>>>> I would replace assert(3) with abort(3). =C2=A0If this ever happens=
 the
>>>>>>> program is broken - returning 0 instead of an undefined value doesn=
't
>>>>>>> help.
>>>>>>
>>>>>> Why is it useful to make failed assertions stop the program regardle=
ss
>>>>>> of NDEBUG only when the assertion happens to be "can't reach"?
>>>>>
>>>>> My point is that it should not be an assertion. =C2=A0The program has=
 a
>>>>> control flow path which should never be taken. =C2=A0In any "safe"
>>>>> programming environment the program will terminate with a diagnostic.
>>>>
>>>> In the not-so-safe C programming environment, we can disable that safe=
ty
>>>> check by defining NDEBUG.
>>>>
>>>> Disabling safety checks is almost always a bad idea.
>>>
>>> There's a difference in a safety check that slows down the system and
>>> a failure condition where the program must terminate.
>>>
>>> assert(3) is for safety checks that can be disabled because they may
>>> slow down the system.
>>>
>>> I've been saying that assert(3) isn't appropriate here because the
>>> program can't continue and there's no check we can skip here.
>>
>> a. Program can't continue: same for pretty much any assertion anywhere.
>>
>> b. There's no code we can skip here: calling abort() is code.
>>
>> What I've been saying is
>>
>> 1. Attempting to distinguish between safety checks that are safe to skip
>> and failure conditions that aren't is a fool's errand. =C2=A0If a check =
is
>> safe to skip it's not a safety check by definition. =C2=A0It's debugging
>> code, perhaps.
>>
>> 2. Optionally disabling "expensive" safety checks should be done based
>> on measurements, if at all. =C2=A0Arbitrarily declaring all "can't reach"
>> checks "inexpensive" and all other assertions "expensive" isn't
>> measuring, it's guesswork.
>
> I'm tempted to continue the thread but at the end of the day we just
> need to make the function compile with -NDEBUG.  Using abort(3) or

Do we?

Anyone crazy^Wadventurous enough to compile with -DNDEBUG should be
capable of configure --disable-werror.

> qemu_abort() would be the smallest and IMO sanest change, but if it's
> something else that's fine.

