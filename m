Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1avNJ0-0002Qb-RR
	for mharc-qemu-trivial@gnu.org; Wed, 27 Apr 2016 07:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1avNIt-0002C0-Bs
	for qemu-trivial@nongnu.org; Wed, 27 Apr 2016 07:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1avNIs-0005Jn-Aq
	for qemu-trivial@nongnu.org; Wed, 27 Apr 2016 07:06:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1avNIl-0005HU-5R; Wed, 27 Apr 2016 07:06:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 770264DAF8;
	Wed, 27 Apr 2016 11:06:38 +0000 (UTC)
Received: from [10.36.116.94] (ovpn-116-94.ams2.redhat.com [10.36.116.94])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RB6Z1j005663
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 27 Apr 2016 07:06:37 -0400
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Max Reitz <mreitz@redhat.com>
Message-ID: <57209D3B.3040707@redhat.com>
Date: Wed, 27 Apr 2016 13:06:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="iKw6fHQMgv7ui2ldUeUKHUO3qxpcSha7o"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] iotests: fix the redirection
 order in 083
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
X-List-Received-Date: Wed, 27 Apr 2016 11:06:53 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iKw6fHQMgv7ui2ldUeUKHUO3qxpcSha7o
Content-Type: multipart/mixed; boundary="pqKpck5lOQe4DfuLCsKh1MBKWbJdSIPWq"
From: Max Reitz <mreitz@redhat.com>
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <57209D3B.3040707@redhat.com>
Subject: Re: [Qemu-devel][PATCH] iotests: fix the redirection order in 083
References: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
In-Reply-To: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>

--pqKpck5lOQe4DfuLCsKh1MBKWbJdSIPWq
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

On 26.04.2016 12:13, Wei Jiangang wrote:
> It should redirect stdout to /dev/null first,
> then redirect stderr to whatever stdout currently points at.
>=20
> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> ---
>  tests/qemu-iotests/083 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my block-next tree:

https://github.com/XanClic/qemu/commits/block-next

Max


--pqKpck5lOQe4DfuLCsKh1MBKWbJdSIPWq--

--iKw6fHQMgv7ui2ldUeUKHUO3qxpcSha7o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIJ07AAoJEDuxQgLoOKytZL4IAIzc15vjB8emXUNeNSdmem4W
C0ICwI9XR7yL/kVLY84yImIy0iS1eXBbYWhiCzENSzPcTKOCqJ4+qnQl27dpifno
RNsfpNFHCK1Bj5ElpiSMzmWhn4GU/NPAyuNkpMTMLJW6GPqxAqw6fnFeuW7RSmZa
1By/okls8yqQ1UYq+0ltNoVTRSrWhhCqL/roJKIrjGzj362FMeEOcZK/dccu5Afw
w7GK9EHuiFyMYTkH+RAxfjOy2jSTLq5SysWv5bO4geXJKWCISw+DhwRlp1rotDu+
rYrKBmaAWULUqqF83rsvRbluYagCuSCyupZl37Ge2ALjJNbEO3T9P7WwN0Phgag=
=O1yD
-----END PGP SIGNATURE-----

--iKw6fHQMgv7ui2ldUeUKHUO3qxpcSha7o--

