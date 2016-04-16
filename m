Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1arYR0-0008J1-20
	for mharc-qemu-trivial@gnu.org; Sat, 16 Apr 2016 18:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1arYQx-0008Dk-Ja
	for qemu-trivial@nongnu.org; Sat, 16 Apr 2016 18:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1arYQw-00046p-II
	for qemu-trivial@nongnu.org; Sat, 16 Apr 2016 18:11:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1arYQq-00046V-SR; Sat, 16 Apr 2016 18:11:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1CA581104;
	Sat, 16 Apr 2016 22:11:11 +0000 (UTC)
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3GMB9Ct018566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 16 Apr 2016 18:11:10 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>,
	qemu trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<1460699173-31401-3-git-send-email-xiecl.fnst@cn.fujitsu.com>
Cc: Wen Congyang <wency@cn.fujitsu.com>, Alberto Garcia <berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5712B87C.5070908@redhat.com>
Date: Sun, 17 Apr 2016 00:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1460699173-31401-3-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HSBVorpcJCKAFEJNh2TujnDDIaLUTeGJd"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v1 2/2] block: remove redundant stats of
 block_acct_start()
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
X-List-Received-Date: Sat, 16 Apr 2016 22:11:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HSBVorpcJCKAFEJNh2TujnDDIaLUTeGJd
Content-Type: multipart/mixed; boundary="4orHPmdF5KPAfQlAN5JUiEhQkXfCt8Eou"
From: Max Reitz <mreitz@redhat.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
 qemu devel <qemu-devel@nongnu.org>, qemu trivial <qemu-trivial@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Wen Congyang <wency@cn.fujitsu.com>, Alberto Garcia <berto@igalia.com>
Message-ID: <5712B87C.5070908@redhat.com>
Subject: Re: [PATCH v1 2/2] block: remove redundant stats of
 block_acct_start()
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
 <1460699173-31401-3-git-send-email-xiecl.fnst@cn.fujitsu.com>
In-Reply-To: <1460699173-31401-3-git-send-email-xiecl.fnst@cn.fujitsu.com>

--4orHPmdF5KPAfQlAN5JUiEhQkXfCt8Eou
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

On 15.04.2016 07:46, Changlong Xie wrote:
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>  block/accounting.c         |  4 ++--
>  dma-helpers.c              |  2 +-
>  hw/block/nvme.c            |  3 +--
>  hw/block/virtio-blk.c      |  6 ++----
>  hw/block/xen_disk.c        |  6 ++----
>  hw/ide/atapi.c             | 12 ++++--------
>  hw/ide/core.c              | 16 +++++++---------
>  hw/ide/macio.c             |  9 +++------
>  hw/scsi/scsi-disk.c        | 29 ++++++++++-------------------
>  include/block/accounting.h |  4 ++--
>  qemu-io-cmds.c             |  8 +++-----
>  11 files changed, 37 insertions(+), 62 deletions(-)

Without having looked too closely into each hunk, the patch itself looks =
OK.

But I'm not so sure whether we want it. Of course, it's obvious that the
parameter is not needed in a technical sense, but the question is why it
exists at all. It definitely wasn't forgotten at some point: Commit
5366d0c8 made the function take this parameter instead of a BDS and it
was totally obvious that it didn't make use of it at all. And this
wasn't something new, the BDS parameter before that commit wasn't used
either.

Every single function in block/accounting.c takes a BlockAcctStats
argument as its first parameter. It just so happens that this function
doesn't make use of it. But I think that was a conscious choice.

So if you had asked me before you wrote this patch, I would have said
that we don't need it. But now it's here, so the pain of writing it is
gone. I don't have a real preference either way. Both having that
parameter and not having it are valid choices which can be argued for or
against.

I'd like to say that my inertia is keeping me from applying this patch,
but I'd feel like a hypocrite for saying that, considering it would have
taken much less time than writing this response...

Max


--4orHPmdF5KPAfQlAN5JUiEhQkXfCt8Eou--

--HSBVorpcJCKAFEJNh2TujnDDIaLUTeGJd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXErh8AAoJEDuxQgLoOKytY/oIAIZk+WeEAzzdYNiiqoc/pxhH
RAw1pSyoCK+/Y9Z6TgIalPRzOVgC+sD8hEynZU/zj/NJMusU6z5+2Np6BoplhQV3
FEk+01hI9TymVQ0xkRtMpwiT6oVqSO15b+TmclEGAsP8K9fJXBOaBILec6PKctky
JebkZd2yeIgYa9o9ho862T5UieC7K9lv9aUHLAJrT2MSWR9LlPuad5zQgDMA+VTP
bv4wfmEhAv8C457dMvRN3bqW8rZtFSe135Sj7wzEwik9SzdQT89ohxzfFzcemFkX
0AdAGgefuPzan9/k1UNtsfLAf+BTizZLf+MpEKOwpYlrB6OZwLfQs6YmnXvnwMM=
=t/VH
-----END PGP SIGNATURE-----

--HSBVorpcJCKAFEJNh2TujnDDIaLUTeGJd--

