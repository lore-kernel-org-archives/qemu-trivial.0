Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7sS5-0001GZ-It
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 18:47:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1b7sS3-0001Dy-L1
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 18:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1b7sS1-00006S-NW
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 18:47:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1b7sRv-00005I-7b; Tue, 31 May 2016 18:47:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A06081105;
	Tue, 31 May 2016 22:47:46 +0000 (UTC)
Received: from localhost (ovpn-112-38.ams2.redhat.com [10.36.112.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VMli7d031971; Tue, 31 May 2016 18:47:45 -0400
Date: Tue, 31 May 2016 15:47:42 -0700
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Cc: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Fam Zheng <famz@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Message-ID: <20160531224742.GH24392@stefanha-x1.localdomain>
References: <1464600491-23340-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline
In-Reply-To: <1464600491-23340-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 May 2016 22:47:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] iostatus: fix comments for
 block_job_iostatus_reset
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
X-List-Received-Date: Tue, 31 May 2016 22:47:56 -0000


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 30, 2016 at 05:28:11PM +0800, Changlong Xie wrote:
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>  include/block/blockjob.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXThSOAAoJEJykq7OBq3PIJ4IH/0EbqMSybI+YzPxdOdjwE2pO
R4zW8s3bdL2L0olnhNRZDAP7a874/si50DYi1TTEH2zr2KxyXCsBauL5+GZOrIbY
nO9/MfcWzbryWaZsCxJq2n7vOhG4OqBOgEe8SHrhiDgrLcNsRMNmFH6bczm5Jc7R
2vMKDL8WuY1wayzvG43OGTu+TZSrbJzaFyOwGMds955nt4Tp0Cub1aen4CGC86dG
7w7nh/g8QWwTsqqor8pxgoT9QTNNR5ZUaS6VLw707GxI/v7jk69vjjrChyJ/N954
kNN+ikHsDC03bH3CCSDvoG7HNeEOl8xitCQuz/ZEBdJrg0bOCfc7k6SJliZ3rZs=
=c8cm
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--

