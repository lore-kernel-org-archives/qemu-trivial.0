Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQRYz-0002HU-De
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 21:14:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WQRYs-0002AF-PL
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 21:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WQRYn-0001mc-Hz
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 21:14:22 -0400
Received: from cantor2.suse.de ([195.135.220.15]:60533 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WQRYS-0001fl-Fc; Wed, 19 Mar 2014 21:13:56 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EBDEB75013;
	Thu, 20 Mar 2014 01:13:55 +0000 (UTC)
Message-ID: <532A40D2.8000404@suse.de>
Date: Thu, 20 Mar 2014 02:13:54 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394977794-18939-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394977794-18939-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-ppc: Add missing
 'static' and 'const' attributes
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
X-List-Received-Date: Thu, 20 Mar 2014 01:14:28 -0000

Am 16.03.2014 14:49, schrieb Stefan Weil:
> This fixes warnings from the static code analysis (smatch).
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-ppc/arch_dump.c  |    6 +++---
>  target-ppc/int_helper.c |    2 +-
>  target-ppc/machine.c    |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Thanks, applied to my ppc-next:
https://github.com/afaerber/qemu-cpu/commits/ppc-next

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

