Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyK3J-0007cD-FN
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2013 05:29:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TyK3F-0007aA-Mk
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 05:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TyJVY-00008X-DZ
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 04:54:11 -0500
Received: from cantor2.suse.de ([195.135.220.15]:60616 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TyJVI-00006E-5l; Thu, 24 Jan 2013 04:53:52 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 71718A3CEE;
	Thu, 24 Jan 2013 10:53:51 +0100 (CET)
Message-ID: <510104A8.1040709@suse.de>
Date: Thu, 24 Jan 2013 10:53:44 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1359021107-29413-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1359021107-29413-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.4] target-cris: Fix
 typo in D_LOG() macro
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
X-List-Received-Date: Thu, 24 Jan 2013 10:28:59 -0000

Am 24.01.2013 10:51, schrieb Andreas F=C3=A4rber:
> It's __VAR_ARGS__. Fixes the build with CRIS_[OP_]HELPER_DEBUG defined.

__VA_ARGS__ obviously. :) Please fix when committing.

Andreas

>=20
> Broken since r6338 / 93fcfe39a0383377e647b821c9f165fd927cd4e0 (Convert
> references to logfile/loglevel to use qemu_log*() macros).
>=20
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  target-cris/helper.c    |    2 +-
>  target-cris/op_helper.c |    2 +-
>  2 Dateien ge=C3=A4ndert, 2 Zeilen hinzugef=C3=BCgt(+), 2 Zeilen entfer=
nt(-)
>=20
> diff --git a/target-cris/helper.c b/target-cris/helper.c
> index 8407a6d..6e75e98 100644
> --- a/target-cris/helper.c
> +++ b/target-cris/helper.c
> @@ -28,7 +28,7 @@
> =20
>  #ifdef CRIS_HELPER_DEBUG
>  #define D(x) x
> -#define D_LOG(...) qemu_log(__VA__ARGS__)
> +#define D_LOG(...) qemu_log(__VA_ARGS__)
>  #else
>  #define D(x)
>  #define D_LOG(...) do { } while (0)
> diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> index 79bff38..0f6a1ee 100644
> --- a/target-cris/op_helper.c
> +++ b/target-cris/op_helper.c
> @@ -28,7 +28,7 @@
> =20
>  #ifdef CRIS_OP_HELPER_DEBUG
>  #define D(x) x
> -#define D_LOG(...) qemu_log(__VA__ARGS__)
> +#define D_LOG(...) qemu_log(__VA_ARGS__)
>  #else
>  #define D(x)
>  #define D_LOG(...) do { } while (0)
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

