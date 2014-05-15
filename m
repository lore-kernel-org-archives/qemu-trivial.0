Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wkpw1-0008OE-UU
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 03:18:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wkpvs-0008DA-Ju
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 03:18:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wkpvk-0002HA-7O
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 03:18:24 -0400
Received: from g4t3426.houston.hp.com ([15.201.208.54]:48249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>)
	id 1WkpvA-00026h-5J; Thu, 15 May 2014 03:17:40 -0400
Received: from g4t3433.houston.hp.com (g4t3433.houston.hp.com [16.210.25.219])
	by g4t3426.houston.hp.com (Postfix) with ESMTP id C45F1122;
	Thu, 15 May 2014 07:17:39 +0000 (UTC)
Received: from [16.187.245.80] (piepie.asiapacific.hpqcorp.net [16.187.245.80])
	by g4t3433.houston.hp.com (Postfix) with ESMTP id A51364C;
	Thu, 15 May 2014 07:17:38 +0000 (UTC)
Message-ID: <537469DD.7010503@hp.com>
Date: Thu, 15 May 2014 15:16:45 +0800
From: "Li, ZhenHua" <zhen-hual@hp.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Max Filippov <jcmvbkbc@gmail.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
	<1399964954-10842-5-git-send-email-zhen-hual@hp.com>
	<CAMo8Bf+nF1CXjs2VVomD0u2eNs_P6hRgUxbESHDiDb8ANriyCg@mail.gmail.com>
In-Reply-To: <CAMo8Bf+nF1CXjs2VVomD0u2eNs_P6hRgUxbESHDiDb8ANriyCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 15.201.208.54
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] Support more than 255
 cpus: runtime check
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
X-List-Received-Date: Thu, 15 May 2014 07:18:32 -0000

Maybe it should be 4 bytes for 4096 (0x1000).

On 05/13/2014 04:19 PM, Max Filippov wrote:
> On Tue, May 13, 2014 at 11:09 AM, Li, Zhen-Hua <zhen-hual@hp.com> wrote:
>> From: "Li, ZhenHua" <zhen-hual@hp.com>
>>
>> There is some runtime check for max cpu count. Make them support 4096 cpus.
>>
>> Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
>> ---
>>   hw/i386/acpi-build.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index c98df88..5c3bf10 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
> [...]
>
>> @@ -680,7 +680,7 @@ build_append_notify_method(GArray *device, const char *name,
>>       for (i = 0; i < count; i++) {
>>           GArray *target = build_alloc_array();
>>           build_append_nameseg(target, format, i);
>> -        assert(i < 256); /* Fits in 1 byte */
>> +        assert(i < 4096); /* Fits in 1 byte */
> The comment is no longer true.
> Also the function build_append_notify_method is called with format argument
> set to "CP%0.02X", looks like this should be changed to "CP%0.03X".
>


