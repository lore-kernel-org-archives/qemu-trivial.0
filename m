Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gt2ek-0004tE-7w
	for mharc-qemu-trivial@gnu.org; Sun, 10 Feb 2019 22:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gt2eh-0004r6-ND
	for qemu-trivial@nongnu.org; Sun, 10 Feb 2019 22:53:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gt2eh-0000oh-2p
	for qemu-trivial@nongnu.org; Sun, 10 Feb 2019 22:53:15 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gt2ec-0000lf-Q6; Sun, 10 Feb 2019 22:53:10 -0500
Received: by mail-pl1-x636.google.com with SMTP id e5so4680138plb.5;
	Sun, 10 Feb 2019 19:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=amSb7hFlYl5ZK/6b8imOGSJdx4reSxi0iyYyc0vTlfQ=;
	b=KAxssSTiFTqgLkK6ffyaBz9yJD6e3/xy8XcD635WZP1AOL0EgUVbdEI9M/SNMFwm/j
	z2/C9CpHjd+9lMBYC9fjv2F6CXBKiGLacb7rDWQZqqKsvy74ZbqxPpfoUACPe+6mHMu2
	2tN9MOr1dGS800KWQG3FbP9bTf+xjh5pHtCNWUfplMciAn8GFzNpbIp0WcyNHf2mdt25
	RS8gF+IcRQsyiUQteJnqT8H3POId7Pf6TFEd36mPxu8GpZFgZgjptNb8kJ0jUb+eFnzA
	/NH4MG0yk6+7VD0Wz01g6gDenFhCdoyQCkkOJLft56L1dqYoFWbAZxGBa7kBdrpK1L30
	/AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=amSb7hFlYl5ZK/6b8imOGSJdx4reSxi0iyYyc0vTlfQ=;
	b=hJLZUMQfJVio9A19f2NNhDQKLwlGlpCmSwfv4fZto1POKFTPTLjuZca2mXvy2YppZT
	K1fxwmEwAvZYU8Hd63ZaAiAnh+ntB0HRkQv+VhXPrSSCAn6qfeTaHPFg5ekhRxhZ8o3B
	qfVy2KxpX+fi/31yjod+pGed07hnF8Q8nGb0nXhGmL+9JEVLoGlUmHcddmlAIN5I1QRG
	F8d5Nzx/M0iRhrX/3H7aKFeRGNVT8NwYB4QFHAUlL7BqhjtHxIvGgEwHuSzu1EoguQfd
	3PdumlS+zWDTIhpnDSCRzQIglmInKlM2B80zkT8rUO9htCOgRhl3KBBxEyhCCMw5tbg1
	hcmQ==
X-Gm-Message-State: AHQUAua8ay6FNnIvmw0/LxBkTSpk+zdNYP3MTFfBK/f2RjDRjyXE2oVr
	IVSKqnvIOlbh0yl9hUTDxGt7OU4KKajhPQ==
X-Google-Smtp-Source: AHgI3Ia8XHhs7vpTSTp5qsy4yRaeSpb6MvaSvGGENSWrWeX+Ur+UWT1295ToSza3iysfNaaA4Ni5gA==
X-Received: by 2002:a17:902:e486:: with SMTP id
	cj6mr21964404plb.86.1549857189167; 
	Sun, 10 Feb 2019 19:53:09 -0800 (PST)
Received: from localhost (42-3-94-015.static.netvigator.com. [42.3.94.15])
	by smtp.gmail.com with ESMTPSA id
	s9sm10720369pgl.88.2019.02.10.19.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 19:53:08 -0800 (PST)
Date: Mon, 11 Feb 2019 11:53:05 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190211035305.GE18083@stefanha-x1.localdomain>
References: <20190208142347.214815-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline
In-Reply-To: <20190208142347.214815-1-sgarzare@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] virtio-blk: cleanup using
 VirtIOBlock *s and VirtIODevice *vdev
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
X-List-Received-Date: Mon, 11 Feb 2019 03:53:16 -0000


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2019 at 03:23:47PM +0100, Stefano Garzarella wrote:
> In several part we still using req->dev or VIRTIO_DEVICE(req->dev)
> when we have already defined s and vdev pointers:
>     VirtIOBlock *s =3D req->dev;
>     VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  hw/block/virtio-blk.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcYPGhAAoJEJykq7OBq3PIgmkH/i/VWN6/Knu7ifMjwq+fCLwb
uimSurwV1dmvgAHQk8XsiqgeiBY9moKW/pICUldMZ7J1kwK7EVXaty13scV72YQp
i9IgImmhmhWxZ64yM0Z3dl7wq79eg7mmwSnS+23eNSEPzOgdxwbmYSm0CIC5PVjE
YWg+SbTD18+DS8wWOzS5rLr4SfFDNsv7Y4RRqNR5PjFaSvGISXbB5PvVuQj1cyHh
eIIOrlWAFc7Efwh2QcMxE+lKCUh7LVfWXvwSdwat4Hd4BLENEGUoCsM8Na83gMEM
FTRPhaINTlLRrBPgi0qvqrh/Z7R0e4+MO5LYW+AEA/WJ5nC10p6ZXI8KDGMs2cQ=
=PPJb
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--

