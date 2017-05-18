Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBMsV-0007xn-SH
	for mharc-qemu-trivial@gnu.org; Thu, 18 May 2017 10:58:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dBMsU-0007xP-I7
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 10:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dBMsT-0005te-OZ
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 10:58:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dBMsP-0005nz-FN; Thu, 18 May 2017 10:58:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41E077F4DD;
	Thu, 18 May 2017 14:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 41E077F4DD
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 41E077F4DD
Received: from [10.36.116.195] (ovpn-116-195.ams2.redhat.com [10.36.116.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12EC1627DD;
	Thu, 18 May 2017 14:57:58 +0000 (UTC)
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, peterx@redhat.com, qemu-trivial@nongnu.org
References: <20170518103642.27796-1-quintela@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <1bfe7314-0138-cb26-c1dc-dd55b7f01cb1@redhat.com>
Date: Thu, 18 May 2017 16:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170518103642.27796-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 May 2017 14:58:03 +0000 (UTC)
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
X-List-Received-Date: Thu, 18 May 2017 14:58:11 -0000

On 18/05/2017 12:36, Juan Quintela wrote:
> All the file is surounded already by #ifndef CONFIG_USER_ONLY.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
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
> 
Reviewed-by: Laurent Vivier <lvivier@redhat.com>


