Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aL6SD-0003Xk-3S
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2016 04:50:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>) id 1aL6SB-0003Uo-0q
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 04:50:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>) id 1aL6SA-0003D5-7W
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 04:50:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cfergeau@redhat.com>)
	id 1aL6S5-000351-Pn; Mon, 18 Jan 2016 04:50:21 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 09BDEBBF44;
	Mon, 18 Jan 2016 09:50:21 +0000 (UTC)
Received: from edamame.cdg.redhat.com ([10.41.1.102])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I9oJHE008100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 18 Jan 2016 04:50:20 -0500
Received: by edamame.cdg.redhat.com (Postfix, from userid 1000)
	id A5F93142BD0; Mon, 18 Jan 2016 10:50:19 +0100 (CET)
Date: Mon, 18 Jan 2016 10:50:19 +0100
From: Christophe Fergeau <cfergeau@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20160118095019.GT24024@edamame.cdg.redhat.com>
References: <1452605979-744-1-git-send-email-cfergeau@redhat.com>
	<56998161.7080207@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pd495SECmvzXpBRb"
Content-Disposition: inline
In-Reply-To: <56998161.7080207@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] man: virtfs-proxy-helper:
 Fix 'capbilities' typo
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:27 -0000


--pd495SECmvzXpBRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2016 at 04:31:45PM -0700, Eric Blake wrote:
> On 01/12/2016 06:39 AM, Christophe Fergeau wrote:
> > Signed-off-by: Christophe Fergeau <cfergeau@redhat.com>
> > ---
> >  fsdev/virtfs-proxy-helper.texi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper=
=2Etexi
> > index e60e3b9..1b905a0 100644
> > --- a/fsdev/virtfs-proxy-helper.texi
> > +++ b/fsdev/virtfs-proxy-helper.texi
> > @@ -29,7 +29,7 @@ driver sends filesystem request to proxy helper and r=
eceives the
> >  response from it.
> > =20
> >  Proxy helper is designed so that it can drop the root privilege with
> > -retaining capbilities needed for doing filesystem operations only.
> > +retaining capabilities needed for doing filesystem operations only.
>=20
> Still reads awkwardly; better might be:
>=20
> The proxy helper is designed so that it can drop root privileges except
> for the capabilities needed for doing filesystem operations.

Ok, I'll send a v2 changing the sentence to your suggestion, thanks!

Christophe

--pd495SECmvzXpBRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWnLVbAAoJEKnYwhQprGyCzlIQALZW54foScCmQmTrdPyISzgw
TkEH9ggSzpLrPR86JGt8wBYLy/t2RJ4+dt9f9gmkArca/7kyy7cb3BMqvNlc4lIc
zz5oJpkqWsx3R0srQ0aflN4fV+0i0/qbr/DMFgUFr8vl4QINKawvcSTbACgegNeI
PT7wn8/imYFs0XdDyPq3qyfJA5LFR/sO8XEsU3mO/VUZfTErR76MH7IU2uUk7tJV
mn4brIWq0TRW2IptYHHV6aOoUj8cZYNfLaVxAVx8qdGKXNoPU6eAz5ouQWI/2PF7
cJVueZjM9gUQn5Bs7sTvmWkYs2nUBnzZmdLl0ipquPb/0n7K3Z/0xkQX+gJKEiqB
tKWgRp0ZSRMZ4xXGRDNL+Ai41MLTerDsp6YFTGcMqzrRT38GSdnQC1MBqLFeU2k+
IZ3y1G6jlfzzxlQ3StE5C3QIKkW2y3Q3kTzf5xF4Ud/Vg5WB3HiS0c9lvpC6xGEg
PFODZIoDHHPPtcODcPwJVHBGk8/SH6NDa4qP40Aqc3QETQbpLQIklpvznBEEwQwy
req/TfMCUGqxWhUqiUjBcH5c0b25lqUEWesyTjJ8ZbQl0LN2lhDJ0SwiZ+gTBG6I
VwI+xkJM27J3nupJZ3X06w99HUpZoARDeYmh6y29noc8QJxNR6L+gKAXg5fmSBH9
h5CDI3V6tRxBwKOcKDzJ
=/Mog
-----END PGP SIGNATURE-----

--pd495SECmvzXpBRb--

