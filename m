Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNFUJ-000680-TJ
	for mharc-qemu-trivial@gnu.org; Mon, 06 Sep 2021 10:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNFUH-000667-RH
 for qemu-trivial@nongnu.org; Mon, 06 Sep 2021 10:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNFUE-0007wC-TS
 for qemu-trivial@nongnu.org; Mon, 06 Sep 2021 10:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dL8fqFL7Qspfu9BADAy4kZgpFoVsh95v7mrtNsmjcww=;
 b=UXubKYrwhPOW2V0Te/uVKbfBfl51GJDJOeKmsLv2UbiezV1tFWMaiGnwinDek+cynYjeM9
 qrZ6JAhbpDjawfyqn+twNQHWX+n590nxyxOQ5VU7Zzf+2mHZsgmkdSY781LYE0vk/kwsxr
 MKWg9d5K+w7kafisRhvPopUXiWt/QnQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-h5ZjEy20O0GiAkbWBpA39Q-1; Mon, 06 Sep 2021 10:20:36 -0400
X-MC-Unique: h5ZjEy20O0GiAkbWBpA39Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1238316wrw.22
 for <qemu-trivial@nongnu.org>; Mon, 06 Sep 2021 07:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dL8fqFL7Qspfu9BADAy4kZgpFoVsh95v7mrtNsmjcww=;
 b=EC7ZTygB5Ve9Flnz2UK86E5yggFBvCMbFx+l+dyfC3xGhWVARembC6swiA7pSy+ui2
 DttrMZTDoYavzy1CPk9ktdDShvc2f8o+7V5y9fS6tUgkXvfk3zAH819JGt94C6WYVazu
 VKUQUzWg03UT/uo6VjdzyliKM+AD8VBisbImji1lgRfV8oLB1RFMEhF/Vbh82AhMWtCN
 Uq1kfYMnIVuATcd/n+ErA9UCeTW5b1zPXdVGboVDmSRzat6h+MuuHF+MlMHqLC9U9vir
 6pPgDNb9Rn6otoahQgnUEZNqfKk8kEd4ecX2u/VrfGbfqhjokum+KrtcUoGR+Uodrg3m
 vKvQ==
X-Gm-Message-State: AOAM531Lf2PPvo5HP1OTMH829yg2+Fb1SGmiRHOCHQTc5GmethflBSAo
 +46cfJiiFJWZhSXUO3tU/bUILRpyMLFM5p8ozmD15W2g60kulIngpr+uHBVJxh3Jk9/obqjOTex
 PTeEvXiEjlx7gzTUre1KKK+AbCCaKuzj/5OjUqIrPcabDDuqTEbOxCtabxmCCpTyvikc=
X-Received: by 2002:a1c:f713:: with SMTP id v19mr11639204wmh.188.1630938035363; 
 Mon, 06 Sep 2021 07:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUaysC9A72MdCR/bK4a3jjIfT57uINiDTEX3EMGl2EC2Ru2gNYWaRE5U7yBpq3vRyz9bkJ/w==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr11639178wmh.188.1630938035100; 
 Mon, 06 Sep 2021 07:20:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f20sm7302087wml.38.2021.09.06.07.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:20:34 -0700 (PDT)
Subject: Re: [PATCH 0/2] iothread: cleanup after adding a new parameter to
 IOThread
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210727145936.147032-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8669491e-1cb1-a9af-ab5b-8e5824629691@redhat.com>
Date: Mon, 6 Sep 2021 16:20:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727145936.147032-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 06 Sep 2021 14:20:42 -0000

On 7/27/21 4:59 PM, Stefano Garzarella wrote:
> We recently added a new parameter (aio-max-batch) to IOThread.
> This series cleans up the code a bit, no functional changes.
> 
> Stefano Garzarella (2):
>   iothread: rename PollParamInfo to IOThreadParamInfo
>   iothread: use IOThreadParamInfo in iothread_[set|get]_param()
> 
>  iothread.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


