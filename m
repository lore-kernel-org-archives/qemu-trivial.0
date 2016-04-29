Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1avwhf-0003ER-6q
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2016 20:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1avwhc-000391-9G
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2016 20:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1avwhZ-0002ly-44
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2016 20:54:40 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1avwhY-0002lp-VW; Thu, 28 Apr 2016 20:54:37 -0400
Received: by mail-qk0-x242.google.com with SMTP id l68so3517577qkf.3;
	Thu, 28 Apr 2016 17:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version; 
	bh=SXmwNmGkahNgMbFWt2qinUwOtF73Tk/zOn1CVYa+9J0=;
	b=PDDiw20AksIlsVjRpzV0QiKjrYZQLkYP7nqeOFRbWhZ59PBGnVU+Qsz43K7tSZ/1Gl
	b5BmFEjhFSlNrv0FeRIHpod3yETmluVPKQND7qwmmD7TaQhMfzCcFC18iwVuh19Ih0cj
	gRLYWu0aTLXrHPbJtS/VOTF1qbeZM8a48zPAgKPbqx248v/fasquDgRUEc2BLH5SbS5p
	5Az0tZD6WP4Zev3dE1AYrK6zexCXkX9Goa1n/p69cex0aLk7WJznCDgqNEAF3R9IFO/W
	elHF49PJPq8kUckHp7Vo81UTH8dVzkjfI9C769N/S3f8aecQJt/3UDW9yJTh7jqgOGa2
	a0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version;
	bh=SXmwNmGkahNgMbFWt2qinUwOtF73Tk/zOn1CVYa+9J0=;
	b=hB4y+em5XRmUFOiVT23K9tSke1TeFFbmYa8qhmdVsik3FVNaT2624FcDs0f0YBYdAd
	XdFViBu2KoIKhjyWOu7txmrZvLHA/iiM0/Fwy87dbKC+SYxztYqiwPS1/Y4Hut5Uvd/C
	IUA6N35FRHQJUcbpgi2ORa85rrKIaVLebUPri8c8GEo/YryS8Wb0Wqzqwt2i1fN0fIHm
	+IhjnlqsPFiXY05g6gOH5TX1I5cL0H9ZsndNjU5mlvKWCsCHtWl2A9OfEl6MDGwsJbJ5
	vEN2yQVezcRC2UHrkl+E+0Ak3/nC6FSEO/gpc04TPj/qia4mbRVuzotg3cMlT8pxqJ9V
	WoYQ==
X-Gm-Message-State: AOPr4FXjwe+tNAGmvZF6/CfLABgdSHQVZFuQD1UJXDAGPmrvhAmaDbsBSzpUDPmsfIMadw==
X-Received: by 10.55.18.12 with SMTP id c12mr17828653qkh.158.1461891276184;
	Thu, 28 Apr 2016 17:54:36 -0700 (PDT)
Received: from ulmo.home (ool-4a58cb9c.dyn.optonline.net. [74.88.203.156])
	by smtp.gmail.com with ESMTPSA id d6sm3656283qkb.13.2016.04.28.17.54.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Apr 2016 17:54:35 -0700 (PDT)
Message-ID: <1461891273.4403.1.camel@gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2016 20:54:33 -0400
In-Reply-To: <1460495386.7674.1.camel@gmail.com>
References: <1458436706-20743-1-git-send-email-jano.vesely@gmail.com>
	<1460495386.7674.1.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-H+4Qf6LAQ7bYL+b5feIr"
X-Mailer: Evolution 3.18.5.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Fri, 29 Apr 2016 00:54:41 -0000


--=-H+4Qf6LAQ7bYL+b5feIr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-04-12 at 17:09 -0400, Jan Vesely wrote:
> On Sat, 2016-03-19 at 21:18 -0400, Jan Vesely wrote:
> >=20
> > Fixes build with new linux headers.
> >=20
> > Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> > ---
> > linux-headers-4.5 and xfsprogs-3.2.4 in my case
> >=20
> > =C2=A0configure | 18 ++++++++++++++++++
> > =C2=A01 file changed, 18 insertions(+)
> >=20
> > diff --git a/configure b/configure
> > index b88d0db..bb64d6c 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4474,6 +4474,21 @@ if test "$fortify_source" !=3D "no"; then
> > =C2=A0=C2=A0=C2=A0fi
> > =C2=A0fi
> > =C2=A0
> > +########################################
> > +# check if struct fsxattr is available
> > +
> > +have_fsxattr=3Dno
> > +cat > $TMPC << EOF
> > +#include <linux/fs.h>
> > +struct fsxattr foo;
> > +int main(void) {
> > +=C2=A0=C2=A0return 0;
> > +}
> > +EOF
> > +if compile_prog "" "" ; then
> > +=C2=A0=C2=A0=C2=A0=C2=A0have_fsxattr=3Dyes
> > +fi
> > +
> > =C2=A0##########################################
> > =C2=A0# End of CC checks
> > =C2=A0# After here, no more $cc or $ld runs
> > @@ -5137,6 +5152,9 @@ fi
> > =C2=A0if test "$have_ifaddrs_h" =3D "yes" ; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0echo "HAVE_IFADDRS_H=3Dy" >> $config_host=
_mak
> > =C2=A0fi
> > +if test "$have_fsxattr" =3D "yes" ; then
> > +=C2=A0=C2=A0=C2=A0=C2=A0echo "HAVE_FSXATTR=3Dy" >> $config_host_mak
> > +fi
> > =C2=A0if test "$vte" =3D "yes" ; then
> > =C2=A0=C2=A0=C2=A0echo "CONFIG_VTE=3Dy" >> $config_host_mak
> > =C2=A0=C2=A0=C2=A0echo "VTE_CFLAGS=3D$vte_cflags" >> $config_host_mak
> gentle ping.
> the docs say trivial patches are collected every week. yet the last
> one
> was in Feb.
>=20

gentle ping v2. Is there a maintainer for configure? get_maintainer.pl
was not helpful.

Jan
--=-H+4Qf6LAQ7bYL+b5feIr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXIrDJAAoJEOCQZixVs7KBnM4P/3S1pEPbrPfyTQBIdWTh8Iuw
fzf1xLWfiT8leUmiZRFj2SUxlaODyr/bvAwk/2s5z4dTaGcr6eLRDo9gShjdEVEv
hmdfaW6TU03KcZ0uInDNlSBhxd3aCbYj+5urS31wI7b2kpzulWU2O2nl3xiROs+F
1GBdkzDLBlxF54LxIu7qDZX+vCYvYRHNnZ6PbEO0juYZNW9BjUa0iLLUpdoKIErA
1KrOhS21DDJ87zI9lzugPTxlHAg4cnwpM2BNQFn12HDN6Ua3nZMmVxaSqGwyBrIn
FBWBB3UDJgaqFl6uQqYfAQGP5oE+gFXOpk9ciJAMSstBKIoMCYdvQ5fq4mK9znVQ
uYxdpntxGDGbRZ3cwLSsqTAeMK7zlk/qWgJTFtkBF9XhA0wFr0gSrwAVWdsTF+cf
8OBI2iuaPveSXjiUmYbqw076r0HGtodXISeJLRyWaDgsfGOn3sb7FdTua4Te/byy
lLOopactZDmg6S7GtTiHPJehLru4wnDrefYgMeLR3EJ+0P74q/fRVsXlaDdgAypK
g06RQeIHAZwtyRWS8xhoC+VBZMOFu1vM5t5vYl51W22oW7yx8wo45xF+ZdTWbamX
clngv9eUFulz0iCVfvQBLQee74hSZY3TanN59yLb/SllafQR7n11kNupP+PLzxQ6
xXjEgcZAxHdHhp8ceMXf
=j8wu
-----END PGP SIGNATURE-----

--=-H+4Qf6LAQ7bYL+b5feIr--


