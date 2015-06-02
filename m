Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YznLD-0007fX-Cf
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 10:38:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YznL7-0007UU-D8
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 10:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YznL2-0007Jl-LK
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 10:38:49 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:33062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YznKv-0007HX-Iz; Tue, 02 Jun 2015 10:38:37 -0400
Received: by wiwd19 with SMTP id d19so21526120wiw.0;
	Tue, 02 Jun 2015 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G61GfNLdFYqCNki9zwGxYhX8+79ENyFScotfeGIoL8Q=;
	b=qdzwBHxO6as/3IhkVB0ZOriYFdl8SjB9kq45KiLl4ycC/MQ/8/i6HQiqBMi0EFc7OX
	3gYTMUtx4ymGh1OFDDPzw9YdVP710/HkqIzxyDoqTLT715Qk9jX4kDEyaE3xlmMWvIXf
	tlCyE5GcBDpeZPDEXqVA2rYrOaYR628C6Q6CZ5Ii78YX66WsAV/VvxDmPXGdNebVv9hV
	ZFCQxoQ8a5o99D2XngiOgY/kgIpSU3JnaVnnGQ3kwYr8PC+mHx+hffaPJhJIWPbHUvO5
	6SmlLG8Zvzg9px75Bzxspl8ajs2D+inEGUyM4k2boKYaPlrvBdaB+l4G+epdBaChUEKT
	jjgg==
X-Received: by 10.194.5.103 with SMTP id r7mr50206052wjr.47.1433255916585;
	Tue, 02 Jun 2015 07:38:36 -0700 (PDT)
Received: from localhost (host109-158-220-195.range109-158.btcentralplus.com.
	[109.158.220.195]) by mx.google.com with ESMTPSA id
	ju2sm21965099wid.12.2015.06.02.07.38.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jun 2015 07:38:35 -0700 (PDT)
Date: Tue, 2 Jun 2015 15:38:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
Message-ID: <20150602143828.GA8199@stefanha-thinkpad.redhat.com>
References: <1432894567-12554-1-git-send-email-chenhanxiao@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <1432894567-12554-1-git-send-email-chenhanxiao@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/writing-qmp-commands:
	fix a typo
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
X-List-Received-Date: Tue, 02 Jun 2015 14:38:54 -0000


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2015 at 06:16:07AM -0400, Chen Hanxiao wrote:
> s/interation/iteration
>=20
> Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
> ---
>  docs/writing-qmp-commands.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVbb+3AAoJEJykq7OBq3PIuIcIAKEPdIuywoqqTkWzLMMtpOH+
J37ZA25AdCgoAiCDtpSWq6Ugo0Mcl3iIdY2QjYxRWZVq6fUVboVAdz1mw/2ng9tx
KIujy8s8DVy1xwHyz4MeM6Q/m494+8Eh63ukUmrgj8v8B1LidfHJAdj/RQx0g0M7
rzu49wUZgowhdEWcJ8V1vB87Wa0e/XocGe0UZ73LbKxSn9GeHTKiEShst9saAmB/
WMaKWx/OauhhycuqREHHG54+Au4tNripAnTPfDCNbGeX7v8rn3kLJfkmlWOa+Aqn
Gc2kbO/60AqVgS5S2b9ksX92LuYJ1H59qUtw7Xf0vvjeOlnoff96jM0ItT2AZaE=
=w2gM
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

