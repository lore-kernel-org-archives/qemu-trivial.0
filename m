Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeTPJ-0005LU-2Q
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 12:57:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UeTPB-00057N-V4
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UeTP7-0007yN-5N
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 12:57:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1UeTOv-0007wW-N1; Mon, 20 May 2013 12:57:33 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4KGvOSN008600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 20 May 2013 12:57:24 -0400
Received: from [10.3.113.113] (ovpn-113-113.phx2.redhat.com [10.3.113.113])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4KGvNcx006051; Mon, 20 May 2013 12:57:23 -0400
Message-ID: <519A55F3.8090101@redhat.com>
Date: Mon, 20 May 2013 10:57:23 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A522F.80305@redhat.com>
	<CAFEAcA_VhTQvsE-XYa4pFZBXJq1kyMeOTp8ccxcLtriQJre+OA@mail.gmail.com>
In-Reply-To: <CAFEAcA_VhTQvsE-XYa4pFZBXJq1kyMeOTp8ccxcLtriQJre+OA@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2RKGSLADFRWMBJSWMJLOW"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema.json: Reformat
 TargetType enum to one-per-line
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
X-List-Received-Date: Mon, 20 May 2013 16:57:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2RKGSLADFRWMBJSWMJLOW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/20/2013 10:47 AM, Peter Maydell wrote:
> On 20 May 2013 17:41, Eric Blake <eblake@redhat.com> wrote:
>> Yep, that raises (once again) the question of dynamic introspection -
>> there's a difference between the maximum amount of information known a=
t
>> compile time, and the subset of enum values that are actually usable a=
t
>> runtime.  This list is static (all known architectures)
>=20
> It's not really static though for practical purposes. The user
> still has to be able to cope with "I know about architecture foo
> but it's not in the list" (if talking to an older qemu) or
> "the list contains architecture bar which I don't know about"
> (if talking to a newer qemu). I think the only thing we really
> need to avoid is changing the name of an existing architecture?

I'm not talking about keeping the enum static as in unchanging in all
future qemu releases, so much as static in that "at the time qemu was
compiled, this was the list of architectures qemu knew about".  But what
good does it do to know what other architectures the compile-time qemu
knew about, when what we really care about is what does THIS qemu binary
emulate.  And Paolo raised the point that what we really care about is
static-per-binary - that is, each binary supports exactly one
architecture (unless you are doing a LOT of work to support multi-arch
emulation from a single binary!).

Changing the name of an architecture would be reflected by having a
different qemu-FOO binary name, right?  If that's the case, then
introspection of which architectures are supported is done by listing
all the matches to qemu-* in the directory where binaries are installed,
and we don't need a QMP enum duplicating what the file system already
tells us.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2RKGSLADFRWMBJSWMJLOW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRmlXzAAoJEKeha0olJ0NqYxwH/3xY/FGqDFnpAo5msw6GWJEA
1FaSBqhYcH45PfXX4EI7gpfWV7fmZHBWS2gRYjgSEGQeCD4TzjL5werjVgOiZakQ
oKKaG0qmtXYnx5GFwHlRUrBdJ6GJCID/kdhmJC/zQWIrZ9gv6QviReBWSvlYdb7O
7SDOZbZsXAWyt1Ajmpu0yDgE3xHmvRyU9TyoJncGqMD26oarwgjRIR4VxhBsBESl
mdKHyY5ZPny2VsiW+wLeOL9cnklzvtWYae575GAihV+rBPsr2+N2lGo3uInA5Djx
7LX/LCD6fsBZdKTnXmNWWI0XWTBMdE7S5f4z3D71e35oWuriXL9qQGlULZOUzlg=
=mwN2
-----END PGP SIGNATURE-----

------enig2RKGSLADFRWMBJSWMJLOW--

