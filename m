Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3Mhc-0006BC-56
	for mharc-qemu-trivial@gnu.org; Wed, 26 Apr 2017 09:09:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d3MhZ-00069J-8p
	for qemu-trivial@nongnu.org; Wed, 26 Apr 2017 09:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d3MhY-0003rX-Bv
	for qemu-trivial@nongnu.org; Wed, 26 Apr 2017 09:09:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d3MhS-0003nh-EK; Wed, 26 Apr 2017 09:09:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70C6980503;
	Wed, 26 Apr 2017 13:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 70C6980503
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 70C6980503
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D67F881FC;
	Wed, 26 Apr 2017 13:09:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B182B1138646; Wed, 26 Apr 2017 15:09:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org, qemu-trivial@nongnu.org
References: <20170426115826.1826-1-n54@gmx.com>
Date: Wed, 26 Apr 2017 15:09:39 +0200
In-Reply-To: <20170426115826.1826-1-n54@gmx.com> (Kamil Rytarowski's message
	of "Wed, 26 Apr 2017 13:58:26 +0200")
Message-ID: <871ssfuxgs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 26 Apr 2017 13:09:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts: Switch to more
 portable Perl shebang
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
X-List-Received-Date: Wed, 26 Apr 2017 13:09:50 -0000

Kamil Rytarowski <n54@gmx.com> writes:

> The default NetBSD package manager is pkgsrc and it installs Perl
> along other third party programs under custom and configurable prefix.
> The default prefix for binary prebuilt packages is /usr/pkg, and the
> Perl executable lands in /usr/pkg/bin/perl.
>
> This change switches "/usr/bin/perl" to "/usr/bin/evn perl" as it's

/usr/bin/env

> the most portable solution that should work for almost everybody.
> Perl's executable is detected automatically.
>
> This change switches -w option passed to the executable with more
> modern "usr warnings;" approach. There is no functional change to the

use warnings;

> default behavior.
>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>

Cc: qemu-trivial

