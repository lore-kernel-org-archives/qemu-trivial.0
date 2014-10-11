Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcncW-0008Jz-W2
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 23:45:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcncQ-0008GM-M4
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:45:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcncL-0003ef-Oi
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:45:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XcncB-0003XW-L0; Fri, 10 Oct 2014 23:45:07 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9B3j0Ik014852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 10 Oct 2014 23:45:01 -0400
Received: from [10.3.113.64] (ovpn-113-64.phx2.redhat.com [10.3.113.64])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9B3j0jv032161; Fri, 10 Oct 2014 23:45:00 -0400
Message-ID: <5438A7BB.3060109@redhat.com>
Date: Fri, 10 Oct 2014 21:44:59 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
	<54389FB1.8040207@huawei.com> <5438A223.2040402@huawei.com>
	<5438A349.9090403@redhat.com> <5438A4E2.4090007@huawei.com>
In-Reply-To: <5438A4E2.4090007@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RKpAk1L6s1SGpufk4xEt784Ij14vp179x"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: change free to
	g_free
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
X-List-Received-Date: Sat, 11 Oct 2014 03:45:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RKpAk1L6s1SGpufk4xEt784Ij14vp179x
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/10/2014 09:32 PM, Gonglei wrote:

>>> Actually, I had noted that C standard says it is a no-operation.
>>> But that doesn't mean that every C-library handles it like that.
>>
>> EVERY libc that is C89 compliant handles it like that.  The last
>> platform that failed on free(NULL) was SunOS 4, which is such
>> museum-ware it's not funny.  There is no need to cater to platforms fr=
om
>> 25 years ago.

>=20
> But why some callers make a check,
> but some other callers don't do this check?

Because some people haven't learned that free(NULL) is safe yet.  You're
welcome to simplify code as you touch it.

> Can I consider those check is superfluous?

Yes.  Checking for NULL before calling free() or g_free() is wasted effor=
t.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--RKpAk1L6s1SGpufk4xEt784Ij14vp179x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUOKe7AAoJEKeha0olJ0NqtIAIAJhW8iKEHtOlXAN9Y2Hzoddj
iTRoXoHUcTWc0xcR11mgataCd957UpaAwVdW7+YYrrqFF0eeNFdE3uZMUzme03Qc
5PkJhPgMR9ov5DHmJC4WVVgE0GB05dA0mTe4W6NDlXcQedszf+E4/Du0ifcNZeng
pfx28wkIrg59QQw+eKR41zVpFXV/WbcPW4rInFvjdHsqQpVsRNY1VPiDw8Gct74l
AiQ/n821HZHwbDqgGQpfs1A7NfRq/yUJ7OpvXCydCWArlpcNGvREgb16zS/O6gJf
AqovQVdxKNtClVbOt3nTnwjcYfp9oKk2CkeXCs+hfg72gDzoIXW/qirSjNfmtpE=
=TpgY
-----END PGP SIGNATURE-----

--RKpAk1L6s1SGpufk4xEt784Ij14vp179x--

