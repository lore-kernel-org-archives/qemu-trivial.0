Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJiTh-0008C6-E4
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 08:25:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XJiTZ-0008AN-J3
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XJiTT-0005c6-E4
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:25:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1XJiTT-0005bv-6P; Tue, 19 Aug 2014 08:25:15 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7JCP7Fx027819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 19 Aug 2014 08:25:07 -0400
Received: from noname.redhat.com (ovpn-116-99.ams2.redhat.com [10.36.116.99])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s7JCP4FC003274; Tue, 19 Aug 2014 08:25:05 -0400
Date: Tue, 19 Aug 2014 14:25:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140819122504.GE4638@noname.redhat.com>
References: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20140819115823.GD4638@noname.redhat.com>
	<53F33DE0.9040700@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <53F33DE0.9040700@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	Li Liu <john.liuli@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/vvfat.c: remove
 debugging code to reinit stderr if NULL
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
X-List-Received-Date: Tue, 19 Aug 2014 12:25:28 -0000


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 19.08.2014 um 14:06 hat Eric Blake geschrieben:
> On 08/19/2014 05:58 AM, Kevin Wolf wrote:
> > Am 18.08.2014 um 13:41 hat Michael Tokarev geschrieben:
> >> Just log to stderr unconditionally, like other similar code does.
> >>
>=20
> >> =20
> >> -DLOG(if (stderr =3D=3D NULL) {
> >> -    stderr =3D fopen("vvfat.log", "a");
> >> -    setbuf(stderr, NULL);
> >> -})
> >> -
>=20
> >=20
> > This specific patch isn't as trivial as it might look at the first
> > sight (in other words: it's wrong). The part that you probably missed is
> > that stderr isn't the real one when DEBUG is set:
> >=20
> >     #undef stderr
> >     #define stderr STDERR
> >     FILE* stderr =3D NULL;
>=20
> Eeek, that's horrible.  I'd rather see code doing freopen("vvfat.log",
> "a", stderr) than the current horrid mess of redefining stderr away from
> its normal meaning.

I'd vote for just removing this redefine in addition to removing the
above hunk, so that everything ends up on the real stderr. But you have
to do the whole thing and not just half of it.

Kevin

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT80IgAAoJEH8JsnLIjy/WC5cP/2Gt/wOniKg3neshpbevwS6c
21rmv8juY3GFZLHVsRCjXke+PpGK86Wk1C4+LEtNSydn1WRZapJy9YX6NDJg2C+Q
/RQptHe4tqupf+WnfgmfJYsJsAaZbCML6UrPE6eaeuXXJRgJ5grf/9O1FcwM7Td6
aoe8sIsQDVIV6qwcYP/538Q3IJ0hD/KAfjexTr9G2dyLYxUhWpGIKzViHbvetGL2
63U/Ap6+7ZTUFBsREOd+cDAheT3uYzVqotj66fzwZHg6kQzJUx0A/5WXI/35EqLd
4E48dWBjggoGp3Xq8GaiZs1oK+l5XWx5t/UbFALug16J7GkmczWxz2+3OeaC6N0k
rJcCf3XewMPxNOo/RNTVc8eZtk9kqq4m/M9YMqwBXKowAmV3LMnYn0/ONRMohcQ7
U4WEzeWJtcdvnZ52ldiPN1xEK1M4o+siR+D8gNym4XilBECNidTFstigX0+v/Dk5
2xfGmtliM5iWj4+Pd2fXsapUHYC3bXaoEsc9VM72DUnEJlKFAuQuhc9BAs+/w2lx
oSxvTsvd6QxJGT5IAxuc5W1RRFwsQLAZPDYmDuWhCUHDRevF2EpWIm69+0cr7HmP
7YoaoyeTJoUDDpt4mC0kh4S6MRbgSuNgQZRDPMxdaiHPvEVKkhk4ZHPhaku0KRD4
B/rwKGndP3Gl/4ZyoLBL
=QlOD
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

