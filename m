Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UbSaz-0002ua-Vo
	for mharc-qemu-trivial@gnu.org; Sun, 12 May 2013 05:29:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UbSax-0002rd-Gx
	for qemu-trivial@nongnu.org; Sun, 12 May 2013 05:29:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UbSaw-0003t5-Dn
	for qemu-trivial@nongnu.org; Sun, 12 May 2013 05:29:31 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UbSau-0003sn-7t; Sun, 12 May 2013 05:29:28 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BE9947280034; Sun, 12 May 2013 11:29:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id EDx94t1eci3v; Sun, 12 May 2013 11:29:23 +0200 (CEST)
Received: from [192.168.178.57] (188-192-111-190-dynip.superkabel.de
	[188.192.111.190])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	50E2E7280031; Sun, 12 May 2013 11:29:23 +0200 (CEST)
Message-ID: <518F60F2.8030909@weilnetz.de>
Date: Sun, 12 May 2013 11:29:22 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: aliguori@us.ibm.com
References: <1368215901-55444-1-git-send-email-i.mitsyanko@gmail.com>
In-Reply-To: <1368215901-55444-1-git-send-email-i.mitsyanko@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.5 V2] osdep.h: include
 sys/types.h for ssize_t definition
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
X-List-Received-Date: Sun, 12 May 2013 09:29:32 -0000

Am 10.05.2013 21:58, schrieb Igor Mitsyanko:
> sys/types.h is taken out from "ifdef __OpenBSD__" guard. It should be
> safe for other systems, according to following survey:
> http://hacks.owlfolio.org/header-survey/
>
> This fixes build for CONFIG_IOVEC-less systems (mingw).
>
> Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
> ---
>  include/qemu/osdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 42545bc..3bcd4ab 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -5,8 +5,8 @@
>  #include <stdarg.h>
>  #include <stddef.h>
>  #include <stdbool.h>
> -#ifdef __OpenBSD__
>  #include <sys/types.h>
> +#ifdef __OpenBSD__
>  #include <sys/signal.h>
>  #endif

Either this patch or http://patchwork.ozlabs.org/patch/243151/
is needed for QEMU 1.5 to fix compilation with MinGW.

Regards,
Stefan Weil


