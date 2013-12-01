Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VnCc7-0000IW-LF
	for mharc-qemu-trivial@gnu.org; Sun, 01 Dec 2013 14:23:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VnCc0-0000Ax-MW
	for qemu-trivial@nongnu.org; Sun, 01 Dec 2013 14:23:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VnCbv-0007cM-D4
	for qemu-trivial@nongnu.org; Sun, 01 Dec 2013 14:23:24 -0500
Received: from cantor2.suse.de ([195.135.220.15]:40070 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VnCbj-0007bH-Oo; Sun, 01 Dec 2013 14:23:07 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 35FADA7D3C;
	Sun,  1 Dec 2013 20:23:06 +0100 (CET)
Message-ID: <529B8C95.6060107@suse.de>
Date: Sun, 01 Dec 2013 20:23:01 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
References: <1385884187-10987-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1385884187-10987-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Peter Crosthwaite <peter.crosthwaite@petalogix.com>,
	Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@amazon.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Replace 'struct
	QEMUTimer' by 'QEMUTimer'
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
X-List-Received-Date: Sun, 01 Dec 2013 19:23:30 -0000

Am 01.12.2013 08:49, schrieb Stefan Weil:
> Most code already used QEMUTimer without the redundant 'struct' keyword=
.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

CC'ing Paolo.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

