Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QXr0l-000146-Sg
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jun 2011 04:36:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QXr0i-00013U-PM
	for qemu-trivial@nongnu.org; Sat, 18 Jun 2011 04:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QXr0h-0005g2-GY
	for qemu-trivial@nongnu.org; Sat, 18 Jun 2011 04:36:08 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QXr0e-0005fj-WF; Sat, 18 Jun 2011 04:36:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6318572818A5; Sat, 18 Jun 2011 10:36:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id IEEhNAdxV1DE; Sat, 18 Jun 2011 10:35:58 +0200 (CEST)
Received: from [192.168.178.20] (p54ADAAC2.dip.t-dialin.net [84.173.170.194])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	50E1772818A4; Sat, 18 Jun 2011 10:35:58 +0200 (CEST)
Message-ID: <4DFC636D.9090800@mail.berlios.de>
Date: Sat, 18 Jun 2011 10:35:57 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Roy Tam <roytam@gmail.com>
References: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
In-Reply-To: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix MinGW compilation when
 --enable-vnc-jpeg is specified
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
X-List-Received-Date: Sat, 18 Jun 2011 08:36:10 -0000

Am 18.06.2011 07:13, schrieb Roy Tam:
> This patch fix conflicting types for 'INT32' in basetsd.h in including
> qemu-common.h first.
>
>
> Sign-off-by: Roy Tam<roytam@gmail.com>
> --
> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
> index 87fdf35..1591df0 100644
> --- a/ui/vnc-enc-tight.c
> +++ b/ui/vnc-enc-tight.c
> @@ -28,6 +28,8 @@
>
>   #include "config-host.h"
>
> +#include "qemu-common.h"
> +
>   #ifdef CONFIG_VNC_PNG
>   #include<png.h>
>   #endif
> @@ -36,8 +38,6 @@
>   #include<jpeglib.h>
>   #endif
>
> -#include "qemu-common.h"
> -
>   #include "bswap.h"
>   #include "qint.h"
>   #include "vnc.h"

Acked-by: Stefan Weil <weil@mail.berlios.de>

The conflicting declaration is in jmorecfg.h which is included from 
jpeglib.h.



