Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw02r-0000vU-Pt
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 00:28:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1aw02n-0000jl-EG
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 00:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1aw02k-00020x-7V
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 00:28:45 -0400
Received: from mail-qg0-x244.google.com ([2607:f8b0:400d:c04::244]:33619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1aw02k-00020p-3m; Fri, 29 Apr 2016 00:28:42 -0400
Received: by mail-qg0-x244.google.com with SMTP id 90so895896qgz.0;
	Thu, 28 Apr 2016 21:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version; 
	bh=4RF8R9G0Q655MdO/JnVWfBfp3pVRkX0tDoyP0Gyanus=;
	b=WsSfEHygj29yQ8AuM5bKXs6+QPxEhXyOpA4FklyKL726tJndSKWFdPm6uvwlWQglVp
	NubxR4IEzsTu4f18OsMS2uHDMMKZra7doQu3i5FD+RqiuQ92klXsYwH3LK+Jfatfwx9r
	ixfBuBo2o9k9E+nb0bQMg5O6jv1Ivbrp2x6/+kNZvyCWo/ZsrXLgKMM4n67d5nAj9H8r
	wa3FIMU5Cofwoz3wMWeqymK5f4kie9xp76WGe36G69ObLrTbjIVs+CSWgia0R98rFAl9
	O9Pg0jIuUMt9tE9SAoQOiyhzU/dWjP+7FBi/oCjmdaIXusfEIcKkAS31ZjmIDYAkpUrE
	GIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version;
	bh=4RF8R9G0Q655MdO/JnVWfBfp3pVRkX0tDoyP0Gyanus=;
	b=kuNWiipM6j8KEK01wiZXQ0P+Uhqn8aAeZqACJuwxmEOsWvbW8xjaZ6yoNK/iohEwB9
	1M9qDp4HbY7sdXKtSOXabWXCVclO0FNNitXvZ5Cfw0J8tWgMAjKfz2y6+aTY02YYQveD
	8PAPWZjY1UKsAUbj/2dGdJk7VAGuJZuCHOsfQMGsEYwLjKheizmok6cZtQ8oGDtD4Zyq
	a0SVZRtwQY2ochgMRqnnpg1V4odhXbXVHT8yjsiD18vNqpW5lx47OqYcrOwRtAGe8nLs
	4yN0f6xWKlXQRKPZ3Vch+z2zP2b80vMOjOMWZMRtDjTV0lP33h8PCTwx0fHfz4lrwkp8
	RubA==
X-Gm-Message-State: AOPr4FXup5z/jRbtUBK/aIEoMBzkvypxctK4ies1VuqObgrowNcNtnINezomOV3q74h/Nw==
X-Received: by 10.141.46.71 with SMTP id x68mr18496881qhe.70.1461904121771;
	Thu, 28 Apr 2016 21:28:41 -0700 (PDT)
Received: from ulmo.home (ool-4a58cb9c.dyn.optonline.net. [74.88.203.156])
	by smtp.gmail.com with ESMTPSA id
	z66sm3902543qhc.16.2016.04.28.21.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Apr 2016 21:28:40 -0700 (PDT)
Message-ID: <1461904119.4403.13.camel@gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>
Date: Fri, 29 Apr 2016 00:28:39 -0400
In-Reply-To: <1458439134-28726-1-git-send-email-jano.vesely@gmail.com>
References: <1458439134-28726-1-git-send-email-jano.vesely@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3BFLUAZjtx3YPhqL97EJ"
X-Mailer: Evolution 3.18.5.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::244
Subject: Re: [Qemu-trivial] [PATCH] po/Makefile: call rm -f directly
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
X-List-Received-Date: Fri, 29 Apr 2016 04:28:46 -0000


--=-3BFLUAZjtx3YPhqL97EJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2016-03-19 at 21:58 -0400, Jan Vesely wrote:
> Default variables are undefined in rules.mak and this is what the
> rest
> of the build system uses.
> Fixes make clean in ./po/
>=20
> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> ---
> =C2=A0po/Makefile | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/po/Makefile b/po/Makefile
> index b271f79..7bab09d 100644
> --- a/po/Makefile
> +++ b/po/Makefile
> @@ -32,7 +32,7 @@ update: $(SRCS)
> =C2=A0build: $(OBJS)
> =C2=A0
> =C2=A0clean:
> -	$(RM) $(OBJS)
> +	rm -f $(OBJS)
> =C2=A0
> =C2=A0install: $(OBJS)
> =C2=A0	for obj in $(OBJS); do \

gentle ping
--=-3BFLUAZjtx3YPhqL97EJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXIuL3AAoJEOCQZixVs7KBN2IP/3+dwMAGGTb8TlM5Enanm1r7
THoDnaBtE9jIz8t4bpRfFF9/6kbjuTvSGNMo4314UbLhKH1tJCx64L8GmtZ27f6S
kQqxlHEC+Dxpno22YqLKAOzHa1rcIzohJ/kdPh+4DVCHo5Md6phNPCwsQ6B+r8YW
vnaUKzxWDc/GHB8bEUM0PYtoHhoB2HMUr5nqzGZYZLu8XQFz85SEkRbL2VfjFbzF
t7tyk8jD+RLhzLy5Kvzl19Da6tfnsmYtTY87a8lHAp23FBddqNcSpdwLBR0moVFQ
eNc1e/CMAL8CfdYy9E76IVEDGzqIpDyikrxVI4lJrYO8gfErg2u+RA+Apmzh3wrc
L+hTnju3X/IUomf83aPjgnjvg9aBu4ucmUdG5+pDkF/GQ8+cVc6blAkIBCXjiKAy
7n+dhk3vSie0m6ALDBvycT5VIyMfBdl9n8Z+rgUBUjoFV5Ca3Ege16Upk+2zS21v
Ywy3zuJ2rj3gqY4I6kc8mMV4kBAm5VuDiv/ngRzRNs0o+1sYLBOVNuoeAjieffNB
V3XmXouDQWksILJEIocGEUIGCKE51GMWchjEn8JVHBxCI2MSwuQaiMehy0ReGC1D
euACVj79xWEnNDAMH6/0Ui2R5QJKAUWza5pw/0t7iHnNRoleogUH2JAiI9Xh29ti
t0eRNL+O1+DSAxZbwipb
=WnXa
-----END PGP SIGNATURE-----

--=-3BFLUAZjtx3YPhqL97EJ--


