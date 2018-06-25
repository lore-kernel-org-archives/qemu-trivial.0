Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXRPX-0005q7-9a
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 09:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXRPU-0005nW-Nh
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 09:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXRPT-0005kQ-GF
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 09:20:00 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:39743)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXRPN-0005gq-3Y; Mon, 25 Jun 2018 09:19:53 -0400
Received: by mail-qk0-x243.google.com with SMTP id g14-v6so7433379qkm.6;
	Mon, 25 Jun 2018 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kGJmEjy4i1UEc0P6myZsqUNvRzLvzzSJP6wHqaz6A5M=;
	b=B/oDKnebUSnGo96chLyItmpnBD4TjG1zPHS27HkI6E0yFgWLN75o3NJ05woFB2bC/D
	wrprV/XipxPfDnm+n4rMPBXMemaXCQUjGNWpL93pHp6IuLc/eBFYpG7Pn6B9GyeyHXA9
	B+pQxD9aq5xmI8bTv2aRjvd4kUWvMx+QvUyvCXJto+sTR/JduzaNxrnzrvi7Spmpup36
	ZHov6naAueQzrX8KXiP13n/OJ9+v40kvQyhYt7nxBVARiJRM0/0sERPo/RcusLRSHvnk
	Vr+M3tF3Jk43QAN5qMhPKT9j6UDBt3Ji8/nhUMk/ZRoODme9DE1J+7HqpDntniRN+7sb
	dBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=kGJmEjy4i1UEc0P6myZsqUNvRzLvzzSJP6wHqaz6A5M=;
	b=odKjUxQYVFjLVeKMegW3v4sYmVS4f5GEnfztApl4GAsexGZF2qdnx/TbcaVRqWTWP3
	GHOveMyZ8emWgdVXcNH6+0B9FunidBB4IiOeymn6Q6C2I4Oqv75P4qjvX49yOtJLnb7d
	fW1gw8gu3N0CZjAH/WiJH9rX15oZfEs9fZf3edPZ4wpm+KdqBIRmH0piIbZYl7/WWoTX
	ntAykOBDYUx9o13EfMpwOqVWt/UB5smRT7C2SQrD3wVDI4k6XIsJeMW2Nm5HIXspUiYo
	1SsZQmPrM5+IrfJcx1GyYhbOAKmg2Enkkwvk/TBMYutAIElrnXVw1rh0uoz3p28//52N
	+ggA==
X-Gm-Message-State: APt69E3hz4DY/o0On8tj/u/AOwTlQhTbzXDDLX/F+ydFQfUPu1vWRO5m
	jEd5aG7dOqahRU5jwTwNu1rLeuwOitQ=
X-Google-Smtp-Source: ADUXVKKNiWI+7toviCvUpzHEu3QJRgvOykg+CoNZPLGNQ2B8+byKsZH9aSG9O+C0z0ZaUH/I0M3wCg==
X-Received: by 2002:a37:7285:: with SMTP id
	n127-v6mr10353773qkc.115.1529932792235; 
	Mon, 25 Jun 2018 06:19:52 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm8727137qti.7.2018.06.25.06.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 06:19:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-20-f4bug@amsat.org>
	<20180625150719.0392da6c.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9854192e-810e-f872-2c92-70cb5a53f744@amsat.org>
Date: Mon, 25 Jun 2018 10:19:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625150719.0392da6c.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [PATCH v5 19/46] hw/s390x: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 13:20:02 -0000

Hi Cornelia,

On 06/25/2018 10:07 AM, Cornelia Huck wrote:
> On Mon, 25 Jun 2018 09:42:11 -0300
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> It eases code review, unit is explicit.
>>
>> Patch generated using:
>>
>>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
>>
>> and modified manually.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Acked-by: Cornelia Huck <cohuck@redhat.com>
> 
> Hm, I had not looked at the v2+ patches, as this already carried my
> ack...

Oops...

>> ---
>>  hw/s390x/s390-skeys.c    | 3 ++-
>>  hw/s390x/s390-stattrib.c | 3 ++-
> 
> ...but these two were added later on.
> 
>>  hw/s390x/sclp.c          | 3 ++-
>>  3 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
>> index 76241c240e..15f7ab0e53 100644
>> --- a/hw/s390x/s390-skeys.c
>> +++ b/hw/s390x/s390-skeys.c
>> @@ -10,6 +10,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>  #include "hw/boards.h"
>>  #include "hw/s390x/storage-keys.h"
>>  #include "qapi/error.h"
>> @@ -19,7 +20,7 @@
>>  #include "sysemu/kvm.h"
>>  #include "migration/register.h"
>>  
>> -#define S390_SKEYS_BUFFER_SIZE 131072  /* Room for 128k storage keys */
>> +#define S390_SKEYS_BUFFER_SIZE (128 * KiB)  /* Room for 128k storage keys */
> 
> This one looks confusing to me. We're not allocating 128 chunks of 1
> KiB size, but space enough for 128k byte values. What do others think?

The idea is use the byte IEC binary prefix to make it more obvious.

If the unit is not 'byte', then this is not a correct use (confusing, as
you said).

> 
>>  #define S390_SKEYS_SAVE_FLAG_EOS 0x01
>>  #define S390_SKEYS_SAVE_FLAG_SKEYS 0x02
>>  #define S390_SKEYS_SAVE_FLAG_ERROR 0x04
>> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
>> index 70b95550a8..5161a1659b 100644
>> --- a/hw/s390x/s390-stattrib.c
>> +++ b/hw/s390x/s390-stattrib.c
>> @@ -10,6 +10,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>  #include "hw/boards.h"
>>  #include "cpu.h"
>>  #include "migration/qemu-file.h"
>> @@ -20,7 +21,7 @@
>>  #include "qapi/error.h"
>>  #include "qapi/qmp/qdict.h"
>>  
>> -#define CMMA_BLOCK_SIZE  (1 << 10)
>> +#define CMMA_BLOCK_SIZE  (1 * KiB)
> 
> This one looks fine.
> 
>>  
>>  #define STATTR_FLAG_EOS     0x01ULL
>>  #define STATTR_FLAG_MORE    0x02ULL
>> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
>> index 047d577313..bd2a024efd 100644
>> --- a/hw/s390x/sclp.c
>> +++ b/hw/s390x/sclp.c
>> @@ -13,6 +13,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>>  #include "qapi/error.h"
>>  #include "cpu.h"
>>  #include "sysemu/sysemu.h"
>> @@ -289,7 +290,7 @@ static void sclp_realize(DeviceState *dev, Error **errp)
>>      ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
>>      if (ret == -E2BIG) {
>>          error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
>> -                   hw_limit >> 30);
>> +                   hw_limit / GiB);
>>      } else if (ret) {
>>          error_setg(&err, "setting the guest size failed");
>>      }
> 

