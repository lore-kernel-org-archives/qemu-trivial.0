Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyDbZ-00017X-9r
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 23:40:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VyDbT-00016K-82
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 23:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VyDbO-0001GO-2i
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 23:40:23 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:48128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VyDbN-0001Fy-RC
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 23:40:18 -0500
Received: by mail-wi0-f173.google.com with SMTP id hn9so13075281wib.0
	for <qemu-trivial@nongnu.org>; Tue, 31 Dec 2013 20:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=y4v+PyStWuyfDwkmJH6quNWyhmNQ8UUyOwDDdxODCtU=;
	b=e8rOBbJJ86uZItfmqTd1ZDcAbxUxd1bt2rqoEICFiERAUsQl6y73A8lHsnV5shoqA6
	sm2vHgziclZl4bhz1e68W6KcLFxIURB7QuUyfxja1pUN4u/5kLCyIlq97930OR5KnJPN
	d8+3ztaJWqdVoIC/4zKAnMd13VyVtuYjVgN/yKw6SuGCiCs0IQ9tZ9+RUJhZwe1t5we/
	aEes6MTXjz3ds/UpPpsFdYTuNGQgmkyOr12pad+wE+VGTmbfZs2pliNeHKivMLJ+NEVr
	f2QynLfNOiei/yuInON+CFtFyEIw1ZjsM5r+V/u2+u0122evu896WferJFrtFHXILZb3
	Uq8A==
X-Gm-Message-State: ALoCoQlGLbEB8ApavMBA1ecAMJfoibXMSaVjfu66psrsTsaZ15nrAg1fXD9e1p00uH9LD1dG7DaL
MIME-Version: 1.0
X-Received: by 10.180.36.105 with SMTP id p9mr49562281wij.58.1388551217114;
	Tue, 31 Dec 2013 20:40:17 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Tue, 31 Dec 2013 20:40:17 -0800 (PST)
In-Reply-To: <CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
Date: Wed, 1 Jan 2014 14:40:17 +1000
X-Google-Sender-Auth: pqlQu9t2VGJluaUNj8OUJMKIyNI
Message-ID: <CAEgOgz5_cT3B38fEUChB7+w7KTsZL5bbTQYiAvp6_i47nNvFMw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Kewei Yu <keweihk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Wed, 01 Jan 2014 04:40:28 -0000

On Tue, Dec 31, 2013 at 11:29 PM, Kewei Yu <keweihk@gmail.com> wrote:
> 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> > When we disabling vnc from "./configure", the qemu can't use the vnc
>> > option.
>>
>> "disable", -"the", "QEMU",
>
> Do you mean "s/disabling/disable; s/the\ qemu/QEMU"?

Yes.

>>
>>
>> > So qtest can't use the "vnc -none ", otherwise "make check" will hang.
>> >
>>
>> Curious, why exactly does make check hang? Shouldn't it just fail with
>> an error result in this case?
>
> Yeah, there is an error result "VNC support is disabled".

I think its just terminology then. s/hangs/fails.

Happy New Year,
Peter

>>
>>
>> > Signed-off-by: Kewei Yu <keweihk@gmail.com>
>> > ---
>> >  v2: Consolidate VNC macro's #ifdef'ery to one central point
>> > (tests/libqtest.c).
>> >
>> >  tests/fdc-test.c |    5 +----
>> >  tests/ide-test.c |    3 ---
>> >  tests/libqtest.c |    8 ++++++++
>> >  3 files changed, 9 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/tests/fdc-test.c b/tests/fdc-test.c
>> > index 38b5b17..37096dc 100644
>> > --- a/tests/fdc-test.c
>> > +++ b/tests/fdc-test.c
>> > @@ -518,7 +518,6 @@ static void fuzz_registers(void)
>> >  int main(int argc, char **argv)
>> >  {
>> >      const char *arch = qtest_get_arch();
>> > -    char *cmdline;
>> >      int fd;
>> >      int ret;
>> >
>> > @@ -538,9 +537,7 @@ int main(int argc, char **argv)
>> >      /* Run the tests */
>> >      g_test_init(&argc, &argv, NULL);
>> >
>> > -    cmdline = g_strdup_printf("-vnc none ");
>> > -
>> > -    qtest_start(cmdline);
>> > +    qtest_start(NULL);
>> >      qtest_irq_intercept_in(global_qtest, "ioapic");
>> >      qtest_add_func("/fdc/cmos", test_cmos);
>> >      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
>> > diff --git a/tests/ide-test.c b/tests/ide-test.c
>> > index d5cec5a..4a0d97f 100644
>> > --- a/tests/ide-test.c
>> > +++ b/tests/ide-test.c
>> > @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
>> >  static void test_bmdma_setup(void)
>> >  {
>> >      ide_test_start(
>> > -        "-vnc none "
>> >          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>> >          "-global ide-hd.ver=%s",
>> >          tmp_path, "testdisk", "version");
>> > @@ -410,7 +409,6 @@ static void test_identify(void)
>> >      int ret;
>> >
>> >      ide_test_start(
>> > -        "-vnc none "
>> >          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>> >          "-global ide-hd.ver=%s",
>> >          tmp_path, "testdisk", "version");
>> > @@ -455,7 +453,6 @@ static void test_flush(void)
>> >      uint8_t data;
>> >
>> >      ide_test_start(
>> > -        "-vnc none "
>> >          "-drive file=blkdebug::%s,if=ide,cache=writeback",
>> >          tmp_path);
>> >
>> > diff --git a/tests/libqtest.c b/tests/libqtest.c
>> > index 359d571..921391c 100644
>> > --- a/tests/libqtest.c
>> > +++ b/tests/libqtest.c
>> > @@ -35,6 +35,12 @@
>> >
>> >  #define MAX_IRQ 256
>> >
>> > +#ifdef CONFIG_VNC
>> > +static const char *qtest_vnc_param = "-vnc none ";
>> > +#else
>> > +static const char *qtest_vnc_param = NULL;
>> > +#endif
>> > +
>> >  QTestState *global_qtest;
>> >
>> >  struct QTestState
>> > @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
>> >                                    "-pidfile %s "
>> >                                    "-machine accel=qtest "
>> >                                    "-display none "
>> > +                                  "%s"
>> >                                    "%s", qemu_binary, s->socket_path,
>> >                                    s->qmp_socket_path, pid_file,
>> > +                                  qtest_vnc_param ?: "",
>>
>> I do vaguely remember someone going to efforts to remove uses of "? :
>> foo" (with the blank true value).
>
>  I'm not clear the sentence's meaning.
>>
>>
>> Regards,
>> Peter
>>
>> >                                    extra_args ?: "");
>> >          execlp("/bin/sh", "sh", "-c", command, NULL);
>> >          exit(1);
>> > --
>> > 1.7.1
>> >
>> >
>
>
> Thanks
> Kewei
>

