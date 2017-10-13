Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vnM-00073o-F1
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2vnK-00071t-As
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:58:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2vnJ-0003eM-LL
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:58:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e2vnE-0003ar-EK; Fri, 13 Oct 2017 04:58:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6477C7EAB0;
	Fri, 13 Oct 2017 08:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6477C7EAB0
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A257918E46;
	Fri, 13 Oct 2017 08:57:52 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
References: <20171013085355.7563-1-famz@redhat.com>
	<20171013085355.7563-4-famz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <94fd9fb1-e99b-0afe-ec36-833c59e97d0d@redhat.com>
Date: Fri, 13 Oct 2017 10:57:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013085355.7563-4-famz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 13 Oct 2017 08:58:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 3/3] MAINTAINERS: Track
 default-configs/pci.mak
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
X-List-Received-Date: Fri, 13 Oct 2017 08:58:15 -0000

On 13.10.2017 10:53, Fam Zheng wrote:
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3938ccbf8a..7cb237babc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -934,6 +934,7 @@ F: hw/pci/*
>  F: hw/pci-bridge/*
>  F: docs/pci*
>  F: docs/specs/*pci*
> +F: default-configs/pci.mak
>  
>  ACPI/SMBIOS
>  M: Michael S. Tsirkin <mst@redhat.com>
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

