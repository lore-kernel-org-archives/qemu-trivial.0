Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5v1f-00074Z-5p
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 10:13:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d5v1c-00072F-Qt
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 10:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d5v1c-0005xT-1N
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 10:13:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1d5v1V-0005t9-CV; Wed, 03 May 2017 10:12:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C8E9448D96;
	Wed,  3 May 2017 14:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C8E9448D96
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5C8E9448D96
Received: from [10.36.117.10] (ovpn-117-10.ams2.redhat.com [10.36.117.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BEA117F5D;
	Wed,  3 May 2017 14:12:51 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, famz@redhat.com, qemu-block@nongnu.org
References: <20170503103023.9247-1-pbonzini@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <018234c2-7142-dedb-8db1-f32ec86711a9@redhat.com>
Date: Wed, 3 May 2017 16:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170503103023.9247-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 03 May 2017 14:12:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Update paths for AioContext
 implementation
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
X-List-Received-Date: Wed, 03 May 2017 14:13:06 -0000

On 03/05/2017 12:30, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46cf4870f9..62d62a6675 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1177,8 +1177,8 @@ M: Stefan Hajnoczi <stefanha@redhat.com>
>  M: Fam Zheng <famz@redhat.com>
>  L: qemu-block@nongnu.org
>  S: Supported
> -F: async.c
> -F: aio-*.c
> +F: util/async.c
> +F: util/aio-*.c
>  F: block/io.c
>  F: migration/block*
>  F: include/block/aio.h
> 
Reviewed-by: Laurent Vivier <lvivier@redhat.com>


