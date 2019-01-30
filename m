Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gon3H-0001Y1-C7
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:25:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gon3F-0001Wg-2C
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gon3C-0004uh-Ud
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:25:00 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50419)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gon2z-000434-Q7; Wed, 30 Jan 2019 05:24:47 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MHoAg-1gun421cF4-00EyPa; Wed, 30 Jan 2019 11:24:08 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <77127630-f476-f134-30a9-9b2d1aaac36d@vivier.eu>
Date: Wed, 30 Jan 2019 11:24:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190104181208.7809-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3QV9ucXIO5rUCQ5Cpkr73V2mXYhtlNmDajEvcwsrnoPbdN8Yayj
	enyXdZkOaXKtaD2pts8I2a6N/LEzBxQbumBN2xccxKUOhve7/6ClEEvJHvZPYLqqfXdphnp
	ip2umlttG1A+AlEdkLQUCLd/DvtcDakdlWdTYRB8ohMfV+U5QsgcaPXY7N9dLooq4IImzWg
	jgGOeQNndKTXOD60FnP3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ghtyd/91LR4=:x1CpopKysg4/fm3nC1BhCA
	JfvD/rdQh5nCv2scoGO/AEW1BO8BMAz7BM0zbLvadK3YHHB/mAfmAdcOsLGDeJIYzaveTzgDP
	GM8hV6Bs8t7gXqjhTEHkqlH1kZRdOolJgGvbYSYsn8VK/sHAlHnmyqxSYRuBvr9MWwxmEiIUw
	TnqVI959KVlhiJhwy3OByLF/REmMBF927rviVz535E4Fp+lWln0AnHPrXn5g6WPU/4fh0eaj3
	l753IksNhAwl3yCxVtXY4h18UvkjHR7yHo4I/G6k1vv5cSL93/imTRvbI3RlILwGic4gcWIA9
	DXow5hcs/XKh1BuWxJpV+l8CTmKqE91R5mQlidj3aB2UQwiubgEngTIqJwsoFZX/U/+HnutXd
	4yCsrby3UPGMVO0yaLsylCj2AqRpJjIHwoEEejG4kLcMbzL66raIya0iSeJB+ZFlNdkYUn2Yi
	I7u4E4dtlxqVydNr527rbVA/1mVveLPsoTT04TYzFFIIBfFFGBcbO2xJDWGYt91HdZ6bc7S1X
	j60HyLZ87LUSM8OMaWldq1Y75d2LN3b19z+RH3cCVxMb/0wnoa24nzaINLiz9qEAugm/gC6Wg
	77ytHA/orm6QDS1qcBUs91MLNjtrRsbE8Qzp8zIIu9thxLBP0l0E3tOdK9eswFyVH8gmr1fR+
	c6CNfnN4MNIq7T2s43H/cx5xq62o2HALghStQW3SdBtOzTH97X5tLHAEu3kfLnM9lGbhmB+99
	ARKnN7GN+JX7D5VoYtbyLiMTBYSOEf4YkssSfPxeUEayopnZEQyMfRT869g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] util/cutils: Move ctype macros to
 "cutils.h"
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
X-List-Received-Date: Wed, 30 Jan 2019 10:25:02 -0000

On 04/01/2019 19:12, Philippe Mathieu-Daudé wrote:
> Introduced in cd390083ad1, these macros don't need to be in
> a generic header.
> Add documentation to justify their use.
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Fixed checkpatch warnings (tabs)
> ---
>  hw/core/bus.c              |  2 +-
>  hw/core/qdev-properties.c  |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  hw/scsi/scsi-generic.c     |  2 +-
>  include/qemu-common.h      | 16 ----------------
>  include/qemu/cutils.h      | 25 +++++++++++++++++++++++++
>  qapi/qapi-util.c           |  2 +-
>  qobject/json-parser.c      |  1 -
>  target/ppc/monitor.c       |  1 +
>  ui/keymaps.c               |  1 +
>  util/id.c                  |  2 +-
>  util/readline.c            |  1 -
>  12 files changed, 33 insertions(+), 22 deletions(-)
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
> -#define qemu_isalnum(c)		isalnum((unsigned char)(c))
> -#define qemu_isalpha(c)		isalpha((unsigned char)(c))
> -#define qemu_iscntrl(c)		iscntrl((unsigned char)(c))
> -#define qemu_isdigit(c)		isdigit((unsigned char)(c))
> -#define qemu_isgraph(c)		isgraph((unsigned char)(c))
> -#define qemu_islower(c)		islower((unsigned char)(c))
> -#define qemu_isprint(c)		isprint((unsigned char)(c))
> -#define qemu_ispunct(c)		ispunct((unsigned char)(c))
> -#define qemu_isspace(c)		isspace((unsigned char)(c))
> -#define qemu_isupper(c)		isupper((unsigned char)(c))
> -#define qemu_isxdigit(c)	isxdigit((unsigned char)(c))
> -#define qemu_tolower(c)		tolower((unsigned char)(c))
> -#define qemu_toupper(c)		toupper((unsigned char)(c))
> -#define qemu_isascii(c)		isascii((unsigned char)(c))
> -#define qemu_toascii(c)		toascii((unsigned char)(c))
> -
>  void *qemu_oom_check(void *ptr);
>  
>  ssize_t qemu_write_full(int fd, const void *buf, size_t count)
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 9ee40470e3..644f2d75bd 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -3,6 +3,31 @@
>  
>  #include "qemu/fprintf-fn.h"
>  
> +/**
> + * unsigned ctype macros:
> + *
> + * The standards require that the argument for these functions
> + * is either EOF or a value that is representable in the type
> + * unsigned char. If the argument is of type char, it must be
> + * cast to unsigned char. This is what these macros do,
> + * avoiding 'signed to unsigned' conversion warnings.
> + */
> +#define qemu_isalnum(c)     isalnum((unsigned char)(c))
> +#define qemu_isalpha(c)     isalpha((unsigned char)(c))
> +#define qemu_iscntrl(c)     iscntrl((unsigned char)(c))
> +#define qemu_isdigit(c)     isdigit((unsigned char)(c))
> +#define qemu_isgraph(c)     isgraph((unsigned char)(c))
> +#define qemu_islower(c)     islower((unsigned char)(c))
> +#define qemu_isprint(c)     isprint((unsigned char)(c))
> +#define qemu_ispunct(c)     ispunct((unsigned char)(c))
> +#define qemu_isspace(c)     isspace((unsigned char)(c))
> +#define qemu_isupper(c)     isupper((unsigned char)(c))
> +#define qemu_isxdigit(c)    isxdigit((unsigned char)(c))
> +#define qemu_tolower(c)     tolower((unsigned char)(c))
> +#define qemu_toupper(c)     toupper((unsigned char)(c))
> +#define qemu_isascii(c)     isascii((unsigned char)(c))
> +#define qemu_toascii(c)     toascii((unsigned char)(c))
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
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

