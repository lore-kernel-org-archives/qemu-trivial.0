Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNy6l-0008Vs-4q
	for mharc-qemu-trivial@gnu.org; Wed, 30 May 2018 06:13:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNy6i-0008UE-US
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 06:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNy6i-0000Uo-1e
	for qemu-trivial@nongnu.org; Wed, 30 May 2018 06:13:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44488 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNy6U-0000OJ-Os; Wed, 30 May 2018 06:13:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AC79818BAF1;
	Wed, 30 May 2018 10:13:08 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8977A6B5B1;
	Wed, 30 May 2018 10:13:01 +0000 (UTC)
Date: Wed, 30 May 2018 12:12:59 +0200
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
Message-ID: <20180530121259.74bc4234.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-10-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 10:13:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 10:13:08 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
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
X-List-Received-Date: Wed, 30 May 2018 10:13:30 -0000

On Mon, 28 May 2018 20:27:07 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Code change produced with:
>     $ git grep '#include "exec/exec-all.h"' | \
>       cut -d: -f-1 | \
>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|si=
nglestep|TranslationBlock)" | \
>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h                        | 1 -
>  target/arm/arm_ldst.h                  | 1 -
>  hw/i386/kvmvapic.c                     | 1 -
>  target/arm/arm-powerctl.c              | 1 -
>  target/arm/crypto_helper.c             | 1 -
>  target/arm/iwmmxt_helper.c             | 1 -
>  target/arm/neon_helper.c               | 1 -
>  target/arm/psci.c                      | 1 -
>  target/arm/vec_helper.c                | 1 -
>  target/cris/cpu.c                      | 1 -
>  target/hppa/helper.c                   | 1 -
>  target/hppa/int_helper.c               | 1 -
>  target/i386/hax-all.c                  | 1 -
>  target/i386/hax-mem.c                  | 1 -
>  target/i386/hax-windows.c              | 1 -
>  target/i386/hvf/hvf.c                  | 1 -
>  target/i386/hvf/x86_task.c             | 1 -
>  target/i386/whpx-all.c                 | 1 -
>  target/lm32/cpu.c                      | 1 -
>  target/m68k/cpu.c                      | 1 -
>  target/moxie/cpu.c                     | 1 -
>  target/moxie/mmu.c                     | 1 -
>  target/openrisc/cpu.c                  | 1 -
>  target/ppc/int_helper.c                | 1 -
>  target/s390x/cpu.c                     | 1 -
>  target/s390x/diag.c                    | 1 -
>  target/s390x/helper.c                  | 1 -
>  target/tilegx/cpu.c                    | 1 -
>  target/xtensa/core-dc232b.c            | 1 -
>  target/xtensa/core-dc233c.c            | 1 -
>  target/xtensa/core-de212.c             | 1 -
>  target/xtensa/core-fsf.c               | 1 -
>  target/xtensa/core-sample_controller.c | 1 -
>  target/xtensa/cpu.c                    | 1 -
>  tcg/tcg-op-vec.c                       | 1 -
>  target/xtensa/import_core.sh           | 1 -
>  36 files changed, 36 deletions(-)
>=20

However you arrived at it, this looks sane, so

Acked-by: Cornelia Huck <cohuck@redhat.com>

