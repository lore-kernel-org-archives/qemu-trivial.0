Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YpvYN-00062y-8Q
	for mharc-qemu-trivial@gnu.org; Wed, 06 May 2015 05:23:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1YpvYK-00060Z-VG
	for qemu-trivial@nongnu.org; Wed, 06 May 2015 05:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1YpvYJ-0007rC-Qf
	for qemu-trivial@nongnu.org; Wed, 06 May 2015 05:23:40 -0400
Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f]:33040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1YpvYH-0007qZ-79; Wed, 06 May 2015 05:23:37 -0400
Received: by obblk2 with SMTP id lk2so2662751obb.0;
	Wed, 06 May 2015 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZnUZrMdkHR2F/HLFOSYmWMwIJ7FhVuQAlEuAYEFTpKQ=;
	b=uLitxX5QHfxZRLlqBL3fgyrRl8A+UfMQAvTNwi8mjHLmBrsDozhAw1S6jELha53aP7
	0KJRYtlXNPGVbkQIHHuW/69dZo6sWkIew7B0OB4+vwliydZy5VLXh7bV0Ot4/zzFev1Y
	EpnQR8Wbpr530VF/GcRqkY7XyoD1ecC5ZNy7qk3K8i1ukr1ZwYZ/POBrwzBYyE0U28bo
	QjXGZP58mVp9Q+o9DEMhmc4QYKk3rOEUgCQ2xM2GByk0YOSlyG5e6yDyR646fBVqxU7m
	VufPM9w/9iW3krKTcNwwAYo9x6KMk0h48h5qMnBx3qBXqgzZHiEGEBtL9ss9uoYK7jWi
	BkQg==
MIME-Version: 1.0
X-Received: by 10.202.183.214 with SMTP id h205mr1413628oif.87.1430904216578; 
	Wed, 06 May 2015 02:23:36 -0700 (PDT)
Received: by 10.182.14.68 with HTTP; Wed, 6 May 2015 02:23:36 -0700 (PDT)
In-Reply-To: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Wed, 6 May 2015 11:23:36 +0200
Message-ID: <CABoDooPkbFvVsC8i0XF9-9+dZQK16aJGDVoE7LAd_L9=COagqA@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22f
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] libcacard: stop
	including qemu-common.h
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
X-List-Received-Date: Wed, 06 May 2015 09:23:42 -0000

Hello,

On Mon, Apr 27, 2015 at 3:27 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> This is a small step towards making libcacard standalone.

on my system the removal of qemu-common.h inclusion broke compilation
due to assert being used in glib-compat.h.  A fix might be to include
assert.h in glib-compat.h.

Thanks,

Laurent

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2: update vscclient.c too, use unistd.h on !WIN32 and getopt.h on *nix
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
> --
> 2.1.4
>
>

