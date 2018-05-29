Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNZXe-0003ex-Fl
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 03:59:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1fNZXc-0003dY-DE
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 03:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1fNZXZ-0000Vi-Bt
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 03:59:36 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:34455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
	id 1fNZXZ-0000VM-5I; Tue, 29 May 2018 03:59:33 -0400
Received: by mail-wr0-x243.google.com with SMTP id j1-v6so23820799wrm.1;
	Tue, 29 May 2018 00:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Yilq8Ujai4pBhA6BjEPsxVhEwQImE4I3vLYESYo7z7U=;
	b=AugnHLkqPzJ/4eHrWgi0N725q5Dc5Kq/xBh/zgItkRWOGfkhFQ8VWTiuuXDp00186l
	aLneeh134f+aJbD2kwN9pbIg57/8AkEx0AQ3AtKCgMGk5xQaVudRLvMw51MGtX1XAp6T
	Ub1ivWDOvxAPSpma78p8Tb7/xm/OxI9QEM1zuEPDiQLm0HM+RgXnU7drjIC525f0IRd6
	gSfwlel05MsT7wYflgk44TNMvBeRNKuedmrKp+jpwAQ0JX/Fa7IEpAuDZJTuPBtk2xXo
	hXwDZ6rQdnrbZu4II6GgpwzCIKNXER/lmQQ7fPCnMdDP6gBixX6/7dKmLTjxe5WOvvL4
	ZhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Yilq8Ujai4pBhA6BjEPsxVhEwQImE4I3vLYESYo7z7U=;
	b=HYZAkOL3ZliiM+rUfTlH3pVrtytJQv3lckWFQBHcc6ky+71olLUSfQxI4YAkCPB4Ad
	g3dGoVj4b5O/0vPc8HNC5x8EpsL9nEe9HsrOn3oKUMIfyTo5HowNdikHndUGlgBu1hs9
	5NJqRAjx+bMwCQhFh148gVNlPscYtITQmRreUmeuJjWmdg/p+etcRr0w9tpB5UgOywt8
	avyAIe2IPA7HpcZeRf4OVK/5vqmtuvh3JJ5WCvnC8BPLHIMfrOjA4s8qM4TxurqXqdWx
	cxr97oxzMKE3T8FUcIMiaAKFeuZO492KdvRTVVigzvO31HYMu8QaxcTU8IGa5CgMjgUV
	sIpg==
X-Gm-Message-State: ALKqPwcYrOpKNr9XOKOv12j1JXDzvFuXcr4wpjG35lj8pZR9gAamkNjj
	9+IkRiUBNV6G/8dozuzcd3I=
X-Google-Smtp-Source: AB8JxZrba61IDiYgHxbfSgN7Hi0gwRSKSuHmWpELR0MQuKO5vBttA4X6AvIvGTAm43OiNO6QgdfaUw==
X-Received: by 2002:adf:9c01:: with SMTP id
	f1-v6mr12032646wrc.171.1527580771933; 
	Tue, 29 May 2018 00:59:31 -0700 (PDT)
Received: from localhost.localdomain ([141.226.29.227])
	by smtp.gmail.com with ESMTPSA id
	u8-v6sm12283100wmc.40.2018.05.29.00.59.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 00:59:31 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-11-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <b3a40260-924b-405b-80fc-521e74498c31@gmail.com>
Date: Tue, 29 May 2018 10:59:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180528232719.4721-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [PATCH v4 10/21] hw: Do not include
 "exec/ioport.h" if it is not necessary
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
X-List-Received-Date: Tue, 29 May 2018 07:59:37 -0000



On 05/29/2018 02:27 AM, Philippe Mathieu-Daudé wrote:
> Code change produced with:
>      $ git grep '#include "exec/ioport.h"' hw | \
>        cut -d: -f-1 | \
>        xargs egrep -Li "(portio|cpu_(in|out).\()" | \
>        xargs sed -i.bak '/#include "exec\/ioport.h"/d'
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/acpi/pcihp.c | 1 -
>   hw/acpi/piix4.c | 1 -
>   2 files changed, 2 deletions(-)
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 91c82fdc7a..80d42e12ff 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -32,7 +32,6 @@
>   #include "hw/pci/pci.h"
>   #include "hw/acpi/acpi.h"
>   #include "sysemu/sysemu.h"
> -#include "exec/ioport.h"
>   #include "exec/address-spaces.h"
>   #include "hw/pci/pci_bus.h"
>   #include "qapi/error.h"
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 8b703455b7..6404af5f33 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -28,7 +28,6 @@
>   #include "sysemu/sysemu.h"
>   #include "qapi/error.h"
>   #include "qemu/range.h"
> -#include "exec/ioport.h"
>   #include "hw/nvram/fw_cfg.h"
>   #include "exec/address-spaces.h"
>   #include "hw/acpi/piix4.h"

Reviewed-by: Marcel Apfelbaum<marcel.apfelbaum@gmail.com>

Thanks,
Marcel


