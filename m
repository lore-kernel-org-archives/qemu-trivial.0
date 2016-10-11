Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btyoW-0004iy-Mf
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 11:17:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1btxWh-0000Fl-11
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 09:55:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1btxWb-0002Qf-2B
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 09:55:26 -0400
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:54188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1btxWa-0002PZ-S7
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 09:55:20 -0400
Received: from player756.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 22A014166F
	for <qemu-trivial@nongnu.org>; Tue, 11 Oct 2016 15:55:18 +0200 (CEST)
Received: from bahia (deibp9eh1--blueice1n3.emea.ibm.com [195.212.29.165])
	(Authenticated sender: groug@kaod.org)
	by player756.ha.ovh.net (Postfix) with ESMTPSA id BD62F420096;
	Tue, 11 Oct 2016 15:55:10 +0200 (CEST)
Date: Tue, 11 Oct 2016 15:55:09 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Victor
	Kaplansky <victork@redhat.com>, qemu-ppc@nongnu.org, Michael Tsirkin
	<mst@redhat.com>
Message-ID: <20161011155509.5c422632@bahia>
In-Reply-To: <1476192722-22871-1-git-send-email-thuth@redhat.com>
References: <1476192722-22871-1-git-send-email-thuth@redhat.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17241468224490936626
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeelgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.59.196
X-Mailman-Approved-At: Tue, 11 Oct 2016 11:17:55 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/boot-sector: Use
 mkstemp() to create a unique file name
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
X-List-Received-Date: Tue, 11 Oct 2016 13:55:28 -0000

On Tue, 11 Oct 2016 15:32:02 +0200
Thomas Huth <thuth@redhat.com> wrote:

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

Unless we really want to control how the temporary file is named (maybe for
debugging purpose?), I have the impression that using tmpfile(3) would result
in a simpler patch.

Cheers.

--
Greg

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


