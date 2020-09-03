Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDpmn-0002AV-2l
	for mharc-qemu-trivial@gnu.org; Thu, 03 Sep 2020 10:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDpmk-00028m-9c
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 10:00:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53688
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDpmh-0003T6-Jn
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 10:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599141614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Im5eAk6wPSmNcodCRioKcx0J21zZyaBr1f5cb3hIzUY=;
 b=JQ2wDOaLCr+DZhHxRHTAyGdiq4FL9AMA74XRbt6bcwa8YJglcFfYoIhd33Q6Y4I2PnW/NM
 wG6s/QzgMjH1tf+swMnUk6We8TdY/iAz/RLH7xKVazg/FtUENeFb2MvTYgC6vFGj6QByih
 aOTNXEQ5hB8XO9M0mrc1leDEs/brP1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-jsPrDkeBM7apWFbfXf8p7w-1; Thu, 03 Sep 2020 10:00:12 -0400
X-MC-Unique: jsPrDkeBM7apWFbfXf8p7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6601DE13;
 Thu,  3 Sep 2020 14:00:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-10.ams2.redhat.com [10.36.114.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF4E41002D58;
 Thu,  3 Sep 2020 14:00:00 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/timer/hpet: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200903134506.440082-1-philmd@redhat.com>
 <20200903134506.440082-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <99ac9ba8-9a6d-dea6-c7eb-387723fe5fcf@redhat.com>
Date: Thu, 3 Sep 2020 15:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200903134506.440082-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Thu, 03 Sep 2020 14:00:18 -0000

On 03/09/2020 15.45, Philippe Mathieu-Daudé wrote:
> This code was never compiled/used, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/timer/hpet.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 380acfa7c8a..b683f64f1d3 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -416,20 +416,6 @@ static void hpet_del_timer(HPETTimer *t)
>      update_irq(t, 0);
>  }
>  
> -#ifdef HPET_DEBUG
> -static uint32_t hpet_ram_readb(void *opaque, hwaddr addr)
> -{
> -    printf("qemu: hpet_read b at %" PRIx64 "\n", addr);
> -    return 0;
> -}
> -
> -static uint32_t hpet_ram_readw(void *opaque, hwaddr addr)
> -{
> -    printf("qemu: hpet_read w at %" PRIx64 "\n", addr);
> -    return 0;
> -}
> -#endif
> -
>  static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
>                                unsigned size)
>  {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


