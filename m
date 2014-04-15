Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZvKg-0001an-G1
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 00:50:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WZvKV-0001GK-H8
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 00:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WZvKM-0001Bu-Fw
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 00:50:43 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:41803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WZvKM-0001Bh-4V; Tue, 15 Apr 2014 00:50:34 -0400
Received: by mail-pd0-f172.google.com with SMTP id p10so8996599pdj.3
	for <multiple recipients>; Mon, 14 Apr 2014 21:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=sH5nNgrsDAD+5L79aEInq9vLHNdy3ifYw3pLh98WMEk=;
	b=WNaAKAhYXJd3ehg5I46tYj5B7cbFAP3fTQ03+0xDmJEVEe2Zxe7qvV8uSOJ20Saznb
	JUnNmgcHLEuOaUPGdaQPez4ME7a4cPH7CBafadhglWam/XT0e7KITg3PLxcN44PoFYhj
	M3DSRo2dkJJfwQqYNGv5GjCmi/+cZjNeJyLCvdQNzMeLhDys5cooZ+9HoZMBvNmMdnVr
	W41ERuPUg4XtGBA1RGNepHDkHQjuMtsYFWi90V8nJ0UYgAT2IpOijpzFLCOB9sXhWyzT
	sXosLkkh910QfbV1pB1OuVCqRXYcqzdMd1Kgf/hfU90tz1kjy4Er7gawmR/75Q0zHceO
	Wyrw==
X-Received: by 10.67.5.131 with SMTP id cm3mr48300052pad.92.1397537432820;
	Mon, 14 Apr 2014 21:50:32 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.234.202])
	by mx.google.com with ESMTPSA id xz7sm89739219pac.3.2014.04.14.21.50.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Apr 2014 21:50:31 -0700 (PDT)
Message-ID: <534CBA87.2040402@gmail.com>
Date: Tue, 15 Apr 2014 12:50:15 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <53337BEB.90305@gmail.com>	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>	<5343E4D4.6070305@gmail.com>	<5343E516.3020103@gmail.com>	<5343E571.60407@gmail.com>
	<CAEgOgz7gEi7s2paSDo+AnO67LT+T+K0_SZ_MnBEZCdpHZgaJrA@mail.gmail.com>
In-Reply-To: <CAEgOgz7gEi7s2paSDo+AnO67LT+T+K0_SZ_MnBEZCdpHZgaJrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 2/3] vl: remove
 redundant local variable 'res'
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
X-List-Received-Date: Tue, 15 Apr 2014 04:50:52 -0000

On 04/15/2014 10:13 AM, Peter Crosthwaite wrote:
> On Tue, Apr 8, 2014 at 10:02 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> In function, if no additional resources to free before quit, commonly,
>> need not use additional local variable 'res' to notice about it. So
>> remove it to simplify code.
>>
> 
> Styling wise, there is a school of thought that functions should only
> have one return statement which is probably the original authors
> intention.
> 

Hmm... maybe.

For me, the readers' feeling (let code simple and easy understanding) is
more important than "school rules".

Welcome other members' styling tastes.

> Regards,
> Peter
> 
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  vl.c |    6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 7505002..377f962 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -1188,18 +1188,16 @@ DeviceState *get_boot_device(uint32_t position)
>>  {
>>      uint32_t counter = 0;
>>      FWBootEntry *i = NULL;
>> -    DeviceState *res = NULL;
>>
>>      if (!QTAILQ_EMPTY(&fw_boot_order)) {
>>          QTAILQ_FOREACH(i, &fw_boot_order, link) {
>>              if (counter == position) {
>> -                res = i->dev;
>> -                break;
>> +                return i->dev;
>>              }
>>              counter++;
>>          }
>>      }
>> -    return res;
>> +    return NULL;
>>  }
>>
>>  /*
>> --
>> 1.7.9.5
>>

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

