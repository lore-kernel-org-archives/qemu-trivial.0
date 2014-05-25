Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoZRB-0003xD-O1
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 10:30:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1WoZR2-0003nG-GR
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1WoZQt-0003kZ-OH
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:30:00 -0400
Received: from mout.web.de ([212.227.17.11]:56778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1WoZQt-0003kR-F6; Sun, 25 May 2014 10:29:51 -0400
Received: from netbook.home ([95.157.58.223]) by smtp.web.de (mrweb003) with
	ESMTPSA (Nemesis) id 0LcPRO-1WPe193Cy6-00josi; Sun, 25 May 2014 16:29:47
	+0200
Message-ID: <5381FE37.80904@web.de>
Date: Sun, 25 May 2014 22:29:11 +0800
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>, qemu-devel@nongnu.org
References: <1400985853-25594-1-git-send-email-tamlokveer@gmail.com>
In-Reply-To: <1400985853-25594-1-git-send-email-tamlokveer@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="g4wjInUliIcrDKjEWdmQmM6qC0XfsP0OO"
X-Provags-ID: V03:K0:XfAym15nPKcMZ2L8vm9vNMo86RyY2zhiMCabUOl8e/tlgBFH1zZ
	yKz6LdF1E+SpIGNkkVdlInWwo6nVARuYCnPGAcum01i+FlE69gGNC20VTesagx/XmFGLgtG
	nhSOeF//u+spNemoRDlJZ0PLBzq+WfIfvUWHgcOruvWVrV73hFtXLPXd1id07011Cq2hB5L
	PVdM7G+Phmlnlsne2o4mg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.17.11
Cc: kwolf@redhat.com, peter.crosthwaite@xilinx.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, stefanha@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v3] block: replace fprintf(stderr,
	...) with error_report()
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
X-List-Received-Date: Sun, 25 May 2014 14:30:08 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g4wjInUliIcrDKjEWdmQmM6qC0XfsP0OO
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On 2014-05-25 10:44, Le Tan wrote:
> Replace fprintf(stderr,...) with error_report() in files block/*, block=
=2Ec,
> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argume=
nt
> have been removed because @fmt of error_report() should not contain new=
line.
> Also fix some coding style issues.

Let's do the "also" part in a separate patch. It's more than one or two
trivial pass-by style fixes, and some people may like the fprintf
conversion while having different views on the other changes.

Jan



--g4wjInUliIcrDKjEWdmQmM6qC0XfsP0OO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlOB/jcACgkQitSsb3rl5xRxfACdEHWhWpHaNfMnsSfOCfUlpkGF
r/UAoLwWkTUAsCtwonBxtF83RO69TN8j
=bMSn
-----END PGP SIGNATURE-----

--g4wjInUliIcrDKjEWdmQmM6qC0XfsP0OO--

