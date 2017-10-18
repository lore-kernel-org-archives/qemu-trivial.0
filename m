Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4q4s-0001a1-Dd
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 11:16:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1e4q4m-0001Xd-5w
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 11:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1e4q4l-00048v-41
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 11:16:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1e4q4g-00042q-7v; Wed, 18 Oct 2017 11:16:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4BB78553F;
	Wed, 18 Oct 2017 15:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E4BB78553F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=stefanha@redhat.com
Received: from localhost (ovpn-116-214.ams2.redhat.com [10.36.116.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D5F8721D2;
	Wed, 18 Oct 2017 15:15:57 +0000 (UTC)
Date: Wed, 18 Oct 2017 17:15:56 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>
Message-ID: <20171018151556.GA31848@stefanha-x1.localdomain>
References: <20171016202912.1117-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171016202912.1117-1-sw@weilnetz.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 18 Oct 2017 15:16:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] oslib-posix: Fix compiler warning and
 some data types
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
X-List-Received-Date: Wed, 18 Oct 2017 15:16:10 -0000

On Mon, Oct 16, 2017 at 10:29:12PM +0200, Stefan Weil wrote:
> gcc warning:
>=20
> /qemu/util/oslib-posix.c:304:11: error:
>  variable =E2=80=98addr=E2=80=99 might be clobbered by =E2=80=98longjmp=
=E2=80=99 or =E2=80=98vfork=E2=80=99
>  [-Werror=3Dclobbered]
>=20
> Fix also some related data types:
>=20
> numpages, hpagesize are used as pointer offset.
> Always use size_t for them and also for the derived
> numpages_per_thread and size_per_thread.
>=20
> Avoid a type cast by declaring addr volatile.

I dropped this outdated line when merging the patch.

>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> v2: Fix more data types (partially as discussed with Richard)
>=20
> v3: Keep volatile type cast (suggested by Philippe and Paolo)
>=20
> Regards
> Stefan
>=20
>  util/oslib-posix.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

