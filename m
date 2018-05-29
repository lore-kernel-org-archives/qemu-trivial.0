Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNd07-0007Z9-9B
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 07:41:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNd05-0007XS-5B
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:41:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNd04-00046q-Bj
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:41:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34294 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNczs-00042e-2W; Tue, 29 May 2018 07:41:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12562401EF09;
	Tue, 29 May 2018 11:40:59 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C636200A4B6;
	Tue, 29 May 2018 11:40:55 +0000 (UTC)
Date: Tue, 29 May 2018 13:40:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo Habkost
	<ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter
	Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, Laurent
	Vivier <laurent@vivier.eu>, Anthony Green <green@moxielogic.com>, Stafford
	Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>, Max
	Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org (open list:ARM),
	qemu-ppc@nongnu.org (open list:PowerPC), qemu-s390x@nongnu.org (open
	list:S390)
Message-ID: <20180529134053.1ea9f46d.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-10-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 11:40:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 11:40:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
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
X-List-Received-Date: Tue, 29 May 2018 11:41:14 -0000

On Mon, 28 May 2018 20:27:07 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Code change produced with:
>     $ git grep '#include "exec/exec-all.h"' | \
>       cut -d: -f-1 | \
>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|si=
nglestep|TranslationBlock)" | \

Hm, does this expression catch all files that need to include
exec-all.h? The resulting patch seems fine, though.

>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

