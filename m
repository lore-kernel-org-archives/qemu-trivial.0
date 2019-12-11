Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if37M-0002WS-17
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 09:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1if37I-0002Ph-Vf
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:37:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1if37H-000278-U2
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:37:28 -0500
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:1384)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1if37F-00021K-9C; Wed, 11 Dec 2019 09:37:25 -0500
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; d="scan'208";a="332831152"
Received: from unknown (HELO function) ([193.50.111.121])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2019 15:37:22 +0100
Received: from samy by function with local (Exim 4.92.3)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1if37C-000lCa-A6; Wed, 11 Dec 2019 15:37:22 +0100
Date: Wed, 11 Dec 2019 15:37:22 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] build-sys: do not include Windows SLIRP dependencies in
 $LIBS
Message-ID: <20191211143722.a4co5wi53gylo2sr@function>
References: <1576074210-52834-2-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1576074210-52834-2-git-send-email-pbonzini@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.134.164.104
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2019 14:37:30 -0000

Paolo Bonzini, le mer. 11 déc. 2019 15:23:23 +0100, a ecrit:
> When including the internal SLIRP library, we should add all the libraries that
> it needs for the build.  Right now they are all included by QEMU, but -liphlpapi
> is not needed without slirp.  Move it from LIBS to slirp_libs.
> 
> Based on a patch by Marc-André Lureau.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

(I don't have a win environment to test this)

> ---
>  configure | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 6099be1..d16dad2 100755
> --- a/configure
> +++ b/configure
> @@ -926,7 +926,7 @@ if test "$mingw32" = "yes" ; then
>    DSOSUF=".dll"
>    # MinGW needs -mthreads for TLS and macro _MT.
>    QEMU_CFLAGS="-mthreads $QEMU_CFLAGS"
> -  LIBS="-lwinmm -lws2_32 -liphlpapi $LIBS"
> +  LIBS="-lwinmm -lws2_32 $LIBS"
>    write_c_skeleton;
>    if compile_prog "" "-liberty" ; then
>      LIBS="-liberty $LIBS"
> @@ -6069,6 +6069,9 @@ case "$slirp" in
>      mkdir -p slirp
>      slirp_cflags="-I\$(SRC_PATH)/slirp/src -I\$(BUILD_DIR)/slirp/src"
>      slirp_libs="-L\$(BUILD_DIR)/slirp -lslirp"
> +    if test "$mingw32" = "yes" ; then
> +      slirp_libs="$slirp_libs -lws2_32 -liphlpapi"
> +    fi
>      ;;
>  
>    system)
> -- 
> 1.8.3.1
> 
> 

-- 
Samuel
 > Quelqu'un aurait-il une solution pour réinitialiser un MBR
 Si tu veux qu'il soit complètement blanc (pas souhaitable, à mon avis) :
 dd if=/dev/zero of=/dev/hda bs=512 count=1 (sous Linux)
 -+- OT in Guide du linuxien (très) pervers - "Pour les K difficiles" -+-

