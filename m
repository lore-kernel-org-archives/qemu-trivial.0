Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjKcg-00075c-4V
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 01:53:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cjKcd-000743-IV
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 01:53:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cjKcc-0002mp-OH
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 01:53:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cjKcY-0002lj-7L; Thu, 02 Mar 2017 01:53:50 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 346294E4D9;
	Thu,  2 Mar 2017 06:53:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC90D15A80;
	Thu,  2 Mar 2017 06:53:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4AC4A1138647; Thu,  2 Mar 2017 07:53:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Suramya Shah <shah.suramya@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170301142320.8328-1-shah.suramya@gmail.com>
Date: Thu, 02 Mar 2017 07:53:47 +0100
In-Reply-To: <20170301142320.8328-1-shah.suramya@gmail.com> (Suramya Shah's
	message of "Wed, 1 Mar 2017 19:53:20 +0530")
Message-ID: <87r32gp3t0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 02 Mar 2017 06:53:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Removed header
 qemu-common.h from path.c
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
X-List-Received-Date: Thu, 02 Mar 2017 06:53:56 -0000

Copying <qemu-trivial@nongnu.org>.

Suramya Shah <shah.suramya@gmail.com> writes:

> Signed-off-by: Suramya Shah <shah.suramya@gmail.com>
> ---
>  util/path.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/util/path.c b/util/path.c
> index 5479f76..46a6098 100644
> --- a/util/path.c
> +++ b/util/path.c
> @@ -6,8 +6,7 @@
>  #include "qemu/osdep.h"
>  #include <sys/param.h>
>  #include <dirent.h>
> -#include "qemu-common.h"
> -#include "qemu/cutils.h"
> +:#include "qemu/cutils.h"
>  #include "qemu/path.h"
>  
>  struct pathelem

I doubt this will compile.  Perhaps the trivial maintainers are willing
to repair it for you.

