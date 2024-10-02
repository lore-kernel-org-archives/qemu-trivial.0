Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svwhC-0007gC-IJ
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2024 06:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwhA-0007eG-N7
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwh9-0001ac-BM
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727865298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y9fuMPi5IhOlTNp4R5bwVFa+0gLsX3y2MARJkWhq9e4=;
 b=DaiP7SO/ZMe/UhI6dTZKUnfkB1B6skvSLfAtC5GD7muYaj2DOJv9At8rmuJIywb590mdz2
 8JkRWTtKxI4YEOFWCtzNjaFgYu+UrRDPteXz6CfT8Bkk5uNopaODw3qQB4A1FH6+4jBF2R
 XiNNBFFVp8Ms4JdhUkVaQ9SGId2kL7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-MAUj7Tf2NvarcWzxXAtHfQ-1; Wed, 02 Oct 2024 06:34:57 -0400
X-MC-Unique: MAUj7Tf2NvarcWzxXAtHfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso51268715e9.3
 for <qemu-trivial@nongnu.org>; Wed, 02 Oct 2024 03:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727865296; x=1728470096;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y9fuMPi5IhOlTNp4R5bwVFa+0gLsX3y2MARJkWhq9e4=;
 b=M3tQSIcxXj3BW5BdV/hIh1tuEpWflTSKJLyDMxpt2SHD72Aj7/S+RKXA9o+qYpx2Qu
 1TSMb5eZVkgVhkQ/YmdejqeQRhBiQjdwzfKYvvf6kFE+Cam3xEDtWc/ywccrWXUR/eP/
 CNeMj1gP+VlnkeraIVgVtVUaoypPgltAHGRRV6raAOG2DLfv+kxP8MJEuLzln+rszvHI
 53nHzmNGcnWpmMFpjQOKIkqiRQJB/g7E9R7Gt8RkFv/FQ11IGl64P6W4BtWXcQnnb9NM
 FR0DD4RhUFZM86+B7kcvvkgUF4ucf3De4xEKEXyWxhJntJMZb43NB83Yn4jqa8kNBORd
 m5Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhgKhADlP3szZ/mmiEYo9W+J8VL03AHm0bN4/pLLXX5RLeXEYlmTdXWu9hQLit2B5Ifed2M1UtjeHm2tE=@nongnu.org
X-Gm-Message-State: AOJu0Yxp0PiZEy/btNcc+aT0h/zU++AF+4L/QZ98n8ID2IVKnpcdUT+z
 l657LCcBk53iINpULu0xfiPPgYM64bpqjDnfvTEuYb0ygSb2z+rS4IcqZy895DH/e850QS2RhtW
 IWpQrJh0kQTEjnN58NMgGa/645ltHGGZ94GkDSCrap6GxOnDyS5/EAkw=
X-Received: by 2002:a5d:5187:0:b0:374:c15a:8556 with SMTP id
 ffacd0b85a97d-37cfba19789mr1955426f8f.50.1727865296162; 
 Wed, 02 Oct 2024 03:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb1Lf3H6ap3EVjUxYxjqCX9y9dMCPzlzpK7bwrfPYQL5EIOzir3tvDKQqATkMZ8K+d7frXZA==
X-Received: by 2002:a5d:5187:0:b0:374:c15a:8556 with SMTP id
 ffacd0b85a97d-37cfba19789mr1955409f8f.50.1727865295725; 
 Wed, 02 Oct 2024 03:34:55 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd564d41dsm13683593f8f.17.2024.10.02.03.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:34:55 -0700 (PDT)
Message-ID: <ab19d2c3-b9ea-4107-b8ed-28ce0ece0fa1@redhat.com>
Date: Wed, 2 Oct 2024 12:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: Remove unused fw_cfg_init_io
To: dave@treblig.org, philmd@linaro.org, kraxel@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org
References: <20240918123542.25319-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240918123542.25319-1-dave@treblig.org>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 02 Oct 2024 10:35:01 -0000

On 18/09/2024 14.35, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> fw_cfg_init_io has been unused since
>    918a7f706b ("i386: load kernel on xen using DMA")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/nvram/fw_cfg.c         | 5 -----
>   include/hw/nvram/fw_cfg.h | 1 -
>   2 files changed, 6 deletions(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 2dadfd6e1f..b644577734 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1171,11 +1171,6 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
>       return s;
>   }
>   
> -FWCfgState *fw_cfg_init_io(uint32_t iobase)
> -{
> -    return fw_cfg_init_io_dma(iobase, 0, NULL);
> -}
> -
>   FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>                                    hwaddr data_addr, uint32_t data_width,
>                                    hwaddr dma_addr, AddressSpace *dma_as)
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index d173998803..fa42677619 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -321,7 +321,6 @@ void fw_cfg_add_extra_pci_roots(PCIBus *bus, FWCfgState *s);
>   
>   FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
>                                   AddressSpace *dma_as);
> -FWCfgState *fw_cfg_init_io(uint32_t iobase);
>   FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr);
>   FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>                                    hwaddr data_addr, uint32_t data_width,

Reviewed-by: Thomas Huth <thuth@redhat.com>


