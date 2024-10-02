Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svwbD-0001BF-Gw
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2024 06:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwb9-0001At-Q7
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:28:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwb6-0000mN-2L
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727864923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p883nUjD9I9bH7pXn8fnsrsSdauN9+KrpyibHluFdfA=;
 b=JzYCtb5eq0iSQv1Usmc2WmgKFVn6SKuUADsaLPWCsToU2e4sfwZ3wBEzlNU41p+oY/2n0X
 VLdn598l+JXgq9FO/8pHlJPr/HDArg0NLG2y5L9SWIji3tYh7p9bMa0Ca7MZ1i6D4nfBNv
 7G0NrSmMrIV9jW9M0lwT5MXze7VwBgc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-o3Rycm4aP16EtO0fb7RYvA-1; Wed, 02 Oct 2024 06:28:39 -0400
X-MC-Unique: o3Rycm4aP16EtO0fb7RYvA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb89fbb8bso40274555e9.3
 for <qemu-trivial@nongnu.org>; Wed, 02 Oct 2024 03:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727864918; x=1728469718;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p883nUjD9I9bH7pXn8fnsrsSdauN9+KrpyibHluFdfA=;
 b=D/pTtXoUae4vWwg9pD+00qjjwCdVQXDjkzf6eTGye9WBTCk0ykVjUb3ghx487ppYuA
 pmVJSk4oDljQpyGIQs5+YWY4Kji6U/JbFqxQOG3yGlOTcF6IXHjQ21oVKxH1a7tzp/jc
 PyJd8rlpqPy4B3du5Ww0GFPmQZnfBCK1kc2SO97q9i86v+1xsQKaGVbIO5ARFiGh2UDF
 7rYYWHTqPMiOlnzmrCPxIveh2yK5idJB9+hbpoBikcsJYgaPnHSLP1t+6Qw2Q9K0JDzF
 x4hsLzSGlsx1zK/IBxg32PKlsiwupdC9aPyk9Ba7Je5m577Lhmf9DjSvX5vaTENW6sMs
 UCqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgUyVHKcYDwxCNio3lDnr+q8BHOsAW4Eu8kJVWfDWFHlnv91mRes3hrNsz/GCRWerptnTOtJhtvKJk/yw=@nongnu.org
X-Gm-Message-State: AOJu0YwgfyFQqbmL2jSG8U+rjdALdu/u505NOZEDAACRMF91968GQIff
 Tl5GcyGiVaCMLQPO8TAko+18Tz5SnYJ9+GjGCWm13ghE97K/ir4GBLXlXDeFDTI1TigcAb1ZrB+
 0t3T7VVDZsuPm8PRGt6NTd1tvqdMQ5E8ayFgher3phUdORo0xc+WJG/Dd/RJBmns/OQ==
X-Received: by 2002:a05:600c:4ec7:b0:426:6326:4cec with SMTP id
 5b1f17b1804b1-42f7909736bmr14280625e9.29.1727864918520; 
 Wed, 02 Oct 2024 03:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVZg9izWtAPUkmaPbNAuD46j3dKwKRkiLJULk5WIhEnC5f+NpEXMwEiu5qEgoANLja9V40Yg==
X-Received: by 2002:a05:600c:4ec7:b0:426:6326:4cec with SMTP id
 5b1f17b1804b1-42f7909736bmr14280415e9.29.1727864918175; 
 Wed, 02 Oct 2024 03:28:38 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79ff5b4asm14915925e9.35.2024.10.02.03.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:28:37 -0700 (PDT)
Message-ID: <f62ac9a0-c119-4b77-8845-9353a7a294ec@redhat.com>
Date: Wed, 2 Oct 2024 12:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] q35: Remove unused mch_mcfg_base
To: dave@treblig.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240918005132.187517-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240918005132.187517-1-dave@treblig.org>
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
X-List-Received-Date: Wed, 02 Oct 2024 10:28:48 -0000

On 18/09/2024 02.51, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> mch_mcfg_base has been unused since it was added by
>    6f1426ab0f ("ich9: APIs for pc guest info")
> back in 2013.
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/pci-host/q35.c         | 10 ----------
>   include/hw/pci-host/q35.h |  2 --
>   2 files changed, 12 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index d5a657a02a..f3e713318e 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -662,16 +662,6 @@ static void mch_realize(PCIDevice *d, Error **errp)
>                                      OBJECT(&mch->smram));
>   }
>   
> -uint64_t mch_mcfg_base(void)
> -{
> -    bool ambiguous;
> -    Object *o = object_resolve_path_type("", TYPE_MCH_PCI_DEVICE, &ambiguous);
> -    if (!o) {
> -        return 0;
> -    }
> -    return MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT;
> -}
> -
>   static Property mch_props[] = {
>       DEFINE_PROP_UINT16("extended-tseg-mbytes", MCHPCIState, ext_tseg_mbytes,
>                          16),
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index 22fadfa3ed..ddafc3f2e3 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -181,8 +181,6 @@ struct Q35PCIHost {
>   #define MCH_PCIE_DEV                           1
>   #define MCH_PCIE_FUNC                          0
>   
> -uint64_t mch_mcfg_base(void);
> -
>   /*
>    * Arbitrary but unique BNF number for IOAPIC device.
>    *

Reviewed-by: Thomas Huth <thuth@redhat.com>


