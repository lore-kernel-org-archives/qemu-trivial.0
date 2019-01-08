Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggql2-0004gS-Lo
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2019 07:45:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ggqku-0004dW-Q0
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 07:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ggqko-0003L9-8y
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 07:45:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ggqkh-0002jv-8i; Tue, 08 Jan 2019 07:45:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C2308667D;
	Tue,  8 Jan 2019 12:44:54 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35FDD22706;
	Tue,  8 Jan 2019 12:44:42 +0000 (UTC)
Date: Tue, 8 Jan 2019 13:44:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>, Paolo
	Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
	qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, qemu-s390x@nongnu.org, Richard Henderson
	<rth@twiddle.net>, Stefano Garzarella <sgarzare@redhat.com>, Christian
	Borntraeger <borntraeger@de.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>
Message-ID: <20190108134440.0d52f2c7.cohuck@redhat.com>
In-Reply-To: <20190104181208.7809-2-philmd@redhat.com>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-2-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 08 Jan 2019 12:44:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 1/3] util/cutils: Move size_to_str()
 from "qemu-common.h" to "cutils.h"
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
X-List-Received-Date: Tue, 08 Jan 2019 12:45:22 -0000

On Fri,  4 Jan 2019 19:12:06 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The size_to_str() function doesn't need to be in a generic header.
>=20
> It makes also sens to find this function in the same header than
> the opposite string to size functions: qemu_strtosz*().
> Note than this function is already implemented in util/cutils.c.
>=20
> Since we introduce a new function in a header, we document it,
> using the previous comment from the source file.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qemu-common.h        |  1 -
>  include/qemu/cutils.h        | 13 +++++++++++++
>  qapi/string-output-visitor.c |  2 +-
>  util/cutils.c                |  6 ------
>  4 files changed, 14 insertions(+), 8 deletions(-)

With the patch description fixed (as noted by Eric):

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

