Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9dcq-0001B6-Ku
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 12:08:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1V9dcg-0000ys-9q
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 12:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1V9dcY-0006kA-B4
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 12:08:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1V9dcQ-0006iA-0g; Wed, 14 Aug 2013 12:08:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7EG8FN7016312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 14 Aug 2013 12:08:15 -0400
Received: from [10.3.113.47] (ovpn-113-47.phx2.redhat.com [10.3.113.47])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7EG8EjA009524; Wed, 14 Aug 2013 12:08:14 -0400
Message-ID: <520BAB6E.4050806@redhat.com>
Date: Wed, 14 Aug 2013 10:08:14 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Taimoor Mirza <taimoor.mrza@gmail.com>
References: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
	<1376427925-26767-1-git-send-email-tmirza@codesourcery.com>
	<520AA338.2010408@redhat.com>
	<CAO6-N=biX38qFJjH5OjUE=XXnB22k+igutDq+gzhhd=kP6XBLA@mail.gmail.com>
In-Reply-To: <CAO6-N=biX38qFJjH5OjUE=XXnB22k+igutDq+gzhhd=kP6XBLA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0n3Vhc8J1nxmc4XuVPad4JbelLllOT37F"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Taimoor Mirza <tmirza@codesourcery.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Port redirection
 option behave differently on Linux and Windows
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
X-List-Received-Date: Wed, 14 Aug 2013 16:08:43 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0n3Vhc8J1nxmc4XuVPad4JbelLllOT37F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/14/2013 09:49 AM, Taimoor Mirza wrote:
> On Wed, Aug 14, 2013 at 2:20 AM, Eric Blake <eblake@redhat.com> wrote:
>> On 08/13/2013 03:05 PM, Taimoor wrote:
>>> From: Taimoor Mirza <tmirza@codesourcery.com>
>>>
>>> port redirection code uses SO_REUSEADDR socket option before binding =
to
>>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux=
=2E
>>> Relaunching QEMU with same host and guest port redirection values on =
Linux
>>> throws error but on Windows it does not throw any error.
>>> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/=
2013-04/msg03089.html
>>
>> When resending a patch, please use a v2 in the subject line (git
>> send-email --subject-prefix PATCHv2), send as a top-level thread, and
>> include a changelog after the --- divider that explains what changed
>> from v1.  See http://wiki.qemu.org/Contribute/SubmitAPatch for more hi=
nts.
>=20
>=20
> Thanks Eric. Should I resend with changelog of v2 and v2 in subject lin=
e?

Yes, doing so will give it better visibility.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--0n3Vhc8J1nxmc4XuVPad4JbelLllOT37F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJSC6tuAAoJEKeha0olJ0NqWyMH/iHd9IP5DbXa5s5GDKY67Vm1
tHUTBHPwxE6OHmVIsVkKKYHadLAuGC9DOo1sFeWM7sUJclk4x72KoSh1VdI/tytt
BnicxtMXOokFuBL+jhgNtil/CVokBTcumZifQxuJWQuabugKCqpAtnhyeyWkLdMB
AdShV/m+IUgnxNbR35nMC6ahW+nFYK4A3icMmHzT5TOtTk5ok/rc4qdec31o6Kfz
//MHfOGXE8aE/PdAgEZdWMS4PaF8El39D/pDeHqCj4Q1t/hwkuMFNktfzIZWOZOI
egnGs1282Igdxz2sCJ/hx4ShpAtsSHyQFe/h2+akgCs98mIG9c9CqEO9Mb6y29Y=
=Kf8e
-----END PGP SIGNATURE-----

--0n3Vhc8J1nxmc4XuVPad4JbelLllOT37F--

