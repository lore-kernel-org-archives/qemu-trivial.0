Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0Uxf-0006As-5K
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2014 06:36:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1W0UxX-00061x-8S
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 06:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1W0UxR-0001bB-3N
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 06:36:34 -0500
Received: from cantor2.suse.de ([195.135.220.15]:40403 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1W0UxE-0001YS-RA; Tue, 07 Jan 2014 06:36:16 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 3FCCFAC2F;
	Tue,  7 Jan 2014 11:36:15 +0000 (UTC)
Message-ID: <52CBE6AB.1060400@suse.de>
Date: Tue, 07 Jan 2014 12:36:11 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
References: <1388393215-27511-1-git-send-email-keweihk@gmail.com>	<52C20D76.7060301@suse.de>	<20140102040856.GB17904@stefanha-thinkpad.redhat.com>
	<8761pw2i6o.fsf@blackfin.pond.sub.org>
In-Reply-To: <8761pw2i6o.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] qtest:Fix the bug about
 disabling vnc causes "make check" hang
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
X-List-Received-Date: Tue, 07 Jan 2014 11:36:41 -0000

Am 07.01.2014 11:35, schrieb Markus Armbruster:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>> On Tue, Dec 31, 2013 at 01:19:02AM +0100, Andreas F=C3=A4rber wrote:
>>> Am 30.12.2013 09:46, schrieb Kewei Yu:
>>>> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
>>>> index 38b5b17..80dbdfb 100644
>>>> --- a/tests/fdc-test.c
>>>> +++ b/tests/fdc-test.c
>>>> @@ -538,7 +538,11 @@ int main(int argc, char **argv)
>>>>      /* Run the tests */
>>>>      g_test_init(&argc, &argv, NULL);
>>>> =20
>>>> +#ifdef CONFIG_VNC
>>>>      cmdline =3D g_strdup_printf("-vnc none ");
>>>> +#else
>>>> +    cmdline =3D NULL;
>>>> +#endif
>>>> =20
>>>>      qtest_start(cmdline);
>>>>      qtest_irq_intercept_in(global_qtest, "ioapic");
>>>
>>> I have already made -display none a default used by all qtests.
>>> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2ad645d2854746b55ddf=
d1d8e951f689cca5d78f
>>>
>>> Is there a reason not to do the same for -vnc none?
>>> That would consolidate the #ifdef'ery to one central point.
>>
>> Agreed, let's set -vnc none by default in one place (if enabled by
>> ./configure).
>>
>> I wonder if we should use -nodefaults too?  That may require adding so=
me
>> new options to explicitly set up devices used by existing tests.
>=20
> Try and see what explodes?

I fear that will render my qom-test useless, which is supposed to test
our defaults. If -nodefaults drops serial ports, floppy drives, etc.
that will reduce its usefulness. Unless of course we find a way to
override -nodefaults with some generic -defaults options. :)
I haven't noticed anyone actually adding qtests along with new machines,
adding them to qom-test already required some poking of mine.

End of last year I was preparing some qtests for optional PCI devices,
but even such stubs are hard to share across multiple shoulders due to
resulting Makefile conflicts...

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

