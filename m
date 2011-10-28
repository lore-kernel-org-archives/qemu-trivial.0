Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJiKL-0004YP-2a
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 05:02:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJiKI-0004Q6-Bw
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 05:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJiKG-0004Qj-US
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 05:02:10 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:32929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJiK9-0004Q2-8E; Fri, 28 Oct 2011 05:02:01 -0400
Received: by wyh15 with SMTP id 15so4129361wyh.4
	for <multiple recipients>; Fri, 28 Oct 2011 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=dueiUO3USZeL5MryxW78+fivpuQ40J/6b6ASwFfm6sc=;
	b=Mg2JjlsmZmdc8N0OUUyGFeUxWf+SCrnApqsq9hpoh+QbC3iXlRwsJEfaSmkDtOd7ny
	xuXd9Whm5ZeWK2xFym5EUNV7Ml1b9Iv2L9O0a0m4jTcJc/wKOWOOJH7LMBCVIXEneI5+
	PVgKYWRF/uxZV0oVuItiZfFiFEIRlrGJo9lcg=
MIME-Version: 1.0
Received: by 10.216.133.5 with SMTP id p5mr556218wei.34.1319792520138; Fri, 28
	Oct 2011 02:02:00 -0700 (PDT)
Received: by 10.180.85.165 with HTTP; Fri, 28 Oct 2011 02:02:00 -0700 (PDT)
In-Reply-To: <m34nytsd99.fsf@blackfin.pond.sub.org>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
	<CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
	<m34nytsd99.fsf@blackfin.pond.sub.org>
Date: Fri, 28 Oct 2011 10:02:00 +0100
Message-ID: <CAJSP0QUX0TtQtrwsotPuGtMXnq=pH8srk-Bbyn6B2gu2YMt9hQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Oct 2011 09:02:12 -0000

On Fri, Oct 28, 2011 at 9:59 AM, Markus Armbruster <armbru@redhat.com> wrot=
e:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
>> On Fri, Oct 28, 2011 at 8:40 AM, Markus Armbruster <armbru@redhat.com> w=
rote:
>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>>
>>>> On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
>>>>> For compilations with -DNDEBUG, the default case did not return
>>>>> a value which caused a compiler warning.
>>>>>
>>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>>> ---
>>>>> =A0hw/ppce500_spin.c | =A0 11 ++++++++---
>>>>> =A01 files changed, 8 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
>>>>> index cccd940..5b5ffe0 100644
>>>>> --- a/hw/ppce500_spin.c
>>>>> +++ b/hw/ppce500_spin.c
>>>>> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target_=
phys_addr_t addr, unsigned len)
>>>>> =A0{
>>>>> =A0 =A0 =A0SpinState *s =3D opaque;
>>>>> =A0 =A0 =A0uint8_t *spin_p =3D &((uint8_t*)s->spin)[addr];
>>>>> + =A0 =A0uint64_t result =3D 0;
>>>>>
>>>>> =A0 =A0 =A0switch (len) {
>>>>> =A0 =A0 =A0case 1:
>>>>> - =A0 =A0 =A0 =A0return ldub_p(spin_p);
>>>>> + =A0 =A0 =A0 =A0result =3D ldub_p(spin_p);
>>>>> + =A0 =A0 =A0 =A0break;
>>>>> =A0 =A0 =A0case 2:
>>>>> - =A0 =A0 =A0 =A0return lduw_p(spin_p);
>>>>> + =A0 =A0 =A0 =A0result =3D lduw_p(spin_p);
>>>>> + =A0 =A0 =A0 =A0break;
>>>>> =A0 =A0 =A0case 4:
>>>>> - =A0 =A0 =A0 =A0return ldl_p(spin_p);
>>>>> + =A0 =A0 =A0 =A0result =3D ldl_p(spin_p);
>>>>> + =A0 =A0 =A0 =A0break;
>>>>> =A0 =A0 =A0default:
>>>>> =A0 =A0 =A0 =A0 =A0assert(0);
>>>>
>>>> I would replace assert(3) with abort(3). =A0If this ever happens the
>>>> program is broken - returning 0 instead of an undefined value doesn't
>>>> help.
>>>
>>> Why is it useful to make failed assertions stop the program regardless
>>> of NDEBUG only when the assertion happens to be "can't reach"?
>>
>> My point is that it should not be an assertion. =A0The program has a
>> control flow path which should never be taken. =A0In any "safe"
>> programming environment the program will terminate with a diagnostic.
>
> In the not-so-safe C programming environment, we can disable that safety
> check by defining NDEBUG.
>
> Disabling safety checks is almost always a bad idea.

There's a difference in a safety check that slows down the system and
a failure condition where the program must terminate.

assert(3) is for safety checks that can be disabled because they may
slow down the system.

I've been saying that assert(3) isn't appropriate here because the
program can't continue and there's no check we can skip here.

Stefan

