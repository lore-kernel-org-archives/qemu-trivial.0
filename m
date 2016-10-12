Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buHcB-00070v-BY
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 07:22:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1buHc9-00070R-3E
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 07:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1buHc4-0005w9-TQ
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 07:22:24 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:36514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1buHc4-0005va-Lc
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 07:22:20 -0400
Received: from player792.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id AD265FFC772
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 13:22:18 +0200 (CEST)
Received: from bahia (gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id E0A32A0091;
	Wed, 12 Oct 2016 13:22:09 +0200 (CEST)
Date: Wed, 12 Oct 2016 13:22:08 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Victor
	Kaplansky <victork@redhat.com>, qemu-ppc@nongnu.org, Michael Tsirkin
	<mst@redhat.com>
Message-ID: <20161012132208.6e22d819@bahia>
In-Reply-To: <12493bd0-4812-eaf7-2fa5-ebe675e3ce78@redhat.com>
References: <1476192722-22871-1-git-send-email-thuth@redhat.com>
	<20161011155509.5c422632@bahia>
	<12493bd0-4812-eaf7-2fa5-ebe675e3ce78@redhat.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2083477778649618738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgedvgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.56.76
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
X-List-Received-Date: Wed, 12 Oct 2016 11:22:26 -0000

On Tue, 11 Oct 2016 16:06:55 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 11.10.2016 15:55, Greg Kurz wrote:
> > On Tue, 11 Oct 2016 15:32:02 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> The pxe-test is run for three different targets now (x86_64, i386
> >> and ppc64), and the bios-tables-test is run for two targets (x86_64
> >> and i386). But each of the tests is using an invariant name for the
> >> disk image with the boot sector code - so if the tests are running
> >> in parallel, there is a race condition that they destroy the disk
> >> image of a parallel test program. Let's use mkstemp() to create
> >> unique temporary files here instead.
> >>
> >> Reported-by: Sascha Silbe <x-qemu@se-silbe.de>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  tests/bios-tables-test.c | 2 +-
> >>  tests/boot-sector.c      | 9 +++++++--
> >>  tests/boot-sector.h      | 4 ++--
> >>  tests/pxe-test.c         | 2 +-
> >>  4 files changed, 11 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> >> index 6ea2b6d..812f830 100644
> >> --- a/tests/bios-tables-test.c
> >> +++ b/tests/bios-tables-test.c
> >> @@ -112,7 +112,7 @@ typedef struct {
> >>      g_assert_cmpstr(ACPI_ASSERT_CMP_str, ==, expected); \
> >>  } while (0)
> >>  
> >> -static const char *disk = "tests/acpi-test-disk.raw";
> >> +static char disk[] = "tests/acpi-test-disk-XXXXXX";
> >>  static const char *data_dir = "tests/acpi-test-data";
> >>  #ifdef CONFIG_IASL
> >>  static const char *iasl = stringify(CONFIG_IASL);
> >> diff --git a/tests/boot-sector.c b/tests/boot-sector.c
> >> index e3193c0..e75572f 100644
> >> --- a/tests/boot-sector.c
> >> +++ b/tests/boot-sector.c
> >> @@ -69,10 +69,15 @@ static uint8_t boot_sector[0x7e000] = {
> >>  };
> >>  
> >>  /* Create boot disk file.  */
> >> -int boot_sector_init(const char *fname)
> >> +int boot_sector_init(char *fname)
> >>  {
> >> -    FILE *f = fopen(fname, "w");
> >> +    FILE *f = NULL;
> >> +    int fd;
> >>  
> >> +    fd = mkstemp(fname);
> >> +    if (fd != -1) {
> >> +        f = fdopen(fd, "w");
> >> +    }  
> > 
> > Unless we really want to control how the temporary file is named (maybe for
> > debugging purpose?), I have the impression that using tmpfile(3) would result
> > in a simpler patch.  
> 
> That unfortunately does not work here - the file name is needed for
> starting the QEMU process later (see test_acpi_one() or test_pxe_one()
> for details).
> 

Oops you're right *of course*.

Then I guess Peter's remark on fwrite()/fclose() should also be addressed, but I
see you already sent an update for that :)

>  Thomas
> 

Cheers.

--
Greg

