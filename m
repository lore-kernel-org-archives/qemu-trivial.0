Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfrZm-00076C-QA
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 13:48:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dfrZi-000746-7G
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 13:48:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dfrZh-0002ZX-6k
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 13:48:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dfrZb-0002Oh-Jf; Thu, 10 Aug 2017 13:48:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BB6E78743;
	Thu, 10 Aug 2017 17:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1BB6E78743
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.117.137] (ovpn-117-137.ams2.redhat.com [10.36.117.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE0DE85291;
	Thu, 10 Aug 2017 17:43:08 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Daniel Berrange <berrange@redhat.com>
References: <1502365466-19432-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b93a10d5-0fbf-e18f-6a3a-c56063a00f56@redhat.com>
Date: Thu, 10 Aug 2017 19:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502365466-19432-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 10 Aug 2017 17:43:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Fix "-net van" typo
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
X-List-Received-Date: Thu, 10 Aug 2017 17:48:51 -0000

On 10/08/2017 13:44, Thomas Huth wrote:
> While Andrew S. Tanenbaum has a point by saying "Never underestimate the
> bandwidth of a station wagon full of tapes hurtling down the highway",
> we don't support that way of transportation in QEMU yet, so replace the
> typo with the correct word "vlan".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

> ---
>  qemu-doc.texi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 92d50f1..9811476 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -3243,7 +3243,7 @@ the ``-netdev user,guestfwd=ARGS'' argument instead.
>  
>  @subsection -net vlan (since 2.9.0)
>  
> -The ``-net van=NN'' argument is partially replaced with the
> +The ``-net vlan=NN'' argument is partially replaced with the
>  new ``-netdev'' argument. The remaining use cases will no
>  longer be directly supported in QEMU.
>  
> 


