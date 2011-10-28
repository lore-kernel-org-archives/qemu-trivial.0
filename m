Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJkHg-0006Ju-Id
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 07:07:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJkHd-000695-Aw
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 07:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJkHc-0002jA-C3
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 07:07:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RJkHZ-0002hV-Lw; Fri, 28 Oct 2011 07:07:29 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9SB7RdT000659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Oct 2011 07:07:27 -0400
Received: from blackfin.pond.sub.org (ovpn-116-20.ams2.redhat.com
	[10.36.116.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9SB7Q1A013262; Fri, 28 Oct 2011 07:07:27 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id ECD5B6006D; Fri, 28 Oct 2011 13:07:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
	<CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
	<m34nytsd99.fsf@blackfin.pond.sub.org>
	<CAJSP0QUX0TtQtrwsotPuGtMXnq=pH8srk-Bbyn6B2gu2YMt9hQ@mail.gmail.com>
Date: Fri, 28 Oct 2011 13:07:25 +0200
In-Reply-To: <CAJSP0QUX0TtQtrwsotPuGtMXnq=pH8srk-Bbyn6B2gu2YMt9hQ@mail.gmail.com>
	(Stefan Hajnoczi's message of "Fri, 28 Oct 2011 10:02:00 +0100")
Message-ID: <m3y5w5nzma.fsf@blackfin.pond.sub.org>
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
X-List-Received-Date: Fri, 28 Oct 2011 11:07:35 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Fri, Oct 28, 2011 at 9:59 AM, Markus Armbruster <armbru@redhat.com> wr=
ote:
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>>> On Fri, Oct 28, 2011 at 8:40 AM, Markus Armbruster <armbru@redhat.com> =
wrote:
>>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>>>
>>>>> On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
>>>>>> For compilations with -DNDEBUG, the default case did not return
>>>>>> a value which caused a compiler warning.
>>>>>>
>>>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>>>> ---
>>>>>> =C2=A0hw/ppce500_spin.c | =C2=A0 11 ++++++++---
>>>>>> =C2=A01 files changed, 8 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
>>>>>> index cccd940..5b5ffe0 100644
>>>>>> --- a/hw/ppce500_spin.c
>>>>>> +++ b/hw/ppce500_spin.c
>>>>>> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target=
_phys_addr_t addr, unsigned len)
>>>>>> =C2=A0{
>>>>>> =C2=A0 =C2=A0 =C2=A0SpinState *s =3D opaque;
>>>>>> =C2=A0 =C2=A0 =C2=A0uint8_t *spin_p =3D &((uint8_t*)s->spin)[addr];
>>>>>> + =C2=A0 =C2=A0uint64_t result =3D 0;
>>>>>>
>>>>>> =C2=A0 =C2=A0 =C2=A0switch (len) {
>>>>>> =C2=A0 =C2=A0 =C2=A0case 1:
>>>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return ldub_p(spin_p);
>>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ldub_p(spin_p);
>>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>>>>>> =C2=A0 =C2=A0 =C2=A0case 2:
>>>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return lduw_p(spin_p);
>>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D lduw_p(spin_p);
>>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>>>>>> =C2=A0 =C2=A0 =C2=A0case 4:
>>>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return ldl_p(spin_p);
>>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ldl_p(spin_p);
>>>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>>>>>> =C2=A0 =C2=A0 =C2=A0default:
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(0);
>>>>>
>>>>> I would replace assert(3) with abort(3). =C2=A0If this ever happens t=
he
>>>>> program is broken - returning 0 instead of an undefined value doesn't
>>>>> help.
>>>>
>>>> Why is it useful to make failed assertions stop the program regardless
>>>> of NDEBUG only when the assertion happens to be "can't reach"?
>>>
>>> My point is that it should not be an assertion. =C2=A0The program has a
>>> control flow path which should never be taken. =C2=A0In any "safe"
>>> programming environment the program will terminate with a diagnostic.
>>
>> In the not-so-safe C programming environment, we can disable that safety
>> check by defining NDEBUG.
>>
>> Disabling safety checks is almost always a bad idea.
>
> There's a difference in a safety check that slows down the system and
> a failure condition where the program must terminate.
>
> assert(3) is for safety checks that can be disabled because they may
> slow down the system.
>
> I've been saying that assert(3) isn't appropriate here because the
> program can't continue and there's no check we can skip here.

a. Program can't continue: same for pretty much any assertion anywhere.

b. There's no code we can skip here: calling abort() is code.

What I've been saying is

1. Attempting to distinguish between safety checks that are safe to skip
and failure conditions that aren't is a fool's errand.  If a check is
safe to skip it's not a safety check by definition.  It's debugging
code, perhaps.

2. Optionally disabling "expensive" safety checks should be done based
on measurements, if at all.  Arbitrarily declaring all "can't reach"
checks "inexpensive" and all other assertions "expensive" isn't
measuring, it's guesswork.

