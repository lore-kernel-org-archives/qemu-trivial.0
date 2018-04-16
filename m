Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7wEF-0006VL-SR
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 00:58:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1f7wEB-0006TK-LQ
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 00:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1f7wEA-0003wJ-Rw
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 00:58:55 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1f7wE6-0003uR-FP; Mon, 16 Apr 2018 00:58:50 -0400
Received: by mail-wr0-f196.google.com with SMTP id s18so22087546wrg.9;
	Sun, 15 Apr 2018 21:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gyeeR5XtLNDWHjJYcnx3UKrDG+x5evyL+MRkVwPMXNI=;
	b=BDF9yqJlqyyZ4Q81IJeMgm95/qQLqxMuJTh/LsC4STaOM8pkZKWpV3icOO3QdD29Jx
	KzR+WKPItyFMGGTHg3o0xRmMgRAgu6L3Fi9sr+08cB0F+HcaM7/lq8usKi7OTukUXAuW
	PtgL+KU+9LB8vAiVoYbfwHLVridgenD1c/Pwv2WkQhLJg4rjDZnlCZV9oWYjbuxVjjMk
	jKQTu92T3wlzsz8iGAooUCFvgIQjomST4BiW1dhcADKc0qLr61X/J0H6CpT8bTXYin1m
	rZd+UVbsK86liHBZOv1YKUlI/K8+v54BhejGO3MYn+cqyzeZXZjvxs9I971YkqLZG1mK
	HGmQ==
X-Gm-Message-State: ALQs6tAyqFLRaDCcArQSvHP60zzCRyKr3p1amB8V5dGzZYE+xCCf4esW
	r6OrKbbfl1aX7tVhiqH4YXE=
X-Google-Smtp-Source: AIpwx4+MFRHt6jNE9QAT3LiL7vKVUybyeaTYstr3hi0hS8y6b5DkZVs8Hb0ai24sDlbv2h4H/jdrmA==
X-Received: by 10.223.166.248 with SMTP id t111mr111461wrc.161.1523854728968; 
	Sun, 15 Apr 2018 21:58:48 -0700 (PDT)
Received: from [192.168.178.23] (pD9575865.dip0.t-ipconnect.de.
	[217.87.88.101]) by smtp.gmail.com with ESMTPSA id
	r8sm11389442wmg.44.2018.04.15.21.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 21:58:47 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <huth@tuxfamily.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-18-f4bug@amsat.org>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <16a3d8ff-2361-27c8-d93a-e210d7080063@tuxfamily.org>
Date: Mon, 16 Apr 2018 06:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180415234307.28132-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.196
Subject: Re: [Qemu-trivial] [PATCH v3 17/41] hw/m68k: Use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 16 Apr 2018 04:58:58 -0000

On 16.04.2018 01:42, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/m68k/mcf5208.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index fac0d09cbc..673d65f8fd 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -6,6 +6,7 @@
>   * This code is licensed under the GPL
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> @@ -241,7 +242,7 @@ static void mcf5208evb_init(MachineState *machine)
>      memory_region_add_subregion(address_space_mem, 0x40000000, ram);
>  
>      /* Internal SRAM.  */
> -    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16384, &error_fatal);
> +    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16 * K_BYTE, &error_fatal);
>      memory_region_add_subregion(address_space_mem, 0x80000000, sram);
>  
>      /* Internal peripherals.  */
> 

Reviewed-by: Thomas Huth <thuth@tuxfamily.org>

