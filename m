Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bty1y-0008TH-6k
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 10:27:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bty1w-0008Qc-4o
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 10:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bty1u-0008Gv-Fz
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 10:27:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bty1m-0008Bs-6N; Tue, 11 Oct 2016 10:27:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8FCA8B978;
	Tue, 11 Oct 2016 14:27:33 +0000 (UTC)
Received: from localhost (vpn1-7-157.pek2.redhat.com [10.72.7.157])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BERWRH024290; Tue, 11 Oct 2016 10:27:32 -0400
Date: Tue, 11 Oct 2016 22:27:31 +0800
From: Fam Zheng <famz@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Victor Kaplansky <victork@redhat.com>, qemu-ppc@nongnu.org,
	Michael Tsirkin <mst@redhat.com>
Message-ID: <20161011142731.GJ5814@lemon>
References: <1476192722-22871-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476192722-22871-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 11 Oct 2016 14:27:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 11 Oct 2016 14:27:45 -0000

On Tue, 10/11 15:32, Thomas Huth wrote:
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

Nice, this does help fix the failure that patchew hits with "make
docker-test-clang@ubuntu J=8".

Tested-by: Fam Zheng <famz@redhat.com>

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
> -- 
> 1.8.3.1
> 
> 

