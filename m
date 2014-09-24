Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWhYn-0007aF-59
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 04:04:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XWhYg-0007O8-KK
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 04:04:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XWhYb-000761-Hd
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 04:04:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50720)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XWhYP-00073a-88; Wed, 24 Sep 2014 04:04:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6B5AD46497;
	Wed, 24 Sep 2014 11:58:45 +0400 (MSK)
Message-ID: <542279B5.7070502@msgid.tls.msk.ru>
Date: Wed, 24 Sep 2014 11:58:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Tobias Klauser <tklauser@distanz.ch>, qemu-devel@nongnu.org
References: <1411061124-21108-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1411061124-21108-1-git-send-email-tklauser@distanz.ch>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] disas/arm: Remove redefinition of
	ATTRIBUTE_UNUSED
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
X-List-Received-Date: Wed, 24 Sep 2014 08:04:23 -0000

18.09.2014 21:25, Tobias Klauser wrote:
> ATTRIBUTE_UNUSED is already defined in disas/bfd.h, which is included.
> Thus, there is no need to redefine it.

Is there any harm in keeping it here?

While it really is a redifinition, I'm not sure what's the right thing
here.  This whole code is not from qemu, it is an external source imported,
and that source is being maintained (but under different license as has
already been discussed, so keeping changes at minimum might not be that
good idea anymore).  On the other hand this symbol is so common it should
be defined in a common header.  Yet on another hand, for these external
sources wich has public API, it might not be a good idea to define it in
a header to start with, because it might clash with project-local define,
so it might be better to define it in either private header or in individual
source.

Oh well, so much for so trivial thing... ;)

/mjt

> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  disas/arm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/disas/arm.c b/disas/arm.c
> index 76e97a8..6f63406 100644
> --- a/disas/arm.c
> +++ b/disas/arm.c
> @@ -23,7 +23,6 @@
>     for things we don't care about.  */
>  
>  #include "disas/bfd.h"
> -#define ATTRIBUTE_UNUSED __attribute__((unused))
>  #define ISSPACE(x) ((x) == ' ' || (x) == '\t' || (x) == '\n')
>  
>  #define ARM_EXT_V1	 0
> 


