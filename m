Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f9Bw7-00059E-En
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 11:57:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f9Bw5-00057A-8H
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 11:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f9Bw3-0005oJ-Eb
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 11:57:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50320 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f9Bvx-0005jo-60; Thu, 19 Apr 2018 11:57:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B00DEC00F;
	Thu, 19 Apr 2018 15:57:16 +0000 (UTC)
Received: from [10.10.123.194] (ovpn-123-194.rdu2.redhat.com [10.10.123.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97E3910F1C0A;
	Thu, 19 Apr 2018 15:57:13 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180419132026.5494-1-kraxel@redhat.com>
	<20180419132026.5494-2-kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <8fc65111-4c2f-9e07-3e4a-c95a6d52b29f@redhat.com>
Date: Thu, 19 Apr 2018 10:57:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419132026.5494-2-kraxel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="kP2csZIYcM4GbRuLNlJnkdAEM3L3ZRC4P"
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 19 Apr 2018 15:57:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 19 Apr 2018 15:57:16 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] ui: add qapi parser for
 -display
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
X-List-Received-Date: Thu, 19 Apr 2018 15:57:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kP2csZIYcM4GbRuLNlJnkdAEM3L3ZRC4P
Content-Type: multipart/mixed; boundary="ifCTXcIHIs5r79RXOwkcIMvaymx1ihGqH";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8fc65111-4c2f-9e07-3e4a-c95a6d52b29f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/4] ui: add qapi parser for -display
References: <20180419132026.5494-1-kraxel@redhat.com>
 <20180419132026.5494-2-kraxel@redhat.com>
In-Reply-To: <20180419132026.5494-2-kraxel@redhat.com>

--ifCTXcIHIs5r79RXOwkcIMvaymx1ihGqH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/19/2018 08:20 AM, Gerd Hoffmann wrote:
> Add parse_display_qapi() function which parses the -display command lin=
e
> using a qapi visitor for DisplayOptions.  Wire up as default catch in
> parse_display().
>=20
> Improves the error message for unknown display types.
>=20
> Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' =
}"
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---

> +
> +    /*
> +     * We don't have any dynamically allocated stuff inside
> +     * DisplayOptions, so we can simply copy the struct content and
> +     * free opts without ending up with pointers pointing into
> +     * nowhere.
> +     */
> +    dpy =3D *opts;
> +    qapi_free_DisplayOptions(opts);

That's risky; would it be better to use QAPI_CLONE_MEMBERS() to not have
to worry about if we add a pointer in the future?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--ifCTXcIHIs5r79RXOwkcIMvaymx1ihGqH--

--kP2csZIYcM4GbRuLNlJnkdAEM3L3ZRC4P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrYvFkACgkQp6FrSiUn
Q2okGQf/afP7Qpp7Y8rUfXFAJmkSPKUDbGcasIZGdWvLZvg9koCOPe8K66ssNyBT
KTYXHziiJWUc94n58T7imIGtgIxeDeXaImTl+7QQYFX0IvRMVh3b0vA2XJat4niX
qFTqQN/5yv51m+FG3So14lpIfScrCSIA+TDLjbuR5fgizsa2mFqvOQKchMfP9zd0
4lUFTnZoWWWYwVFlKnTtP9tU02XJp2Rw2Nz+XikCgaa3C+14lIGZ3ZbUfb/tfMnW
Oc/hsdpo2XNV4CmK/AaM4qmTZ9hcri/RbR320jVxiFugBBeCWSNgezbxXgNSP5w4
SqYt1yE+OgKLWbeLQ/q/MPR/MqekmA==
=v0va
-----END PGP SIGNATURE-----

--kP2csZIYcM4GbRuLNlJnkdAEM3L3ZRC4P--

