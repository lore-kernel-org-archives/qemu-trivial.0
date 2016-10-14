Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bv4uK-00007j-Qv
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2016 12:00:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bv4uI-00005q-Ov
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 12:00:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bv4uI-0000hd-0B
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 12:00:26 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bv4u6-0000cc-EF; Fri, 14 Oct 2016 12:00:14 -0400
Received: by mail-wm0-x243.google.com with SMTP id z189so403603wmb.1;
	Fri, 14 Oct 2016 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B2odsCCPn+NxhD8thmiTyO8LuFige2UckOi7obB8tUw=;
	b=PvzsT1vFFoVz50O/s3yc5JwrqjBRUVCc9v3zmKbvhWL33gK6zJR9pwehzRDkD4EeI5
	CkvGegV3GDh/g+XK3Nlq9l2JtgKsUMW76zuAGwP3HTNVL7UCd6PncfpVSV6rD3NmBuZ+
	0tjSXdbk15vSLH1ItUtR1TFgzPkZ1PGzsC5rCksPv6ekFzBagLJNEpiz7d1Svx234gts
	Qa59IQX9NVUD+dndC6RUkQ0A3yUS/ILlSYwFO5p5MHMyhSwSd+HwbIFQ0r3rwU6mJIdM
	kM6ZoHJnnr3POCcmYBouIHNsdXrfbsFiRK2+1tpOZt0I6JHNu6M+0n3hA/gHpF5wUSM3
	uNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B2odsCCPn+NxhD8thmiTyO8LuFige2UckOi7obB8tUw=;
	b=ffcFlX/oirP+rm13/vnaTsp3Z81HUTDuTrde5aHwPW565ocrmJheU56NVOs4zKZYg3
	4bYtyD0zwZMYj0L0olXEFMrvFI3AUO8lUtP6btJ+CyVYffHRj5pjY25Cv3WnycPX0ZbR
	T/pdgxYuEaK7ZNNmKHKJO/WgO7oFW7vLkJQUR5FHRprJwzY016Vuvbc1JXsdWlqkhNJd
	73Vbv38tdxAqf6Eu9R8wVzrfzQ0KrvGjGoY4lfM6FbgOzC+jkYMeHI/NpfhpyeFlBZcu
	B/1H+JDU+dfEBYavfE/gqZ6xhWaUEm3ORugX5bDon6GJjo2tSF2KRzMNJfvN6bXhMMWk
	1vNQ==
X-Gm-Message-State: AA6/9RkGWLeCU2CeTWYAgKfeijooKA0aypPnkCrZHPKXW42i8nQijvb1LDfvC0k6sX4F2Q==
X-Received: by 10.28.149.9 with SMTP id x9mr2219511wmd.121.1476460813638;
	Fri, 14 Oct 2016 09:00:13 -0700 (PDT)
Received: from localhost (host109-156-67-175.range109-156.btcentralplus.com.
	[109.156.67.175])
	by smtp.gmail.com with ESMTPSA id f2sm32646101wjr.2.2016.10.14.09.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Oct 2016 09:00:12 -0700 (PDT)
Date: Fri, 14 Oct 2016 17:00:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20161014160011.GJ3482@stefanha-x1.localdomain>
References: <20161011152012.3228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kr14OxHsRwZHHqxS"
Content-Disposition: inline
In-Reply-To: <20161011152012.3228-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] char.h: misc doc fix
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
X-List-Received-Date: Fri, 14 Oct 2016 16:00:27 -0000


--kr14OxHsRwZHHqxS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 07:20:12PM +0400, Marc-Andr=E9 Lureau wrote:
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/sysemu/char.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kr14OxHsRwZHHqxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYAQELAAoJEJykq7OBq3PIgvsIAJmPXsWPN25IpTWbjRObVlX3
OGNJDmTZJAc4CD3n3P8Mv1xTc2gzDZqDXJWOjVlg1sXSIlyHpaFpJCDpKfvKWT2k
oZ1KfUmWz+i4uVSHpFVJ1wHXEuqo4KRgJbkBu52m0u3c9ur3xceyhBo2Y4iE10PT
VbHOSJmmZB3vrl1XaxV+A2s+rg/kQUf+Co3bfxl5pjJDyen4pSS85pXl4Wybf2Kz
1Kuz6kA7+a7+3jofW5ALHzG0HmmkV7Uua4Pk8pd7TjOsSSREu+CgHgQwduEsOWNw
RDj+uCI3HFqQU7XP1mTlCXl6B5p6NxmS10GiCBoYwVTfj8WqqCsb00PTEgTXuow=
=0Ooj
-----END PGP SIGNATURE-----

--kr14OxHsRwZHHqxS--

