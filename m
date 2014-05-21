Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wn1Xr-0006D2-Ob
	for mharc-qemu-trivial@gnu.org; Wed, 21 May 2014 04:06:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Wn1Xj-000637-W4
	for qemu-trivial@nongnu.org; Wed, 21 May 2014 04:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Wn1Xd-0000r8-Cz
	for qemu-trivial@nongnu.org; Wed, 21 May 2014 04:06:31 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51179 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Wn1XP-0000mx-QR; Wed, 21 May 2014 04:06:11 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 60899ABE8;
	Wed, 21 May 2014 08:06:11 +0000 (UTC)
Message-ID: <537C5E71.9060203@suse.de>
Date: Wed, 21 May 2014 10:06:09 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>, qemu-devel@nongnu.org
References: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
	<1400631039-7208-2-git-send-email-tamlokveer@gmail.com>
In-Reply-To: <1400631039-7208-2-git-send-email-tamlokveer@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com, jan.kiszka@web.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] arch_init: replace
 fprintf(stderr, ...) with error_report()
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
X-List-Received-Date: Wed, 21 May 2014 08:06:38 -0000

Am 21.05.2014 02:10, schrieb Le Tan:
> Replace fprintf(stderr,...) with error_report() in the file
> arch_init.c. The trailing "\n"s of the @fmt argument have been removed
> because @fmt of error_report() should not contain newline.
>=20
> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> ---
>  arch_init.c |   32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

