Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2XZs-0002iZ-DM
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2020 04:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1j2XZp-0002h6-CT
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 04:48:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1j2XZn-0003jB-S9
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 04:48:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39613
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1j2XZn-0003de-Jl
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 04:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581673676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20fbL3ToQICmNWsKGnNkTpJ/LGFT34R/mtj5+uGzCaM=;
 b=MW04kROKqUrVtqhkQsyWhQ1Ua301FIyswbl5LNo/uFoed5ALAA146ZSuQUz9eaZqy3vXcc
 2zuEX6fNgy8sYlWUDwjAVnKuZtW+bS2S7TIxOEJoJK5/wxF/n6k9A8qMB7h2kQWhiV0909
 qPuMMPL/JwFaMIW2rfs8XQzspOYm3Fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-fV5fMBy9NRahr3RdStkNCA-1; Fri, 14 Feb 2020 04:47:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1848F107ACC9;
 Fri, 14 Feb 2020 09:47:46 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A58795C1C3;
 Fri, 14 Feb 2020 09:47:42 +0000 (UTC)
Date: Fri, 14 Feb 2020 10:47:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alex.williamson@redhat.com
Subject: Re: [PATCH] Report stringified errno in VFIO related errors
Message-ID: <20200214104740.07f59c72.cohuck@redhat.com>
In-Reply-To: <2dc5a0962a38b912e4fa4900f9813b7ea1a9273c.1581670009.git.mprivozn@redhat.com>
References: <2dc5a0962a38b912e4fa4900f9813b7ea1a9273c.1581670009.git.mprivozn@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: fV5fMBy9NRahr3RdStkNCA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2020 09:48:02 -0000

On Fri, 14 Feb 2020 09:47:39 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> In a few places we report errno formatted as a negative integer.
> This is not as user friendly as it can be. Use strerror() and/or
> error_setg_errno() instead.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  hw/vfio/common.c    | 2 +-
>  util/vfio-helpers.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5ca11488d6..a3a2a82d99 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -352,7 +352,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          return 0;
>      }
>  
> -    error_report("VFIO_MAP_DMA: %d", -errno);
> +    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
>      return -errno;
>  }

I think you missed the one in vfio_dma_unmap().

(...)

The other file looks good.


