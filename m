Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5HGI-0007Hr-BY
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 11:27:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V5HGA-00075s-Nz
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 11:27:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V5HG4-0006Bx-Ba
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 11:27:18 -0400
Received: from cantor2.suse.de ([195.135.220.15]:50358 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V5GnW-0004Bs-4s; Fri, 02 Aug 2013 10:57:42 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 56DE0A51CB;
	Fri,  2 Aug 2013 16:57:40 +0200 (CEST)
Message-ID: <51FBC8E0.7070807@suse.de>
Date: Fri, 02 Aug 2013 16:57:36 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1375453248-7178-2-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1375453248-7178-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 1/4] qemu-ga: build it even
	if !system
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
X-List-Received-Date: Fri, 02 Aug 2013 15:27:25 -0000

Am 02.08.2013 16:20, schrieb Michael Tokarev:
> Move qemu-ga build check out of if softmmu.. into its own section.
> We want to build qemu-ga for _guest_ even if system build isn't
> done.  It is controlled separately using --enable-guest-agent.
> Additionally, give error message if guest agent is requested but
> not supported.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |   11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/configure b/configure
> index f0761ea..293f167 100755
> --- a/configure
> +++ b/configure
> @@ -231,7 +231,7 @@ libusb=3D""
>  usb_redir=3D""
>  glx=3D""
>  zlib=3D"yes"
> -guest_agent=3D"yes"
> +guest_agent=3D""
>  want_tools=3D"yes"
>  libiscsi=3D""
>  coroutine=3D""
> @@ -3444,10 +3444,15 @@ if test "$softmmu" =3D yes ; then
>        virtfs=3Dno
>      fi
>    fi
> +fi
> +if [ "$guest_agent" !=3D "no" ]; then
>    if [ "$linux" =3D "yes" -o "$bsd" =3D "yes" -o "$solaris" =3D "yes" =
] ; then
> -    if [ "$guest_agent" =3D "yes" ]; then
>        tools=3D"qemu-ga\$(EXESUF) $tools"
> -    fi
> +      guest_agent=3Dyes
> +  elif [ "$guest_agent" !=3D yes ]; then
> +      guest_agent=3Dno
> +  else
> +      error_exit "Guest agent is not supported on this platform"
>    fi
>  fi

You are mixing 2- and 4-char indentation here...

Andreas

> =20
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

