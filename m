Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJiHg-0003fA-Jd
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 04:59:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJiHc-0003QK-BF
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:59:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RJiHb-000461-7U
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:59:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RJiHX-00045G-7n; Fri, 28 Oct 2011 04:59:19 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9S8xGik030230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Oct 2011 04:59:17 -0400
Received: from blackfin.pond.sub.org (ovpn-116-20.ams2.redhat.com
	[10.36.116.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9S8xGod028257; Fri, 28 Oct 2011 04:59:16 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 4BEBA6006D; Fri, 28 Oct 2011 10:59:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
	<20111026125431.GC27267@stefanha-thinkpad.localdomain>
	<m3obx1y36x.fsf@blackfin.pond.sub.org>
	<CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
Date: Fri, 28 Oct 2011 10:59:14 +0200
In-Reply-To: <CAJSP0QVpEpB-_hAWJr1mNKzoEjGGPwVBkMu+S-BcOFe_fK7Nhw@mail.gmail.com>
	(Stefan Hajnoczi's message of "Fri, 28 Oct 2011 09:49:52 +0100")
Message-ID: <m34nytsd99.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
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
X-List-Received-Date: Fri, 28 Oct 2011 08:59:27 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Fri, Oct 28, 2011 at 8:40 AM, Markus Armbruster <armbru@redhat.com> wr=
ote:
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>>> On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
>>>> For compilations with -DNDEBUG, the default case did not return
>>>> a value which caused a compiler warning.
>>>>
>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>> ---
>>>> =C2=A0hw/ppce500_spin.c | =C2=A0 11 ++++++++---
>>>> =C2=A01 files changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
>>>> index cccd940..5b5ffe0 100644
>>>> --- a/hw/ppce500_spin.c
>>>> +++ b/hw/ppce500_spin.c
>>>> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target_p=
hys_addr_t addr, unsigned len)
>>>> =C2=A0{
>>>> =C2=A0 =C2=A0 =C2=A0SpinState *s =3D opaque;
>>>> =C2=A0 =C2=A0 =C2=A0uint8_t *spin_p =3D &((uint8_t*)s->spin)[addr];
>>>> + =C2=A0 =C2=A0uint64_t result =3D 0;
>>>>
>>>> =C2=A0 =C2=A0 =C2=A0switch (len) {
>>>> =C2=A0 =C2=A0 =C2=A0case 1:
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return ldub_p(spin_p);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ldub_p(spin_p);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>>>> =C2=A0 =C2=A0 =C2=A0case 2:
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return lduw_p(spin_p);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D lduw_p(spin_p);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>>>> =C2=A0 =C2=A0 =C2=A0case 4:
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return ldl_p(spin_p);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ldl_p(spin_p);
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>>>> =C2=A0 =C2=A0 =C2=A0default:
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(0);
>>>
>>> I would replace assert(3) with abort(3). =C2=A0If this ever happens the
>>> program is broken - returning 0 instead of an undefined value doesn't
>>> help.
>>
>> Why is it useful to make failed assertions stop the program regardless
>> of NDEBUG only when the assertion happens to be "can't reach"?
>
> My point is that it should not be an assertion.  The program has a
> control flow path which should never be taken.  In any "safe"
> programming environment the program will terminate with a diagnostic.

In the not-so-safe C programming environment, we can disable that safety
check by defining NDEBUG.

Disabling safety checks is almost always a bad idea.

> That's exactly what we need to do here too.  assert(3) is the wrong
> tool for this; we're not even asserting anything.

We do, actually: "can't reach".  That's as good an assertion as any.

