Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6tel-0003Fe-LH
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 03:29:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e6tej-0003E8-5j
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 03:29:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e6tei-00047Z-90
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 03:29:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1e6ted-00044Q-OM; Tue, 24 Oct 2017 03:29:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9AD17EA8E;
	Tue, 24 Oct 2017 07:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B9AD17EA8E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from localhost (ovpn-116-163.ams2.redhat.com [10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F4825C544;
	Tue, 24 Oct 2017 07:29:34 +0000 (UTC)
Date: Tue, 24 Oct 2017 08:29:33 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20171024072856.GY18285@redhat.com>
References: <20171023213359.23025-1-f4bug@amsat.org>
	<20171023213359.23025-4-f4bug@amsat.org>
	<20171023213732.GX18285@redhat.com>
	<4a8ab2c3-0576-9c8e-d6c7-8353337fdbe1@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4a8ab2c3-0576-9c8e-d6c7-8353337fdbe1@amsat.org>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 24 Oct 2017 07:29:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 3/3] vl: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Tue, 24 Oct 2017 07:29:46 -0000

On Mon, Oct 23, 2017 at 11:33:31PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Richard,
>=20
> On 10/23/2017 06:37 PM, Richard W.M. Jones wrote:
> > The series fixes the build for me, thanks :-)
>=20
> Good, does this mean I can add your Tested-by: tag?

Sure,

Tested-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rj=
ones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/

