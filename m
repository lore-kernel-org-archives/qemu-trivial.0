Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db46T-0005Ot-II
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db46R-0005NK-5l
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db46O-0003bC-Cq
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:10:47 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36017)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db46O-0003ai-50; Fri, 28 Jul 2017 08:10:44 -0400
Received: by mail-wm0-x241.google.com with SMTP id 184so27182366wmo.3;
	Fri, 28 Jul 2017 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RG6oWWN4+3qHrJ5htAIbd3h2Ly/0OKWyd/VWqxGxZSE=;
	b=TzlvMYd/I6AjHKRPMCoPn0fMUljiS/7Guj02H3a3QNnzx9gSL37FQ7S8Uc+vTZXpVi
	7dHnyW9dPQDAqdS+YChoaCgRn6GpHSW2AgluIeuIFIdr/p98KmIay+10QcrkrQaDDRNs
	TPCBh28Y4efT02+CAzOdZHMIwNu2YAeCYPDnbCxv3I0DEfkzR3GCfxvvd/N1cH7//kNe
	PjeZd7i1iciYuKAkp9ljTJ6DIuWozMHmyks1QVVAjNlUbd8omOrRNUfX+mzvT3PCvruw
	bgmqR2lQXXhndZzQ9hkHaggfDG1UV2ok35D4flabIMv3ampuK7zFfmq0euiSrffnmE+o
	wIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RG6oWWN4+3qHrJ5htAIbd3h2Ly/0OKWyd/VWqxGxZSE=;
	b=RNFyKL+HGXBnWKvtnjmYRogEjghRns8h3Ll6IfUzHfELjd0rHK3ztaQiI/E7XhIyQa
	iGLYx5dH0t8W/nvMvsLZ/UvgJ1xigXBRJL1hCEb2/ZEbKog/10rFniYOE0qEXTZ87cWy
	mwgmJ7SfuAnFrIzrgpghtt6y7iET3KirKToB+/NSoDkXUyCJqYNMjsrFHnP3ZCbwnjL/
	HUATu+z7GlYrgOBCNytjIT2M2iUK3GyblXEX7vrmjGjU7dLUsN4FQhX+ZxOjoOUnj7NK
	GMcQReFkSzqoZvrLzTrUopHypiKIlkYr7LKc3yyt6zM0HWDkI7UdVaGU/tWzVe5l83BA
	e/qQ==
X-Gm-Message-State: AIVw111Da6ta12cfgxkv34Sfq+knYdycYeyw110KecpzlDP1zKWAALfQ
	xXNcG3pheXlZieKaIYI=
X-Received: by 10.80.179.156 with SMTP id s28mr6585141edd.57.1501243843119;
	Fri, 28 Jul 2017 05:10:43 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id g4sm3260713edd.67.2017.07.28.05.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:10:42 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:10:41 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170728121041.GF12364@stefanha-x1.localdomain>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-9-f4bug@amsat.org>
	<e35426ff-9c8b-1e04-bc53-e6302deee776@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z+pzSjdB7cqptWpS"
Content-Disposition: inline
In-Reply-To: <e35426ff-9c8b-1e04-bc53-e6302deee776@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/47] MAINTAINERS: add
 missing entry for virtio
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
X-List-Received-Date: Fri, 28 Jul 2017 12:10:48 -0000


--z+pzSjdB7cqptWpS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 09:05:13AM +0200, Thomas Huth wrote:
> On 28.07.2017 07:35, Philippe Mathieu-Daud=E9 wrote:
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 69987b5e5b..6da3264d4e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1046,6 +1046,7 @@ F: hw/virtio/Makefile.objs
> >  F: hw/virtio/trace-events
> >  F: net/vhost-user.c
> >  F: include/hw/virtio/
> > +F: include/standard-headers/linux/virtio_*
>=20
> Same as for the linux-headers folder: include/standard-headers comes
> from the Linux kernel ... not sure whether it makes sense to add an
> entry in our MAINTAINERS file here...

I think it doesn't hurt for the virtio maintainer to be CCed on emails
that update the header files.  Most of the time changes are made by
mechanically importing header files using a script, but sometimes they
may be manual edits that are worth reviewing by someone familiar with
the domain.

Stefan

--z+pzSjdB7cqptWpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeynBAAoJEJykq7OBq3PIVMoH/3zt4LaI1gHE4t6K3VrLX1dY
3UgnW6q+c86iDD7MkUg3lP/peT2p0sVeTfAaRkAtmFCdvLZ/UNEuC9eHNYvZSNmJ
N2c+eQU5t9/g+lNMkhP+v02qNCjqQDDp6w3xqtoHWzH8T/uYzG8qu1MA7tClmS0i
C/I2RBevkcCGrdSFfqHQKme8xvBbbPNq4epnLVUC5mYxCTWONYwgDvc+unzqB+zT
CSIGyqmQLVyOgk2R0YBpWskmDdrW0IlNDC5hhGkZApFDfltbWuPhplHcDmdL32A7
fFHKiYNNwAI0RxFZSTUI9UcB9izu6l3mBQ/Xi2RDbN3f1kzHNhCpSrsBcPoeiB0=
=oR04
-----END PGP SIGNATURE-----

--z+pzSjdB7cqptWpS--

