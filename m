Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2v1F-00024u-5u
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:08:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2v1D-00023p-P4
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:08:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2v1C-0008Iy-UH
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:08:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e2v17-0008Gu-QO; Fri, 13 Oct 2017 04:08:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB8EE4B70C;
	Fri, 13 Oct 2017 08:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CB8EE4B70C
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 887EA60F84;
	Fri, 13 Oct 2017 08:08:21 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20171013012455.10737-1-famz@redhat.com>
	<20171013012455.10737-3-famz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7e611573-e25e-65cc-2222-f7d2429bf924@redhat.com>
Date: Fri, 13 Oct 2017 10:08:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013012455.10737-3-famz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 13 Oct 2017 08:08:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] MAINTAINERS: Drop Sun4v
 nonexistent file
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
X-List-Received-Date: Fri, 13 Oct 2017 08:08:32 -0000

On 13.10.2017 03:24, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index da3c78df47..731c5c7ec2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -778,7 +778,6 @@ F: pc-bios/openbios-sparc64
>  Sun4v
>  M: Artyom Tarasenko <atar4qemu@gmail.com>
>  S: Maintained
> -F: hw/sparc64/sun4v.c

I guess you should rather replace that one with:

hw/sparc64/niagara.c

Artyom, is that right?

 Thomas

