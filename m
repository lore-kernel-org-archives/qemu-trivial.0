Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0VlA-0003Ta-Mq
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 11:09:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b0Vl7-0003Nh-If
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 11:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b0Vl3-00051X-D2
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 11:09:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b0Vkg-0004lx-2V; Wed, 11 May 2016 11:08:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7339381114;
	Wed, 11 May 2016 15:08:41 +0000 (UTC)
Received: from [10.36.112.83] (ovpn-112-83.ams2.redhat.com [10.36.112.83])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4BF8a3O025327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 May 2016 11:08:38 -0400
To: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
	<20160510160438.GD28315@chrystal.uk.oracle.com>
	<8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
	<5732FD8C.1080106@redhat.com> <57333CEB.7050705@redhat.com>
	<E93C6545-4622-4E30-BE81-7B6E9B6DE219@alex.org.uk>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57334AF0.1020501@redhat.com>
Date: Wed, 11 May 2016 17:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <E93C6545-4622-4E30-BE81-7B6E9B6DE219@alex.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dwRDvh8eG1W9riKfLSbOenwdx8x8o7K2t"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 11 May 2016 15:08:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Wed, 11 May 2016 15:09:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dwRDvh8eG1W9riKfLSbOenwdx8x8o7K2t
Content-Type: multipart/mixed; boundary="IlMAfjpadfvtaS5xlMdTu4K26Msnk0vpu"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Message-ID: <57334AF0.1020501@redhat.com>
Subject: Re: [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard commands with a
 length bigger than NBD_MAX_BUFFER_SIZE
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
 <5731E99C.3000108@redhat.com>
 <3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
 <5731FE53.6010602@redhat.com>
 <672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
 <20160510154545.GB28315@chrystal.uk.oracle.com>
 <592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
 <20160510160438.GD28315@chrystal.uk.oracle.com>
 <8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
 <5732FD8C.1080106@redhat.com> <57333CEB.7050705@redhat.com>
 <E93C6545-4622-4E30-BE81-7B6E9B6DE219@alex.org.uk>
In-Reply-To: <E93C6545-4622-4E30-BE81-7B6E9B6DE219@alex.org.uk>

--IlMAfjpadfvtaS5xlMdTu4K26Msnk0vpu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 11/05/2016 16:55, Alex Bligh wrote:
>> > Then I think I will propose a doc patch to the extension-info branch=

>> > that adds new INFO items for NBD_INFO_TRIM_SIZE and
>> > NBD_INFO_WRITE_ZERO_SIZE (if requested by client and replied by serv=
er,
>> > then this can be larger than the normal maximum size in
>> > NBD_INFO_BLOCK_SIZE; if either side doesn't request the info, then
>> > assume any maximum in NBD_INFO_BLOCK_SIZE applies, otherwise UINT32_=
MAX;
>> > and the two infos are separate items because NBD_FLAG_SEND_TRIM and
>> > NBD_FLAG_SEND_WRITE_ZEROES are orthogonally optional).
> mmmm ...
>=20
> at this rate you'd be better with a list of command / maximum size
> tuples!

Not sure if serious or not, but anyway I think enumerating the items
individually should be enough.  It's not like commands grow on trees. :)

Paolo


--IlMAfjpadfvtaS5xlMdTu4K26Msnk0vpu--

--dwRDvh8eG1W9riKfLSbOenwdx8x8o7K2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXM0rwAAoJEL/70l94x66DdvIH/0CnQHo9azF9q2ejGNMjU4YT
WSdBIWzC/8fspQVNNCe0k5NrbdCDQrsiC+AGXJDCnF9UEL6+BfCEu+qO27MBZEHn
WJJj35zULHw187/DE2xPqOHDhDcwIML0wRtj2BQ4K6LWIOr0Y6gtEDl9rcbdRVH8
AoELGZpxP7te+AFYvxqP2JQ9OKRI+HWrxK79o9VrtXdK0ulqyxAxcCInilI4yc8g
UwDa8r7vT9Q7Q7TutdbeSdtzlPyJ9gQasMq21ui5wFcYZIKehLweU7QZAF8ZrELG
zdPnNZ8ujA1S5Ve0ZY6EWmLMVHVio5eILhFXplpgGdeCscPuvG4PvBxEzqMqiP0=
=7kIK
-----END PGP SIGNATURE-----

--dwRDvh8eG1W9riKfLSbOenwdx8x8o7K2t--

