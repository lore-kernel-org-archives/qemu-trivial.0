Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpWDE-00022Z-Gq
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 03:57:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1bpWDC-0001zz-1W
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 03:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1bpWD6-0003ct-TH
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 03:56:57 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1bpWD6-0003bv-NO; Thu, 29 Sep 2016 03:56:52 -0400
Received: by mail-wm0-f65.google.com with SMTP id w72so760162wmf.1;
	Thu, 29 Sep 2016 00:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NdIYCKvZPdlUiTt2VT3nOF5RiPXUgTOoInSe5GVqc9o=;
	b=beRBgq5H6Q7obQIHxsTczA7XS9AqjqDuRtPXV6Lr0gkFT1mldSIZGiXtUkA/fFt30k
	+tZcKJW2bjLiNRfxLVFShlOBzj0n/xOPXJXk/knU38zOpWnZIIp5adX+RNvWlhGrKOAc
	9reUBB3MZbBtgeuujuJmA5fJUgK3BHaTCqqzM/O3zMKiQhgVp1V4rt0W4KICeKtAKadx
	88LlbkL90Oi4MyNEFwKj293nix9QwSTSBMghDSyCUUx+DZNGkvfNcwig78bnPgdn0KUC
	IEXbLEGA1QpW/qt/9UFDoezKd89elbUhOv7vJiZhD2IplByVxM2BWGAKu7GIhGScq27V
	HS9A==
X-Gm-Message-State: AA6/9RlMaAscN7Xs9YfAOH8J9Jx+Tj9V2MtPl7Hg21Gclh7ycYUKz/hL1ZbrWmuCrPlB9Q==
X-Received: by 10.28.22.138 with SMTP id 132mr11216169wmw.7.1475135811637;
	Thu, 29 Sep 2016 00:56:51 -0700 (PDT)
Received: from [192.168.178.23] (p57AEE4F3.dip0.t-ipconnect.de.
	[87.174.228.243]) by smtp.gmail.com with ESMTPSA id
	au10sm12507710wjc.12.2016.09.29.00.56.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Sep 2016 00:56:50 -0700 (PDT)
To: Laurent Vivier <laurent@vivier.eu>, Greg Ungerer <gerg@uclinux.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1475021199-28674-1-git-send-email-gerg@uclinux.org>
	<d5a78365-a0a9-d208-442b-32c4f35c5daf@vivier.eu>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <d1ddd6de-5b17-cad0-f6a1-79ca89896949@tuxfamily.org>
Date: Thu, 29 Sep 2016 09:56:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <d5a78365-a0a9-d208-442b-32c4f35c5daf@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
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
X-List-Received-Date: Thu, 29 Sep 2016 07:56:59 -0000

On 29.09.2016 09:50, Laurent Vivier wrote:
> 
> 
> Le 28/09/2016 à 02:06, Greg Ungerer a écrit :
>> The shipping default setting for the Freescale M5208EVB board is to run
>> the CPU at 166.67MHz. The current qemu emulation code for this board is
>> defaulting to 66MHz. This results in time appearing to run way to slowly.
>> So a "sleep 5" in a standard ColdFire Linux build takes almost 15
>> seconds in real time to actually complete.
>>
>> Change the hard coded default to match the default hardware setting.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> 
> This solution is as good as another, so:
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Fine for me, too, so:

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

By the way, we still do not have a m68k maintainer yet ... Laurent,
maybe you could finally send a pull request for that patch here:
https://lists.gnu.org/archive/html/qemu-devel/2016-05/msg00805.html ?

Meanwhile, Peter, could you please take this patch here from Greg
directly? Or should it go via qemu-trivial instead?

 Thomas


>> ---
>>  hw/m68k/mcf5208.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> v2: more accurately set frequency (166666666 instead of 166000000)
>>
>> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
>> index 9240ebf..3438314 100644
>> --- a/hw/m68k/mcf5208.c
>> +++ b/hw/m68k/mcf5208.c
>> @@ -21,7 +21,7 @@
>>  #include "elf.h"
>>  #include "exec/address-spaces.h"
>>  
>> -#define SYS_FREQ 66000000
>> +#define SYS_FREQ 166666666
>>  
>>  #define PCSR_EN         0x0001
>>  #define PCSR_RLD        0x0002
>>
> 


