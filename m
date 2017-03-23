Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqyEH-0003z6-6e
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 04:36:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cqyEF-0003xj-Fv
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 04:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cqyEE-00047r-NH
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 04:36:19 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:34418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cqyEA-00046M-2I; Thu, 23 Mar 2017 04:36:14 -0400
Received: by mail-wr0-x244.google.com with SMTP id y90so6254086wrb.1;
	Thu, 23 Mar 2017 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=deM6fyl208DJrDE8hBWCF5k8uHUf1ArfIhhiVg535hY=;
	b=XhbBCW97BFK9pC9yDXkeiwyBcyGUL49Y5y/BCQyzgqio6daQJEt9Rh2qa6bgN9I97u
	c9MewbA+kfpMQ8jAoPzlW8T9UyVkbLVa7y490HH3Fwuv5pXjEutUmB6RmWDgEXijIFZ4
	ImQVQaYV9IncdRElXGTA7WQy48IWpX1/5b6Gl/eVPrOS43WT6YSQzvH+m7fkzLi1GA0z
	4orA1XQ/vQ931XhJ+oXQEl7QktcA5/RSXe3uVYl7kWGitkniZZBwpMiUqR3OYCmhen1i
	mdLu8IsGGu7dmZxhw4iiKnP9XUwkNhrtyTk/GMt7EbNOZU7DxrXx93oKDSiji7gotaKB
	3Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=deM6fyl208DJrDE8hBWCF5k8uHUf1ArfIhhiVg535hY=;
	b=OeiXhKHARWgY/ygFGPqp7yEyE1//BCRsz9PC3ePxsVV85TpsZvyJBOfWyPVZUtX2Bp
	PhgibKdpdDMOZrUGA0z3eUy30bQ4Nj2HQJ+EV1P58Xo7lJFeIlV6GHA1PftexWYD1AuQ
	rNyyqgwqMOQK8M/soS2aSInwwptpHf+ov/zTkgaXbVcFAwXY/Y8z4oRsVvDegRhLweev
	x95Q20Bu5T7jUf4lYbNSH8VbFRJVLlOxAaT6cS6Go6ArNVp/avdHB+YBc4ASMAEFi2Jl
	U+GxAikum8UJzrCaTZq+zPkRqaJfnXblGnNE4o4GKpfk1d16yRGfNV5K0O8VMGQAwjoc
	6hDg==
X-Gm-Message-State: AFeK/H2616r8pt3B/4UmDe1Tc4ksZhPKo0B8nX7Jw8D5zKbZBxXtOuhTJNDNr7+48dqQXg==
X-Received: by 10.223.144.67 with SMTP id h61mr1461443wrh.30.1490258173018;
	Thu, 23 Mar 2017 01:36:13 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id w2sm3337518wmd.19.2017.03.23.01.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Mar 2017 01:36:12 -0700 (PDT)
Date: Thu, 23 Mar 2017 08:34:16 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Saurav Sachidanand <sauravsachidanand@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu
Message-ID: <20170323083416.GG16717@stefanha-x1.localdomain>
References: <20170320173828.3874-1-sauravsachidanand@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline
In-Reply-To: <20170320173828.3874-1-sauravsachidanand@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [PATCH v5] util: Use g_malloc/g_free in envlist.c
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
X-List-Received-Date: Thu, 23 Mar 2017 08:36:20 -0000


--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 05:38:28PM +0000, Saurav Sachidanand wrote:
> Change malloc/strdup/free to g_malloc/g_strdup/g_free in
> util/envlist.c.
>=20
> Remove NULL checks for pointers returned from g_malloc and g_strdup
> as they exit in case of failure. Also, update calls to envlist_create
> to reflect this.
>=20
> Free array and array contents returned by envlist_to_environ using
> g_free in bsd-user/main.c and linux-user/main.c.
>=20
> Update comments to reflect change in semantics.
>=20
> Signed-off-by: Saurav Sachidanand <sauravsachidanand@gmail.com>
> ---
>  bsd-user/main.c   | 14 ++++----------
>  linux-user/main.c |  9 +++------
>  util/envlist.c    | 47 +++++++++++++++++++----------------------------
>  3 files changed, 26 insertions(+), 44 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJY04iIAAoJEJykq7OBq3PIRhcIAIPatmn/Mg9hIjSs/0pbpsNy
Ef/Nna6HkzIAHDi6MEhgrjW3izT8ZckjZ8j/Vv+VXQULLSG0nO6cmeV9KUrblisZ
5Vc7pJLSxhehRpDudkNOqrOQ4d4B7YO9oJjKNrGfmutjqYHQLEywRee5a8CT10A3
UtMQ5bRUb7/GZgSKzYSdklLG8tBkxGF3cLRVSSJwjf2bU1wMeVtE1irkXolZAgB5
B9ZZUhIzTZA4DuYWwxxhCwqPepX6pPIYiglF06/96aLzO5hUOSSQlBZLHWdEK6Hx
0dJ8cm2g4UyT37vwy4lWLEDkgik2ebuucD9iPEvtNG/9v/1nYEFzpzVK3YYo0Ag=
=dmfl
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--

