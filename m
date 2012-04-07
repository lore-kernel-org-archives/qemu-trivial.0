Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGSoV-00045G-2I
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 06:24:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SGSoS-0003xE-BI
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 06:24:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SGSoQ-000308-JF
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 06:24:07 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41674 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SGSoN-0002zV-Ex; Sat, 07 Apr 2012 06:24:03 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 9395F915A2;
	Sat,  7 Apr 2012 12:24:01 +0200 (CEST)
Message-ID: <4F8015BF.1060101@suse.de>
Date: Sat, 07 Apr 2012 12:23:59 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120312 Thunderbird/11.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Replace Qemu by QEMU
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
X-List-Received-Date: Sat, 07 Apr 2012 10:24:09 -0000

Am 07.04.2012 09:23, schrieb Stefan Weil:
> These patches try to establish the official spelling "QEMU".
> There remain some old spellings "Qemu" in BIOS code
> (use "grep -rw Qemu pc-bios" to see them).
>=20
> Patch 4 also fixes a spelling bug and debug messages
> which I did not mention in the commit message.
>=20
> Regards,
> Stefan W.
>=20
> [PATCH 1/4] Replace Qemu by QEMU in user visible documentation
> [PATCH 2/4] Replace Qemu by QEMU in internal documentation
> [PATCH 3/4] Replace Qemu by QEMU in w32 installation path (prefix)
> [PATCH 4/4] Replace Qemu by QEMU in comments

Series (including ppc parts and same-line fixes)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

I hope it'll avoid some copy&paste errors, but I somewhat doubt it'll
stop newbies from varying the spelling and new misspellings creeping in.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

