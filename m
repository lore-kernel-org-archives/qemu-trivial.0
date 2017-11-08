Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCGbB-0001A0-Sb
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 22:00:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eCGb9-00016l-Pj
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 22:00:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eCGb9-00079D-0x
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 22:00:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1eCGb4-00076K-Pq; Tue, 07 Nov 2017 22:00:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACDB86A7CD;
	Wed,  8 Nov 2017 03:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ACDB86A7CD
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B96CE5FFE4;
	Wed,  8 Nov 2017 03:00:05 +0000 (UTC)
Date: Wed, 8 Nov 2017 11:00:03 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20171108030003.GB2834@lemon>
References: <20171108024719.8389-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20171108024719.8389-1-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 08 Nov 2017 03:00:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docker: correctly escape
 $BACKEND in the help output
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
X-List-Received-Date: Wed, 08 Nov 2017 03:00:16 -0000

On Tue, 11/07 23:47, Philippe Mathieu-Daud=E9 wrote:
> In Makefiles the $ must be escaped as $$ in shell uses.
>=20
> Since 8a2390a4f47:
>=20
>  $ make docker
>      [...]
>      NETWORK=3D1            Enable virtual network interface with defau=
lt backend.
>      NETWORK=3DACKEND     Enable virtual network interface with ACKEND.
>=20
> Once escaped:
>=20
>  $ make docker
>      [...]
>      NETWORK=3D1            Enable virtual network interface with defau=
lt backend.
>      NETWORK=3D$BACKEND     Enable virtual network interface with $BACK=
END.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Queued, thanks!

Fam

