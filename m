Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cHtat-0007g3-Rx
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2016 09:34:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cHtao-0007au-34
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2016 09:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cHtan-0006nc-0V
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2016 09:34:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cHtaZ-0006ZR-1W; Fri, 16 Dec 2016 09:34:23 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DE4883F3E;
	Fri, 16 Dec 2016 14:34:21 +0000 (UTC)
Received: from [10.10.117.243] (ovpn-117-243.rdu2.redhat.com [10.10.117.243])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uBGEYJDv022596; Fri, 16 Dec 2016 09:34:20 -0500
To: QingFeng Hao <haoqf@linux.vnet.ibm.com>, qemu-block@nongnu.org
References: <20161216054723.96055-1-haoqf@linux.vnet.ibm.com>
	<20161216054723.96055-2-haoqf@linux.vnet.ibm.com>
Cc: cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
	"Qemu-devel@nongnu.org" <Qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b70a8f66-81e9-6e3b-0245-2eab3ec27d0f@redhat.com>
Date: Fri, 16 Dec 2016 08:34:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161216054723.96055-2-haoqf@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TQ3CF31PXsxWAXVg6AjXLmpP4OoUN1IVG"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 16 Dec 2016 14:34:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH v1 1/1] iotests: Fix a
 problem in common.filter
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
X-List-Received-Date: Fri, 16 Dec 2016 14:34:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TQ3CF31PXsxWAXVg6AjXLmpP4OoUN1IVG
Content-Type: multipart/mixed; boundary="CVrJPC1dB4LxE2DvlfGL4PtrGPrmu1w8r";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: QingFeng Hao <haoqf@linux.vnet.ibm.com>, qemu-block@nongnu.org
Cc: cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
 "Qemu-devel@nongnu.org" <Qemu-devel@nongnu.org>,
 qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <b70a8f66-81e9-6e3b-0245-2eab3ec27d0f@redhat.com>
Subject: Re: [Qemu-block] [PATCH v1 1/1] iotests: Fix a problem in
 common.filter
References: <20161216054723.96055-1-haoqf@linux.vnet.ibm.com>
 <20161216054723.96055-2-haoqf@linux.vnet.ibm.com>
In-Reply-To: <20161216054723.96055-2-haoqf@linux.vnet.ibm.com>

--CVrJPC1dB4LxE2DvlfGL4PtrGPrmu1w8r
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[adding qemu-devel, ALL patches should include the main list]

On 12/15/2016 11:47 PM, QingFeng Hao wrote:
> If TEST_DIR is set to /tmp, test case 144 will fail. The reason is that=

> TEST_DIR duplicates with 144's test image name tmp.qcow2.

s/duplicates with/resembles/

> when 144 is testing $TEST_DIR/tmp.qcow2, it wants to replace
> $TEST_DIR/tmp.qcow2 to TEST_DIR/tmp.qcow2, but actually it will fail
> and get TEST_DIRTEST_DIR.qcow2 in this case.
> The fix is just to modify the code to replace $TEST_DIR/ with TEST_DIR/=
=2E
>=20
> Signed-off-by: QingFeng Hao <haoqf@linux.vnet.ibm.com>
> ---
>  tests/qemu-iotests/common.filter | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/comm=
on.filter
> index 240ed06..d29e965 100644
> --- a/tests/qemu-iotests/common.filter
> +++ b/tests/qemu-iotests/common.filter
> @@ -35,7 +35,7 @@ _filter_generated_node_ids()
>  # replace occurrences of the actual TEST_DIR value with TEST_DIR
>  _filter_testdir()
>  {
> -    sed -e "s#$TEST_DIR#TEST_DIR#g"
> +    sed -e "s#$TEST_DIR\/#TEST_DIR\/#g"

Why do you need \/?  It should be sufficient to use / without escaping.

But overall I agree with including the / in the pattern.  It's too late
to include this in 2.8, but with the commit message grammar improved and
\ escape removed, I'm fine with:

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm also adding qemu-trivial in cc, in case we want to take it through
that tree instead of the usual qemu-iotests.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--CVrJPC1dB4LxE2DvlfGL4PtrGPrmu1w8r--

--TQ3CF31PXsxWAXVg6AjXLmpP4OoUN1IVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYU/trAAoJEKeha0olJ0NqQcAH/0/citGr1oIuV0fuVoHetev0
sDAI8T6J8zIMqZiCQ0zKz6oPcYWznwWor80a2Fg9/hZsohWxmnL/ZbzHngIyXlCR
bHpd/jYVAZy3qt03Mrkvs4aZTzIUU9psqR+QYb/LmarhCv+5kGWPnGFwZLkPn/29
HGVhJBvWIzv2xecckQapQcWz6DAwsGGLYuzrtL7B/ulm1e0IAXpBNrnkyi05X37W
O3QQdK4EWxMjxie1alnTdzFOmI6mx06+AAyDgxey1zxBMxi6kn9/5JanIoCFKi7j
DWxtzBiPUzWoyBtZPXbVqz8C/xBkQWNFuN9LWo+eOQn9XEZuVIsCIgH7726iGA8=
=7rJU
-----END PGP SIGNATURE-----

--TQ3CF31PXsxWAXVg6AjXLmpP4OoUN1IVG--

