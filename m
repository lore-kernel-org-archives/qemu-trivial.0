Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNZWJ-0002qw-IY
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 03:58:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1fNZWH-0002qM-F3
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 03:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1fNZWE-0008D8-En
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 03:58:13 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
	id 1fNZWE-0008C2-8R; Tue, 29 May 2018 03:58:10 -0400
Received: by mail-wm0-x244.google.com with SMTP id l1-v6so37935902wmb.2;
	Tue, 29 May 2018 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=CiIcdf0l6518BSzSaLlcAn0rgx6nzqK6xUFWWGaLNas=;
	b=SkLsXggOiBDPdj0waUOwRzOhLaTJkD5Q7jtw+34k2EtJbxDA8ylJdHbwLUi9d1o0XQ
	RdYn+oWxx2k8KPHIsNKaRRayrWnHYoiVgc/liUylWtWShgRazyyWUQCvaHvprE23JdV4
	Mu9fZ4Zz0Kx8UryEt5bmoCNvdz6YxIzwcn+kytXwQJLo17XqnMxvyElsXbTBBG0UohWO
	HMTftRpesOLoVOqZ+1j1gAYmY30ZCUTIRTQ3BJiHxQOw/a0sbBLxmmniCPN/y9SKUAwk
	PcKAYAfY5ha50vYzpzzkAI3YRFhPiuTdRcQikV1B0gUUVt5JxxmqdDab1ZCeDZQSIrH0
	REcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=CiIcdf0l6518BSzSaLlcAn0rgx6nzqK6xUFWWGaLNas=;
	b=PDw4C1wbWl2FA80SsGdT25FdN1IU4NC0cpbWjG/R9vSEXu0NWL9VTHXwxppNZeZSCv
	Leppi5/jbaBJJFAAReGxjZuCYKTUjicWeN9ZWDnYiW0Zi2hJse3/i+J8f38M2w92+vLT
	YdNIQHApH8LrNUsjVeYWYDexMBq1bwhbnTV71UOBHig3ht6rhvBD5MZdx7LdhA1o1Rf9
	rZHxxU1TRy1prkAezeJ1X7svhq8bK7aEQuF8VzvcxhPz6Mp5RML8QSxi+4pFquLXMToO
	KVtgTnR+mYTcSupT4IC1WVZjmMTZMb1+v8hmtNyr78Dhc1O8bK0RjfQsDkqLAa9cnZCE
	QadQ==
X-Gm-Message-State: ALKqPwen99m1jQOnXvgsOcloXNA4IQeDrJSBGKsHgCKuVfH1ZO2TEjjA
	7whOsAn20ofYAhM8UO/1BBA=
X-Google-Smtp-Source: ADUXVKIsB2N6CHUmAGKpR5gQE4j+xGg2CLIvjxJ69tEz7X37j6dmMbPFRbwngH2GeA2HLbrjgPh3aQ==
X-Received: by 2002:a1c:2cc2:: with SMTP id
	s185-v6mr9608036wms.62.1527580688767; 
	Tue, 29 May 2018 00:58:08 -0700 (PDT)
Received: from localhost.localdomain ([141.226.29.227])
	by smtp.gmail.com with ESMTPSA id
	5-v6sm22116972wre.41.2018.05.29.00.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 00:58:07 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-18-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <145a7511-f2f9-6535-9711-8614a2ec16f1@gmail.com>
Date: Tue, 29 May 2018 10:58:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180528232719.4721-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [PATCH v4 17/21] hw/misc/sga: Use the correct
 ISA include
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
X-List-Received-Date: Tue, 29 May 2018 07:58:14 -0000



On 05/29/2018 02:27 AM, Philippe Mathieu-Daudé wrote:
> The SGA BIOS loader is an ISA device, it does not require the PCI header.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/misc/sga.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/sga.c b/hw/misc/sga.c
> index 97fd63f176..4a22a52a60 100644
> --- a/hw/misc/sga.c
> +++ b/hw/misc/sga.c
> @@ -25,7 +25,7 @@
>    *
>    */
>   #include "qemu/osdep.h"
> -#include "hw/pci/pci.h"
> +#include "hw/isa/isa.h"
>   #include "hw/loader.h"
>   #include "sysemu/sysemu.h"
>   

Reviewed-by: Marcel Apfelbaum<marcel.apfelbaum@gmail.com>

Thanks,
Marcel


