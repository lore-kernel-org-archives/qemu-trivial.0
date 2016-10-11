Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btxiM-0000z5-9S
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2016 10:07:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btxiF-0000vj-S2
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 10:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1btxiB-0008Hs-Rg
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2016 10:07:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1btxhr-000875-4B; Tue, 11 Oct 2016 10:06:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E1E3C04B927;
	Tue, 11 Oct 2016 14:06:58 +0000 (UTC)
Received: from [10.33.192.218] (dhcp-192-218.str.redhat.com [10.33.192.218])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9BE6tbW026143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 11 Oct 2016 10:06:56 -0400
To: Greg Kurz <groug@kaod.org>
References: <1476192722-22871-1-git-send-email-thuth@redhat.com>
	<20161011155509.5c422632@bahia>
Cc: Sascha Silbe <x-qemu@se-silbe.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Victor Kaplansky <victork@redhat.com>, qemu-ppc@nongnu.org,
	Michael Tsirkin <mst@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <12493bd0-4812-eaf7-2fa5-ebe675e3ce78@redhat.com>
Date: Tue, 11 Oct 2016 16:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161011155509.5c422632@bahia>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 11 Oct 2016 14:06:58 +0000 (UTC)
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
X-List-Received-Date: Tue, 11 Oct 2016 14:07:28 -0000

On 11.10.2016 15:55, Greg Kurz wrote:
> On Tue, 11 Oct 2016 15:32:02 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> The pxe-test is run for three different targets now (x86_64, i386
>> and ppc64), and the bios-tables-test is run for two targets (x86_64
>> and i386). But each of the tests is using an invariant name for the
>> disk image with the boot sector code - so if the tests are running
>> in parallel, there is a race condition that they destroy the disk
>> image of a parallel test program. Let's use mkstemp() to create
>> unique temporary files here instead.
>>
>> Reported-by: Sascha Silbe <x-qemu@se-silbe.de>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/bios-tables-test.c | 2 +-
>>  tests/boot-sector.c      | 9 +++++++--
>>  tests/boot-sector.h      | 4 ++--
>>  tests/pxe-test.c         | 2 +-
>>  4 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
>> index 6ea2b6d..812f830 100644
>> --- a/tests/bios-tables-test.c
>> +++ b/tests/bios-tables-test.c
>> @@ -112,7 +112,7 @@ typedef struct {
>>      g_assert_cmpstr(ACPI_ASSERT_CMP_str, ==, expected); \
>>  } while (0)
>>  
>> -static const char *disk = "tests/acpi-test-disk.raw";
>> +static char disk[] = "tests/acpi-test-disk-XXXXXX";
>>  static const char *data_dir = "tests/acpi-test-data";
>>  #ifdef CONFIG_IASL
>>  static const char *iasl = stringify(CONFIG_IASL);
>> diff --git a/tests/boot-sector.c b/tests/boot-sector.c
>> index e3193c0..e75572f 100644
>> --- a/tests/boot-sector.c
>> +++ b/tests/boot-sector.c
>> @@ -69,10 +69,15 @@ static uint8_t boot_sector[0x7e000] = {
>>  };
>>  
>>  /* Create boot disk file.  */
>> -int boot_sector_init(const char *fname)
>> +int boot_sector_init(char *fname)
>>  {
>> -    FILE *f = fopen(fname, "w");
>> +    FILE *f = NULL;
>> +    int fd;
>>  
>> +    fd = mkstemp(fname);
>> +    if (fd != -1) {
>> +        f = fdopen(fd, "w");
>> +    }
> 
> Unless we really want to control how the temporary file is named (maybe for
> debugging purpose?), I have the impression that using tmpfile(3) would result
> in a simpler patch.

That unfortunately does not work here - the file name is needed for
starting the QEMU process later (see test_acpi_one() or test_pxe_one()
for details).

 Thomas


