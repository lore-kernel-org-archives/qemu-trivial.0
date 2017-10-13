Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2uxg-0008Bl-3M
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2uxe-0008AW-RG
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2uxd-000684-NK
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:04:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35043)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e2uxY-0005yR-IP; Fri, 13 Oct 2017 04:04:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C9B1D77EA;
	Fri, 13 Oct 2017 08:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9C9B1D77EA
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50EC75D6A4;
	Fri, 13 Oct 2017 08:04:40 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20171013012455.10737-1-famz@redhat.com>
	<20171013012455.10737-2-famz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2d524426-1467-8d9b-f216-1014d5b18f00@redhat.com>
Date: Fri, 13 Oct 2017 10:04:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013012455.10737-2-famz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 13 Oct 2017 08:04:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] MAINTAINERS: Fix scsi
 path
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
X-List-Received-Date: Fri, 13 Oct 2017 08:04:51 -0000

On 13.10.2017 03:24, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 772ac209e1..da3c78df47 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -982,7 +982,7 @@ S: Supported
>  F: include/hw/scsi/*
>  F: include/scsi/*
>  F: hw/scsi/*
> -F: util/scsi*
> +F: scsi/*

scsi/* is already covered by the new "Block SCSI subsystem" section, so
I think you can also simply remove that line instead.

 Thomas

