Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY8c8-00065r-5u
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 07:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fY8c5-00063v-Ss
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 07:27:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fY8c4-00007W-P9
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 07:27:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46156 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fY8c1-0008WN-Qw; Wed, 27 Jun 2018 07:27:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68B5581A4EBC;
	Wed, 27 Jun 2018 11:27:49 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8712E1117658;
	Wed, 27 Jun 2018 11:27:48 +0000 (UTC)
Date: Wed, 27 Jun 2018 13:27:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20180627132747.76773eb9@redhat.com>
In-Reply-To: <20180625124238.25339-2-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 27 Jun 2018 11:27:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 27 Jun 2018 11:27:49 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 11:27:54 -0000

On Mon, 25 Jun 2018 09:41:53 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Loosely based on 076b35b5a56.
>=20
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qemu/units.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 include/qemu/units.h
>=20
> diff --git a/include/qemu/units.h b/include/qemu/units.h
> new file mode 100644
> index 0000000000..692db3fbb2
> --- /dev/null
> +++ b/include/qemu/units.h
> @@ -0,0 +1,20 @@
> +/*
> + * IEC binary prefixes definitions
> + *
> + * Copyright (C) 2015 Nikunj A Dadhania, IBM Corporation
> + * Copyright (C) 2018 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef QEMU_UNITS_H
> +#define QEMU_UNITS_H
> +
> +#define KiB     (INT64_C(1) << 10)
> +#define MiB     (INT64_C(1) << 20)
> +#define GiB     (INT64_C(1) << 30)
> +#define TiB     (INT64_C(1) << 40)
> +#define PiB     (INT64_C(1) << 50)
> +#define EiB     (INT64_C(1) << 60)
Shouldn't above use UINT64_C()

> +
> +#endif


