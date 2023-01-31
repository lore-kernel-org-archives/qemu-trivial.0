Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMrFf-0006o0-0X
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 09:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrFd-0006ns-FC
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 09:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrFc-0002sx-08
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 09:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Svd+8sWUw8PYlJNHP3F0NKAwX2zot7PgklGR5ShTsz0=;
 b=f5qcdoe+ryISyofqGhSJLMH5rkNSTXSKabrytftRJhwT3l1UjMMlOAO1fqdiCngkR/+/vs
 sJhhW54HfXq8OLTx7fui50CYa/WCfR0I2hhq5wRJFgtGKp5gTOmtXNZC77crJMb/1tuAcw
 iGviFJ2iEhOAFTTs7y2+JqTVYk/ILJo=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-dhr61dTlPnW4SH7LziQPkA-1; Tue, 31 Jan 2023 09:04:41 -0500
X-MC-Unique: dhr61dTlPnW4SH7LziQPkA-1
Received: by mail-yb1-f200.google.com with SMTP id
 x8-20020a25e008000000b007cb4f1e3e57so11657373ybg.8
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 06:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Svd+8sWUw8PYlJNHP3F0NKAwX2zot7PgklGR5ShTsz0=;
 b=Pzm9C1YLuxp1J7wuScc0e4QvrdwBTUGcc1ikIzKSxatQ+tjcmPxs6L8sM6bnM+A3PD
 bvowh56vOMQw491HvtZV2PSqnkkP7AucPJwWIF0SuwozQ6jrBYkdJ3Djod04G3rcEHX7
 5tvCumW3ED9itXte4jm1Nzap4Px6y0Sn2bCniM/MMU2aJBLeZXuhQysMYrvI7nYRPzBM
 IfhYTp6WnUIDUzXKvUEuv4yZp1kDZ1MkW+//KsMQGJspNmWyk50X9L6c+bfNsD+gWSsW
 G3Q6UI95SHg65RpWmwOntLYYCB6vt06OKooaS+niwLAAAOife5kBezbqhgrRjcDj3FpM
 4e/w==
X-Gm-Message-State: AO0yUKVY/Dhz0aR8TrTAwwrU/C07up51QLdGwJJVG+RbkMbnxSmVhG1s
 qE9a1lDxDvDpPZBRbh5a2RpgLVIPEIbglEuLNY3IxdrhbVvykH44LxzPYXinG2XbxDTtU7AupIv
 bzAk2k+tBaPDhcWIKDg==
X-Received: by 2002:a25:28c2:0:b0:83a:c1da:f0de with SMTP id
 o185-20020a2528c2000000b0083ac1daf0demr1012085ybo.46.1675173874214; 
 Tue, 31 Jan 2023 06:04:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9XC1mQUbpN4jCNTmaSOaCkUSADsDfVAISNUFf/qc0+/QaSvmJIlLE2VC+TK6ppdgBMM/bhrA==
X-Received: by 2002:a25:28c2:0:b0:83a:c1da:f0de with SMTP id
 o185-20020a2528c2000000b0083ac1daf0demr1012064ybo.46.1675173873912; 
 Tue, 31 Jan 2023 06:04:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 i1-20020a37b801000000b00702d1c6e7bbsm9876458qkf.130.2023.01.31.06.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:04:33 -0800 (PST)
Message-ID: <d72390b7-baab-c7d8-f827-cb9b0f11ac6c@redhat.com>
Date: Tue, 31 Jan 2023 15:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 10/20] hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-11-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-11-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2023 14:04:45 -0000

On 31/01/2023 12.53, Bernhard Beschow wrote:
> By using qdev_get_child_bus() we can eliminate ICH9LPCState::isa_bus and
> spare the ich9_lpc variable in pc_q35, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h | 3 ---
>   hw/i386/pc_q35.c       | 4 +---
>   hw/isa/lpc_ich9.c      | 5 +----
>   3 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


