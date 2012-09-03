Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8Ymt-0000Yx-O9
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 11:42:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T8Ymq-0000PY-PZ
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 11:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T8Ymm-0006XI-Ss
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 11:42:04 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33431 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T8Ymf-0006WU-NR; Mon, 03 Sep 2012 11:41:53 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 955EEA2FD7;
	Mon,  3 Sep 2012 17:41:52 +0200 (CEST)
Message-ID: <5044CFBC.9050800@suse.de>
Date: Mon, 03 Sep 2012 17:41:48 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Stefan Hajnoczi <stefanha@gmail.com>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2 v3] Fix static linking
	for cURL and SDL
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
X-List-Received-Date: Mon, 03 Sep 2012 15:42:05 -0000

Hello,

Am 02.09.2012 15:09, schrieb Yann E. MORIN:
> Currently, configure checks for cURL and SDL with either pkg-config (th=
e
> default), or with {curl,sdl}-config (as a fallback).
>=20
> But pkg-config and {curl,sdl}-config do not have the same set of option=
s:
>   - to check for shared libs, both use the option: --libs
>   - to check for static libs:
>     - pkg-config uses      : --static --libs
>     - {curl,sdl}-config use: --static-libs
>=20
> To add to the complexity, pkg-config is called through the querry_pkg_c=
onfig
> wrapper, that already passes --static when static linking is required, =
but
> there is no such wrapper for {curl,sdl}-config, so we miss the occasion=
 to
> pass --static-libs.
>=20
> To fix this:
>   - introduce a new variable QEMU_XXX_CONFIG_LIBS_FLAGS that mirrors th=
e
>     behavior of QEMU_PKG_CONFIG_FLAGS; this variable can be used by all
>     xxx-config scripts (eg. curl-config, but later sdl-config too).
>     Default it to '--libs', which is for shared linking.
>   - properly use either --libs for pkg-config (--static is already take=
n
>     care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for
>     {curl,sdl}-config.

While this patch set looks okay technically, I wonder if this is fixing
the wrong problem...

The only use case for QEMU's --static compilation I know is linux-user,
and that doesn't need cURL or SDL AFAIK. Shouldn't we rather sanitize
our configure-time checks to only look for the actually needed stuff
than making sure that unnecessary dependencies are generated nicely?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

