Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ufzgo-0006Z2-S9
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 17:38:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ufzgk-0006VY-Pu
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 17:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ufzgg-00052f-A5
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 17:38:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Ufzgg-00052a-20; Fri, 24 May 2013 17:38:10 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4OLc8f9015262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 24 May 2013 17:38:08 -0400
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4OLc6Vm014957; Fri, 24 May 2013 17:38:06 -0400
Message-ID: <519FDDBD.7030201@redhat.com>
Date: Fri, 24 May 2013 15:38:05 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com> <871u8zp34w.fsf@codemonkey.ws>
	<CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
	<87y5b7hyuo.fsf@codemonkey.ws>
In-Reply-To: <87y5b7hyuo.fsf@codemonkey.ws>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2UOFFUIDGOWADBPSTPTFB"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	John Rigby <john.rigby@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [libvirt] [Qemu-devel] [PATCH] qapi-schema.json:
 Reformat TargetType enum to one-per-line
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
X-List-Received-Date: Fri, 24 May 2013 21:38:17 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2UOFFUIDGOWADBPSTPTFB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/22/2013 08:29 AM, Anthony Liguori wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
>> On 22 May 2013 14:15, Anthony Liguori <aliguori@us.ibm.com> wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>> You
>>>> don't need to know what targets were supported in the version that y=
ou
>>>> compiled from.  Only one target is supported in this executable
>>>> anyway.
>>>
>>> It seems useful to me.  One day we may support multiple targets per
>>> executable.
>>
>> Why would you care about which architectures the executable supports?
>> What you actually want to know is which machine models are supported;
>> whether board foo happens to be ARM or PPC isn't really very interesti=
ng
>> IMHO.
>=20
> That's a very good point.  It was the libvirt folks that requested
> this.  Perhaps they can shed some light on the logic?

I think knowing the architecture (such as x86 vs. pseries ppc) is used
by libvirt to know what default devices the board supports (for example,
whether usb is present by default).  There's probably still room for
improvement for communication between libvirt and qemu on what exactly
is being supported, and knowing an architecture type may be too broad of
a knob compared to what is really wanted, except that I don't have a
good handle on what is really wanted.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2UOFFUIDGOWADBPSTPTFB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRn929AAoJEKeha0olJ0Nq0JYIAJVYmByS+92I9gYsoggDoFy/
7BM/b/6e/FB1VZROqEv1uLIN+hWmMCOGLO+jtElRyFEbtosegQUhRn4bC7jhpYEF
qJ0m7F5r/MkRUPI+1kBi8J+QuLBYla49L3pmg4+5T76uVCuIsVK+QlFMoAvMCw5y
0FW805jJTOob/Jcrj/+06RVv+m2ikFUaE6N9UxfbqCDRgyjkyaJAKxSTctgox+3x
vHKYYsJrkfX8D7VtJnppF6VMIMgVZMZ5wd7fprfT4x54YrqIfNNRFcuW5tgbxXwJ
LNVw6Yjd/4QeL6rKm492P4bThxRhvTbpwpweplJOP932Qm+j2WKnyom/VeNOF6g=
=ehm6
-----END PGP SIGNATURE-----

------enig2UOFFUIDGOWADBPSTPTFB--

