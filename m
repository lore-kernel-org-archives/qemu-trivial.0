Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMzYG-00021w-HG
	for mharc-qemu-trivial@gnu.org; Thu, 28 Aug 2014 09:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XMzY9-000206-4Y
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 09:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XMzY3-0001iM-Iv
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 09:15:37 -0400
Received: from mail-la0-f54.google.com ([209.85.215.54]:59206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XMzY3-0001iB-Cr
	for qemu-trivial@nongnu.org; Thu, 28 Aug 2014 09:15:31 -0400
Received: by mail-la0-f54.google.com with SMTP id b17so899918lan.13
	for <qemu-trivial@nongnu.org>; Thu, 28 Aug 2014 06:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=zwOpBCx8Q9LpFLbdi1T68Pmbd7WKfMC+SPzn5XLdBxY=;
	b=jZUzWJNN6J07Q2ZAJPpl4E4l/J6WrMc25+3o0zT9kzwl9zlYXupfcB+RBfFG/AejY2
	lYEe0GdLwHYL4VH52F4PIxia99wPynMOsNOWgIbW7W4NSr1AN9S/KBPrjh0HmuO0SjWl
	+Um4FUG7RIu4B8PwzPLYDUDkaFIc8MXvvmY1U2QMf27A7lAR5H7c3ZmFmQHTC3ROlI6l
	JcWEXHUnLmuK8KGdz21UsT7L2A5zJvJVFMDtZLPU8SQRdaZxVBOOiX4FEjlgz4FmJPk8
	dtgU6cUkDr6yIn/FmDXKOqEGhKq4kw8b1mYBcvKUCqNvTfr9TGpA7bhqEd6MzZCQ95oY
	T50w==
X-Gm-Message-State: ALoCoQn8EgXWvfNK9of8b7JbjKecOV7mNTsi/dTPMMWc+HV/O/3MTCO4e7ggc1fcSpLMdNVgPqqc
MIME-Version: 1.0
X-Received: by 10.152.45.42 with SMTP id j10mr4248265lam.13.1409231725982;
	Thu, 28 Aug 2014 06:15:25 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.25.148.143 with HTTP; Thu, 28 Aug 2014 06:15:25 -0700 (PDT)
In-Reply-To: <53FF145E.4040004@huawei.com>
References: <1409035084-6740-1-git-send-email-john.liuli@huawei.com>
	<53FF145E.4040004@huawei.com>
Date: Thu, 28 Aug 2014 23:15:25 +1000
X-Google-Sender-Auth: bpJ35afHK5eBWdqzK_wxfdFIHf4
Message-ID: <CAEgOgz5CihZHeVPdGZEfz4bTaB7Eyhs2wnoKdUFO11bvxGTjKg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Li Liu <john.liuli@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.54
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/2] device_tree.c:
 redirect load_device_tree err message to stderr
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
X-List-Received-Date: Thu, 28 Aug 2014 13:15:41 -0000

Hi Li,

On Thu, Aug 28, 2014 at 9:37 PM, Li Liu <john.liuli@huawei.com> wrote:
> Could this patchset apply to -trivial, thank you!
>

Pings should generally only be sent after a week or so. My personal
rule is 7 calendar days from the original send before pinging.
Maintainers will often silently take short periods of time off-list
either for work or vacation.

Regards,
Peter

> Best regards,
> Li.
>
> On 2014/8/26 14:38, john.liuli wrote:
>> From: Li Liu <john.liuli@huawei.com>
>>
>> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> Signed-off-by: Li Liu <john.liuli@huawei.com>
>> ---
>> changes v1 -> v2:
>> 1) fix indent issue as peter suggested.
>> 2) dump all err mesages with error_report.
>>
>> ---
>>  device_tree.c |   15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index ca83504..9d47195 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -20,6 +20,7 @@
>>
>>  #include "config.h"
>>  #include "qemu-common.h"
>> +#include "qemu/error-report.h"
>>  #include "sysemu/device_tree.h"
>>  #include "sysemu/sysemu.h"
>>  #include "hw/loader.h"
>> @@ -79,8 +80,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
>>      *sizep = 0;
>>      dt_size = get_image_size(filename_path);
>>      if (dt_size < 0) {
>> -        printf("Unable to get size of device tree file '%s'\n",
>> -            filename_path);
>> +        error_report("Unable to get size of device tree file '%s'",
>> +                     filename_path);
>>          goto fail;
>>      }
>>
>> @@ -92,21 +93,21 @@ void *load_device_tree(const char *filename_path, int *sizep)
>>
>>      dt_file_load_size = load_image(filename_path, fdt);
>>      if (dt_file_load_size < 0) {
>> -        printf("Unable to open device tree file '%s'\n",
>> -               filename_path);
>> +        error_report("Unable to open device tree file '%s'",
>> +                     filename_path);
>>          goto fail;
>>      }
>>
>>      ret = fdt_open_into(fdt, fdt, dt_size);
>>      if (ret) {
>> -        printf("Unable to copy device tree in memory\n");
>> +        error_report("Unable to copy device tree in memory");
>>          goto fail;
>>      }
>>
>>      /* Check sanity of device tree */
>>      if (fdt_check_header(fdt)) {
>> -        printf ("Device tree file loaded into memory is invalid: %s\n",
>> -            filename_path);
>> +        error_report("Device tree file loaded into memory is invalid: %s",
>> +                     filename_path);
>>          goto fail;
>>      }
>>      *sizep = dt_size;
>>
>
>

