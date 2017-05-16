Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAV1I-00077W-8g
	for mharc-qemu-trivial@gnu.org; Tue, 16 May 2017 01:27:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dAV1G-00076W-5v
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 01:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dAV1F-00010X-DP
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 01:27:38 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:33778
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1dAV1A-0000uh-7F; Tue, 16 May 2017 01:27:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 54255DA39CF;
	Tue, 16 May 2017 07:27:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fgDKFrCWDG9f; Tue, 16 May 2017 07:27:28 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC8A36.dip0.t-ipconnect.de
	[84.172.138.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6260FDA05AB; 
	Tue, 16 May 2017 07:27:28 +0200 (CEST)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170516052439.16214-1-kraxel@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <ed22959a-4ca8-0556-6ea7-f7866a20fe7d@weilnetz.de>
Date: Tue, 16 May 2017 07:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170516052439.16214-1-kraxel@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix mingw build failure
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
X-List-Received-Date: Tue, 16 May 2017 05:27:39 -0000

Am 16.05.2017 um 07:24 schrieb Gerd Hoffmann:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  crypto/random-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/crypto/random-platform.c b/crypto/random-platform.c
> index 0eddb915b7..92eed0ee78 100644
> --- a/crypto/random-platform.c
> +++ b/crypto/random-platform.c
> @@ -23,7 +23,7 @@
>  #include "crypto/random.h"
>
>  #ifdef _WIN32
> -#include <Wincrypt.h>
> +#include <wincrypt.h>
>  static HCRYPTPROV hCryptProv;
>  #else
>  static int fd; /* a file handle to either /dev/urandom or /dev/random */
>

Thank you.

Reviewed-by: Stefan Weil <sw@weilnetz.de>

cc`ing qemu-trivial.

