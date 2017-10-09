Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1UUp-0004eN-TB
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 05:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1e1UUn-0004cF-1N
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:37:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1e1UUm-0001o1-D7
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 05:37:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1e1UUf-0001k8-Up; Mon, 09 Oct 2017 05:37:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAE3B4A6EB;
	Mon,  9 Oct 2017 09:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CAE3B4A6EB
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4E155D9C7;
	Mon,  9 Oct 2017 09:36:53 +0000 (UTC)
Date: Mon, 9 Oct 2017 11:36:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>, Markus
	Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, Christian
	Borntraeger <borntraeger@de.ibm.com>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, qemu-devel@nongnu.org, Kevin Wolf
	<kwolf@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
	qemu-s390x@nongnu.org
Message-ID: <20171009113651.526bd8ad.cohuck@redhat.com>
In-Reply-To: <20171006235023.11952-27-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-27-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 09 Oct 2017 09:37:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 26/88] S390: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 09:37:10 -0000

On Fri,  6 Oct 2017 20:49:21 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: more changes in hw/s390x/css.c, added target/s390x/cpu_models.c]
> ---
>  hw/s390x/css.c            | 10 +++++-----
>  hw/s390x/s390-pci-bus.c   |  4 ++--
>  target/s390x/cpu_models.c | 12 ++++++------
>  target/s390x/diag.c       |  2 +-
>  4 files changed, 14 insertions(+), 14 deletions(-)

I think I'll just queue that on s390-next.

In case somebody wants to take the whole patchset after all,

Acked-by: Cornelia Huck <cohuck@redhat.com>

