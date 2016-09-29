Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpboi-0002YC-Cq
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 09:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gerg@uclinux.org>) id 1bpadG-0007pU-TP
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 08:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gerg@uclinux.org>) id 1bpadA-00057R-Nl
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 08:40:09 -0400
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:58980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gerg@uclinux.org>)
	id 1bpadA-00056z-C2; Thu, 29 Sep 2016 08:40:04 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2B0AwBLCu1X/3nvq3wNUBsBAQEDAQEBCQEBAYM/AQEBAQF1KlKjCQICAQEGgRqWHQwZC4V6AoIuAQIBAQEBAQKFZgEBAQECAQECIA8BBUYLCw0LAgImAgIoLwYBDAYCAQEXiCoWrwlnjHMBAQEBAQEEAQEBAQEBARsFgQaEZ4JHgliEFIM0gloFlB+FWIYnhVKFZYRmgyuFb4xsg32Fb2ABhRaCLwEBAQ
X-IPAS-Result: A2B0AwBLCu1X/3nvq3wNUBsBAQEDAQEBCQEBAYM/AQEBAQF1KlKjCQICAQEGgRqWHQwZC4V6AoIuAQIBAQEBAQKFZgEBAQECAQECIA8BBUYLCw0LAgImAgIoLwYBDAYCAQEXiCoWrwlnjHMBAQEBAQEEAQEBAQEBARsFgQaEZ4JHgliEFIM0gloFlB+FWIYnhVKFZYRmgyuFb4xsg32Fb2ABhRaCLwEBAQ
X-IronPort-AV: E=Sophos;i="5.30,415,1470672000"; d="scan'208";a="81155175"
Received: from unknown (HELO [192.168.0.106]) ([124.171.239.121])
	by icp-osb-irony-out9.iinet.net.au with ESMTP;
	29 Sep 2016 20:39:58 +0800
To: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1475021199-28674-1-git-send-email-gerg@uclinux.org>
	<d5a78365-a0a9-d208-442b-32c4f35c5daf@vivier.eu>
	<d1ddd6de-5b17-cad0-f6a1-79ca89896949@tuxfamily.org>
From: Greg Ungerer <gerg@uclinux.org>
Message-ID: <5082bb5b-1fba-c70f-89fc-2177165d4ffc@uclinux.org>
Date: Thu, 29 Sep 2016 22:39:55 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <d1ddd6de-5b17-cad0-f6a1-79ca89896949@tuxfamily.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.59.1.226
X-Mailman-Approved-At: Thu, 29 Sep 2016 09:56:03 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCHv2] m68k: change default
 system clock for m5208evb
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
X-List-Received-Date: Thu, 29 Sep 2016 12:40:15 -0000

Hi Thomas,

On 29/09/16 17:56, Thomas Huth wrote:
> On 29.09.2016 09:50, Laurent Vivier wrote:
>>
>>
>> Le 28/09/2016 à 02:06, Greg Ungerer a écrit :
>>> The shipping default setting for the Freescale M5208EVB board is to run
>>> the CPU at 166.67MHz. The current qemu emulation code for this board is
>>> defaulting to 66MHz. This results in time appearing to run way to slowly.
>>> So a "sleep 5" in a standard ColdFire Linux build takes almost 15
>>> seconds in real time to actually complete.
>>>
>>> Change the hard coded default to match the default hardware setting.
>>>
>>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>>
>> This solution is as good as another, so:
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
> Fine for me, too, so:
>
> Reviewed-by: Thomas Huth <huth@tuxfamily.org>

Thanks for the review.

Regards
Greg


> By the way, we still do not have a m68k maintainer yet ... Laurent,
> maybe you could finally send a pull request for that patch here:
> https://lists.gnu.org/archive/html/qemu-devel/2016-05/msg00805.html ?
>
> Meanwhile, Peter, could you please take this patch here from Greg
> directly? Or should it go via qemu-trivial instead?
>
>  Thomas
>
>
>>> ---
>>>  hw/m68k/mcf5208.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> v2: more accurately set frequency (166666666 instead of 166000000)
>>>
>>> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
>>> index 9240ebf..3438314 100644
>>> --- a/hw/m68k/mcf5208.c
>>> +++ b/hw/m68k/mcf5208.c
>>> @@ -21,7 +21,7 @@
>>>  #include "elf.h"
>>>  #include "exec/address-spaces.h"
>>>
>>> -#define SYS_FREQ 66000000
>>> +#define SYS_FREQ 166666666
>>>
>>>  #define PCSR_EN         0x0001
>>>  #define PCSR_RLD        0x0002
>>>
>>
>
>

