Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fO2lq-0005zh-Ti
	for mharc-qemu-trivial@gnu.org; Wed, 30 May 2018 11:12:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fO2lp-0005zH-Hd
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 11:12:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fO2lo-0007XU-Ky
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 11:12:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48044 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fO2lk-0007VD-AK; Wed, 30 May 2018 11:12:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A94CB4022414;
	Wed, 30 May 2018 15:12:07 +0000 (UTC)
Received: from localhost (ovpn-117-228.ams2.redhat.com [10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EA9C111AF2E;
	Wed, 30 May 2018 15:12:06 +0000 (UTC)
Date: Wed, 30 May 2018 16:12:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org
Message-ID: <20180530151202.GC5973@stefanha-x1.localdomain>
References: <20180528054055.21153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <20180528054055.21153-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 30 May 2018 15:12:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 30 May 2018 15:12:07 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] trace: Sort trace-events-subdirs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 15:12:14 -0000


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 28, 2018 at 02:40:55AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Having these entries sorted helps to add new ones.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  Makefile.objs | 82 +++++++++++++++++++++++++--------------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbDr9CAAoJEJykq7OBq3PI4mgH/j3TGhejFypF5yDLmbNSyVq1
mu/YrHjj3l3LM3pyfZbf730ne6b4fvWzaqb4sykoErgYpXWOBCBPFMuWOpwhIXGj
8ezGElD08pYjkhG5qJpjicmZcYDxniMDgWgRiUS55Mg5o1WXgT1bBWmGWO5FQJ+n
hCfq6sVtCYMeYNfiDj0XoJwXzBhIDIybKUiw/OkUBVNN8yexF+gsceNJ760YA/kl
N7RzmPnayzR2Qs+IuTvIhlkoco5IHlUhbZbWPWXpWamtsLV76c4nDaeg1O/gjgSF
qYSmjfYIkJAOXjv8eBvGC3+XgyczCTUCcvz2GKV897fz8A5w9oA6aGZ9looM28g=
=LvGB
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

