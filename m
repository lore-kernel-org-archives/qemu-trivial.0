Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNbVq-0006kg-5Z
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 06:05:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNbVo-0006jQ-G2
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 06:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNbVn-0007IF-OG
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 06:05:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59398 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNbVf-00076o-WC; Tue, 29 May 2018 06:05:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDB21401EF08;
	Tue, 29 May 2018 10:05:42 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4C011166E7;
	Tue, 29 May 2018 10:05:36 +0000 (UTC)
Date: Tue, 29 May 2018 12:05:33 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo Habkost
	<ehabkost@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>, Mark
	Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
	<atar4qemu@gmail.com>, qemu-s390x@nongnu.org (open list:S390)
Message-ID: <20180529120533.1a264193.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-4-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-4-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 10:05:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 10:05:42 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 03/21] target: Do not include
 "exec/address-spaces.h" if it is not necessary
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
X-List-Received-Date: Tue, 29 May 2018 10:05:53 -0000

On Mon, 28 May 2018 20:27:01 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Code change produced with:
>     $ git grep '#include "exec/address-spaces.h"' target | \
>       cut -d: -f-1 | \
>       xargs egrep -L "(get_system_|address_space_)" | \
>       xargs sed -i.bak '/#include "exec\/address-spaces.h"/d'
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/hvf/x86_task.c | 1 -
>  target/s390x/kvm.c         | 1 -
>  target/s390x/mem_helper.c  | 1 -
>  target/s390x/misc_helper.c | 1 -
>  target/sparc/mmu_helper.c  | 1 -
>  5 files changed, 5 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>

