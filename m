Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgCRP-0008F2-7X
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 07:15:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgCRF-0007z0-4y
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgCR6-0003DO-L6
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:15:05 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54998 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UgCQu-00039i-0U; Sat, 25 May 2013 07:14:44 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4532CA41E0;
	Sat, 25 May 2013 13:14:43 +0200 (CEST)
Message-ID: <51A09D20.9010702@suse.de>
Date: Sat, 25 May 2013 13:14:40 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1369473597-7322-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1369473597-7322-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (trivial)] don't run
 pkg-config for features explicitly disabled
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
X-List-Received-Date: Sat, 25 May 2013 11:15:13 -0000

Am 25.05.2013 11:19, schrieb Michael Tokarev:
> We test pkg-config for curses and curl even if those are explicitly
> disabled.  Move these tests inside `if "$feature" !=3D "no"' sections.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

