Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJll6-0000iT-Cw
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 08:42:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJlky-0000IG-Jy
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 08:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJlku-00089v-9L
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 08:41:56 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:51018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJlkq-00088n-6J; Fri, 28 Oct 2011 08:41:48 -0400
Received: by wyh15 with SMTP id 15so4331280wyh.4
	for <multiple recipients>; Fri, 28 Oct 2011 05:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Ls/kW7eZDvxbVG2frkBvMpE5GpqW5nLsbJZOcoXaGyQ=;
	b=xbZ424Jke4trChPCGYKFYj7Q2k+tOlfeg14VB8t6Hh+0htdLDdy1ZiIsdrgdqDMXrx
	Lf0uCfOlzIQtTJg+m6hNMoWX6QtXtaADAkmQhitFRFhxn72LD1EDV7rT3hg1e9CTlo6d
	7ro8Lh8fj8gIZZAFw032IOiVKmmtpy4E3AwfU=
MIME-Version: 1.0
Received: by 10.227.208.77 with SMTP id gb13mr3996622wbb.4.1319805707058; Fri,
	28 Oct 2011 05:41:47 -0700 (PDT)
Received: by 10.180.85.165 with HTTP; Fri, 28 Oct 2011 05:41:47 -0700 (PDT)
In-Reply-To: <m3y5w5nzma.fsf@blackfin.pond.sub.org>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
	<CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
	<m34nytsd99.fsf@blackfin.pond.sub.org>
	<CAJSP0QUX0TtQtrwsotPuGtMXnq=pH8srk-Bbyn6B2gu2YMt9hQ@mail.gmail.com>
	<m3y5w5nzma.fsf@blackfin.pond.sub.org>
Date: Fri, 28 Oct 2011 13:41:47 +0100
Message-ID: <CAJSP0QWd-aT6Hyj=dut+a_Va75zYMORzdjGit3pzU-PFzYWD+Q@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
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
X-List-Received-Date: Fri, 28 Oct 2011 12:42:01 -0000

On Fri, Oct 28, 2011 at 12:07 PM, Markus Armbruster <armbru@redhat.com> wro=
te:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
>> On Fri, Oct 28, 2011 at 9:59 AM, Markus Armbruster <armbru@redhat.com> w=
rote:
>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>>
>>>> On Fri, Oct 28, 2011 at 8:40 AM, Markus Armbruster <armbru@redhat.com>=
 wrote:
>>>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>>>>
>>>>>> On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
>>>>>>> For compilations with -DNDEBUG, the default case did not return
>>>>>>> a value which caused a compiler warning.
>>>>>>>
>>>>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>>>>> ---
>>>>>>> =A0hw/ppce500_spin.c | =A0 11 ++++++++---
>>>>>>> =A01 files changed, 8 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
>>>>>>> index cccd940..5b5ffe0 100644
>>>>>>> --- a/hw/ppce500_spin.c
>>>>>>> +++ b/hw/ppce500_spin.c
>>>>>>> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, targe=
t_phys_addr_t addr, unsigned len)
>>>>>>> =A0{
>>>>>>> =A0 =A0 =A0SpinState *s =3D opaque;
>>>>>>> =A0 =A0 =A0uint8_t *spin_p =3D &((uint8_t*)s->spin)[addr];
>>>>>>> + =A0 =A0uint64_t result =3D 0;
>>>>>>>
>>>>>>> =A0 =A0 =A0switch (len) {
>>>>>>> =A0 =A0 =A0case 1:
>>>>>>> - =A0 =A0 =A0 =A0return ldub_p(spin_p);
>>>>>>> + =A0 =A0 =A0 =A0result =3D ldub_p(spin_p);
>>>>>>> + =A0 =A0 =A0 =A0break;
>>>>>>> =A0 =A0 =A0case 2:
>>>>>>> - =A0 =A0 =A0 =A0return lduw_p(spin_p);
>>>>>>> + =A0 =A0 =A0 =A0result =3D lduw_p(spin_p);
>>>>>>> + =A0 =A0 =A0 =A0break;
>>>>>>> =A0 =A0 =A0case 4:
>>>>>>> - =A0 =A0 =A0 =A0return ldl_p(spin_p);
>>>>>>> + =A0 =A0 =A0 =A0result =3D ldl_p(spin_p);
>>>>>>> + =A0 =A0 =A0 =A0break;
>>>>>>> =A0 =A0 =A0default:
>>>>>>> =A0 =A0 =A0 =A0 =A0assert(0);
>>>>>>
>>>>>> I would replace assert(3) with abort(3). =A0If this ever happens the
>>>>>> program is broken - returning 0 instead of an undefined value doesn'=
t
>>>>>> help.
>>>>>
>>>>> Why is it useful to make failed assertions stop the program regardles=
s
>>>>> of NDEBUG only when the assertion happens to be "can't reach"?
>>>>
>>>> My point is that it should not be an assertion. =A0The program has a
>>>> control flow path which should never be taken. =A0In any "safe"
>>>> programming environment the program will terminate with a diagnostic.
>>>
>>> In the not-so-safe C programming environment, we can disable that safet=
y
>>> check by defining NDEBUG.
>>>
>>> Disabling safety checks is almost always a bad idea.
>>
>> There's a difference in a safety check that slows down the system and
>> a failure condition where the program must terminate.
>>
>> assert(3) is for safety checks that can be disabled because they may
>> slow down the system.
>>
>> I've been saying that assert(3) isn't appropriate here because the
>> program can't continue and there's no check we can skip here.
>
> a. Program can't continue: same for pretty much any assertion anywhere.
>
> b. There's no code we can skip here: calling abort() is code.
>
> What I've been saying is
>
> 1. Attempting to distinguish between safety checks that are safe to skip
> and failure conditions that aren't is a fool's errand. =A0If a check is
> safe to skip it's not a safety check by definition. =A0It's debugging
> code, perhaps.
>
> 2. Optionally disabling "expensive" safety checks should be done based
> on measurements, if at all. =A0Arbitrarily declaring all "can't reach"
> checks "inexpensive" and all other assertions "expensive" isn't
> measuring, it's guesswork.

I'm tempted to continue the thread but at the end of the day we just
need to make the function compile with -NDEBUG.  Using abort(3) or
qemu_abort() would be the smallest and IMO sanest change, but if it's
something else that's fine.

Stefan

