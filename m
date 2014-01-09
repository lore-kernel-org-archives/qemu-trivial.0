Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W1Fk3-00028S-2e
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jan 2014 08:33:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1W1Fjw-0001z3-TB
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 08:33:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1W1Fjs-0006ha-EB
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 08:33:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:19512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1W1Fjh-0006g9-Ch; Thu, 09 Jan 2014 08:33:25 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s09DXMYA017429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 9 Jan 2014 08:33:22 -0500
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s09DXKHY016487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 9 Jan 2014 08:33:21 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 683DC200CD; Thu,  9 Jan 2014 14:33:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
References: <1388393215-27511-1-git-send-email-keweihk@gmail.com>
	<52C20D76.7060301@suse.de>
	<20140102040856.GB17904@stefanha-thinkpad.redhat.com>
	<8761pw2i6o.fsf@blackfin.pond.sub.org> <52CBE6AB.1060400@suse.de>
Date: Thu, 09 Jan 2014 14:33:19 +0100
In-Reply-To: <52CBE6AB.1060400@suse.de> ("Andreas =?utf-8?Q?F=C3=A4rber=22?=
	=?utf-8?Q?'s?= message of "Tue, 07 Jan 2014 12:36:11 +0100")
Message-ID: <87ha9de0v4.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, mst@redhat.com
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
X-List-Received-Date: Thu, 09 Jan 2014 13:33:45 -0000

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 07.01.2014 11:35, schrieb Markus Armbruster:
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>> On Tue, Dec 31, 2013 at 01:19:02AM +0100, Andreas F=C3=A4rber wrote:
>>>> Am 30.12.2013 09:46, schrieb Kewei Yu:
>>>>> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
>>>>> index 38b5b17..80dbdfb 100644
>>>>> --- a/tests/fdc-test.c
>>>>> +++ b/tests/fdc-test.c
>>>>> @@ -538,7 +538,11 @@ int main(int argc, char **argv)
>>>>>      /* Run the tests */
>>>>>      g_test_init(&argc, &argv, NULL);
>>>>>=20=20
>>>>> +#ifdef CONFIG_VNC
>>>>>      cmdline =3D g_strdup_printf("-vnc none ");
>>>>> +#else
>>>>> +    cmdline =3D NULL;
>>>>> +#endif
>>>>>=20=20
>>>>>      qtest_start(cmdline);
>>>>>      qtest_irq_intercept_in(global_qtest, "ioapic");
>>>>
>>>> I have already made -display none a default used by all qtests.
>>>> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2ad645d2854746b55ddfd=
1d8e951f689cca5d78f
>>>>
>>>> Is there a reason not to do the same for -vnc none?
>>>> That would consolidate the #ifdef'ery to one central point.
>>>
>>> Agreed, let's set -vnc none by default in one place (if enabled by
>>> ./configure).
>>>
>>> I wonder if we should use -nodefaults too?  That may require adding some
>>> new options to explicitly set up devices used by existing tests.
>>=20
>> Try and see what explodes?
>
> I fear that will render my qom-test useless, which is supposed to test
> our defaults. If -nodefaults drops serial ports, floppy drives, etc.
> that will reduce its usefulness. Unless of course we find a way to
> override -nodefaults with some generic -defaults options. :)
> I haven't noticed anyone actually adding qtests along with new machines,
> adding them to qom-test already required some poking of mine.
>
> End of last year I was preparing some qtests for optional PCI devices,
> but even such stubs are hard to share across multiple shoulders due to
> resulting Makefile conflicts...
>
> Andreas

(Loosely) related: should we set QEMU_AUDIO_DRV=3Dnone to stop the "audio:
Could not init `oss' audio driver" complaints?

