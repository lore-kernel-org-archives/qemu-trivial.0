Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W00dc-0007nO-9D
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jan 2014 22:14:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1W00dR-0007kf-O0
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:13:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1W00dL-00028T-Im
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:13:49 -0500
Received: from mail-wi0-f181.google.com ([209.85.212.181]:37198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1W00dL-00028I-9c
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:13:43 -0500
Received: by mail-wi0-f181.google.com with SMTP id hq4so2321385wib.8
	for <qemu-trivial@nongnu.org>; Sun, 05 Jan 2014 19:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=iGCRQm9ZvXNUVwZOWG+Migcy8/ycqrnvop9wbYchQos=;
	b=RFKXOrGu7JkPGd/A7JU3j0PIs6Ov1FZUB7XtNMG31zEdafnDFfHym0JktT1pN49Pq8
	co8alD1U92UxCEn1Mjy+6DG7/qmdpIAEgpTHI0t4W4rFC9u21ZoemljFCaK5mIupOsan
	fT/hJFkjrKbwLX4ZQmo7l39ILfqliVX/IFvstwJLtkvedmlna4vwm/gWyOlXaydOXnij
	PVSWSgDHp/XGQ60E7f+GZht1TL3sgZIiLvX1VzvvNOz0knGdRvdbWrx9caMXEGg3J2dt
	cfrKFTPt1gzf3BSklOxdFgyOr2L/jIEHgtF8GYkU4sF7/auhv83HCmS23v8v4sWuNDfF
	gnNw==
X-Gm-Message-State: ALoCoQkdXoZ5yIF5SYOQR3jmskFYKz5wkX+qOMqeIK0QH7G19QI1uidx6KL3qjPp2llYF65W6CTN
MIME-Version: 1.0
X-Received: by 10.180.76.103 with SMTP id j7mr10451748wiw.58.1388978021681;
	Sun, 05 Jan 2014 19:13:41 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Sun, 5 Jan 2014 19:13:41 -0800 (PST)
In-Reply-To: <CAJBZ5eMmkhBqCuLpR0iRx-2=mwsRhM2fhFckA9vrRnN5bMo1Rg@mail.gmail.com>
References: <1388629202-29482-1-git-send-email-keweihk@gmail.com>
	<CAJBZ5eMmkhBqCuLpR0iRx-2=mwsRhM2fhFckA9vrRnN5bMo1Rg@mail.gmail.com>
Date: Mon, 6 Jan 2014 13:13:41 +1000
X-Google-Sender-Auth: tghkQwnSxxCmwrW7BhoLWu6_JDU
Message-ID: <CAEgOgz5d0hLEj1qr_BDAwg2MWmUyAaC4CqUmKOAN8VXGHCg9uA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Kewei Yu <keweihk@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.181
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Mon, 06 Jan 2014 03:13:55 -0000

Hi Kewei,

On Mon, Jan 6, 2014 at 12:22 PM, Kewei Yu <keweihk@gmail.com> wrote:
> Ping.
>

Paolo's latest query on the other thread is still an open question.
Does simply substituting "-display none" for "-vnc none" resolve the
problem? If not why not?

Regards,
Peter

> Faithfully yours
> Kewei Yu
>
>
> 2014/1/2 Kewei Yu <keweihk@gmail.com>
>>
>> When we disable vnc from "./configure", QEMU can't use the vnc option.
>> So qtest can't use the "vnc -none ", otherwise "make check" fails.
>>
>> Signed-off-by: Kewei Yu <keweihk@gmail.com>
>> ---
>>  v2: Consolidate VNC macro's #ifdef'ery to one central point
>> (tests/libqtest.c).
>>  v3: Fix the spelling and terminology error: "s/disabling/disable; s/the\
>> qemu/QEMU; s/hangs/fails;"
>> ---
>>
>>  tests/fdc-test.c |    5 +----
>>  tests/ide-test.c |    3 ---
>>  tests/libqtest.c |    8 ++++++++
>>  3 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
>> index 38b5b17..37096dc 100644
>> --- a/tests/fdc-test.c
>> +++ b/tests/fdc-test.c
>> @@ -518,7 +518,6 @@ static void fuzz_registers(void)
>>  int main(int argc, char **argv)
>>  {
>>      const char *arch = qtest_get_arch();
>> -    char *cmdline;
>>      int fd;
>>      int ret;
>>
>> @@ -538,9 +537,7 @@ int main(int argc, char **argv)
>>      /* Run the tests */
>>      g_test_init(&argc, &argv, NULL);
>>
>> -    cmdline = g_strdup_printf("-vnc none ");
>> -
>> -    qtest_start(cmdline);
>> +    qtest_start(NULL);
>>      qtest_irq_intercept_in(global_qtest, "ioapic");
>>      qtest_add_func("/fdc/cmos", test_cmos);
>>      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
>> diff --git a/tests/ide-test.c b/tests/ide-test.c
>> index d5cec5a..4a0d97f 100644
>> --- a/tests/ide-test.c
>> +++ b/tests/ide-test.c
>> @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
>>  static void test_bmdma_setup(void)
>>  {
>>      ide_test_start(
>> -        "-vnc none "
>>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>>          "-global ide-hd.ver=%s",
>>          tmp_path, "testdisk", "version");
>> @@ -410,7 +409,6 @@ static void test_identify(void)
>>      int ret;
>>
>>      ide_test_start(
>> -        "-vnc none "
>>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>>          "-global ide-hd.ver=%s",
>>          tmp_path, "testdisk", "version");
>> @@ -455,7 +453,6 @@ static void test_flush(void)
>>      uint8_t data;
>>
>>      ide_test_start(
>> -        "-vnc none "
>>          "-drive file=blkdebug::%s,if=ide,cache=writeback",
>>          tmp_path);
>>
>> diff --git a/tests/libqtest.c b/tests/libqtest.c
>> index 359d571..921391c 100644
>> --- a/tests/libqtest.c
>> +++ b/tests/libqtest.c
>> @@ -35,6 +35,12 @@
>>
>>  #define MAX_IRQ 256
>>
>> +#ifdef CONFIG_VNC
>> +static const char *qtest_vnc_param = "-vnc none ";
>> +#else
>> +static const char *qtest_vnc_param = NULL;
>> +#endif
>> +
>>  QTestState *global_qtest;
>>
>>  struct QTestState
>> @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
>>                                    "-pidfile %s "
>>                                    "-machine accel=qtest "
>>                                    "-display none "
>> +                                  "%s"
>>                                    "%s", qemu_binary, s->socket_path,
>>                                    s->qmp_socket_path, pid_file,
>> +                                  qtest_vnc_param ?: "",
>>                                    extra_args ?: "");
>>          execlp("/bin/sh", "sh", "-c", command, NULL);
>>          exit(1);
>> --
>> 1.7.1
>>
>

