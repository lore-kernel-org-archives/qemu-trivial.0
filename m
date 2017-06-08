Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIvw4-0007ZN-CE
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 07:49:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dIvvy-0007VP-R8
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 07:49:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dIvvy-0007cE-5f
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 07:49:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dIvvt-0007XY-UN; Thu, 08 Jun 2017 07:48:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B367A81253;
	Thu,  8 Jun 2017 11:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B367A81253
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B367A81253
Received: from [10.36.117.35] (ovpn-117-35.ams2.redhat.com [10.36.117.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD7717CE1E;
	Thu,  8 Jun 2017 11:48:55 +0000 (UTC)
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1496864204-5954-1-git-send-email-jcmvbkbc@gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <3194496c-7365-b402-dbc9-ee3f1aee1265@redhat.com>
Date: Thu, 8 Jun 2017 13:48:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1496864204-5954-1-git-send-email-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 08 Jun 2017 11:48:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] target/xtensa: gdbstub: drop dead return
 statement
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
X-List-Received-Date: Thu, 08 Jun 2017 11:49:06 -0000

On 07/06/2017 21:36, Max Filippov wrote:
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  target/xtensa/gdbstub.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
> index da131ae..d78a1b4 100644
> --- a/target/xtensa/gdbstub.c
> +++ b/target/xtensa/gdbstub.c
> @@ -72,7 +72,6 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>                        __func__, n, reg->type);
>          memset(mem_buf, 0, reg->size);
>          return reg->size;
> -        return 0;
>      }
>  }
>  
> 
Reviewed-by: Laurent Vivier <lvivier@redhat.com>


