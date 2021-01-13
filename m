Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kza8W-0001If-R3
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2021 02:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kza8V-0001H8-0W
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 02:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kza8R-0005mr-Ft
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 02:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610521201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ixj4+yi0lETAF+ggllGxIF5hknlV3cJnCPByBZMlBGI=;
 b=ZU+d8rTrGF74b1mJ84qCq+Erc0Rn5NEwAW87FtWI4WxWP6sZWmgGA26EiWFHpMBc4fsHLb
 ZiFS/Qk6+F8MjtYhgGFP9yIbGcsQgvFezBZm+ymrvFKSphAJ9dWFuH+RefPF4ygFvcHdQD
 lk5pPSyAYsiqysHetn4izglH7YpYmXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-vBKCDyURPLC2SeHZX_nPEQ-1; Wed, 13 Jan 2021 01:59:58 -0500
X-MC-Unique: vBKCDyURPLC2SeHZX_nPEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA0048015D0;
 Wed, 13 Jan 2021 06:59:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36D025C559;
 Wed, 13 Jan 2021 06:59:51 +0000 (UTC)
Subject: Re: [PATCH 2/9] configure: Add sys/timex.h to probe clk_adjtime
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 kvm@vger.kernel.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
 <20201221005318.11866-3-jiaxun.yang@flygoat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4977db1-2f4e-22fd-9e40-1dcd11df7922@redhat.com>
Date: Wed, 13 Jan 2021 07:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221005318.11866-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 13 Jan 2021 07:00:07 -0000


In the subject:

s/clk_adjtime/clock_adjtime/

On 21/12/2020 01.53, Jiaxun Yang wrote:
> It is not a part of standard time.h. Glibc put it under
> time.h however musl treat it as a sys timex extension.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   configure | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index c228f7c21e..990f37e123 100755
> --- a/configure
> +++ b/configure
> @@ -4374,6 +4374,7 @@ fi
>   clock_adjtime=no
>   cat > $TMPC <<EOF
>   #include <time.h>
> +#include <sys/timex.h>
>   
>   int main(void)
>   {
> 

According to the man page:

  http://www.tin.org/bin/man.cgi?section=2&topic=clock_adjtime

sys/timex.h is indeed the right header here.

Reviewed-by: Thomas Huth <thuth@redhat.com>


