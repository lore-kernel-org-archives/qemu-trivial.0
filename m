Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNswK-0002f5-5Z
	for mharc-qemu-trivial@gnu.org; Wed, 30 May 2018 00:42:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNswH-0002dl-RM
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 00:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNswH-0007O7-0G
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 00:42:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fNsw3-0007Jk-I4; Wed, 30 May 2018 00:42:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 525D676F91;
	Wed, 30 May 2018 04:42:04 +0000 (UTC)
Received: from redhat.com (ovpn-120-96.rdu2.redhat.com [10.10.120.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C76532166BB2;
	Wed, 30 May 2018 04:42:01 +0000 (UTC)
Date: Wed, 30 May 2018 07:42:01 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>,
	Anthony Green <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	"open list:S390" <qemu-s390x@nongnu.org>
Message-ID: <20180530074026-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 04:42:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 04:42:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
X-List-Received-Date: Wed, 30 May 2018 04:42:22 -0000

On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Cornelia,
>=20
> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
> > On Mon, 28 May 2018 20:27:07 -0300
> > Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:
> >=20
> >> Code change produced with:
> >>     $ git grep '#include "exec/exec-all.h"' | \
> >>       cut -d: -f-1 | \
> >>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GET=
PC|singlestep|TranslationBlock)" | \
> >=20
> > Hm, does this expression catch all files that need to include
> > exec-all.h? The resulting patch seems fine, though.
>=20
> No, not all :/
> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
> more errors appear. In 2 more steps I added "cpu_address_space_init|"
> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for m=
y
> goal than trying to build a regex to explode function/struct names from
> headers. This is a clever way to do it for long term command reuse take=
n
> from commit messages...

Brutebuilding isn't a good way to find unused includes, some other header
might pull in an include you are trying to remove for its own purposes.
If you want to try brutebuilding you must also verify that's
not the case - e.g. look at the dependency file generated.

> >>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

