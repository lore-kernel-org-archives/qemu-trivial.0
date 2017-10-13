Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vmK-0006Ap-NF
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2vmI-00068b-76
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2vmH-0002kS-Co
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:57:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46317)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e2vmC-0002cx-7S; Fri, 13 Oct 2017 04:57:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A46081E09;
	Fri, 13 Oct 2017 08:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1A46081E09
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA4619E8E;
	Fri, 13 Oct 2017 08:57:00 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20171013085355.7563-1-famz@redhat.com>
	<20171013085355.7563-2-famz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <35a5d00d-6ba6-2350-9245-c5a401672ea6@redhat.com>
Date: Fri, 13 Oct 2017 10:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013085355.7563-2-famz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 13 Oct 2017 08:57:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 1/3] MAINTAINERS: Clean up SCSI device
 section
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
X-List-Received-Date: Fri, 13 Oct 2017 08:57:11 -0000

On 13.10.2017 10:53, Fam Zheng wrote:
> 1. Remove nonexistent file util/scsi*.
> 2. Drop useless section for LSI53C895A.
> 3. Leave include/scsi to "Block SCSI subsystem" section.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  MAINTAINERS | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 772ac209e1..18ddaf4070 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -980,16 +980,10 @@ SCSI
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  S: Supported
>  F: include/hw/scsi/*
> -F: include/scsi/*
>  F: hw/scsi/*
> -F: util/scsi*
>  F: tests/virtio-scsi-test.c
>  T: git git://github.com/bonzini/qemu.git scsi-next
>  
> -LSI53C895A
> -S: Orphan
> -F: hw/scsi/lsi53c895a.c
> -
>  SSI
>  M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>  M: Alistair Francis <alistair.francis@xilinx.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>

