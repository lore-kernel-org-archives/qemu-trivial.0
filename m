Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsiPe-0000YP-EM
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 17:12:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiPZ-0000E4-Hr
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:12:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiPX-00009H-5b
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:12:16 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:40163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RsiPU-00006T-Km; Wed, 01 Feb 2012 17:12:12 -0500
Received: by mail-pw0-f45.google.com with SMTP id a11so1882314pba.4
	for <multiple recipients>; Wed, 01 Feb 2012 14:12:12 -0800 (PST)
Received: by 10.68.74.69 with SMTP id r5mr1258160pbv.118.1328134331223;
	Wed, 01 Feb 2012 14:12:11 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id t10sm1192223pbb.18.2012.02.01.14.12.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 14:12:09 -0800 (PST)
Message-ID: <4F29B8B7.70809@codemonkey.ws>
Date: Wed, 01 Feb 2012 16:12:07 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Sergei Trofimovich <slyfox@inbox.ru>
References: <1328036638-3190-1-git-send-email-slyfox@inbox.ru>
In-Reply-To: <1328036638-3190-1-git-send-email-slyfox@inbox.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Sergei Trofimovich <slyfox@gentoo.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH resend] ./configure: add
	link check for nss-smartcard
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
X-List-Received-Date: Wed, 01 Feb 2012 22:12:19 -0000

On 01/31/2012 01:03 PM, Sergei Trofimovich wrote:
> From: Sergei Trofimovich<slyfox@gentoo.org>
>
> Current './configure --static&&  make' fails for me:
>
>      LINK  qemu-nbd
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lssl3
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lsmime3
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lnssutil3
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lnss3
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lplds4
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lplc4
>      /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lnspr4
>
> My system does not provide static libraries for nss, so
> fix autoconfiguration by link checking.
>
> Signed-off-by: Sergei Trofimovich<slyfox@gentoo.org>
> CC: qemu-trivial<qemu-trivial@nongnu.org>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   configure |   13 +++++++++----
>   1 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/configure b/configure
> index 8fd5404..3b0b300 100755
> --- a/configure
> +++ b/configure
> @@ -2528,11 +2528,16 @@ if test "$smartcard" != "no" ; then
>       smartcard_cflags=""
>       # TODO - what's the minimal nss version we support?
>       if test "$smartcard_nss" != "no"; then
> -        if $pkg_config --atleast-version=3.12.8 nss>/dev/null 2>&1 ; then
> +      cat>  $TMPC<<  EOF
> +#include<pk11pub.h>
> +int main(void) { PK11_FreeSlot(0); return 0; }
> +EOF
> +        smartcard_cflags="-I\$(SRC_PATH)/libcacard"
> +        libcacard_libs=$($pkg_config --libs nss 2>/dev/null)
> +        libcacard_cflags=$($pkg_config --cflags nss 2>/dev/null)
> +        if $pkg_config --atleast-version=3.12.8 nss>/dev/null 2>&1&&  \
> +          compile_prog "$smartcard_cflags $libcacard_cflags" "$libcacard_libs"; then
>               smartcard_nss="yes"
> -            smartcard_cflags="-I\$(SRC_PATH)/libcacard"
> -            libcacard_libs=$($pkg_config --libs nss 2>/dev/null)
> -            libcacard_cflags=$($pkg_config --cflags nss 2>/dev/null)
>               QEMU_CFLAGS="$QEMU_CFLAGS $smartcard_cflags $libcacard_cflags"
>               LIBS="$libcacard_libs $LIBS"
>           else


