Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1DKL-0004ih-41
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2013 04:54:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U1DKF-0004TW-KH
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 04:54:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U1DKE-0006ua-DV
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2013 04:54:27 -0500
Received: from cantor2.suse.de ([195.135.220.15]:49255 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1U1DKA-0006td-8n; Fri, 01 Feb 2013 04:54:22 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 589F6A3B99;
	Fri,  1 Feb 2013 10:54:21 +0100 (CET)
Message-ID: <510B90C9.8000309@suse.de>
Date: Fri, 01 Feb 2013 10:54:17 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>
References: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
In-Reply-To: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Fri, 01 Feb 2013 09:54:31 -0000

Am 31.01.2013 11:15, schrieb Michal Privoznik:
> Currently, we are enforcing the _FORTIFY_SOURCE=3D2 without any
> previous detection if the macro has been already defined, e.g.
> by environment, or is just enabled by compiler by default.
>=20
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index b7635e4..97070eb 100755
> --- a/configure
> +++ b/configure
> @@ -3159,7 +3159,7 @@ if test "$gcov" =3D "yes" ; then
>    CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
>    LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
>  elif test "$debug" =3D "no" ; then
> -  CFLAGS=3D"-O2 -D_FORTIFY_SOURCE=3D2 $CFLAGS"
> +  CFLAGS=3D"-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $CFLAGS"
>  fi
> =20
> =20

Should we maybe instead add a compile-test?

#ifdef _FORTIFY_SOURCE
#if _FORTIFY_SOURCE >=3D 2
#error Environment already has _FORTIFY_SOURCE
#endif
#endif

I admit I have no clue what the number means and whether there are more
fortified levels.

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

