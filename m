Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e8K0W-0004iF-VZ
	for mharc-qemu-trivial@gnu.org; Sat, 28 Oct 2017 01:50:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e8K0T-0004fg-KJ
	for qemu-trivial@nongnu.org; Sat, 28 Oct 2017 01:50:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1e8K0S-0000fb-Mp
	for qemu-trivial@nongnu.org; Sat, 28 Oct 2017 01:50:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1e8K0N-0000bA-DC; Sat, 28 Oct 2017 01:49:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E59354E90D;
	Sat, 28 Oct 2017 05:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E59354E90D
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.23] (ovpn-120-23.rdu2.redhat.com [10.10.120.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C7468F48A;
	Sat, 28 Oct 2017 05:49:54 +0000 (UTC)
To: Zach Riggle <zachriggle@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
	<CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
Date: Sat, 28 Oct 2017 07:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="G1jk8dkvPQnhlteKMkI7Jxu0iEk1JgwSu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 28 Oct 2017 05:49:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Sat, 28 Oct 2017 05:50:07 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G1jk8dkvPQnhlteKMkI7Jxu0iEk1JgwSu
Content-Type: multipart/mixed; boundary="Fs8frFcQ3VTtebqdV5ToaR64fISjFiVph";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Zach Riggle <zachriggle@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Message-ID: <2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] linux-user: fix is_proc_myself to check
 the paths via realpath
References: <20171024230758.31779-1-riggle@google.com>
 <20171025033442.44872-1-zachriggle@gmail.com>
 <CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
 <20171027093600.GA29513@kos.to>
 <CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
 <CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
In-Reply-To: <CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>

--Fs8frFcQ3VTtebqdV5ToaR64fISjFiVph
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/27/2017 09:07 PM, Zach Riggle wrote:
> Another case that may be more relevant for general QEMU use, is that th=
e
> current code fails if the software under test has poor path-handling co=
de.
> For example, any of
>=20
> - //proc/self/maps
> - /proc//self/maps
> - /proc/self//maps
>=20
> Will all return the non-emulated results.  Those examples are just path=

> canonicalization issues and could be resolved with e.g.
> canonicalize_file_name, but I'm not sure if QEMU allows GNU extensions =
--
> and realpath() is portable.

By definition, in linux-user, we ARE using glibc; therefore, you are
free to use all GNU extensions.

And you'd be surprised at how many non-glibc implementations of
realpath() are not POSIX-compliant, even though that is not relevant here=
=2E

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Fs8frFcQ3VTtebqdV5ToaR64fISjFiVph--

--G1jk8dkvPQnhlteKMkI7Jxu0iEk1JgwSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAln0EkUACgkQp6FrSiUn
Q2q9eAf8D5opCz0OcGhDUH0DcNAsN7GMC70YfRczq7L90OsT44LXI0hkQYgFBZ+H
1YYl2f2vPt2BBpfzZyFdmkI6qDeP4F8sOfOq/YOFHaoOUtIh64HRNyKwMGF7Nx7p
oxkLJoFFPbK6wVsn9Dx1CaTC1k44n0bICc3LcmeuHcPfKlhuZaEQ50PkSYChqC5o
HuqFcOtMUUZ708lguw6ceKRkAtOj3UDaQplhc37RXuGK/kQWRKkpSCm3cCfu//DR
E39GWbjVMet5AHPCue4GrXFNb6vUTTOH/Cde1R0htwyV1lpeDgeHke+TpuaUfDah
o0e+Zf1pQ1VibaMR5B/z/J6d9hvltg==
=GYoB
-----END PGP SIGNATURE-----

--G1jk8dkvPQnhlteKMkI7Jxu0iEk1JgwSu--

