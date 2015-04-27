Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmnlK-0007tk-Lk
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 14:28:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YmnlH-0007nx-S3
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 14:28:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YmnlH-0004jQ-0V
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 14:28:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YmnlB-0004ic-Tf; Mon, 27 Apr 2015 14:28:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 58FF48EB3B;
	Mon, 27 Apr 2015 18:28:01 +0000 (UTC)
Received: from [10.3.113.161] (ovpn-113-161.phx2.redhat.com [10.3.113.161])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3RIS0vw001856; Mon, 27 Apr 2015 14:28:00 -0400
Message-ID: <553E7FB0.1020404@redhat.com>
Date: Mon, 27 Apr 2015 12:28:00 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>	<1430153133-30988-5-git-send-email-cota@braap.org>
	<CAEgOgz5LL=9EChHirsppPBVqP4vM2td5ZMdm+1g_tAsTo2WejQ@mail.gmail.com>
In-Reply-To: <CAEgOgz5LL=9EChHirsppPBVqP4vM2td5ZMdm+1g_tAsTo2WejQ@mail.gmail.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Lf7M4OOqQLTeXlKG85PJijnDqDp4umTsL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/6] gitignore: ignore
	*.patch files
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
X-List-Received-Date: Mon, 27 Apr 2015 18:28:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lf7M4OOqQLTeXlKG85PJijnDqDp4umTsL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/27/2015 12:11 PM, Peter Crosthwaite wrote:

>> +++ b/.gitignore
>> @@ -62,6 +62,7 @@
>>  *.fn
>>  *.ky
>>  *.log
>> +*.patch
>=20
> This Issue is discussed and I think it was concluded to not gitignore
> patches. See:
>=20
> commit f3a22014e94dfaacb57277dafce66b41cd994869
> Author: Michael Tokarev <mjt@tls.msk.ru>
> Date:   Thu Jun 6 01:14:54 2013 +0400
>=20
>     gitignore: unignore *.patch

You can always ignore them locally:
echo '*.patch' >> .git/info/exclude

without requiring everyone to ignore them (I actually like seeing them
show up, to know when I have not yet hit send on a series).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Lf7M4OOqQLTeXlKG85PJijnDqDp4umTsL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVPn+wAAoJEKeha0olJ0NqXwgH/jMsxhUH6oEpM4gdV5x4ZThW
YUXoWecCSMB8O/ANH3/3kNXExQJ35Xqc3UuUZSX+vKW9yLDGBPUKdmfgFKVpT9vw
x2SIofVw//+DJ4ruZPmCRmHJqS8oeaitzGwCOlm1Q2471MVfBLzlgXNZ1UunRoCn
roryJ8P7/i3hokk/i5wMdzVee8IVVBysqJtKCtdgIavj/C2iXWHdYx+yhXftHGFn
lAHgAA5RC174OANHVyuD9kWQApiQuepLCMI45T06qsjmX6KECIThPVvTWbD2VeMl
ZkHpRt/8hke3ThkXq5XvFvR1MdRtCLWBsl8z4Qv/eOhdOR/2q/hVaB7IuUQjGR8=
=7iwk
-----END PGP SIGNATURE-----

--Lf7M4OOqQLTeXlKG85PJijnDqDp4umTsL--

