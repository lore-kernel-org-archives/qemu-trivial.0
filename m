Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1geeBd-0003EH-0s
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2019 05:55:45 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gecKK-0000s8-AM
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 03:56:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gecKF-0002W2-At
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 03:56:36 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45202)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1gecKF-0002V3-4C
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2019 03:56:31 -0500
Received: by mail-oi1-f194.google.com with SMTP id y1so24580031oie.12
	for <qemu-trivial@nongnu.org>; Wed, 02 Jan 2019 00:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=emu+uCEDPx7L04UM09fx1vLYRnp1xmAKBRlVTcE5IRM=;
	b=mML/vodTkBTOgv5cJ5RP8dUe4U3/3IISU9edCpJLvFd/4F2KhOnbrvvKBPF08sUxQP
	8jDzSJfuroI4fbKCEk88hpn27aEIF21WDs4Aum2flcUj4vcFbwChWCBvnJPkKwaspntc
	4kDkXLYe+/TQCwKWlmXbUnVDz/MZMy//8fxc/gHLJGe92GBIHX30033hcRti3mSEvaPT
	EKlC5yhmRG7Tf87g8TKFPCswg75IaHeCe6pGQdRC9AqjtMOKcyfgn3eorKPVubpb3nom
	gMtRbyoYRyDVzbL10kEO1RiE5ClbJaaTEHXeyyQIqBpZRqlCQlyFbo/9RkzLB0pkmSa0
	8V+w==
X-Gm-Message-State: AA+aEWa2WeIjOhRrHkgK8C12CfmxYVON2cGmsbiBLjDrnO+cMZhh3d/m
	fJgWtzbrWdQBOEIvaTJSNYIa0ihlIXLLazEYngrJLA==
X-Google-Smtp-Source: AFSGD/WAerNs72uy8FcaYq3IDU7p3SeTIHX6KqiyUWflJXSm5fiWrQu0z3RX32D2BWdjBDJRI4frJ1WVxfaWSSdhJuk=
X-Received: by 2002:aca:50cf:: with SMTP id
	e198mr30087209oib.343.1546419389535; 
	Wed, 02 Jan 2019 00:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20181226171538.21984-1-philmd@redhat.com>
	<20181226171538.21984-3-philmd@redhat.com>
In-Reply-To: <20181226171538.21984-3-philmd@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 2 Jan 2019 09:56:18 +0100
Message-ID: <CAGxU2F60pcF88j7MYqAKYyvDOYJN0qJF487fCvgEO_CFWpsnSQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, 
	David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org, 
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>, 
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.167.194
X-Mailman-Approved-At: Wed, 02 Jan 2019 05:55:42 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] util/cutils: Move ctype
 macros to "cutils.h"
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
X-List-Received-Date: Wed, 02 Jan 2019 08:56:38 -0000

On Wed, Dec 26, 2018 at 6:25 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Introduced in cd390083ad1, these macros don't need to be in
> a generic header.
> Add documentation to justify their use.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/bus.c              |  2 +-
>  hw/core/qdev-properties.c  |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  hw/scsi/scsi-generic.c     |  2 +-
>  include/qemu-common.h      | 16 ----------------
>  include/qemu/cutils.h      | 24 ++++++++++++++++++++++++
>  qapi/qapi-util.c           |  2 +-
>  qobject/json-parser.c      |  1 -
>  target/ppc/monitor.c       |  1 +
>  ui/keymaps.c               |  1 +
>  util/id.c                  |  2 +-
>  util/readline.c            |  1 -
>  12 files changed, 32 insertions(+), 22 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index 4651f24486..dceb144075 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -18,7 +18,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/cutils.h"
>  #include "hw/qdev.h"
>  #include "qapi/error.h"
>
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 943dc2654b..3bdebac361 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "net/net.h"
>  #include "hw/qdev.h"
>  #include "qapi/error.h"
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index fd9d0b0542..ed23bb7b3a 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/boards.h"
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 7237b4162e..86f65fd474 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -12,8 +12,8 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qemu/error-report.h"
>  #include "hw/scsi/scsi.h"
>  #include "hw/scsi/emulation.h"
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 760527294f..ed43ae286d 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -33,22 +33,6 @@ int qemu_main(int argc, char **argv, char **envp);
>  void qemu_get_timedate(struct tm *tm, int offset);
>  int qemu_timedate_diff(struct tm *tm);
>
> -#define qemu_isalnum(c)                isalnum((unsigned char)(c))
> -#define qemu_isalpha(c)                isalpha((unsigned char)(c))
> -#define qemu_iscntrl(c)                iscntrl((unsigned char)(c))
> -#define qemu_isdigit(c)                isdigit((unsigned char)(c))
> -#define qemu_isgraph(c)                isgraph((unsigned char)(c))
> -#define qemu_islower(c)                islower((unsigned char)(c))
> -#define qemu_isprint(c)                isprint((unsigned char)(c))
> -#define qemu_ispunct(c)                ispunct((unsigned char)(c))
> -#define qemu_isspace(c)                isspace((unsigned char)(c))
> -#define qemu_isupper(c)                isupper((unsigned char)(c))
> -#define qemu_isxdigit(c)       isxdigit((unsigned char)(c))
> -#define qemu_tolower(c)                tolower((unsigned char)(c))
> -#define qemu_toupper(c)                toupper((unsigned char)(c))
> -#define qemu_isascii(c)                isascii((unsigned char)(c))
> -#define qemu_toascii(c)                toascii((unsigned char)(c))
> -
>  void *qemu_oom_check(void *ptr);
>
>  ssize_t qemu_write_full(int fd, const void *buf, size_t count)
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 9ee40470e3..cb06a5adab 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -3,6 +3,30 @@
>
>  #include "qemu/fprintf-fn.h"
>
> +/** unsigned ctype macros:
> + *
> + * The standards require that the argument for these functions
> + * is either EOF or a value that is representable in the type
> + * unsigned char. If the argument is of type char, it must be
> + * cast to unsigned char. This is what these macros do,
> + * avoiding 'signed to unsigned' conversion warnings.
> + */
> +#define qemu_isalnum(c)                isalnum((unsigned char)(c))
> +#define qemu_isalpha(c)                isalpha((unsigned char)(c))
> +#define qemu_iscntrl(c)                iscntrl((unsigned char)(c))
> +#define qemu_isdigit(c)                isdigit((unsigned char)(c))
> +#define qemu_isgraph(c)                isgraph((unsigned char)(c))
> +#define qemu_islower(c)                islower((unsigned char)(c))
> +#define qemu_isprint(c)                isprint((unsigned char)(c))
> +#define qemu_ispunct(c)                ispunct((unsigned char)(c))
> +#define qemu_isspace(c)                isspace((unsigned char)(c))
> +#define qemu_isupper(c)                isupper((unsigned char)(c))
> +#define qemu_isxdigit(c)       isxdigit((unsigned char)(c))
> +#define qemu_tolower(c)                tolower((unsigned char)(c))
> +#define qemu_toupper(c)                toupper((unsigned char)(c))
> +#define qemu_isascii(c)                isascii((unsigned char)(c))
> +#define qemu_toascii(c)                toascii((unsigned char)(c))
> +
>  /**
>   * pstrcpy:
>   * @buf: buffer to copy string into
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index e9b266bb70..ea93ae05d9 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -11,8 +11,8 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>
>  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val)
>  {
> diff --git a/qobject/json-parser.c b/qobject/json-parser.c
> index 7a7ae9e8d1..06316f3a53 100644
> --- a/qobject/json-parser.c
> +++ b/qobject/json-parser.c
> @@ -15,7 +15,6 @@
>  #include "qemu/cutils.h"
>  #include "qemu/unicode.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "qapi/qmp/qbool.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qlist.h"
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index 14915119fc..dbcb921231 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -22,6 +22,7 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "cpu.h"
>  #include "monitor/monitor.h"
>  #include "monitor/hmp-target.h"
> diff --git a/ui/keymaps.c b/ui/keymaps.c
> index 085889b555..00b52a6db3 100644
> --- a/ui/keymaps.c
> +++ b/ui/keymaps.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "keymaps.h"
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
> diff --git a/util/id.c b/util/id.c
> index 6141352955..ca21a77522 100644
> --- a/util/id.c
> +++ b/util/id.c
> @@ -11,7 +11,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/cutils.h"
>  #include "qemu/id.h"
>
>  bool id_wellformed(const char *id)
> diff --git a/util/readline.c b/util/readline.c
> index ec91ee0fea..f3d8b0698a 100644
> --- a/util/readline.c
> +++ b/util/readline.c
> @@ -23,7 +23,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qemu/readline.h"
>  #include "qemu/cutils.h"
>
> --
> 2.17.2
>
>


--
Stefano Garzarella
Red Hat

