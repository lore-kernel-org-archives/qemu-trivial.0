Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzT60-00026n-Im
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 11:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzT5s-0001tI-IV
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 11:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzT5m-00081A-RV
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 11:57:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzT5a-0007x6-Tc; Tue, 24 Jun 2014 11:56:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ADD454405B;
	Tue, 24 Jun 2014 19:56:46 +0400 (MSK)
Message-ID: <53A99FBE.9090607@msgid.tls.msk.ru>
Date: Tue, 24 Jun 2014 19:56:46 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Bernhard_=DCbelacker?= <bernhardu@vr-web.de>, 
	qemu-devel@nongnu.org
References: <53A58863.7040004@vr-web.de>
In-Reply-To: <53A58863.7040004@vr-web.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [PATCH-trivial] Grub fails to boot from internal
 TFTP server when loading more than 3 initrd files.
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
X-List-Received-Date: Tue, 24 Jun 2014 15:57:18 -0000

21.06.2014 17:28, Bernhard =DCbelacker wrote:
> - From a5c3977f133faa8d7e403005325014f114234307 Mon Sep 17 00:00:00 200=
1
> From: =3D?UTF-8?q?Bernhard=3D20=3DC3=3D9Cbelacker?=3D <bernhardu@vr-web=
.de>
> Date: Sat, 21 Jun 2014 15:26:05 +0200
> Subject: Increase maximum number of session of the internal TFTP server=
.
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Grub fails to boot from internal TFTP server when loading more than 3 i=
nitrd files.
>=20
> Grub first opens a session to the TFTP server for every initrd file and
> retrieves only the file size for all.
> Then it wants to download the content using the old sessions which are
> already expired.
>=20
> Increasing the maximum number of session of the internal TFTP
> server avoids this issue.

This looks sane.  And while slirp has the maintainer, he appears to be
inactive, so applying it to -trivial.  Thank you!

/mjt

