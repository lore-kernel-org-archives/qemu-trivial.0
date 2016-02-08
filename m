Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aSnTv-0000vl-4x
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2016 10:12:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1aSnTn-0000ug-Gd
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 10:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1aSnTj-0002hI-5a
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 10:11:55 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:36626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1aSnTi-0002hE-Uq; Mon, 08 Feb 2016 10:11:51 -0500
Received: by mail-wm0-x22d.google.com with SMTP id p63so118035407wmp.1;
	Mon, 08 Feb 2016 07:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2LbmYmFLNE0todJwufSq0up/euTRRdIvOkncWGGHQ6c=;
	b=Gs4yph503DRLpMoUnn2siDvM7UAhuHtJ4/YVayrfLE/4pj8rXBF9tWaNRdNcp22Mfi
	ivnpYPLdf8jzd8EtFl9wB3vs8ANz/cemQ74Al09hciiC8YA/IrPj7EG8QW/K70Zj8ozc
	5ovOox/QA/f9XQdtqlwjJEDXmzixxxuq1h3uNEa1mUmLw2MLY2CR4ji0xOoreqw4YzlW
	dqX8PF9K5Q5XP68WqlDexiNQ37Qm+jhxo4d4knmPprNjvNz1bA1iP2FTnsOphVoIlh2c
	M0fqKRa0B50rq6AQWagB/PuI+geuMSh5haZqk7SmTakbCtnpnCfXvfYvBWe5s4Tq0S/d
	kiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=2LbmYmFLNE0todJwufSq0up/euTRRdIvOkncWGGHQ6c=;
	b=c6iYCJqxgf9dEVatOz3iZNARmE7Bmy/b61FqTlj/1PoCxTmmGa5HqSEe3N5L+dLbsD
	W7waieqwxS4scjLejxiy45w/qgBVPoU3s+QV3xzqgU+7pXNwNnqqnD7fqyGhs6z601/e
	3g30/gnky6lU25NBGgTOiPmROKZyBgi5WPv0/FxMMDaP2iVni+brIkuXYVMqE8eaIqpC
	XlqWwqsQRLIsq4C0Tx6seKqZux6evUlQ+kJ/TrDaj8VyA/B++8VD05182rxo7yCHZUJC
	54W48o43Czn2oCzLQYY9Swb4+BUwjK9jDktBqomNVYZwV9Gpdr1wY4e4tmpbmBwSDQDx
	4w7Q==
X-Gm-Message-State: AG10YOTJ0pqUbScxYwRHoMy7Q9ZLVobVQ8a8lUVtOy1cbw+AMXUUIYEDqCrrkZu5xonqHg==
X-Received: by 10.194.134.134 with SMTP id pk6mr28896585wjb.176.1454944310313; 
	Mon, 08 Feb 2016 07:11:50 -0800 (PST)
Received: from localhost (host86-186-101-16.range86-186.btcentralplus.com.
	[86.186.101.16]) by smtp.gmail.com with ESMTPSA id
	xx3sm30209464wjc.32.2016.02.08.07.11.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Feb 2016 07:11:49 -0800 (PST)
Date: Mon, 8 Feb 2016 15:11:47 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
Message-ID: <20160208151147.GC31586@stefanha-x1.localdomain>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
	<569D22F6.5070104@msgid.tls.msk.ru>
	<20160118192843.55ef9d93@bahia.huguette.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline
In-Reply-To: <20160118192843.55ef9d93@bahia.huguette.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace: drop trailing empty
	strings
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
X-List-Received-Date: Mon, 08 Feb 2016 15:12:01 -0000


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 07:28:43PM +0100, Greg Kurz wrote:
> On Mon, 18 Jan 2016 20:37:58 +0300
> Michael Tokarev <mjt@tls.msk.ru> wrote:
>=20
> > 11.01.2016 20:30, Greg Kurz wrote:
> >=20
> > > -virtio_balloon_handle_output(const char *name, uint64_t gpa) "sectio=
n name: %s gpa: %"PRIx64""
> > > +virtio_balloon_handle_output(const char *name, uint64_t gpa) "sectio=
n name: %s gpa: %"PRIx64 =20
> > ...
> >=20
> > I'm not sure what's the value of this.  It's fine either way, no?
>=20
> The only value is to drop unneeded stuff... and maybe some consistency
> with the traces that don't have these trailing empty strings.
>=20
> > Do we have a rule for trailing empty strings in coding style? :)
> >=20
>=20
> Nor we have against parenthesitis, which brings a lot more unneeded
> characters into the code :P

Regarding the history of the quoting limitation, see commit
cf85cf8e972f3ad79f203be4edb7968d6e052293 ("trace: Format strings must
begin/end with double quotes").  It was a limitation of the old
tracetool.sh script.

The modern tracetool.py script handles format strings fine when they do
not end with double-quotes.

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWuLAzAAoJEJykq7OBq3PIzGcH/jPxKtj492e/ezj2hp2dTWYm
I26mELahR/U1WLfT2Vwk0LJsphfDWvQqAmXumPQtMap7iLZr8teCdVtBxgWYaebc
wSlB+PW5lY1/h4iA0ONyL5Wq1gONEc33ktjJ70eZCmQFogkNpJS6xgH/TFweizz6
LVQsKUILN3Xyx/pNuzYXDxkZi1j6lOBjfQlGsPjwieTo8YQExvRZIWPxuYKIaMup
f+nHLiWojzT1B7Oer3YfjcoXFxmVABhyFHKfVnK5XuK1s2vqeY9HK8QdsPpEhyBA
oRIcl9Qp9bGit5uMj66roHOFZM1kbz01e0CbOxtAuGUMiFA38j8LUfRn9DQoV2M=
=p0nL
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--

