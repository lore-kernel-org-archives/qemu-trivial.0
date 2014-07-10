Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X5ItN-0003wM-N3
	for mharc-qemu-trivial@gnu.org; Thu, 10 Jul 2014 14:16:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1X59Hs-0005on-Ti
	for qemu-trivial@nongnu.org; Thu, 10 Jul 2014 04:01:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1X59Hn-0000xp-A8
	for qemu-trivial@nongnu.org; Thu, 10 Jul 2014 04:01:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1X59Hb-0000x2-JY; Thu, 10 Jul 2014 04:00:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6A80hDM009919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 10 Jul 2014 04:00:43 -0400
Received: from noname.redhat.com (ovpn-116-64.ams2.redhat.com [10.36.116.64])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s6A80eB6013039; Thu, 10 Jul 2014 04:00:41 -0400
Date: Thu, 10 Jul 2014 10:00:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140710080039.GA3919@noname.redhat.com>
References: <1404915288-604-1-git-send-email-kwolf@redhat.com>
	<53BDEF3D.1000309@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <53BDEF3D.1000309@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, hutao@cn.fujitsu.com, qemu-devel@nongnu.org,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.1]
 test-string-output-visitor: Fix unterminated string
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
X-List-Received-Date: Thu, 10 Jul 2014 18:16:23 -0000


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 10.07.2014 um 03:41 hat Eric Blake geschrieben:
> On 07/09/2014 08:14 AM, Kevin Wolf wrote:
> > Don't forget to add a terminating '\0' or the test case will be randomly
> > failing. The broken code was added in commit b4900c0e.
>=20
> Sorry, but I prefer this solution better:
> https://lists.gnu.org/archive/html/qemu-devel/2014-07/msg01595.html

Fine with me, as long as my 'make check' gets fixed. :-)

Kevin

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTvkgnAAoJEH8JsnLIjy/WdPgP/3iWU/iXPYt1Hcf3t/chCvvV
YL1o7fhVnaju4yfM7/sshIqZjLGQdSW7XcUgcQnGPsr5ufFGnsJei5oTgSYOh8fG
aRXv0Ebxjo40ZGoKCYX7phy/YBbpBHJflNKaNIFdyh0y1ScP77Dza0pLRbOgFArC
8lDQ9rkfr/j4W3Z/u3hhIph94Wdsh+/hEQltf40gJHe56zuLahIMoN9hekbS7b7J
hiV+AQPtLbfN5+rjs8RloVRjmNqnPf3PjYZDi2Hyzwq/O91TT5jsBAySR8Rt2vD3
TyAi7j6drQ3watRroqIlw/x5CFbI4up5NhtI8dYCN7IeFXGxXvA8Ev0RPSLF+jcX
4HnFWAg7BzEohKbfED4KS2GabZLOgJDPFOh8Xa/FgMqvOykdEz4Jg54Nxo12jTa1
PZd9/yP53uMet5sMcQ+98KfXVlLgqla7yZP+tmUUZ7PyjUe/8bGaDH6hKZ3eClJJ
p2Hxm/iR+VhsuEUN1nWN0GX9Fpjuh4pYcHZ5iPX8JIU6oVO5q3xf9oSgnEQ98rCq
dtv3jigES3aGDGuHgpYgobb1uNebiZMf0YG7gvYadF7Iz3vkpJAlyM7c2yGyCfhk
lAzifTWgzWjd/PcDPFkQyLccaGN8aiJTROoSgUYm8bp4e6FFF9AtF9oi9kGlPkzJ
kjv8sWsvz8kZuR5shmt0
=cf+a
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

