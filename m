Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VxyVf-0002dn-7t
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 07:33:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VxyVY-0002ZN-9I
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 07:33:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VxyVO-0000lu-Oe
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 07:33:16 -0500
Received: from mail-we0-f177.google.com ([74.125.82.177]:49616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VxyVO-0000lj-IU
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 07:33:06 -0500
Received: by mail-we0-f177.google.com with SMTP id u56so11060481wes.36
	for <qemu-trivial@nongnu.org>; Tue, 31 Dec 2013 04:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=EDKdwILqq5nTrcQToEdnZrVhkcc6jowNwK+Wta1EoWc=;
	b=Xso1pk+Or2dVOGAW2W7wbP3ejxCpH0/UpCwf7NP860lrACxCH3JHVLSfpqs5GgjkXc
	dotnQxXBoOVvBexPffkIisogoOXm6uQQfI7z/IQo/FADgbRDEF1Vkyv1QnR2F1d2Odv4
	ipT9w9I8oEaKCeaj6K5Ui+3ow8QdLVaRxbuUavwWAz3mUa5OHkFXg4qH6FnZXhmmO1Gk
	zwbymZw/JqL5pLboWNYA4Em9GWkZS8Hy0R1GJHDKW12e+0C92mebs6AlvDRV02vl3EZN
	pZd5783sBs0QBDMx+2D8hbDB1Y/J87T6yhvTkoIBz2hM9UyMPXU1h6ZU/p0vDiiq/CFR
	55EA==
X-Gm-Message-State: ALoCoQmzwuY5zpTyw4fkMlvctLwrGchN4kBLnBIe4wGMIQ/OLO1eX4jFkqaUK+LGQ9hxM5LVY0Hv
MIME-Version: 1.0
X-Received: by 10.194.58.136 with SMTP id r8mr49766744wjq.4.1388493185467;
	Tue, 31 Dec 2013 04:33:05 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Tue, 31 Dec 2013 04:33:05 -0800 (PST)
In-Reply-To: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
Date: Tue, 31 Dec 2013 22:33:05 +1000
X-Google-Sender-Auth: cl6FlNi-WdoSk3LrBe8FYeZBZQ4
Message-ID: <CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Kewei Yu <keweihk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.177
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
X-List-Received-Date: Tue, 31 Dec 2013 12:33:22 -0000

On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
> When we disabling vnc from "./configure", the qemu can't use the vnc option.

"disable", -"the", "QEMU",

> So qtest can't use the "vnc -none ", otherwise "make check" will hang.
>

Curious, why exactly does make check hang? Shouldn't it just fail with
an error result in this case?

> Signed-off-by: Kewei Yu <keweihk@gmail.com>
> ---
>  v2: Consolidate VNC macro's #ifdef'ery to one central point (tests/libqtest.c).
>
>  tests/fdc-test.c |    5 +----
>  tests/ide-test.c |    3 ---
>  tests/libqtest.c |    8 ++++++++
>  3 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> index 38b5b17..37096dc 100644
> --- a/tests/fdc-test.c
> +++ b/tests/fdc-test.c
> @@ -518,7 +518,6 @@ static void fuzz_registers(void)
>  int main(int argc, char **argv)
>  {
>      const char *arch = qtest_get_arch();
> -    char *cmdline;
>      int fd;
>      int ret;
>
> @@ -538,9 +537,7 @@ int main(int argc, char **argv)
>      /* Run the tests */
>      g_test_init(&argc, &argv, NULL);
>
> -    cmdline = g_strdup_printf("-vnc none ");
> -
> -    qtest_start(cmdline);
> +    qtest_start(NULL);
>      qtest_irq_intercept_in(global_qtest, "ioapic");
>      qtest_add_func("/fdc/cmos", test_cmos);
>      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
> diff --git a/tests/ide-test.c b/tests/ide-test.c
> index d5cec5a..4a0d97f 100644
> --- a/tests/ide-test.c
> +++ b/tests/ide-test.c
> @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
>  static void test_bmdma_setup(void)
>  {
>      ide_test_start(
> -        "-vnc none "
>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>          "-global ide-hd.ver=%s",
>          tmp_path, "testdisk", "version");
> @@ -410,7 +409,6 @@ static void test_identify(void)
>      int ret;
>
>      ide_test_start(
> -        "-vnc none "
>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>          "-global ide-hd.ver=%s",
>          tmp_path, "testdisk", "version");
> @@ -455,7 +453,6 @@ static void test_flush(void)
>      uint8_t data;
>
>      ide_test_start(
> -        "-vnc none "
>          "-drive file=blkdebug::%s,if=ide,cache=writeback",
>          tmp_path);
>
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 359d571..921391c 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -35,6 +35,12 @@
>
>  #define MAX_IRQ 256
>
> +#ifdef CONFIG_VNC
> +static const char *qtest_vnc_param = "-vnc none ";
> +#else
> +static const char *qtest_vnc_param = NULL;
> +#endif
> +
>  QTestState *global_qtest;
>
>  struct QTestState
> @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
>                                    "-pidfile %s "
>                                    "-machine accel=qtest "
>                                    "-display none "
> +                                  "%s"
>                                    "%s", qemu_binary, s->socket_path,
>                                    s->qmp_socket_path, pid_file,
> +                                  qtest_vnc_param ?: "",

I do vaguely remember someone going to efforts to remove uses of "? :
foo" (with the blank true value).

Regards,
Peter

>                                    extra_args ?: "");
>          execlp("/bin/sh", "sh", "-c", command, NULL);
>          exit(1);
> --
> 1.7.1
>
>

