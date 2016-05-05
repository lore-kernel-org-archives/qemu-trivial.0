Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayN3V-0006y0-1c
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2016 13:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ayN3M-0006cy-3s
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 13:27:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ayN3A-0005tt-H7
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 13:27:02 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:36251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ayN2r-0005c8-MO; Thu, 05 May 2016 13:26:38 -0400
Received: by mail-wm0-x233.google.com with SMTP id n129so29081066wmn.1;
	Thu, 05 May 2016 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k8exVuyGjADqFM22HGzgi7XxXKs2B/9LJz8bwAEUHXc=;
	b=BArnvVfJvc63hcSRN1KnNav0QiYA0b9Ab3icsxXh9kLhw4ZnmwAA89UuE7/CazTNxD
	gPm/+tl8LLfEn+CyEvtMGRnruP2KO7e99kWhgkQyG9so9xpZ/71qrKaKwonIGnTWl4uq
	iZsQXUmmSCNhfkkFELg2ZUjrRCXh5YLhoMd4uU6OqxxIdJ1a5PnyQ9Sd98eRHFaWRqqz
	MMZL8smBz38NTDet6zup529PI1QuG+pw+uy+6DnFTCRas3KTtjzFgx7z/sKTAkJq5Ain
	CYwjv+7qdIAouLw/pocdvLvpCluJC3n8b/mbSlzvJodS2QW+owln4stLdPdJcZfxy0Dh
	qskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k8exVuyGjADqFM22HGzgi7XxXKs2B/9LJz8bwAEUHXc=;
	b=db0mL+PIEjrLZWXMCNdjV5k7sb4X17qQqtY6UBCkLQsR7B5ltyJqyYXOm1VsRwv9dq
	yA0ug4m7GnsJWc/Ki5rIerRNIOctea0fUO1SdKSjMJ1qL43qh2dNxsjSKIZHfkqy2UUb
	yaubmAuzzpZe5jYR2g5re0eQ/gfWCShcVfll2blDxU6VjASTlYSRc9iNCOcVWOYMEd+x
	aNzYMB2jEZ/5NBfBMphOHKPfsJGSZJySeRmqB3fw/WodMZ+31taj7ZCOvv7TnlvwvYXH
	01OCT6MbMNUIcE5vHHT2CzIEiilbgCaGug7OhOG0fLFxDwaEx2k5+tLq3ESM5+5SbaiD
	1tIw==
X-Gm-Message-State: AOPr4FVHpInRBunqEdZx5bAO3AeZPQm20j5iHUn6vNrtT0fU04yj7lBepa6lHykr7bapvw==
X-Received: by 10.28.48.145 with SMTP id w139mr4421978wmw.51.1462469165178;
	Thu, 05 May 2016 10:26:05 -0700 (PDT)
Received: from localhost (host109-156-67-28.range109-156.btcentralplus.com.
	[109.156.67.28]) by smtp.gmail.com with ESMTPSA id
	s6sm10755493wjy.31.2016.05.05.10.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 10:26:04 -0700 (PDT)
Date: Thu, 5 May 2016 18:26:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Md Haris Iqbal <haris.phnx@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160505172602.GB14181@stefanha-x1.localdomain>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-Devel] [PATCH] Changed malloc
 to g_malloc, free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Thu, 05 May 2016 17:27:14 -0000


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 24, 2016 at 12:02:03AM +0530, Md Haris Iqbal wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  linux-user/qemu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXK4IqAAoJEJykq7OBq3PIlu0IAL84xq+LzstLL5Ib4brWGzjr
SoMZ2f4CJVpjWR+Qg9Ma/bXRpnPYKh6Y9wgUfAgurTyR2rfyxtD4G1Nxkk0/lBMg
4J1GMDSodhQ+vOglAuv8yugDZPk1+xcoGWYo2QXw6CFSDZBKafAQf7RIkIoHBAyD
eEKq+jaWU3TVRnFRc/c4xTM/nkhvxOhmXnGbx1fm5jnSdZfvjCzRn9/EXSrLWlTs
FGliosDa1VE3zumdZakAWb6QoOKC0hz7VhlPvTSVENcK23Ko54hI2V3Sh/ALC4tc
aFGMAK950DF7AsXK6o7pcuv/vNWI7TevVBdh3FUdmimq1hYSHtGjbNUe7LT4LFc=
=u1tj
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--

