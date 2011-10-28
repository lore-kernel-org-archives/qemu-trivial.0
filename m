Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJi8a-0008Qu-05
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 04:50:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJi8W-0008JI-CT
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:50:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJi8V-0002H6-Cr
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:50:00 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:44076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJi8P-0002GA-Of; Fri, 28 Oct 2011 04:49:53 -0400
Received: by wyh15 with SMTP id 15so4118525wyh.4
	for <multiple recipients>; Fri, 28 Oct 2011 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=IHRFzucejN2YZfkCQ79HThWT+walMenCOIl7ilZ4nfg=;
	b=CKux/rkErQzUYLEFnmNNo9UArqE5Xs7De1dA8Gd2bhPsrjdA5EmdYvFbt0OvX2k1/K
	aY+rT1jdQ2ZxyWw7FcnXbFgC+G2bk4Gq7Y3bh90WsAcYKsjHHp3TKzHl929dhnsJlIU1
	wM5zLny4Db+0tGo8gII8lvSxOoAeUyH+NB/Jc=
MIME-Version: 1.0
Received: by 10.227.208.77 with SMTP id gb13mr2719723wbb.4.1319791792519; Fri,
	28 Oct 2011 01:49:52 -0700 (PDT)
Received: by 10.180.85.165 with HTTP; Fri, 28 Oct 2011 01:49:52 -0700 (PDT)
In-Reply-To: <m3obx1y36x.fsf@blackfin.pond.sub.org>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
Date: Fri, 28 Oct 2011 09:49:52 +0100
Message-ID: <CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Oct 2011 08:50:02 -0000

On Fri, Oct 28, 2011 at 8:40 AM, Markus Armbruster <armbru@redhat.com> wrot=
e:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
>> On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
>>> For compilations with -DNDEBUG, the default case did not return
>>> a value which caused a compiler warning.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>> =A0hw/ppce500_spin.c | =A0 11 ++++++++---
>>> =A01 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
>>> index cccd940..5b5ffe0 100644
>>> --- a/hw/ppce500_spin.c
>>> +++ b/hw/ppce500_spin.c
>>> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target_ph=
ys_addr_t addr, unsigned len)
>>> =A0{
>>> =A0 =A0 =A0SpinState *s =3D opaque;
>>> =A0 =A0 =A0uint8_t *spin_p =3D &((uint8_t*)s->spin)[addr];
>>> + =A0 =A0uint64_t result =3D 0;
>>>
>>> =A0 =A0 =A0switch (len) {
>>> =A0 =A0 =A0case 1:
>>> - =A0 =A0 =A0 =A0return ldub_p(spin_p);
>>> + =A0 =A0 =A0 =A0result =3D ldub_p(spin_p);
>>> + =A0 =A0 =A0 =A0break;
>>> =A0 =A0 =A0case 2:
>>> - =A0 =A0 =A0 =A0return lduw_p(spin_p);
>>> + =A0 =A0 =A0 =A0result =3D lduw_p(spin_p);
>>> + =A0 =A0 =A0 =A0break;
>>> =A0 =A0 =A0case 4:
>>> - =A0 =A0 =A0 =A0return ldl_p(spin_p);
>>> + =A0 =A0 =A0 =A0result =3D ldl_p(spin_p);
>>> + =A0 =A0 =A0 =A0break;
>>> =A0 =A0 =A0default:
>>> =A0 =A0 =A0 =A0 =A0assert(0);
>>
>> I would replace assert(3) with abort(3). =A0If this ever happens the
>> program is broken - returning 0 instead of an undefined value doesn't
>> help.
>
> Why is it useful to make failed assertions stop the program regardless
> of NDEBUG only when the assertion happens to be "can't reach"?

My point is that it should not be an assertion.  The program has a
control flow path which should never be taken.  In any "safe"
programming environment the program will terminate with a diagnostic.

That's exactly what we need to do here too.  assert(3) is the wrong
tool for this; we're not even asserting anything.

Stefan

