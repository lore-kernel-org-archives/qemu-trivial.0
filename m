Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAdjf-0005zU-Pd
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 09:41:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAdjd-0005xT-Jp
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAdjZ-0000Ft-Ld
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:41:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bAdjO-0000Dr-W6; Wed, 08 Jun 2016 09:41:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4114485367;
	Wed,  8 Jun 2016 13:41:14 +0000 (UTC)
Received: from [10.3.116.88] (ovpn-116-88.phx2.redhat.com [10.3.116.88])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58DfC7m005640; Wed, 8 Jun 2016 09:41:13 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Jeff Cody <jcody@redhat.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<1465348292-26750-8-git-send-email-xiecl.fnst@cn.fujitsu.com>
Cc: qemu block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Dong Eddie <eddie.dong@intel.com>, Jiang Yunhong <yunhong.jiang@intel.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57582070.6020508@redhat.com>
Date: Wed, 8 Jun 2016 07:41:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1465348292-26750-8-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WjGjGBM1XX0vnlP0kJa1kJOV1TRtxemPb"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 08 Jun 2016 13:41:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v20 07/10] Introduce new APIs to do
 replication operation
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
X-List-Received-Date: Wed, 08 Jun 2016 13:41:31 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WjGjGBM1XX0vnlP0kJa1kJOV1TRtxemPb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/07/2016 07:11 PM, Changlong Xie wrote:
> Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>

No mention of the API names in the commit message?  Grepping 'git log'
is easier if there is something useful to grep for.

> ---
>  Makefile.objs        |   1 +
>  qapi/block-core.json |  13 ++++
>  replication.c        | 105 ++++++++++++++++++++++++++++++
>  replication.h        | 176 +++++++++++++++++++++++++++++++++++++++++++=
++++++++
>  4 files changed, 295 insertions(+)
>  create mode 100644 replication.c
>  create mode 100644 replication.h
>=20

> +++ b/qapi/block-core.json
> @@ -2032,6 +2032,19 @@
>              '*read-pattern': 'QuorumReadPattern' } }
> =20
>  ##
> +# @ReplicationMode
> +#
> +# An enumeration of replication modes.
> +#
> +# @primary: Primary mode, the vm's state will be sent to secondary QEM=
U.
> +#
> +# @secondary: Secondary mode, receive the vm's state from primary QEMU=
=2E
> +#
> +# Since: 2.7
> +##
> +{ 'enum' : 'ReplicationMode', 'data' : [ 'primary', 'secondary' ] }
> +

This part is fine, from an interface point of view. However, I have not
closely reviewed the rest of the patch or series.  That said, here's
some quick things that caught my eye.


> +++ b/replication.c
> @@ -0,0 +1,105 @@
> +/*
> + * Replication filter
> + *
> + * Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
> + * Copyright (c) 2016 Intel Corporation
> + * Copyright (c) 2016 FUJITSU LIMITED
> + *
> + * Author:
> + *   Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "replication.h"

All new .c files must include "qemu/osdep.h" first.


> +++ b/replication.h
> @@ -0,0 +1,176 @@
> +/*
> + * Replication filter
> + *
> + * Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
> + * Copyright (c) 2016 Intel Corporation
> + * Copyright (c) 2016 FUJITSU LIMITED
> + *
> + * Author:
> + *   Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef REPLICATION_H
> +#define REPLICATION_H
> +
> +#include "qemu/osdep.h"

And .h files must NOT include osdep.h.

> +#include "qapi/error.h"

Do you really need the full error.h, or is typedefs.h enough to get the
forward declaration of Error?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--WjGjGBM1XX0vnlP0kJa1kJOV1TRtxemPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXWCBwAAoJEKeha0olJ0Nq9d8H+QECmZOaaMIsra5lQkvcHDpl
YusAac884RJeRe+htg777z9+s05x+uHwekuIS1bukRCnN4pEG4dmL+MdZjsujywa
lG8NHHdc51SN573+8MO6TRO0TppKTVot4fjo3vREUwSRkVK5yiqW+S3y7t5Jk2hJ
UBc9nLvae3fPU1vbdI8nkjgDETVLkoKHuU6u6MxZrTsZTNzQXcbcp6TPrq1183d5
Udgf/BTpUOrUtQ1uGvt60nHCMq6zTwOdUA8Ib6ZXeKv2tJPdx9DJBaqD69dUCV6L
McEEKVuxT/1kDGShTtuLS/FO5cyaUDaO8lkOp4fKFNsAqjoheslplrA4+Sh6sUQ=
=L4g0
-----END PGP SIGNATURE-----

--WjGjGBM1XX0vnlP0kJa1kJOV1TRtxemPb--

