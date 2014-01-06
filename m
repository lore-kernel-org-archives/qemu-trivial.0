Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W00lZ-0001tR-8L
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jan 2014 22:22:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1W00lQ-0001hZ-3b
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:22:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1W00lI-0004GJ-Pt
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:22:04 -0500
Received: from cantor2.suse.de ([195.135.220.15]:43117 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1W00kz-0003zS-Ra; Sun, 05 Jan 2014 22:21:38 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5C9CFAC34;
	Mon,  6 Jan 2014 03:21:36 +0000 (UTC)
Message-ID: <52CA213B.4000601@suse.de>
Date: Mon, 06 Jan 2014 04:21:31 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
	Kewei Yu <keweihk@gmail.com>
References: <1388629202-29482-1-git-send-email-keweihk@gmail.com>	<CAJBZ5eMmkhBqCuLpR0iRx-2=mwsRhM2fhFckA9vrRnN5bMo1Rg@mail.gmail.com>
	<CAEgOgz5d0hLEj1qr_BDAwg2MWmUyAaC4CqUmKOAN8VXGHCg9uA@mail.gmail.com>
In-Reply-To: <CAEgOgz5d0hLEj1qr_BDAwg2MWmUyAaC4CqUmKOAN8VXGHCg9uA@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/1] qtest: Fix the bug
 about disable vnc causes "make check" fail
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
X-List-Received-Date: Mon, 06 Jan 2014 03:22:11 -0000

Am 06.01.2014 04:13, schrieb Peter Crosthwaite:
> Hi Kewei,
>=20
> On Mon, Jan 6, 2014 at 12:22 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> Ping.
>>
>=20
> Paolo's latest query on the other thread is still an open question.
> Does simply substituting "-display none" for "-vnc none" resolve the
> problem? If not why not?

Assuming Paolo is right about -display none implying -vnc none:
Does *dropping* "-vnc none" resolve the problem? :)

Cheers,
Andreas

>=20
> Regards,
> Peter
>=20
>> Faithfully yours
>> Kewei Yu
>>
>>
>> 2014/1/2 Kewei Yu <keweihk@gmail.com>
>>>
>>> When we disable vnc from "./configure", QEMU can't use the vnc option=
.
>>> So qtest can't use the "vnc -none ", otherwise "make check" fails.
>>>
>>> Signed-off-by: Kewei Yu <keweihk@gmail.com>
>>> ---
>>>  v2: Consolidate VNC macro's #ifdef'ery to one central point
>>> (tests/libqtest.c).
>>>  v3: Fix the spelling and terminology error: "s/disabling/disable; s/=
the\
>>> qemu/QEMU; s/hangs/fails;"
>>> ---
>>>
>>>  tests/fdc-test.c |    5 +----
>>>  tests/ide-test.c |    3 ---
>>>  tests/libqtest.c |    8 ++++++++
>>>  3 files changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
>>> index 38b5b17..37096dc 100644
>>> --- a/tests/fdc-test.c
>>> +++ b/tests/fdc-test.c
>>> @@ -518,7 +518,6 @@ static void fuzz_registers(void)
>>>  int main(int argc, char **argv)
>>>  {
>>>      const char *arch =3D qtest_get_arch();
>>> -    char *cmdline;
>>>      int fd;
>>>      int ret;
>>>
>>> @@ -538,9 +537,7 @@ int main(int argc, char **argv)
>>>      /* Run the tests */
>>>      g_test_init(&argc, &argv, NULL);
>>>
>>> -    cmdline =3D g_strdup_printf("-vnc none ");
>>> -
>>> -    qtest_start(cmdline);
>>> +    qtest_start(NULL);
>>>      qtest_irq_intercept_in(global_qtest, "ioapic");
>>>      qtest_add_func("/fdc/cmos", test_cmos);
>>>      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start)=
;
>>> diff --git a/tests/ide-test.c b/tests/ide-test.c
>>> index d5cec5a..4a0d97f 100644
>>> --- a/tests/ide-test.c
>>> +++ b/tests/ide-test.c
>>> @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
>>>  static void test_bmdma_setup(void)
>>>  {
>>>      ide_test_start(
>>> -        "-vnc none "
>>>          "-drive file=3D%s,if=3Dide,serial=3D%s,cache=3Dwriteback "
>>>          "-global ide-hd.ver=3D%s",
>>>          tmp_path, "testdisk", "version");
>>> @@ -410,7 +409,6 @@ static void test_identify(void)
>>>      int ret;
>>>
>>>      ide_test_start(
>>> -        "-vnc none "
>>>          "-drive file=3D%s,if=3Dide,serial=3D%s,cache=3Dwriteback "
>>>          "-global ide-hd.ver=3D%s",
>>>          tmp_path, "testdisk", "version");
>>> @@ -455,7 +453,6 @@ static void test_flush(void)
>>>      uint8_t data;
>>>
>>>      ide_test_start(
>>> -        "-vnc none "
>>>          "-drive file=3Dblkdebug::%s,if=3Dide,cache=3Dwriteback",
>>>          tmp_path);
>>>
>>> diff --git a/tests/libqtest.c b/tests/libqtest.c
>>> index 359d571..921391c 100644
>>> --- a/tests/libqtest.c
>>> +++ b/tests/libqtest.c
>>> @@ -35,6 +35,12 @@
>>>
>>>  #define MAX_IRQ 256
>>>
>>> +#ifdef CONFIG_VNC
>>> +static const char *qtest_vnc_param =3D "-vnc none ";
>>> +#else
>>> +static const char *qtest_vnc_param =3D NULL;
>>> +#endif
>>> +
>>>  QTestState *global_qtest;
>>>
>>>  struct QTestState
>>> @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
>>>                                    "-pidfile %s "
>>>                                    "-machine accel=3Dqtest "
>>>                                    "-display none "
>>> +                                  "%s"
>>>                                    "%s", qemu_binary, s->socket_path,
>>>                                    s->qmp_socket_path, pid_file,
>>> +                                  qtest_vnc_param ?: "",
>>>                                    extra_args ?: "");
>>>          execlp("/bin/sh", "sh", "-c", command, NULL);
>>>          exit(1);
>>> --
>>> 1.7.1
>>>
>>


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

