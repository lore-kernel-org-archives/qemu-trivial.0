Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goOzj-0002j7-6z
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 03:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goOzg-0002io-U3
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goOzg-0005Km-8M
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:43:44 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:49643)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goOzf-0005IT-70; Tue, 29 Jan 2019 03:43:44 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MK3BO-1gajUF4B14-00LV9T; Tue, 29 Jan 2019 09:43:22 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, imammedo@redhat.com,
	mst@redhat.com
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
	<20190129080455.GA10084@richard>
	<91c53c72-8e9c-f68d-1dc8-f6320ed3dfc0@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f6f1703e-1c77-055e-1906-300df3c79479@vivier.eu>
Date: Tue, 29 Jan 2019 09:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <91c53c72-8e9c-f68d-1dc8-f6320ed3dfc0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TFYjFwmDXGuEwMCNOyygdVKF1oXrE8jBiJot+8esRgSENM5qzsJ
	QC284HshD4u/xQDRNLNhpEcIKIorxDVE0A5cO7cxdKdjO75vKS7TPIaGawqED0s2Za0QA0X
	Wpii908Hh+ykyuUa6aJsCccGPFbK8ahxBjT5zDefZ0vzOddC/DlEXybc554vfnUhJNEdWNm
	XHRpQg2XH2eNPqDJTlfqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HKpqilIZzgY=:NE1jllm7NcdtIsh1LP7Q+O
	3vkmxjqNeBr2al0qndHeVkr6Fj9w9iQCNu9xM+S76CXV+WGcs4uPdk/9X5V2q622VoBSla3LG
	b3cnDIVq3DGRLHaEDuK/znd6UMi1CdJh34EshfgUkHToPHFJSe9WUp5fhvrHsYzxBT6ylT4lQ
	w+rvLhOcycpV4K4q3U5FsizTN88lU7F1EPrE+Kv3zFZw6e4LjkEAYxnFH/XAU47m5RilNbUbt
	VPEAkLr6evLT3Tv3E/De1/oHy49FzmeAhe/eUnHScSwcBkzJMrb/HfE9PD+gofBjuw7aYIdNB
	HDNgx+WUj9YiCPR8rRcMK4zazmfELrXzhh3PTW1EvY4rkwdQY77nRUMmMZMH0rHSUpM9AdKdn
	qzs/elQzG9QjGFyCb/70xPA7MydO4J0idhwoHOsrCrQXcJTlJZtGvI+PuqT2oPfRBpfL/0gFM
	I80GXFx2o76aMBf+eLiebOpj836WpnShHfLVLkM1UvrcxWRV8rYVjnBavlD42PZcv50GBXVTO
	HRXG0TeURQ7e4m+nCA3Jkb6QwW/6W34TIAetfLpLjxTP2n/CvrLpnj5SlWfUOXzBr83sgbFCD
	LLKKhD/v7ecj+SYdGofo13PrAzKTRlFLMZO1d1EQViRgCHmQToIvjLgzKFLpDJLwbrxnpYr9Z
	t30++OhIoV7cqwO7LkF15hAZl1SqRcHB/Zl/JNY9YqVmTuoUYp42xc0Gav2uv/suQQ5vwipiP
	BeZcJIxseqOeR8awEdpv1l87M0nzEMv2HkKbYn6TNfJZAZpYu8y5vWvCv4Y=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/3] Trivial cleanup in
 hw/acpi
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
X-List-Received-Date: Tue, 29 Jan 2019 08:43:45 -0000

On 29/01/2019 09:23, Philippe Mathieu-Daudé wrote:
> On 1/29/19 9:04 AM, Wei Yang wrote:
>> On Tue, Jan 29, 2019 at 07:56:54AM +0100, Philippe Mathieu-Daudé wrote:
>>> Hi Wei,
>>>
>>> On 1/29/19 1:08 AM, Wei Yang wrote:
>>>> There are several functions/variable which are not used anymore.
>>>>
>>>> This serials just remove those without functional change.
>>>>
>>>> Wei Yang (3):
>>>>   hw/i386/pc.c: remove unused function pc_acpi_init()
>>>>   hw/acpi: remove unused function acpi_table_add_builtin()
>>>>   hw/acpi: remove unnecessary variable acpi_table_builtin
>>>>
>>>>  hw/acpi/core.c         | 10 +---------
>>>>  hw/i386/pc.c           | 27 ---------------------------
>>>>  include/hw/acpi/acpi.h |  1 -
>>>>  include/hw/i386/pc.h   |  1 -
>>>>  4 files changed, 1 insertion(+), 38 deletions(-)
>>>>
>>>
>>> Please do not post iterated series in reply to previous version, but as
>>> new thread:
>>> - patches are parsed by scripts
>>> - some email clients can tag a thread as "reviewed, skip" and replies to
>>> this thread will be masked.
>>>
>>
>> Well, do I need to repost it in a new thread?
> 
> It depends who will take this patchset and his mood :)
> Let's wait and see.
> 

No need to repost if they go through the trivial branch.

Thanks,
Laurent

