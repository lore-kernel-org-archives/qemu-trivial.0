Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcDRR-0001C5-RE
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 07:30:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcDRJ-00019d-VE
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 07:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcDRI-0003yX-Nf
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 07:30:41 -0400
Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d]:64922)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcDRI-0003yJ-Hc
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 07:30:40 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc8so345235pbc.32
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2013 04:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=thyLcooZmC9mYXBzLFD/vd2DeDHCDB/JPHDMVmq5/Ns=;
	b=AwpVHosEYGJu2vOkULSKJY3zmiGiwis56j+dM6W9cjyPsLnLVtKOfTLOGFAN07o14y
	HERaiwoqX+xSJe1r2+0G0OMxZkL9JIvViX0JAEuhcr7dVhyXkFkzCEXJ9U+wQpqKyXco
	qglaJHBER62XgzW76GG+cu90knrAeonvzYbBh4SwZwgqcqoGUjCkIL+TisMRYFg3RW+o
	sP3cgJJ1Tmo46+WBKqpBWuU0oVuq86sEUiMFQu/5crvAzjwl7nxUYicyKQvqCr6WWsXY
	AKfx05rLkncNLoSHzDjV2KKXsI1zIE7QZYuPRO4MDwDNLTBWr3KmKJ3ArAfPSXFz1xLk
	rmzw==
X-Received: by 10.68.112.1 with SMTP id im1mr33661214pbb.116.1368531039548;
	Tue, 14 May 2013 04:30:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.70.46.66 with HTTP; Tue, 14 May 2013 04:30:19 -0700 (PDT)
In-Reply-To: <1368530312-16080-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1368530312-16080-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2013 12:30:19 +0100
Message-ID: <CAFEAcA_P78TYqZGr0reev4Oa=4j1qoKaGbC6rEnBDeMtUo-TTg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmBaiecA+vkf1LSFpeGO9V388Xve72Pb5tmWhc1fqbDaxaPydoITf6biGocuHkL2ESCFxUU
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (trivial)] remove some
	double-includes
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
X-List-Received-Date: Tue, 14 May 2013 11:30:48 -0000

On 14 May 2013 12:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Some source files #include the same header more than
> once for no good reason.  Remove second #includes in
> such cases.
>
> diff --git a/translate-all.c b/translate-all.c
> index da93608..a18bf55 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -52,21 +52,20 @@
>  #include <libutil.h>
>  #endif
>  #endif
>  #else
>  #include "exec/address-spaces.h"
>  #endif
>  #include "qemu/timer.h"
>
>  #include "exec/cputlb.h"
>  #include "translate-all.h"
> -#include "qemu/timer.h"

There's already been a patch on the list for this one:
http://patchwork.ozlabs.org/patch/240540/

thanks
-- PMM

