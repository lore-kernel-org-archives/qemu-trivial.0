Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIKGO-0007UL-FP
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 12:58:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKGL-0007Pg-GV
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:58:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIKGK-0005ED-GX
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 12:58:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIKGE-0005An-AV; Sun, 10 Jan 2016 12:58:38 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DB90640359;
	Sun, 10 Jan 2016 20:58:35 +0300 (MSK)
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56929BCA.1040706@msgid.tls.msk.ru>
Date: Sun, 10 Jan 2016 20:58:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1449708466-13366-1-git-send-email-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] configure: remove unused or
	undefined variables
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
X-List-Received-Date: Sun, 10 Jan 2016 17:58:46 -0000

10.12.2015 03:47, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Found thanks to shellcheck!
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/configure b/configure
> index b55dcdd..6a971a2 100755
> --- a/configure
> +++ b/configure
> @@ -3994,7 +3994,6 @@ EOF
>  fi
> =20
>  # check for smartcard support
> -smartcard_cflags=3D""
>  if test "$smartcard" !=3D "no"; then
>      if $pkg_config libcacard; then
>          libcacard_cflags=3D$($pkg_config --cflags libcacard)
> @@ -4356,7 +4355,6 @@ fi
>  # If we can't selectively disable warning in the code, disable -Werror=
 so that
>  # the build doesn't fail anyway.
> =20
> -pragma_disable_unused_but_set=3Dno
>  cat > $TMPC << EOF
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wunused-but-set-variable"
> @@ -4791,9 +4789,6 @@ if test "$vnc" =3D "yes" ; then
>      echo "VNC JPEG support  $vnc_jpeg"
>      echo "VNC PNG support   $vnc_png"
>  fi
> -if test -n "$sparc_cpu"; then
> -    echo "Target Sparc Arch $sparc_cpu"
> -fi
>  echo "xen support       $xen"
>  if test "$xen" =3D "yes" ; then
>    echo "xen ctrl version  $xen_ctrl_version"
> @@ -5285,7 +5280,6 @@ if test "$qom_cast_debug" =3D "yes" ; then
>  fi
>  if test "$rbd" =3D "yes" ; then
>    echo "CONFIG_RBD=3Dm" >> $config_host_mak
> -  echo "RBD_CFLAGS=3D$rbd_cflags" >> $config_host_mak

RBD_CFLAGS is used in block/Makefile.objs.  We should either
drop that variable from there or actually define rbd_cflags
in configure.  Without either of these, this patch is incomplete.

Thanks,

/mjt

>    echo "RBD_LIBS=3D$rbd_libs" >> $config_host_mak
>  fi
> =20
>=20


