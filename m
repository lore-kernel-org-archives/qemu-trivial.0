Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXPI3-0001Bs-GC
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 05:59:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dXPI1-00019h-4J
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 05:59:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dXPI0-0000gp-EX
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 05:59:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18133)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dXPHu-0000dV-Dc; Tue, 18 Jul 2017 05:59:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC8F14A70C;
	Tue, 18 Jul 2017 09:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EC8F14A70C
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EC8F14A70C
Received: from localhost (ovpn-117-165.ams2.redhat.com [10.36.117.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A904A17538;
	Tue, 18 Jul 2017 09:59:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>
In-Reply-To: <20170718061005.29518-6-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	18 Jul 2017 03:09:41 -0300")
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-6-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 18 Jul 2017 11:59:22 +0200
Message-ID: <877ez6ysjp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Jul 2017 09:59:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 05/29] block: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 09:59:38 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

