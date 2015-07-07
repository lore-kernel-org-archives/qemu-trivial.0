Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZCRNf-0007dZ-Un
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jul 2015 07:49:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZCRNb-0007YG-N1
	for qemu-trivial@nongnu.org; Tue, 07 Jul 2015 07:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZCRNa-0004Yq-S7
	for qemu-trivial@nongnu.org; Tue, 07 Jul 2015 07:49:39 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:36451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ZCRNV-0004TW-3m; Tue, 07 Jul 2015 07:49:33 -0400
Received: by widjy10 with SMTP id jy10so186323233wid.1;
	Tue, 07 Jul 2015 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8yurDglxQMZeXt7Xnj2AbDWW0J/U7KNDJr9cEvNXnc8=;
	b=nBfMOXj+FAfAURTMBdAkGAqyF0IYqx5iDjce0yUyDxprJs/1D/UP6OiaFZwzcDqJ1B
	CpepiD8wE9AVWgaHIdwhwEfUTHk1h/GWzO//r2k+KyUSgB6ZSUo3fIykLF3K0rK/zBwv
	l1V0lHkW6SGqEjEEwoD31yfTxjD+ZsyK2xEl8P1k0c1W7CJJYfDmpYFigk3xoZ9qqFAJ
	tiGu3xIInEsbHeoOkSHPLOHuxmdT4s73SU+eXGZoSb4sQzKk2jtt/4koQjtn/FHiReWG
	51EWFVnBshaYkUma/g4AHZwQvA9GmI9grFklMGPWMH9HIvunK6o6sLTXQE2xoK/rXL9A
	UyRA==
X-Received: by 10.180.84.202 with SMTP id b10mr63938738wiz.23.1436269772356;
	Tue, 07 Jul 2015 04:49:32 -0700 (PDT)
Received: from localhost (host86-153-218-221.range86-153.btcentralplus.com.
	[86.153.218.221])
	by mx.google.com with ESMTPSA id lu5sm32992151wjb.9.2015.07.07.04.49.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jul 2015 04:49:29 -0700 (PDT)
Date: Tue, 7 Jul 2015 12:49:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Message-ID: <20150707114928.GA2405@stefanha-thinkpad.redhat.com>
References: <19df383991831bad31163fa0053f996284eeedec.1435934626.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <19df383991831bad31163fa0053f996284eeedec.1435934626.git.DirtY.iCE.hu@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH v2] opts: produce valid
 command line in qemu_opts_print
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
X-List-Received-Date: Tue, 07 Jul 2015 11:49:40 -0000


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2015 at 04:45:36PM +0200, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1=
n wrote:
> This will let us print options in a format that the user would actually
> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
> prepending a spurious comma at the beginning of the list, or quoting
> values unnecessarily.  This patch provides the following changes:
> * write and id=3D, if the option has an id
> * do not print separator before the first element
> * do not quote string arguments
> * properly escape commas (,) for QEMU
>=20
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>=20
> Change from v1:
> * updated escaped_print as suggested by Markus
>=20
>  block.c            |  2 +-
>  util/qemu-option.c | 29 ++++++++++++++++++++++++++---
>  2 files changed, 27 insertions(+), 4 deletions(-)

Looks good but please fix qemu-iotests so the test suite keeps passing:

  $ make && cd tests/qemu-iotests && ./check -qcow2

The test fixes must be in the same commit so the git commit history
remains bisectable.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVm7zIAAoJEJykq7OBq3PIq7sH/iQq4NfOVNoPgSb2Ar/WTKBW
3ryaCwbG+1q089ZsbSSXeG5IDLCnWt7/x6Y0+iwppBGcVAblADFJec0pXVBSss99
mAomcs3akV9QbFUTY8dZ3QaDaDP1QnN7DrMrxL7McCYkRSkE7yFq2eo4IwwEgqAc
XwndEUnQ6v4R05z/NpHcCFQghUQKlOpYutu+OnmOIkrWBI4Fxt1oem8mQ13Eq237
qozxdVH6fFyzOFJL9Oa4vU0+u/15Xqmyq6YNcnD5Ll6MLZLJIEAc8VIQU1jI4tCg
pwGpMHAHCGqOTlB9prwCikWF/8+HG8mLYuMUI6W4ajc35vQxhzaiPIHvHMIzy48=
=yIz2
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

