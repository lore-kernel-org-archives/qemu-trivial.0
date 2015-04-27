Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymj6O-00079p-9s
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 09:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ymj6G-0006za-LF
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ymj6D-0008RR-DR
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:29:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Ymj6D-0008RF-6p; Mon, 27 Apr 2015 09:29:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3RDTOKK022446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 27 Apr 2015 09:29:24 -0400
Received: from [10.36.112.36] (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3RDTKH6018049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 27 Apr 2015 09:29:22 -0400
Message-ID: <553E39B0.7070100@redhat.com>
Date: Mon, 27 Apr 2015 15:29:20 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] libcacard: stop including
	qemu-common.h
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
X-List-Received-Date: Mon, 27 Apr 2015 13:29:34 -0000



On 27/04/2015 15:27, Michael Tokarev wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> This is a small step towards making libcacard standalone.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2: update vscclient.c too, use unistd.h on !WIN32 and getopt.h on *nix

Thanks very much Michael.  The vscclient.c parts look good, you may want
to add your changes before your S-o-b line.

Paolo

> 
>  libcacard/cac.c            | 5 ++++-
>  libcacard/card_7816.c      | 4 +++-
>  libcacard/event.c          | 2 +-
>  libcacard/vcard.c          | 4 +++-
>  libcacard/vcard_emul_nss.c | 2 +-
>  libcacard/vreader.c        | 4 +++-
>  libcacard/vscclient.c      | 8 +++++++-
>  7 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/libcacard/cac.c b/libcacard/cac.c
> index f38fdce..bc84534 100644
> --- a/libcacard/cac.c
> +++ b/libcacard/cac.c
> @@ -5,7 +5,10 @@
>   * See the COPYING.LIB file in the top-level directory.
>   */
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
> +
> +#include <string.h>
> +#include <stdbool.h>
>  
>  #include "cac.h"
>  #include "vcard.h"
> diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
> index 814fa16..22fd334 100644
> --- a/libcacard/card_7816.c
> +++ b/libcacard/card_7816.c
> @@ -5,7 +5,9 @@
>   * See the COPYING.LIB file in the top-level directory.
>   */
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
> +
> +#include <string.h>
>  
>  #include "vcard.h"
>  #include "vcard_emul.h"
> diff --git a/libcacard/event.c b/libcacard/event.c
> index 4c551e4..63f4057 100644
> --- a/libcacard/event.c
> +++ b/libcacard/event.c
> @@ -5,7 +5,7 @@
>   * See the COPYING.LIB file in the top-level directory.
>   */
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
>  
>  #include "vcard.h"
>  #include "vreader.h"
> diff --git a/libcacard/vcard.c b/libcacard/vcard.c
> index d140a8e..1a87208 100644
> --- a/libcacard/vcard.c
> +++ b/libcacard/vcard.c
> @@ -5,7 +5,9 @@
>   * See the COPYING.LIB file in the top-level directory.
>   */
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
> +
> +#include <string.h>
>  
>  #include "vcard.h"
>  #include "vcard_emul.h"
> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
> index 950edee..6955f69 100644
> --- a/libcacard/vcard_emul_nss.c
> +++ b/libcacard/vcard_emul_nss.c
> @@ -25,7 +25,7 @@
>  #include <prthread.h>
>  #include <secerr.h>
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
>  
>  #include "vcard.h"
>  #include "card_7816t.h"
> diff --git a/libcacard/vreader.c b/libcacard/vreader.c
> index 0315dd8..9725f46 100644
> --- a/libcacard/vreader.c
> +++ b/libcacard/vreader.c
> @@ -10,7 +10,9 @@
>  #endif
>  #define G_LOG_DOMAIN "libcacard"
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
> +
> +#include <string.h>
>  
>  #include "vcard.h"
>  #include "vcard_emul.h"
> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
> index fa6041d..0652684 100644
> --- a/libcacard/vscclient.c
> +++ b/libcacard/vscclient.c
> @@ -10,14 +10,20 @@
>   * See the COPYING.LIB file in the top-level directory.
>   */
>  
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #ifndef _WIN32
>  #include <sys/socket.h>
>  #include <netinet/in.h>
>  #include <netdb.h>
> +#include <unistd.h>
>  #define closesocket(x) close(x)
> +#else
> +#include <getopt.h>
>  #endif
>  
> -#include "qemu-common.h"
> +#include "glib-compat.h"
>  
>  #include "vscard_common.h"
>  
> 

