Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoGjC-00054r-0k
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 13:26:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoGjA-00053B-06
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 13:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoGj9-0001sY-20
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 13:26:55 -0400
Received: from cantor2.suse.de ([195.135.220.15]:34394 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UoGj5-0001mZ-Dn; Sun, 16 Jun 2013 13:26:51 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CD6ACA50DD;
	Sun, 16 Jun 2013 19:26:49 +0200 (CEST)
Message-ID: <51BDF556.9040807@suse.de>
Date: Sun, 16 Jun 2013 19:26:46 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371292923-28105-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1371292923-28105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Peter Wu <lekensteyn@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] vl: always define
	no_frame
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
X-List-Received-Date: Sun, 16 Jun 2013 17:26:57 -0000

Am 15.06.2013 12:42, schrieb Michael Tokarev:
> Commit 047d4e151dd46 "Unbreak -no-quit for GTK, validate SDL options" b=
roke
> build of qemu without sdl, by referencing `no_frame' variable which is =
defined
> inside #if SDL block.  Fix that by defining that variable unconditional=
ly.
>=20
> This is a better fix for the build issue introduced by that patch than
> a revert.  This change keeps the new functinality introduced by that pa=
tch
> and just fixes the compilation.  It still is not a complete fix around =
the
> original issue (not working -no-frame et al with -display gtk), because=
 it
> makes only the legacy interface working, not the new suboption interfac=
e,
> so a few more changes are needed.
>=20
> Cc: Peter Wu <lekensteyn@gmail.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Tested-by: Andreas F=E4rber <afaerber@suse.de>

Unbreaks my headless ppc build.

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

