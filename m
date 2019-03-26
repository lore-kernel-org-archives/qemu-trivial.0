Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8hIh-00028a-L2
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 04:19:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h8hId-000201-Gl
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 04:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h8hHo-0004c5-8e
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 04:18:21 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1h8hHm-0004bV-UV; Tue, 26 Mar 2019 04:18:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id v14so11807099wmf.2;
	Tue, 26 Mar 2019 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ol2Z5lr7/k60c8Jy1gdlKAAf0k0ifaDTPrG17y3vnBQ=;
	b=oLiDH02F79skWrUf8TqHEAU+JqgWkR2OSXnC7IT3kUQkWhcIGex96LrTSdKMe3pMBc
	BRIzPTVO5P0DCMLcgs/bcomoBLFkOnboKTa9xO1EkXif3tmMFHrPKPiyu8y6oQZN6nVp
	IMIaYVaxHavYFubjE0ywQ+GzWHH8rhpUZhgD5NhHpfkLdPKoL3CYeVPxw0pWIeqsWW6a
	rx62pgZFSux/GBW2Wt7tRIOeQNilwTxut7/TyZc0dRxOwoRI3cADpcWuPdLxKIzCd3KS
	7ua8/BvMZQcSuwZS7Brr8WYZ8Xs13oNEPsXpMbcKHJQmRZMvDOSOrfxAWLdbX3kJ8KrS
	9cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ol2Z5lr7/k60c8Jy1gdlKAAf0k0ifaDTPrG17y3vnBQ=;
	b=M/E7jJ1hxGNtNIPb3jLwSbJyrdahvwqd0DmFum9A8B5wzCRGVhdLzQT0B1nEUQ8txD
	sJgDcHO5VquebSiyqWa58vNUgb07eLvZh/alRA3PO3uEGnGXBCT+KI80SIr7XvGDvjWL
	OVXC19A3a1QoCNi+tcGWXbPeN3VNPI3jL1eL5IYrphmz8lWeYYXvfO85SfIeV43nx6XH
	PJ4bQVWjn0CrYZJySn3x9EfpTjMFTDHCO6XH9G2x0NioHZWSRwzg0S2JZ+0VaY4ZLn3N
	JhI7S/R1mac2aQy4AHYdeCWEXrJHywLBGJTDc7FpSEorU7mhoRB1oloxZEiF/8akMSLi
	bNaw==
X-Gm-Message-State: APjAAAUqENpgBL9CdNOi9L2clQExBhWNQjDoNQt5Gs+/rbOC2pCCeGH+
	7+aWRP7Obry97hNvE0V8v8I=
X-Google-Smtp-Source: APXvYqy7mfln+fSUdN9V6ZHRKy7OuGTiAtG97G9wG+/oAFR0Vex+zGSmAjRf9pRB5vVkO9wFWVM2lw==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr5432632wmh.128.1553588296892; 
	Tue, 26 Mar 2019 01:18:16 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id 66sm1923501wmd.3.2019.03.26.01.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 01:18:15 -0700 (PDT)
Date: Tue, 26 Mar 2019 08:18:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jafar Abdi <cafer.abdi@gmail.com>
Cc: qemu-devel@nongnu.org, jusual@mail.ru, qemu-trivial@nongnu.org
Message-ID: <20190326081814.GF21018@stefanha-x1.localdomain>
References: <1553351197-14581-1-git-send-email-cafer.abdi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline
In-Reply-To: <1553351197-14581-1-git-send-email-cafer.abdi@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-trivial] [PATCH V2 0/4] fix usage of bool
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
X-List-Received-Date: Tue, 26 Mar 2019 08:19:12 -0000


--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2019 at 05:26:33PM +0300, Jafar Abdi wrote:
> Clean up wrong usage of FALSE and TRUE in places that use "bool" from std=
bool.h.
>=20
> FALSE and TRUE (with capital letters) are the constants defined by glib f=
or
> being used with the "gboolean" type of glib. But some parts of the code a=
lso use
> TRUE and FALSE for variables that are declared as "bool" (the type from <=
stdbool.h>).

CCing qemu-trivial

> Jafar Abdi (4):
>   authz: fix usage of bool in listfile.c
>   tests/libqos: fix usage of bool in pci-pc.c
>   tests/libqos: fix usage of bool in pci-spapr.c
>   hw/tpm: fix usage of bool in tpm-tis.c
>=20
>  authz/listfile.c         | 2 +-
>  hw/tpm/tpm_tis.c         | 4 ++--
>  tests/libqos/pci-pc.c    | 2 +-
>  tests/libqos/pci-spapr.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.7.4
>=20

--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcmeBGAAoJEJykq7OBq3PIIg4H+QEMB/51G42n4ARf2R2S+wD7
fDdly5LX56kF6hcTheq6PGmBr6DGNtKVDS1PtrAfuKJ0dcZK6RDxoIZD6fpwsVag
jeI1KVLeGkRS+yZv4/WGIA3SFrNvbKht+AONKvZB+oXW1x/aEjrjjNMWfUYs9S7d
7onzBLndz2qy8sJ2Mk3O/djC7p45UoUalmZS/GjMQwWyHfkkZUKLM2Pc9/PvFSZf
xT01xhp6NNJHCpKoqBLMkBmh41h44zfshZhBWvl+p3Bk+Q2xQ4bUGxnAMp4eDLS3
gdbiap/8d2Q0PnHhGaKQswDTsmI6GeUVy6DXrKRRdLzSOeVL+ewKa/h8A52ngPk=
=qCg8
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--

