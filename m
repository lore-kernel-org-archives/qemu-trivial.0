Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcnKB-0004zG-0K
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 23:26:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcnK4-0004ru-FF
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcnJz-0006X6-IA
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:26:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XcnJn-0006WH-2J; Fri, 10 Oct 2014 23:26:07 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9B3Q2MG003940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 10 Oct 2014 23:26:02 -0400
Received: from [10.3.113.64] (ovpn-113-64.phx2.redhat.com [10.3.113.64])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9B3Q24P031822; Fri, 10 Oct 2014 23:26:02 -0400
Message-ID: <5438A349.9090403@redhat.com>
Date: Fri, 10 Oct 2014 21:26:01 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>	<54389FB1.8040207@huawei.com>
	<5438A223.2040402@huawei.com>
In-Reply-To: <5438A223.2040402@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="j1j57A6oxkKNOqBq4MSuP6AgjBPfnNjEt"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
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
X-List-Received-Date: Sat, 11 Oct 2014 03:26:29 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--j1j57A6oxkKNOqBq4MSuP6AgjBPfnNjEt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/10/2014 09:21 PM, Gonglei wrote:

>=20
> Actually, I had noted that C standard says it is a no-operation.
> But that doesn't mean that every C-library handles it like that.

EVERY libc that is C89 compliant handles it like that.  The last
platform that failed on free(NULL) was SunOS 4, which is such
museum-ware it's not funny.  There is no need to cater to platforms from
25 years ago.

> Some people saw crashes for free(NULL), so it's best to avoid
> calling the free in the first place (caller) or using  g_free() in qemu=
_vfree().

Absolutely not.  g_free is unsafe to use except for pointers from
g_malloc, which is NOT the case that qemu_vfree is used on.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--j1j57A6oxkKNOqBq4MSuP6AgjBPfnNjEt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUOKNJAAoJEKeha0olJ0NqxEYH/2o34zhb+9uiAMNzK8GjSsET
hecaFPBawd0VASl5WRK4KAWPp5I2RnzSUuLnYVBcwx2mlXptUfyvB59StxbvuL9V
jz2IPQvMlq4ybk7sUSdlvCe2XbHOFuIVnshuCZ+zT+wRBOK+b+jjbulIypLVV7RN
4zVIRZAzC73vSnIboLNtcSixlxkKTm8nrYQ7/bPVc89jvaJVB1YLX86OJwosWO9w
17rq6aSOPGRZMUM4PaNLll3QlpuOdxhcfD2Ed9mS1YSQ2KPsV/wFVUrRSBflcynw
vnGPmDD5AJu75ffA6WxYohIyUCFqOwO4U179kZMb+HzSb2oWvZOK9Ygo3gBZJE8=
=FCg5
-----END PGP SIGNATURE-----

--j1j57A6oxkKNOqBq4MSuP6AgjBPfnNjEt--

