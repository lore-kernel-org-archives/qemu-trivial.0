Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBJwQ-0000g7-5C
	for mharc-qemu-trivial@gnu.org; Thu, 18 May 2017 07:50:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dBJwN-0000eL-EC
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 07:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dBJwM-0004zV-QI
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 07:49:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dBJwH-0004y4-KU; Thu, 18 May 2017 07:49:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A4175277F;
	Thu, 18 May 2017 11:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6A4175277F
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=dgilbert@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6A4175277F
Received: from work-vm (ovpn-117-126.ams2.redhat.com [10.36.117.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7054160BE1;
	Thu, 18 May 2017 11:49:49 +0000 (UTC)
Date: Thu, 18 May 2017 12:49:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, lvivier@redhat.com, peterx@redhat.com,
	qemu-trivial@nongnu.org
Message-ID: <20170518114946.GB2467@work-vm>
References: <20170518103642.27796-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170518103642.27796-1-quintela@redhat.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 May 2017 11:49:52 +0000 (UTC)
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
X-List-Received-Date: Thu, 18 May 2017 11:50:00 -0000

* Juan Quintela (quintela@redhat.com) wrote:
> All the file is surounded already by #ifndef CONFIG_USER_ONLY.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Ah yes, the patch that added the inner ifndef added it to
every use of exec/hwaddr.h.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
> -- 
> 2.9.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

