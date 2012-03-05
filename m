Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4Xt5-0008MN-Qw
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:23:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S4Xsy-00080s-Me
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:23:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S4Xsu-0000iB-00
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:23:32 -0500
Received: from cantor2.suse.de ([195.135.220.15]:49734 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S4Xsh-0000gw-Ej; Mon, 05 Mar 2012 08:23:15 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id ABAB790B1D;
	Mon,  5 Mar 2012 14:23:13 +0100 (CET)
Message-ID: <4F54BE41.7040409@suse.de>
Date: Mon, 05 Mar 2012 14:23:13 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330928551-6452-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330928551-6452-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] osdep: Remove local
 definition of macro offsetof
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
X-List-Received-Date: Mon, 05 Mar 2012 13:23:39 -0000

Am 05.03.2012 07:22, schrieb Stefan Weil:
> The macro offsetof is defined in stddef.h. It is conforming to
> the standards C89, C99 and POSIX.1-2001 (see man page), so it
> is a sufficiently old standard.
>=20
> Therefore chances are very high that QEMU never needs a local
> definition of this macro.
>=20
> osdep.h already includes stddef.h, so this patch simply removes
> the unneeded code from the files configure and osdep.h.
>=20
> If we ever need the local definition again, it should be added
> to compiler.h (the macro is usually provided with the compiler,
> it is not OS specific).
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Did you check when this was introduced and whether the commit message
gave any explanation why?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

