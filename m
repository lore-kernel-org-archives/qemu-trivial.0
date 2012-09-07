Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9zkX-0000ZZ-2R
	for mharc-qemu-trivial@gnu.org; Fri, 07 Sep 2012 10:41:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T9zkO-00008Y-T2
	for qemu-trivial@nongnu.org; Fri, 07 Sep 2012 10:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T9zkK-0002Qy-RV
	for qemu-trivial@nongnu.org; Fri, 07 Sep 2012 10:41:28 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51905 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T9zkA-0002N6-Um; Fri, 07 Sep 2012 10:41:15 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 1C01CA398D;
	Fri,  7 Sep 2012 16:41:14 +0200 (CEST)
Message-ID: <504A0787.4050109@suse.de>
Date: Fri, 07 Sep 2012 16:41:11 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <1346964030-17633-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1346964030-17633-1-git-send-email-yann.morin.1998@free.fr>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix seccomp check
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
X-List-Received-Date: Fri, 07 Sep 2012 14:41:34 -0000

Am 06.09.2012 22:40, schrieb Yann E. MORIN:
> Currently, if libseccomp is missing but the user explicitly requested
> seccomp support using --enable-seccomp, configure silently ignores the
> situation and disables seccomp support.
>=20
> This is unlike all other tests that explicitly fail in such situation.
>=20
> Fix that.
>=20
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

