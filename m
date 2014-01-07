Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0U0p-0007XX-VJ
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2014 05:35:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1W0U0j-0007Pa-53
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 05:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1W0U0e-00014D-Cn
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 05:35:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:21287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1W0U0U-00012a-7J; Tue, 07 Jan 2014 05:35:34 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s07AZUMD003580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 7 Jan 2014 05:35:30 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s07AZSOL017985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jan 2014 05:35:29 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D6C97200CD; Tue,  7 Jan 2014 11:35:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1388393215-27511-1-git-send-email-keweihk@gmail.com>
	<52C20D76.7060301@suse.de>
	<20140102040856.GB17904@stefanha-thinkpad.redhat.com>
Date: Tue, 07 Jan 2014 11:35:27 +0100
In-Reply-To: <20140102040856.GB17904@stefanha-thinkpad.redhat.com> (Stefan
	Hajnoczi's message of "Thu, 2 Jan 2014 12:08:56 +0800")
Message-ID: <8761pw2i6o.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mst@redhat.com,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 07 Jan 2014 10:35:54 -0000

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Tue, Dec 31, 2013 at 01:19:02AM +0100, Andreas F=C3=A4rber wrote:
>> Am 30.12.2013 09:46, schrieb Kewei Yu:
>> > When we disabling vnc from "./configure", the qemu can't use the vnc o=
ption.
>> > So qtest can't use the "vnc -none ", otherwise "make check" will hang.
>> >=20
>> > Signed-off-by: Kewei Yu <keweihk@gmail.com>
>> > ---
>> >  tests/fdc-test.c |    4 ++++
>> >  tests/ide-test.c |   11 ++++++++---
>> >  2 files changed, 12 insertions(+), 3 deletions(-)
>> >=20
>> > diff --git a/tests/fdc-test.c b/tests/fdc-test.c
>> > index 38b5b17..80dbdfb 100644
>> > --- a/tests/fdc-test.c
>> > +++ b/tests/fdc-test.c
>> > @@ -538,7 +538,11 @@ int main(int argc, char **argv)
>> >      /* Run the tests */
>> >      g_test_init(&argc, &argv, NULL);
>> >=20=20
>> > +#ifdef CONFIG_VNC
>> >      cmdline =3D g_strdup_printf("-vnc none ");
>> > +#else
>> > +    cmdline =3D NULL;
>> > +#endif
>> >=20=20
>> >      qtest_start(cmdline);
>> >      qtest_irq_intercept_in(global_qtest, "ioapic");
>>=20
>> I have already made -display none a default used by all qtests.
>> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2ad645d2854746b55ddfd1d=
8e951f689cca5d78f
>>=20
>> Is there a reason not to do the same for -vnc none?
>> That would consolidate the #ifdef'ery to one central point.
>
> Agreed, let's set -vnc none by default in one place (if enabled by
> ./configure).
>
> I wonder if we should use -nodefaults too?  That may require adding some
> new options to explicitly set up devices used by existing tests.

Try and see what explodes?

