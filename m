Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXaIE-00086L-15
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 12:54:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaIB-00082K-Em
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 12:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaIA-0005xj-3s
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 12:54:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UXaI4-0005o0-Ot; Wed, 01 May 2013 12:54:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 26BF940073;
	Wed,  1 May 2013 20:53:58 +0400 (MSK)
Message-ID: <518148A4.1090306@msgid.tls.msk.ru>
Date: Wed, 01 May 2013 20:53:56 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1367159247-13441-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1367159247-13441-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, agraf@suse.de, brogers@suse.com,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.5] configure: Pick up libseccomp
 include path
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
X-List-Received-Date: Wed, 01 May 2013 16:54:09 -0000

28.04.2013 18:27, Andreas F=C3=A4rber wrote:
> openSUSE 12.3 has seccomp.h in /usr/include/libseccomp-1.0.1,
> so add `pkg-config --cflags libseccomp` output to QEMU_CFLAGS.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

Thanks, applied to qemu-trivial tree (372e47e9b5e31c493823d7f512716644fb0=
2d0fd).

/mjt

>  configure | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/configure b/configure
> index 21438d4..643153f 100755
> --- a/configure
> +++ b/configure
> @@ -1505,6 +1505,7 @@ libs_softmmu=3D"$libs_softmmu -lz"
>  if test "$seccomp" !=3D "no" ; then
>      if $pkg_config --atleast-version=3D1.0.0 libseccomp --modversion >=
/dev/null 2>&1; then
>          libs_softmmu=3D"$libs_softmmu `$pkg_config --libs libseccomp`"
> +        QEMU_CFLAGS=3D"$QEMU_CFLAGS `$pkg_config --cflags libseccomp`"
>  	seccomp=3D"yes"
>      else
>  	if test "$seccomp" =3D "yes"; then



