Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsnT-0001nq-Gk
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 06:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uBsnL-0001k4-O5
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 06:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uBsnJ-0007em-1B
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 06:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746439887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vY9Sse6qLU4yXX+OFkxtxctaHzVh/d4bNnbXds5ox7M=;
 b=Z8jT8a6o4jC4F+H88TUVYEnSROG3/+rJ9t6yKdX21fZE30v45D30flxaNAcG5mlBV91nK7
 WVUSqZAjpFry9I8eU8WVSm4R2T61avXUDhBP11PjDhMR/RkyfgAYGjvkwgI3WY4KHZzOdT
 iJFvbnGPp1JasP596INLRmIw02KbyAc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-2x7o38PXMQm9qwNHFbr4lg-1; Mon, 05 May 2025 06:11:25 -0400
X-MC-Unique: 2x7o38PXMQm9qwNHFbr4lg-1
X-Mimecast-MFC-AGG-ID: 2x7o38PXMQm9qwNHFbr4lg_1746439885
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39c184b20a2so1173181f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 03:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439885; x=1747044685;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vY9Sse6qLU4yXX+OFkxtxctaHzVh/d4bNnbXds5ox7M=;
 b=AD2L6TnpfyJkDrygRU82HMZkE8I3gNlQkzY6QJSS1RDJn6ZtYc/a7NtkgGGn/gqRgL
 yhHAU8e5VmWyMrVH9GW8lZLPKxtPE3XNEMqcyzkjOwd6RuZuKqS6dmTr6PEAN4HR3OZ5
 zsAsRNhEPQL8qolMbUYcrnHcPD2x00D0e7Jsc7pZuJ978P4/aNDTZehEKgGhTOiMjLpL
 WW5AlLuTa1pxTQqadWFUwMhF/l6ADkuEYtA9HLZ+58ZiCdpoMPDuBQx51C9uVU1SyZMi
 LnIct9po6ZLc5x/iAlb3NWNyLOM52kj57T388PSx5Qpm+TFwkt5OTVXbyxxxI8sYv5NU
 jOPw==
X-Gm-Message-State: AOJu0YzUBJtxqtr/VQVlrouBVQbDEmAFEyQcW6SEUb1Z6hZyOTRHMiro
 5qyWQ6COsCjxYfbF9SkPPVGTbAdqsV0Xys7DWeG2OLs4QZiFnexbprd5abF+qSxvA6ruc57zCYn
 jLUyHfUn7KNjLWAf+KLusNnpSwFVgwrGHpd8MrG2BwD3pYS7/O6E3aJQ=
X-Gm-Gg: ASbGncsfJAL0VGT4CLEJ7YWIumDM5jOnvjC5SWGST+Os5cDHEGd03Vb57q0uPH9Bchk
 KD9jaikbG5z7+Y75mmDxZAB1niD+cWAl+7RsBTLazheluo1lLwRuIpFRNORxnXPkLA1F7suRTJd
 ofuhHxNzW2irdnzuIMfbruQX1tpWLhRVugspTySgl9y36F4gURdlIOIcSXxIvcGzc3D6YblWdJ2
 1Uu90eXf+ZG1FWBzgokZD3mM5bIJu4MoMg3E+evT1JvqHwl6VUq0jmrTMTtCkmKOzespofJfa+6
 cyseCg4zcwb94rUEOIJLRURr4vvof9PkZa3kHii0
X-Received: by 2002:a05:6000:178f:b0:3a0:8826:d9df with SMTP id
 ffacd0b85a97d-3a09fdd6f89mr4662675f8f.49.1746439884771; 
 Mon, 05 May 2025 03:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNo4eafI5RbACmF7QQBU98lVVbJSfI+uQQ8K2wpItDuMk0TNbHw0itIw7ozrJwrxDAFr7Wlw==
X-Received: by 2002:a05:6000:178f:b0:3a0:8826:d9df with SMTP id
 ffacd0b85a97d-3a09fdd6f89mr4662658f8f.49.1746439884339; 
 Mon, 05 May 2025 03:11:24 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-87.web.vodafone.de. [109.42.49.87])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae344esm9760237f8f.25.2025.05.05.03.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:11:23 -0700 (PDT)
Message-ID: <0cd8b486-630f-4168-ab89-92f2e1843a09@redhat.com>
Date: Mon, 5 May 2025 12:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/pci-host/gpex-acpi: Fix typo in comment
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org
References: <20250504215639.54860-1-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250504215639.54860-1-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wNYbfzZ7q9UULjmM1LLRvU8UyQ10-MBjd0iQm-hswrw_1746439885
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 05 May 2025 10:11:34 -0000

On 04/05/2025 23.56, Gustavo Romero wrote:
> Fix typo in a comment about the creation of the ACPI CRS method.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   hw/pci-host/gpex-acpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index e8b4c64c5f..0aba47c71c 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -182,7 +182,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>   
>               /*
>                * Resources defined for PXBs are composed of the following parts:
> -             * 1. The resources the pci-brige/pcie-root-port need.
> +             * 1. The resources the pci-bridge/pcie-root-port need.
>                * 2. The resources the devices behind pxb need.
>                */
>               crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,

Reviewed-by: Thomas Huth <thuth@redhat.com>


