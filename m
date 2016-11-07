Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3mcR-0002rU-Kg
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 11:17:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c3mcP-0002pe-27
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 11:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c3mcO-0001sR-4d
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 11:17:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1c3mcH-0001or-2y; Mon, 07 Nov 2016 11:17:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB5C74DAF7;
	Mon,  7 Nov 2016 16:17:46 +0000 (UTC)
Received: from [10.3.116.189] (ovpn-116-189.phx2.redhat.com [10.3.116.189])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7GHj29025787; Mon, 7 Nov 2016 11:17:46 -0500
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Changlong Xie <xiecl.fnst@cn.fujitsu.com>, qemu devel
	<qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
References: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<CAJ+F1CJxcgTOroM3Oy=bSLP0PrxS=uBBD3k8iZnvZ2riJsqRJg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b701e086-c769-8055-1943-0a2b3e0bbf31@redhat.com>
Date: Mon, 7 Nov 2016 10:17:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJxcgTOroM3Oy=bSLP0PrxS=uBBD3k8iZnvZ2riJsqRJg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RhqroT4rgOu3nPi7CQqTGlREF5eR7wH5v"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 07 Nov 2016 16:17:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: Ignore
 test-char
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
X-List-Received-Date: Mon, 07 Nov 2016 16:17:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RhqroT4rgOu3nPi7CQqTGlREF5eR7wH5v
Content-Type: multipart/mixed; boundary="dFRK8iSminlC5F9FGoX2tBuScclVvpCFG";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Changlong Xie <xiecl.fnst@cn.fujitsu.com>, qemu devel
 <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Message-ID: <b701e086-c769-8055-1943-0a2b3e0bbf31@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] tests/.gitignore: Ignore test-char
References: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
 <CAJ+F1CJxcgTOroM3Oy=bSLP0PrxS=uBBD3k8iZnvZ2riJsqRJg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJxcgTOroM3Oy=bSLP0PrxS=uBBD3k8iZnvZ2riJsqRJg@mail.gmail.com>

--dFRK8iSminlC5F9FGoX2tBuScclVvpCFG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/07/2016 05:01 AM, Marc-Andr=C3=A9 Lureau wrote:
> On Mon, Nov 7, 2016 at 8:52 AM Changlong Xie <xiecl.fnst@cn.fujitsu.com=
>
> wrote:
>=20
>> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>>
>=20
> Introduced in commit  ea3af47d7
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Marc-Andr=C3=A9, do you still want to pursue your patch that auto-generat=
ed
tests/.gitignore, so we don't have to keep doing these cleanups?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--dFRK8iSminlC5F9FGoX2tBuScclVvpCFG--

--RhqroT4rgOu3nPi7CQqTGlREF5eR7wH5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYIKkpAAoJEKeha0olJ0NqElsIAIdghOjGuJUfbldFQbUSKJsR
7Lgy/pSfIv+1c0eVrRgMODeSYChtEBNpK4qufQR+tf0pL4i3CDgLggxyLhFydYcv
ikdMgv/F6D1AQsgnmuXVzsUU72OuWrp2y7KL/xRnws0+GaBNWxIfasIHpiRBYjTC
ca01x/lAOxRuI2GtD348/dZULnmhiGm2ICXaS1x5/ZXGjgzfjYSVqMm4ypJ7ycm7
1fdDWjFhTJi/z1ho/FmHw6Sjcj9QuPYee2zgBdn/ujH2I6fyuiIr+PQnlWU1x0WC
MmLeYCUpkc2vHhFDHy/9+w5qOLEKSKFb9FPh8P8DOn4ZBPV90KmWDM85H0XeCfM=
=//Fu
-----END PGP SIGNATURE-----

--RhqroT4rgOu3nPi7CQqTGlREF5eR7wH5v--

