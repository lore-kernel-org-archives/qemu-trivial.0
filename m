Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJlyt-0000s8-KV
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 18:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJlys-0000re-0M; Tue, 09 Mar 2021 18:41:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:38028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJlyp-0005Da-4F; Tue, 09 Mar 2021 18:41:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A54607456B4;
 Wed, 10 Mar 2021 00:41:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 86A4F7456B8; Wed, 10 Mar 2021 00:41:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 844707456B7;
 Wed, 10 Mar 2021 00:41:29 +0100 (CET)
Date: Wed, 10 Mar 2021 00:41:29 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
In-Reply-To: <5d3abcbd-99f0-0c43-4493-9881a38ae980@amsat.org>
Message-ID: <8494e9f1-b4d9-10bb-451d-54807d4c1deb@eik.bme.hu>
References: <20210302080531.913802-1-f4bug@amsat.org>
 <5d3abcbd-99f0-0c43-4493-9881a38ae980@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="3866299591-1812202737-1615333021=:316"
Content-ID: <a477ea58-50fb-1396-1867-1695b43480ac@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Mar 2021 23:41:38 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1812202737-1615333021=:316
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <27149de4-7e6d-73c3-4f83-39c493c6bd37@eik.bme.hu>

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> ping for review?

This is included in my pegasos2 series as 6/8 replacing half of a similar 
patch from my original version. Since I've reported it I don't think I 
should be also reviewing it but it's quite trivial so may not need that 
much review.

Regards,
BALATON Zoltan

> On 3/2/21 9:05 AM, Philippe Mathieu-Daudé wrote:
>> TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
>> requires APM to be selected.
>>
>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/isa/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index c7f07854f7e..9c026d0c510 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -47,6 +47,7 @@ config VT82C686
>>      select ACPI_SMBUS
>>      select SERIAL_ISA
>>      select FDC
>> +    select APM
>>
>>  config SMC37C669
>>      bool
>>
>
>
--3866299591-1812202737-1615333021=:316--

