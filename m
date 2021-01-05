Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwk8N-00045d-L4
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2021 06:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwk8K-00044S-Ke
 for qemu-trivial@nongnu.org; Tue, 05 Jan 2021 06:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwk8J-0007bu-2X
 for qemu-trivial@nongnu.org; Tue, 05 Jan 2021 06:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609844650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhEb6IKJxF+dezkTX0J1ddSOzu//0Q/wqITiikG7nr4=;
 b=KdcGJmQrS8eJ56iGEHYApeA0fW3MvPztuNZyvuNlGB6Ek0iTVGQZ7L9m0wgnEZ/62WTspV
 qtoEqVaLqpz2T9xyOhpbFnoeWRmAe8TfFatFUwHKTjtyPBeIHWF+kCAQNQXrl85t3CMeXW
 MUkNALo04pNrHyTeH94vZ46+J3kxWuk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-J06MZ5oQMeW2N4yt0bzGWQ-1; Tue, 05 Jan 2021 06:04:08 -0500
X-MC-Unique: J06MZ5oQMeW2N4yt0bzGWQ-1
Received: by mail-wr1-f72.google.com with SMTP id o17so14744135wra.8
 for <qemu-trivial@nongnu.org>; Tue, 05 Jan 2021 03:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GhEb6IKJxF+dezkTX0J1ddSOzu//0Q/wqITiikG7nr4=;
 b=uL6B6prLFad5Dr/mY3MRUtGNKhMRjQuKuFGkGTP1NIzDahJtbnczivAoxcrISJT0cU
 KXDB9Fgs0MTGTz6eKm58XHpz6ae/NNILMdpW9lTCOleh671f7zjzFZs6uyj1JMC0XxtS
 b0LzmNvMX7liq1Jy+JiNyRWYziNmAv7SgK7D9t4FMSk+eF4aSjFWNyK24f7Sc2W70Ymv
 MIGREsGqL8IZpy3tVvmr8e2u56K4M/X4Pe1x7M9BAi4rM8NPVFsAiUjW1dDSHJa2oVqH
 cSGMNr4WKKNCdYXOhy0/TT92IEmNMgM/a92Ew9W2xKixmAVzBErO7YEv6+OrB/RUEYJR
 QKQg==
X-Gm-Message-State: AOAM531v6VT2tot10H2KLBIW0ptKJXqC9jFt9odCOW+nYXddJzDYsK+S
 86PORsWj8gMKatiiZk/e4+MZvF099WGw1H7Mdu1GAIqsrPspsVHhqeyg4M7dWT5ZQu/ovPccQQk
 epqciOnYvTmys5dzoSIBijxXwW1uZfaEPglKkGVF6StFbY/9mZ5iJxa3i+HVuiKQ03DI=
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr2930298wmd.41.1609844646982; 
 Tue, 05 Jan 2021 03:04:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+luF3HtXb3tmXQilpKjg5nQCMc2/ScSCWpGvXbf1EaUXosqbNxW7GVcFgUPouTEmChysjbw==
X-Received: by 2002:a05:600c:2903:: with SMTP id
 i3mr2930283wmd.41.1609844646804; 
 Tue, 05 Jan 2021 03:04:06 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s6sm104900465wro.79.2021.01.05.03.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 03:04:05 -0800 (PST)
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
References: <20201210172834.178052-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d4dcb51a-e738-33e0-fb7a-bad6cbe07ba0@redhat.com>
Date: Tue, 5 Jan 2021 12:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201210172834.178052-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jan 2021 11:04:12 -0000

ping?

On 12/10/20 6:28 PM, Philippe Mathieu-Daudé wrote:
> Replace I/O write error reported with error_report() by
> qemu_log_mask(GUEST_ERROR) which allow filtering.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/virtio-pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index f863f69ede4..094c36aa3ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -27,6 +27,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> +#include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
> @@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>          virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>          break;
>      default:
> -        error_report("%s: unexpected address 0x%x value 0x%x",
> -                     __func__, addr, val);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: unexpected address 0x%x value 0x%x\n",
> +                      __func__, addr, val);
>          break;
>      }
>  }
> 


