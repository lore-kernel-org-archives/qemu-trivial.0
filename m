Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anU5n-000269-1E
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 12:44:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1anU5k-000225-NG
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 12:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1anU5j-0002iw-JO
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 12:44:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1anU5e-0002hO-1r; Tue, 05 Apr 2016 12:44:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9551C78222;
	Tue,  5 Apr 2016 16:44:28 +0000 (UTC)
Received: from [10.3.113.124] (ovpn-113-124.phx2.redhat.com [10.3.113.124])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u35GiRmX013738; Tue, 5 Apr 2016 12:44:27 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, qemu trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
References: <1459838127-32288-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<57036822.9070501@cn.fujitsu.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5703EB6B.1050705@redhat.com>
Date: Tue, 5 Apr 2016 10:44:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <57036822.9070501@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="bnt5NO8tj8OOil3s9GoLDGCG2WDhPqSG8"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Wen Congyang <wency@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [PATCH] tests: ignore test-logging
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
X-List-Received-Date: Tue, 05 Apr 2016 16:44:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bnt5NO8tj8OOil3s9GoLDGCG2WDhPqSG8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/05/2016 01:24 AM, Changlong Xie wrote:
> On 04/05/2016 02:35 PM, Changlong Xie wrote:
>> Commit 3514552e added a new test, but did not mark it for
>> exclusion in .gitignore.
>>
>> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>> ---
>>   tests/.gitignore | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/.gitignore b/tests/.gitignore
>> index b7bf13e..898a35f 100644
>> --- a/tests/.gitignore
>> +++ b/tests/.gitignore
>> @@ -70,5 +70,6 @@ test-xbzrle
>>   test-netfilter
>>   test-filter-mirror
>>   test-filter-redirector
>> +test-logging
>>   *-test
>>   qapi-schema/*.test.*
>>
> It seems we should keep items in order, so
>=20
> From a6d9e3aeaee66941613ebed312ee7a1b0e80bcc3 Mon Sep 17 00:00:00 2001
> From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> Date: Thu, 31 Mar 2016 13:52:35 +0800
> Subject: [PATCH] tests: ignore test-logging
>=20
> Commit 3514552e added a new test, but did not mark it for
> exclusion in .gitignore.

May be easier to resend this as a top-level v2 (or now v3), so that it
is easier for a maintainer to pick up.  But in any case, your v2 is:
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--bnt5NO8tj8OOil3s9GoLDGCG2WDhPqSG8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXA+trAAoJEKeha0olJ0Nq1oUH/jGdmmGzyQCJ3aYoTWgCMROA
rMmT1t1MuJY02EKY3SepxaX4g5nqXXXsAno4dPnOR0VviDUaZsBAhgNUsC0Bgsg2
uXZfqDq4r5YaG7R74PK3feJn8mflNzofJ70OqqD7egeyiSkZqlRypYeaf51x4RGM
C39vh4EFTuW0YJ4fY6l0s7DpyRaMwAEm12ZGSFkLB66zYf5hF9mS89fQyO0mk4VV
FO7+37mXeEBMAVI+8ob3gFf2/Cwe/FhRRfH5moZV2nAHcxaBYhqLCu8e3TFyuSAr
gD3XiCCAmvh6Je8O8Gh0/p7x7p1IRDuuHgopHHMMJ61LBrXq8ntZHe58QhvTydI=
=svpW
-----END PGP SIGNATURE-----

--bnt5NO8tj8OOil3s9GoLDGCG2WDhPqSG8--

