Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btxH7-0001qD-PD
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 09:39:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1btxH4-0001oh-Pe
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 09:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1btxH2-0002yC-JN
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 09:39:17 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1btxH2-0002xs-F3
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 09:39:16 -0400
Received: by mail-vk0-x234.google.com with SMTP id 192so18746803vkl.2
	for <qemu-trivial@nongnu.org>; Tue, 11 Oct 2016 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dRkrquMqdIcJf9wMag3uUtKy8MC4yaNsezeIyj2Y9/M=;
	b=VwXmFTtns57CLfTtQVaV6teNWHuwYrvWgeJSgYfYsO6AaKU+C7IifajS5Y4riKIGX4
	TMB1ZyddHabvGxRLfmt4S3wJ/w9/TI8C179CeDShTbdPCICy32bKlsiqRw97M5lr9STb
	4DFDtUhF1B/i8ljEZknzoC3087ZJP3lwuWm20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dRkrquMqdIcJf9wMag3uUtKy8MC4yaNsezeIyj2Y9/M=;
	b=T4hrVa73SP86/E0ptDF2RK+NidqdpIdo4dHB2w4+MDB7ZJVKJL/huz6CFKCOdiKjcy
	3qmMiPGcm9V0oKqMhHI1znWhqvizh09yWWvM2qLrj4tK8rp7TtagHuWuo1v9ox9WYsJb
	X0/yZTSHY5/Bhs0i4UNlbFB9f1rvZCjulnkTeIiWgAT/2N2bBUlUIBllntmUR27iaWM5
	JUzXrqEZLfdkAufoBLpJitS/uQUVVLVHA+boPVrjRpGNtY5QjfMCROfVmOlOmuUOt4CT
	HEep3u8ZPh5rI0/4PhzDYlvujh5x6QLIyX8sOp4zB42OrSHqBg4RbbK1kY+i8eloGdO8
	cXGQ==
X-Gm-Message-State: AA6/9Rn0gzydb9avIn2H+BcTZmkpK8rrGinCRYvDHj8TmC6MhzoAwDQQ3we+A2ui3UjlwtdSHx7/Lf5Bb8Tn8jA2
X-Received: by 10.31.206.198 with SMTP id e189mr2630869vkg.51.1476193155827;
	Tue, 11 Oct 2016 06:39:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 11 Oct 2016 06:38:55 -0700 (PDT)
In-Reply-To: <1476192722-22871-1-git-send-email-thuth@redhat.com>
References: <1476192722-22871-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2016 14:38:55 +0100
Message-ID: <CAFEAcA_0qLdC706wtKgf2=D4aMbKgAikTfqG4oFzyToobtQQvA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tsirkin <mst@redhat.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Victor Kaplansky <victork@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-trivial] [PATCH] tests/boot-sector: Use mkstemp() to
 create a unique file name
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Oct 2016 13:39:20 -0000

On 11 October 2016 at 14:32, Thomas Huth <thuth@redhat.com> wrote:
> The pxe-test is run for three different targets now (x86_64, i386
> and ppc64), and the bios-tables-test is run for two targets (x86_64
> and i386). But each of the tests is using an invariant name for the
> disk image with the boot sector code - so if the tests are running
> in parallel, there is a race condition that they destroy the disk
> image of a parallel test program. Let's use mkstemp() to create
> unique temporary files here instead.
>
> Reported-by: Sascha Silbe <x-qemu@se-silbe.de>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/bios-tables-test.c | 2 +-
>  tests/boot-sector.c      | 9 +++++++--
>  tests/boot-sector.h      | 4 ++--
>  tests/pxe-test.c         | 2 +-
>  4 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 6ea2b6d..812f830 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -112,7 +112,7 @@ typedef struct {
>      g_assert_cmpstr(ACPI_ASSERT_CMP_str, ==, expected); \
>  } while (0)
>
> -static const char *disk = "tests/acpi-test-disk.raw";
> +static char disk[] = "tests/acpi-test-disk-XXXXXX";
>  static const char *data_dir = "tests/acpi-test-data";
>  #ifdef CONFIG_IASL
>  static const char *iasl = stringify(CONFIG_IASL);
> diff --git a/tests/boot-sector.c b/tests/boot-sector.c
> index e3193c0..e75572f 100644
> --- a/tests/boot-sector.c
> +++ b/tests/boot-sector.c
> @@ -69,10 +69,15 @@ static uint8_t boot_sector[0x7e000] = {
>  };
>
>  /* Create boot disk file.  */
> -int boot_sector_init(const char *fname)
> +int boot_sector_init(char *fname)
>  {
> -    FILE *f = fopen(fname, "w");
> +    FILE *f = NULL;
> +    int fd;
>
> +    fd = mkstemp(fname);
> +    if (fd != -1) {
> +        f = fdopen(fd, "w");
> +    }

Given that we're only writing a pile of bytes, we could
just use write() and close() in this function rather
than doing an fdopen() to use fwrite() and fclose().
But I can see the attraction of not doing that in this
patch for review purposes.

>      if (!f) {
>          fprintf(stderr, "Couldn't open \"%s\": %s", fname, strerror(errno));
>          return 1;
> diff --git a/tests/boot-sector.h b/tests/boot-sector.h
> index f64b477..35d61c7 100644
> --- a/tests/boot-sector.h
> +++ b/tests/boot-sector.h
> @@ -14,8 +14,8 @@
>  #ifndef TEST_BOOT_SECTOR_H
>  #define TEST_BOOT_SECTOR_H
>
> -/* Create boot disk file.  */
> -int boot_sector_init(const char *fname);
> +/* Create boot disk file. fname must be a suitable string for mkstemp() */
> +int boot_sector_init(char *fname);
>
>  /* Loop until signature in memory is OK.  */
>  void boot_sector_test(void);
> diff --git a/tests/pxe-test.c b/tests/pxe-test.c
> index 5d3ddbe..34282d3 100644
> --- a/tests/pxe-test.c
> +++ b/tests/pxe-test.c
> @@ -19,7 +19,7 @@
>
>  #define NETNAME "net0"
>
> -static const char *disk = "tests/pxe-test-disk.raw";
> +static char disk[] = "tests/pxe-test-disk-XXXXXX";
>
>  static void test_pxe_one(const char *params, bool ipv6)
>  {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

