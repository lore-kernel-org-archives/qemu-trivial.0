Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffpCf-0000gk-VZ
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2018 12:21:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ffpCd-0000eu-0N
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 12:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ffpCb-0000Cy-RD
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 12:21:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47856 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ffpCW-00006Y-0g; Wed, 18 Jul 2018 12:21:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33A28400E9BA;
	Wed, 18 Jul 2018 16:21:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48ADD2026D69;
	Wed, 18 Jul 2018 16:21:13 +0000 (UTC)
Date: Wed, 18 Jul 2018 17:21:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20180718162111.GR9812@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180712192603.11599-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180712192603.11599-1-sw@weilnetz.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 18 Jul 2018 16:21:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 18 Jul 2018 16:21:15 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Support
 pkg-config for zlib
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
X-List-Received-Date: Wed, 18 Jul 2018 16:21:24 -0000

On Thu, Jul 12, 2018 at 09:26:03PM +0200, Stefan Weil wrote:
> This is needed for builds with the mingw64-* packages from Cygwin,
> but also works for Linux.
> 
> Move the zlib test also more to the end because users should
> get information on the really important missing packages
> (which also require zlib) first.

According to the zlib Changelog file pkgconfig support was added
in 2006 !

[quote]
Changes in 1.2.3.1 (16 August 2006)

  - Add pkgconfig support [Weigelt]
[/quote]

Given our target build platforms support guidelines

  https://qemu.weilnetz.de/doc/qemu-doc.html#Supported-build-platforms

we can safely say that all supported platforms will have a zlib
that contains pkgconfig support, so......

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure | 40 +++++++++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/configure b/configure
> index 2a7796ea80..dcaab01729 100755
> --- a/configure
> +++ b/configure
> @@ -2140,23 +2140,6 @@ EOF
>    fi
>  fi
>  
> -#########################################
> -# zlib check
> -
> -if test "$zlib" != "no" ; then
> -    cat > $TMPC << EOF
> -#include <zlib.h>
> -int main(void) { zlibVersion(); return 0; }
> -EOF
> -    if compile_prog "" "-lz" ; then
> -        :
> -    else
> -        error_exit "zlib check failed" \
> -            "Make sure to have the zlib libs and headers installed."
> -    fi
> -fi
> -LIBS="$LIBS -lz"
> -
>  ##########################################
>  # lzo check
>  
> @@ -3525,6 +3508,29 @@ if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
>      fi
>  fi
>  
> +#########################################
> +# zlib check
> +
> +if test "$zlib" != "no" ; then
> +    if $pkg_config --exists zlib; then
> +        zlib_cflags=$($pkg_config --cflags zlib)
> +        zlib_libs=$($pkg_config --libs zlib)
> +        QEMU_CFLAGS="$zlib_cflags $QEMU_CFLAGS"
> +        LIBS="$zlib_libs $LIBS"
> +    else
> +        cat > $TMPC << EOF
> +#include <zlib.h>
> +int main(void) { zlibVersion(); return 0; }
> +EOF
> +        if compile_prog "" "-lz" ; then
> +            LIBS="$LIBS -lz"
> +        else
> +            error_exit "zlib check failed" \
> +                "Make sure to have the zlib libs and headers installed."
> +        fi
> +    fi

.... this fallback support for non-pkgconfig scenarios can be entirely
deleted, just leaving the error_exit message. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

