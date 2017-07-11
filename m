Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUrZn-0006jJ-Mb
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 05:35:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dUrZl-0006hg-Ek
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 05:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dUrZk-0000w3-L9
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 05:35:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dUrZg-0000v9-4R; Tue, 11 Jul 2017 05:35:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06974C04B929;
	Tue, 11 Jul 2017 09:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 06974C04B929
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 06974C04B929
Received: from [10.36.116.111] (ovpn-116-111.ams2.redhat.com [10.36.116.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9BB1914D;
	Tue, 11 Jul 2017 09:35:17 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
References: <1499765477-10541-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <37126d01-f5bb-653f-66dc-541b6e0f1d6f@redhat.com>
Date: Tue, 11 Jul 2017 11:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499765477-10541-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 11 Jul 2017 09:35:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] trivial: Move softmmu_template.h to the
 accel/tcg/ folder
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
X-List-Received-Date: Tue, 11 Jul 2017 09:35:26 -0000

On 11/07/2017 11:31, Thomas Huth wrote:
> The header is only used by accel/tcg/cputlb.c so we can
> move it to the accel/tcg/ folder, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: This patch should be applied after Philippe's "MAINTAINERS:
>  update TCG entries" patch here:
>  https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg06529.html
> 
>  MAINTAINERS                                        | 1 -
>  softmmu_template.h => accel/tcg/softmmu_template.h | 0
>  2 files changed, 1 deletion(-)
>  rename softmmu_template.h => accel/tcg/softmmu_template.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 74b3956..993b12e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -86,7 +86,6 @@ M: Richard Henderson <rth@twiddle.net>
>  S: Maintained
>  F: cpus.c
>  F: exec.c
> -F: softmmu_template.h
>  F: accel/tcg/
>  F: include/exec/cpu*.h
>  F: include/exec/exec-all.h
> diff --git a/softmmu_template.h b/accel/tcg/softmmu_template.h
> similarity index 100%
> rename from softmmu_template.h
> rename to accel/tcg/softmmu_template.h
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


