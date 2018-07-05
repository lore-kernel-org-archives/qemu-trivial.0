Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6uC-0001Eu-64
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 12:14:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fb6uA-0001DQ-Ot
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 12:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fb6u9-0008VC-QR
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 12:14:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43108 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fb6u4-0008PM-Fa; Thu, 05 Jul 2018 12:14:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E47A72646;
	Thu,  5 Jul 2018 16:14:44 +0000 (UTC)
Received: from gondolin (ovpn-116-231.ams2.redhat.com [10.36.116.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F246776C9;
	Thu,  5 Jul 2018 16:14:38 +0000 (UTC)
Date: Thu, 5 Jul 2018 18:14:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Christian Borntraeger
	<borntraeger@de.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, Richard
	Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>, David
	Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org (open
	list:virtio-ccw)
Message-ID: <20180705181436.6a2f796e.cohuck@redhat.com>
In-Reply-To: <20180705155811.20366-3-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
	<20180705155811.20366-3-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 05 Jul 2018 16:14:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 05 Jul 2018 16:14:44 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] error: Remove NULL checks on
 error_propagate() calls
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
X-List-Received-Date: Thu, 05 Jul 2018 16:14:51 -0000

On Thu,  5 Jul 2018 12:58:06 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Patch created mechanically by rerunning:
>=20
>   $  spatch --sp-file scripts/coccinelle/error_propagate_null.cocci \
>             --macro-file scripts/cocci-macro-file.h \
>             --dir . --in-place
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/s390x/virtio-ccw.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I might send this via the s390x tree; in case trivial is quicker:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

