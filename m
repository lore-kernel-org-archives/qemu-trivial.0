Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSOzV-00048i-0x
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 11:44:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOzQ-000467-C9
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 11:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOzP-0004FH-5F
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 11:44:16 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOzH-0004AW-Gt; Mon, 11 Jun 2018 11:44:07 -0400
Received: by mail-qt0-x243.google.com with SMTP id s9-v6so20681863qtg.2;
	Mon, 11 Jun 2018 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WyPpFahjaE+suUlA3LZRLKQpT/zfPpH+X6zGFIvWfQo=;
	b=N/uG1yDalfGL2TpkRkXmv0PVJfe+/u8Ht2GHymduKHcHoVYlFjde5ZWi3BQAepZT+k
	T675evPKNOcayScNXAqIES5PkOs6gfpX9gLl06T/e0Li2cs/jJpSfEuWTGyym+tUd2ko
	UGSJUWFwF2y/JixZMtstS5C3plUMpQCQFIMKnYyoADZFBkt2a41vfcUuegw1JxhzMSGt
	M9LC4R9OhpDBrsvolRyZcsj5uEalLbxJ6Gbx2EqFKE16ui5Go38AK008n1cX3UGjqkg4
	8Af8kkph3N43I5msaNT4Q4Ng38tC0QnSSW9tn1g7dXBagIr2qAJ6eAwrUT18NIONcVbF
	2/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WyPpFahjaE+suUlA3LZRLKQpT/zfPpH+X6zGFIvWfQo=;
	b=mR+ONijyEokeLQMYedKUgoSKtzXpXxMjJCAwPrK4D+2k9lTRlQoqkSZ1uuz5V6ZosN
	EcQg/DOt+qV1jLvSUf/3BcskRVrH2UTd5w0MAdzmMH1A0ItwUGvSBzCf5a41hwV4NFve
	sgbc19UFmd01eyN1ZuXPopmQRSL/9N7sAl7c5BTrqsa6FBEbfsaY3DWpZtaeCVNYRHg7
	VtKKXMWgoAyCZQYk0n/bpMCSHPNOWMqwWIVUEBu2aDiy7NZVTkZ5gcp9t6GJR5nBhJ/z
	B8QCm2gpebd6CJLu/gBj9RixTaW9nUwKEzpitEUbdUu6RJ5778QlzTH+CIyOVPCxB741
	zcPQ==
X-Gm-Message-State: APt69E2czzsA4B1iyudBzfjZ4kh/JpNEFif3LsIUjUWwYIPxUpmHzKZP
	BrWlLyxhQ6fV4Yb3RQr4cAk=
X-Google-Smtp-Source: ADUXVKKNnQI1d5DhHoi32gH4uoZhEQbqV+5Uqt4PyJ3K4NTzSNwSqX5lQJ16VkDob0ghQ7SB1cD7hA==
X-Received: by 2002:ac8:43ce:: with SMTP id
	w14-v6mr16661386qtn.137.1528731846844; 
	Mon, 11 Jun 2018 08:44:06 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k6-v6sm16906679qth.24.2018.06.11.08.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 08:44:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	"open list:sPAPR" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-33-f4bug@amsat.org>
	<alpine.BSF.2.21.1806110959440.5957@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d04f4485-3b07-3b19-458d-0372ee131fca@amsat.org>
Date: Mon, 11 Jun 2018 12:44:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.21.1806110959440.5957@zero.eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-ppc] [PATCH v4 32/40] hw/ppc:
 Use the IEC binary prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 15:44:19 -0000

Hi Zoltan,

On 06/11/2018 05:09 AM, BALATON Zoltan wrote:
> On Sun, 10 Jun 2018, Philippe Mathieu-Daudé wrote:
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 2a98c10664..b35e3fff1c 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -12,8 +12,9 @@
>>  */
>>
>> #include "qemu/osdep.h"
>> +#include "qemu/units.h"
>> #include "qemu-common.h"
>> -#include "qemu/cutils.h"
>> +#include "qemu/units.h"
> 
> I think one of these includes of qemu/units.h is enough.

Oops :) Rebase mistake.

> 
>> #include "qemu/error-report.h"
>> #include "qapi/error.h"
>> #include "hw/hw.h"
>> @@ -46,7 +47,7 @@
>> /* from Sam460 U-Boot include/configs/Sam460ex.h */
>> #define FLASH_BASE             0xfff00000
>> #define FLASH_BASE_H           0x4
>> -#define FLASH_SIZE             (1 << 20)
>> +#define FLASH_SIZE             (1 * MiB)
>> #define UBOOT_LOAD_BASE        0xfff80000
>> #define UBOOT_SIZE             0x00080000
>> #define UBOOT_ENTRY            0xfffffffc
>> @@ -71,7 +72,8 @@
>>
>> /* FIXME: See u-boot.git 8ac41e, also fix in ppc440_uc.c */
>> static const unsigned int ppc460ex_sdram_bank_sizes[] = {
>> -    1024 << 20, 512 << 20, 256 << 20, 128 << 20, 64 << 20, 32 << 20, 0
>> +    1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
>> +    64 * MiB, 32 * MiB, 0
>> };
> 
> You said elsewhere:
> 
> On Sun, 10 Jun 2018, Philippe Mathieu-Daudé wrote:
>> Each use this saves 3 char of the 80 columns limit!

This was versus the M_BYTE/G_BYTE definitions, now I noticed the ML ate
this patch...
(it supposed to be 31/41 here)
http://patchew.org/QEMU/20180415234307.28132-1-f4bug@amsat.org/

Where the diff was:

 static const unsigned int ppc460ex_sdram_bank_sizes[] = {
-    1024 << 20, 512 << 20, 256 << 20, 128 << 20, 64 << 20, 32 << 20, 0
+    1 * G_BYTE, 512 * M_BYTE, 256 * M_BYTE, 128 * M_BYTE,
+    64 * M_BYTE, 32 * M_BYTE, 0
 };

> Except when not but at least should not be longer than before and maybe
> more readable. But why are you splitting this line into two? I prefer
> one line for readability if it's not over the line limit.

Sure, as it fits.

> 
>> struct boot_info {
>> @@ -225,7 +227,7 @@ static int sam460ex_load_uboot(void)
>>     fl_sectors = (bios_size + 65535) >> 16;
>>
>>     if (!pflash_cfi01_register(base, NULL, "sam460ex.flash", bios_size,
>> -                               blk, (64 * 1024), fl_sectors,
>> +                               blk, 64 * KiB, fl_sectors,
>>                                1, 0x89, 0x18, 0x0000, 0x0, 1)) {
>>         error_report("qemu: Error registering flash memory.");
>>         /* XXX: return an error instead? */
>> @@ -359,14 +361,14 @@ static void main_cpu_reset(void *opaque)
>>
>>     /* either we have a kernel to boot or we jump to U-Boot */
>>     if (bi->entry != UBOOT_ENTRY) {
>> -        env->gpr[1] = (16 << 20) - 8;
>> +        env->gpr[1] = (16 * MiB) - 8;
>>         env->gpr[3] = FDT_ADDR;
>>         env->nip = bi->entry;
>>
>>         /* Create a mapping for the kernel.  */
>>         mmubooke_create_initial_mapping(env, 0, 0);
>>         env->gpr[6] = tswap32(EPAPR_MAGIC);
>> -        env->gpr[7] = (16 << 20) - 8; /*bi->ima_size;*/
>> +        env->gpr[7] = (16 * MiB) - 8; /* bi->ima_size; */
>>
>>     } else {
>>         env->nip = UBOOT_ENTRY;
>> @@ -479,8 +481,8 @@ static void sam460ex_init(MachineState *machine)
>>     /* 256K of L2 cache as memory */
>>     ppc4xx_l2sram_init(env);
>>     /* FIXME: remove this after fixing l2sram mapping in ppc440_uc.c? */
>> -    memory_region_init_ram(l2cache_ram, NULL, "ppc440.l2cache_ram",
>> 256 << 10,
>> -                           &error_abort);
>> +    memory_region_init_ram(l2cache_ram, NULL, "ppc440.l2cache_ram",
>> +                           256 * KiB, &error_abort);
> 
> Line is split differently here too for no apparent reason.

Same explanation:

+    memory_region_init_ram(l2cache_ram, NULL, "ppc440.l2cache_ram",
+                           256 * K_BYTE, &error_abort);

I'll update.

> 
> Regards,
> BALATON Zoltan

