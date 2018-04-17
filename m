Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8TBB-0005Ko-21
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2018 12:10:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8TB6-0005It-OG
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2018 12:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8TB2-0006vL-Ds
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2018 12:09:56 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:37702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8TAx-0006tC-JR; Tue, 17 Apr 2018 12:09:47 -0400
Received: by mail-vk0-x243.google.com with SMTP id d9so7269495vka.4;
	Tue, 17 Apr 2018 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nWmVN/vzaN3Tp6clCGcNpY8JhpY7wU1sPDXhaAYqO/M=;
	b=KS5zsoGKhYY674YMCAcI/TIHIiNVCm0tIOzLqn9qKDtzZGL1g9cQ5t9oLiEXlpBuj5
	aRUOizcleaTNg+yA2d8LKFixSCtwoP8ENhM7ZtwpYTljSrEWaPmslqILc03Dnou5SC3/
	6WA3Rq4g1Hew5ud1SojzJEcmjBzGOZH6LsKmEBhDHh8g5JB89z4UjpKr2Tn/Rz0/UC1a
	IfTtMv7SGZsauZUrtZoRC6m6f1C2QdKxKI+1J+h+CIiEGax6n8sYuuB609Qgtd7DTz0N
	dkSk/0YbZBF9ZXfkPdeDCGZ+4n1pUK0HJS3qA2QKXfq5bdtoJztszU2DDw0/x2fVvjVW
	UtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nWmVN/vzaN3Tp6clCGcNpY8JhpY7wU1sPDXhaAYqO/M=;
	b=J+yFR4DNRW9PGkYK13oWvKnZIexlNIN0TAqvI+5cVQquibwPVOLF/Pnt203mLI86Bf
	H/OtRVjrsN3EboUkbQGd1jnxZxAmsak67H9xhyniB7gkYSFpKZ2MrWqOicds7pjB/n1J
	oHt/7aDEXFl34n4XG9nu7HVSkKPKq3HosfDJqHiVRQDkct77C04EIl9pgA5g7rOFjMmz
	ZhuB/M+3hqbLfuVvp32bRUONZpwJmiG7D+mbK9+znh2dLAZ5rhyrtMb3etNSkgWpiSoo
	VggjXw26sIT9MKKgi9loIOtpvW6W0XdEBMvlarM/tvM2JKem5zSPVl7d29/Z2nhqq4Dd
	frmA==
X-Gm-Message-State: ALQs6tA7kvHGF3BIvYVhLHgAPVHCvByHO+x7dlx0NmC0qc9iNNCfrF8o
	LbNbvgIC3k2XlRW9iCG1c14t/eEc
X-Google-Smtp-Source: AIpwx4+r9ONoXe3tznQUIShZP8c5Lcb1Ogk5H7/aItMkG92dtdMkgTlCPyH1rebrCihv6O+HxFkS5A==
X-Received: by 10.31.54.4 with SMTP id d4mr1904701vka.33.1523981386796;
	Tue, 17 Apr 2018 09:09:46 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	c187sm6594166vkf.46.2018.04.17.09.09.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 09:09:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Jason Wang <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	"open list:Allwinner-a10" <qemu-arm@nongnu.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-34-f4bug@amsat.org>
	<f11c4eac-fcbf-0aa3-06bf-570ff57144c4@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f798155d-7740-42cc-fd37-384bb0d4fb06@amsat.org>
Date: Tue, 17 Apr 2018 13:09:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f11c4eac-fcbf-0aa3-06bf-570ff57144c4@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 33/41] hw/net: Use the
 BYTE-based definitions
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
X-List-Received-Date: Tue, 17 Apr 2018 16:10:00 -0000

Hi Stefan,

On 04/16/2018 02:23 AM, Stefan Weil wrote:
> Am 16.04.2018 um 01:42 schrieb Philippe Mathieu-Daudé:
>> It eases code review, unit is explicit.
>>
>> Patch generated using:
>>
>>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
>>
>> and modified manually.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/net/allwinner_emac.h | 5 +++--
>>  hw/net/e1000e.c                 | 7 ++++---
>>  hw/net/e1000x_common.c          | 3 ++-
>>  hw/net/eepro100.c               | 7 +++----
>>  4 files changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
>> index 4cc8aab7ec..4b53b6485c 100644
>> --- a/include/hw/net/allwinner_emac.h
>> +++ b/include/hw/net/allwinner_emac.h
>> @@ -23,6 +23,7 @@
>>  #ifndef ALLWINNER_EMAC_H
>>  #define ALLWINNER_EMAC_H
>>  
>> +#include "qemu/units.h"
>>  #include "net/net.h"
>>  #include "qemu/fifo8.h"
>>  #include "hw/net/mii.h"
>> @@ -125,8 +126,8 @@
>>  #define EMAC_INT_RX         (1 << 8)
>>  
>>  /* Due to lack of specifications, size of fifos is chosen arbitrarily */
>> -#define TX_FIFO_SIZE        (4 * 1024)
>> -#define RX_FIFO_SIZE        (32 * 1024)
>> +#define TX_FIFO_SIZE        (4 * K_BYTE)
>> +#define RX_FIFO_SIZE        (32 * K_BYTE)
>>  
>>  #define NUM_TX_FIFOS        2
>>  #define RX_HDR_SIZE         8
>> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
>> index 16a9417a85..101efe7c83 100644
>> --- a/hw/net/e1000e.c
>> +++ b/hw/net/e1000e.c
>> @@ -34,6 +34,7 @@
>>  */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>  #include "net/net.h"
>>  #include "net/tap.h"
>>  #include "qemu/range.h"
>> @@ -81,10 +82,10 @@ typedef struct E1000EState {
>>  #define E1000E_IO_IDX       2
>>  #define E1000E_MSIX_IDX     3
>>  
>> -#define E1000E_MMIO_SIZE    (128 * 1024)
>> -#define E1000E_FLASH_SIZE   (128 * 1024)
>> +#define E1000E_MMIO_SIZE    (128 * K_BYTE)
>> +#define E1000E_FLASH_SIZE   (128 * K_BYTE)
>>  #define E1000E_IO_SIZE      (32)
>> -#define E1000E_MSIX_SIZE    (16 * 1024)
>> +#define E1000E_MSIX_SIZE    (16 * K_BYTE)
>>  
>>  #define E1000E_MSIX_TABLE   (0x0000)
>>  #define E1000E_MSIX_PBA     (0x2000)
>> diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
>> index eb0e097137..58c8db77e9 100644
>> --- a/hw/net/e1000x_common.c
>> +++ b/hw/net/e1000x_common.c
>> @@ -23,6 +23,7 @@
>>  */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>  #include "hw/hw.h"
>>  #include "hw/pci/pci.h"
>>  #include "net/net.h"
>> @@ -111,7 +112,7 @@ bool e1000x_is_oversized(uint32_t *mac, size_t size)
>>      static const int maximum_ethernet_vlan_size = 1522;
>>      /* this is the size past which hardware will
>>         drop packets when setting LPE=1 */
>> -    static const int maximum_ethernet_lpe_size = 16384;
>> +    static const int maximum_ethernet_lpe_size = 16 * K_BYTE;
>>  
>>      if ((size > maximum_ethernet_lpe_size ||
>>          (size > maximum_ethernet_vlan_size
>> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
>> index a07a63247e..a02e2b55e8 100644
>> --- a/hw/net/eepro100.c
>> +++ b/hw/net/eepro100.c
>> @@ -41,6 +41,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>  #include "hw/hw.h"
>>  #include "hw/pci/pci.h"
>>  #include "net/net.h"
>> @@ -60,8 +61,6 @@
>>   * changed to pad short packets itself. */
>>  #define CONFIG_PAD_RECEIVED_FRAMES
>>  
>> -#define KiB 1024
>> -
>>  /* Debug EEPRO100 card. */
>>  #if 0
>>  # define DEBUG_EEPRO100
>> @@ -104,9 +103,9 @@
>>  /* Use 64 word EEPROM. TODO: could be a runtime option. */
>>  #define EEPROM_SIZE     64
>>  
>> -#define PCI_MEM_SIZE            (4 * KiB)
>> +#define PCI_MEM_SIZE            (4 * K_BYTE)
>>  #define PCI_IO_SIZE             64
>> -#define PCI_FLASH_SIZE          (128 * KiB)
>> +#define PCI_FLASH_SIZE          (128 * K_BYTE)
>>  
>>  #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
> 
> 
> Technically this is fine, therefore
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> Practically I'd prefer replacing all K_BYTE by KiB, because that is the
> standard name with a precise definition:
> https://en.wikipedia.org/wiki/Kibibyte.

"1 kibibyte is 1024 bytes. The unit symbol for the kibibyte is KiB."

I like your suggestion :) Mostly because this shortens the code and
keeps it readable (while respecting the SI).

If the other maintainers agree with this change, I'm OK to do the
cleanup. I couldn't find a rule requiring #defines be all capital letter
in CODING_STYLE, is this acceptable to have a lower case "i"?

Regards,

Phil.

