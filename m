Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBIoJ-0002m9-A1
	for mharc-qemu-trivial@gnu.org; Thu, 18 May 2017 06:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dBIoH-0002kr-IY
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dBIoE-0005hl-Gz
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:37:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1dBIoE-0005h9-9k
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:37:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 361D7369C9
	for <qemu-trivial@nongnu.org>; Thu, 18 May 2017 10:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 361D7369C9
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 361D7369C9
Received: from localhost (ovpn-117-10.ams2.redhat.com [10.36.117.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C97AF7E2D2;
	Thu, 18 May 2017 10:37:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: rhvirt-patches@redhat.com
Cc: dgilbert@redhat.com, lvivier@redhat.com, peterx@redhat.com,
	qemu-trivial@nongnu.org
In-Reply-To: <20170518103036.27745-1-quintela@redhat.com> (Juan Quintela's
	message of "Thu, 18 May 2017 12:30:36 +0200")
References: <20170518103036.27745-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 18 May 2017 12:37:23 +0200
Message-ID: <87vaoya1ss.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 May 2017 10:37:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] trivial: Remove unneeded ifndef in
 memory.h
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
X-List-Received-Date: Thu, 18 May 2017 10:37:34 -0000

Juan Quintela <quintela@redhat.com> wrote:
> All the file is surounded already by #ifndef CONFIG_USER_ONLY.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

and here I am again, sorry.

/me changing his scripts to detect RHEL on the subject line to allow
sending to rhvirt-patches.

Sorry again, Juan.


> ---
>  include/exec/memory.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 99e0f54..6b5b953 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -17,9 +17,7 @@
>  #ifndef CONFIG_USER_ONLY
>  
>  #include "exec/cpu-common.h"
> -#ifndef CONFIG_USER_ONLY
>  #include "exec/hwaddr.h"
> -#endif
>  #include "exec/memattrs.h"
>  #include "exec/ramlist.h"
>  #include "qemu/queue.h"

