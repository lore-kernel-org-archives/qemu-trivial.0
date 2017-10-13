Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vo2-0007bR-N9
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:58:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2vo0-0007Zh-Pf
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e2vo0-0003xm-1t
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:58:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e2vnu-0003vm-M1; Fri, 13 Oct 2017 04:58:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3FCB37EEF;
	Fri, 13 Oct 2017 08:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A3FCB37EEF
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D87918B97;
	Fri, 13 Oct 2017 08:58:46 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20171013085355.7563-1-famz@redhat.com>
	<20171013085355.7563-3-famz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <00b58d8d-11d2-894a-6e87-f65585435a0b@redhat.com>
Date: Fri, 13 Oct 2017 10:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013085355.7563-3-famz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 13 Oct 2017 08:58:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] MAINTAINERS: Fix Sun4v file
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
X-List-Received-Date: Fri, 13 Oct 2017 08:58:57 -0000

On 13.10.2017 10:53, Fam Zheng wrote:
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 18ddaf4070..3938ccbf8a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -778,7 +778,7 @@ F: pc-bios/openbios-sparc64
>  Sun4v
>  M: Artyom Tarasenko <atar4qemu@gmail.com>
>  S: Maintained
> -F: hw/sparc64/sun4v.c
> +F: hw/sparc64/niagara.c
>  F: hw/timer/sun4v-rtc.c
>  F: include/hw/timer/sun4v-rtc.h
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

