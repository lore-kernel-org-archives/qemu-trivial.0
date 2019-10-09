Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIEoa-0008JE-Lc
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 12:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIEoX-0008F9-M8
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 12:27:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIEoW-0001ds-Kn
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 12:27:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11189)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIEoS-0001cn-Eg; Wed, 09 Oct 2019 12:27:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94B4030013A1;
 Wed,  9 Oct 2019 16:27:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E61C60C63;
 Wed,  9 Oct 2019 16:27:42 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:27:40 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/4] iotests: trivial cleanups
Message-ID: <20191009162740.GH30349@localhost.localdomain>
References: <20190927141728.7137-1-crosa@redhat.com>
 <ac7839be-eea2-6fa7-eff5-146d2aedf059@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac7839be-eea2-6fa7-eff5-146d2aedf059@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 09 Oct 2019 16:27:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 16:27:51 -0000

On Mon, Oct 07, 2019 at 03:09:25PM +0200, Max Reitz wrote:
> On 27.09.19 16:17, Cleber Rosa wrote:
> > The most trivial set of cleanups to iotests common libraries and the
> > 044 test.
> >=20
> > Cleber Rosa (4):
> >   qemu-iotests: remove bash shebang from library files
> >   qemu-iotests: remove forceful execution success from library files
> >   qemu-iotests: 044: pass is actually a noop, so remove it
> >   qemu-iotests: 044: remove inaccurate docstring class description
> >=20
> >  tests/qemu-iotests/044            | 4 ----
> >  tests/qemu-iotests/common.config  | 5 -----
> >  tests/qemu-iotests/common.filter  | 5 -----
> >  tests/qemu-iotests/common.nbd     | 1 -
> >  tests/qemu-iotests/common.pattern | 2 --
> >  tests/qemu-iotests/common.qemu    | 2 --
> >  tests/qemu-iotests/common.rc      | 5 -----
> >  tests/qemu-iotests/common.tls     | 2 --
> >  8 files changed, 26 deletions(-)
>=20
> Looks OK to me, but I=E2=80=99d like to know what you think about Eric=E2=
=80=99s concern
> on patch 1.
>=20
> Max
>=20

Yep, I agree with Eric's point.  Will send a v2 shortly.

Thanks,
- Cleber.

