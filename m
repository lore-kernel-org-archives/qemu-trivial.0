Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvR6p-0000Pt-C0
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvR6n-0000O4-MA
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvR6m-0001Uz-QH
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:47:21 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:50229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvR6m-0001Ti-KG
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:47:20 -0400
Received: by mail-wm0-x22e.google.com with SMTP id b195so5539992wmb.5
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gTVRAt4NQqktfkEpilx9AdgyzLHgGVP1+yY01swwoeA=;
	b=ChJ0ReQnJm0E1cPK9MPz31Eed54VYsawIGt9Tg9v70j3dUmtCLvcazRxHak9ruz2dP
	8tuckDY8yoaZErelhzH+pIGshfJnI87j0NMNYHAguNCsX6VQjCh9UOoPTL8wU2JDxkny
	rN8y10WrFeHmqo6ScQrgi0m7ufANaoGVoZsLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gTVRAt4NQqktfkEpilx9AdgyzLHgGVP1+yY01swwoeA=;
	b=JO/rvbIk51q5ENvwWOBx5a/vr5vMAqn3oKxFKiIh67yE13Q2lzXpfgTDTJFlFivxRs
	kMjWB5rN5NgF4toIu0wS6CsaYeWCPn6UB+psWyAiV3i7rqEN3Az6qq/Z9lmCJuxij4rd
	l938kGyYasrM1cIEwnlzJX3nnbZvTxiTxiMST4ntOmvUIZJAh8e1C82GfSM+0/HqkxDN
	8ws8gq5ILNDPKiqKdOyI9g7MX/m0K1H04gHRZuL53myev/G5qhreTT4rnnvIZSPYWgi1
	GeeGJXfEmqBkyYtLKSoUiqkJsZXML1OD41okGlpjPALP+c4n7T5bfBaUBdRrC00z1d9F
	IIwA==
X-Gm-Message-State: AHPjjUh3pxRqswvHBlIlazJ6jcgBrDmfDs90UQumJywJFvDZndwP3N56
	AroRPZVbNDCVS3OP7DB93RzvcDEwAkhGMU/dEFDIJQ==
X-Google-Smtp-Source: AOwi7QBgcoa7yxpGM4sXneG3AvpJJeupeMMBDIsatB5RS9sx2YzBtyUYjBS8AZgfZLDGAlZIT7bJvoP+eQIQv0r5PCc=
X-Received: by 10.28.166.135 with SMTP id p129mr4656776wme.147.1506098839617; 
	Fri, 22 Sep 2017 09:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:46:59 -0700 (PDT)
In-Reply-To: <20170922154014.29350-10-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-10-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:46:59 +0100
Message-ID: <CAFEAcA8gFCnFKeMcRx42Nj_W1hryYpB8Gd+YXXHhv_OJjxzOzw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [PATCH 09/34] misc: avoid "include/" in include
 path
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
X-List-Received-Date: Fri, 22 Sep 2017 16:47:22 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> while here, remove unused #include from aspeed_smc.h
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/input/adb.c      | 2 +-
>  hw/ssi/aspeed_smc.c | 3 +--
>  numa.c              | 1 -
>  3 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/adb.c b/hw/input/adb.c
> index fcca3a8eb9..924a3f9fd5 100644
> --- a/hw/input/adb.c
> +++ b/hw/input/adb.c
> @@ -24,8 +24,8 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/input/adb.h"
> +#include "hw/input/adb-keys.h"
>  #include "ui/console.h"
> -#include "include/hw/input/adb-keys.h"
>  #include "ui/input.h"
>  #include "sysemu/sysemu.h"
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index cb515730c5..5059396bc6 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -26,8 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/log.h"
> -#include "include/qemu/error-report.h"
> -#include "exec/address-spaces.h"
> +#include "qemu/error-report.h"
>
>  #include "hw/ssi/aspeed_smc.h"
>
> diff --git a/numa.c b/numa.c
> index 100a67febf..ebc553b5d9 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -29,7 +29,6 @@
>  #include "qemu/bitmap.h"
>  #include "qom/cpu.h"
>  #include "qemu/error-report.h"
> -#include "include/exec/cpu-common.h" /* for RAM_ADDR_FMT */
>  #include "qapi-visit.h"
>  #include "qapi/opts-visitor.h"
>  #include "hw/boards.h"
> --
> 2.14.1

"while here" usually indicates a patch should be split.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

