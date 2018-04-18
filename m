Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8p3y-00077M-N0
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 11:32:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8p3u-00075k-Jd
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 11:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8p3t-0008An-KC
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 11:31:58 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::3]:12484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8p3t-000891-2M; Wed, 18 Apr 2018 11:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524065514;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=aznttYjhnu4p0KLyvJcPoLjhAJkmHRLTyslUdOrSes8=;
	b=Iy1vUyNCJYPD85dlReYnzWLDX6ODFxmlC6H/oAhtUqXOm1kOuT+ohFb8WFANYiD60f
	0Hvm/mGlVIRtrOFyvjHaCG/opUNleR5N8LWOmBHtcI53v7rx0jqAlSfvSeu0CjwhGrxF
	Bv5KRqSisJv94jA4PY3AbWMLFW/va2py9Pwph7eIgs14cd18Sl1LWEOUQoOM0iVBw/6U
	mZeudSSJbKJSg0jgJkKfAysuBheFgw6fRtKppIDkG+bqdbU+NjrYdWrLKmipeEwmls6O
	gVt0/sR71ss7acAaOS0b+J3uSjCP+6AUxb28qBLTxJy/z16bOEv67ZRHdcHG1X2x0f9L
	lc8w==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3IFVq74Z
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 17:31:52 +0200 (CEST)
Date: Wed, 18 Apr 2018 17:31:47 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418173147.07667af9.olaf@aepfle.de>
In-Reply-To: <7df49e91-aa65-d775-78eb-ddf53676dd7f@redhat.com>
References: <20180418145443.6332-1-olaf@aepfle.de>
	<7df49e91-aa65-d775-78eb-ddf53676dd7f@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/L+9nLjUvlY6X99WXlriIkU8";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::3
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: require
 glib-2.24 on Linux
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
X-List-Received-Date: Wed, 18 Apr 2018 15:32:01 -0000

--Sig_/L+9nLjUvlY6X99WXlriIkU8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Apr 2018 10:04:03 -0500
schrieb Eric Blake <eblake@redhat.com>:

> Rather than hacking configure, why not fix util/vfio-helpers.c to avoid
> g_realloc_n()?  We've done it before; see commit 071d405

I can not really test it, this variant may work:

--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState=
 *s,
=20
     assert(index >=3D 0);
     s->nr_mappings++;
-    s->mappings =3D g_realloc_n(s->mappings, sizeof(s->mappings[0]),
-                              s->nr_mappings);
+    s->mappings =3D g_renew(IOVAMapping *, s->mappings, s->nr_mappings);
     insert =3D &s->mappings[index];
     shift =3D s->nr_mappings - index - 1;
     if (shift) {
@@ -577,8 +576,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IO=
VAMapping *mapping,
     memmove(mapping, &s->mappings[index + 1],
             sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
     s->nr_mappings--;
-    s->mappings =3D g_realloc_n(s->mappings, sizeof(s->mappings[0]),
-                              s->nr_mappings);
+    s->mappings =3D g_renew(IOVAMapping *, s->mappings, s->nr_mappings);
 }
=20
 /* Check if the mapping list is (ascending) ordered. */

Olaf

--Sig_/L+9nLjUvlY6X99WXlriIkU8
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtdk4wAKCRBdQqD6ppg2
fu8wAJ0ZBInqugyq1jo6DcMEMqwmuHFdDACgn0trvyOVOYzsCHN/fsFeLvrT5pA=
=vguH
-----END PGP SIGNATURE-----

--Sig_/L+9nLjUvlY6X99WXlriIkU8--

