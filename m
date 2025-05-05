Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsiI-0004Tc-DG
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 06:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uBsiG-0004TH-DN
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 06:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uBsiE-0006vZ-MR
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 06:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746439572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xWTWf+tCbT/zui5GQMcCZb/aZOotwYbrPx5arEUaOXs=;
 b=UM46bIJZuBe/aTMALbxhIM21zRJkgopCnp2hRqY9cG+OSRrDJkIbliaJdvlPBvvpjMPnHC
 dhsvfM37SZDLahMDxwS5pgnse7l2U3dVIr6pQMi4X8gJRAGWDWzhn9RNhWcWLJMLfzR+VF
 db+qTEkt5hcr9XBCH04E1OO2JkEUbBs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-ErACqTZLNbKwG_v9lwwfOw-1; Mon, 05 May 2025 06:06:10 -0400
X-MC-Unique: ErACqTZLNbKwG_v9lwwfOw-1
X-Mimecast-MFC-AGG-ID: ErACqTZLNbKwG_v9lwwfOw_1746439570
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf446681cso24682095e9.1
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 03:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439569; x=1747044369;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xWTWf+tCbT/zui5GQMcCZb/aZOotwYbrPx5arEUaOXs=;
 b=E21EeGxQW0G8LMqcUbnIH501xjNMcPpm7pAi1Kg5p5SDbR0oeqdKcyagOlK+VTsIWi
 z1Qq9yiFVKP4jR8BCGizo9xzTGQOJs83GlGHlPgnqsAu9pUw5aOURyRQkspr6d3YyZp0
 tQ+zvsAEkedud6jHIetkIBDyNViyeEob1QMNlT0IRPYoKDwnDHuWMPHnhfgGkfwnn6xe
 t8Aq94Z+Wg8rzghnIH0fypyEvPh41Ixux0+jmxEMzecbohnd6qJSH05s4BP4NPXzjsHK
 B+dLqOSdldmWENOi2HiisLCoN5TVTzjwXCRcQA7gItetztJORjGDpTuJp05Mlc9lzhqq
 rceQ==
X-Gm-Message-State: AOJu0YzgEeXCqY7bDUGvWkEd6gzNBZC/aDDyfqpFaiN+e5dRZEnyzeaC
 faDunlGYwMVpLsbjDlxWIyEA9oAk/8FCYaWmS2eT+9M8No6zZGe8nTu8d/+d1nnS1KtJ3HcsFGm
 GYwiI3Il4yGHLpgKh/P1FovT1qdxGMlo8v9qz5MPI8RZJ3ZbSNWIhmts=
X-Gm-Gg: ASbGncuBRLFtNgY9jmPQ/gDWxFTLa1XNOK2qXXphCZ+UgwCIoZhld6uP0qlSZx7uHo5
 5uPylBkZLSb2468w0a/SRYMedhwqZXZZHEvNKQS5MRK7AyZFEzxa1Nl5wdLjeqVFFtFFAPx/paR
 iV6AyHhqcSsxXeaHTsh8Wl3yCKGXhxhXUqzvZBnyL0knHWrfxGPKtDN9cI3fsPuEk99ni0Ndlfy
 rVdtWym9vh+Rn3aFV6Py38UYOmZE2WN2CZ4xJ2FxVwFYOdNeQBj5661RerB5begGAq3XZyoBi0o
 ejrvHLrOPZKV8XTA7sjmd28k+IfRCGQfu/M5x4yC
X-Received: by 2002:a05:600c:34c3:b0:43d:abd:ad1c with SMTP id
 5b1f17b1804b1-441c48b0347mr57794825e9.6.1746439569512; 
 Mon, 05 May 2025 03:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKW5pXFhFGO4RrBi3/zMtdBc6GI4MHJ6b0ktfqjQxLBPb7JQ5rn4bKSOr3cYl/DReaGxWa5A==
X-Received: by 2002:a05:600c:34c3:b0:43d:abd:ad1c with SMTP id
 5b1f17b1804b1-441c48b0347mr57794545e9.6.1746439569178; 
 Mon, 05 May 2025 03:06:09 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-87.web.vodafone.de. [109.42.49.87])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20a70sm175429475e9.31.2025.05.05.03.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:06:08 -0700 (PDT)
Message-ID: <ef5938de-4893-4eee-a9e1-c208f7c6890f@redhat.com>
Date: Mon, 5 May 2025 12:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/core/machine: Fix indentation
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org
References: <20250504215639.54860-6-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250504215639.54860-6-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yGCRWQljy8VNc8WUm1XtcdWFPC7s_Opur6NC-rbfo98_1746439570
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 05 May 2025 10:06:17 -0000

On 04/05/2025 23.56, Gustavo Romero wrote:
> Fix indentation for some elements in the hardware compat arrays.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   hw/core/machine.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index ed01798d37..b8ae155dfa 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,7 +41,7 @@ GlobalProperty hw_compat_10_0[] = {};
>   const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>   
>   GlobalProperty hw_compat_9_2[] = {
> -    {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
> +    { "arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
>       { "virtio-balloon-pci", "vectors", "0" },
>       { "virtio-balloon-pci-transitional", "vectors", "0" },
>       { "virtio-balloon-pci-non-transitional", "vectors", "0" },
> @@ -58,12 +58,12 @@ GlobalProperty hw_compat_9_1[] = {
>   const size_t hw_compat_9_1_len = G_N_ELEMENTS(hw_compat_9_1);
>   
>   GlobalProperty hw_compat_9_0[] = {
> -    {"arm-cpu", "backcompat-cntfrq", "true" },
> +    { "arm-cpu", "backcompat-cntfrq", "true" },
>       { "scsi-hd", "migrate-emulated-scsi-request", "false" },
>       { "scsi-cd", "migrate-emulated-scsi-request", "false" },
> -    {"vfio-pci", "skip-vsc-check", "false" },
> +    { "vfio-pci", "skip-vsc-check", "false" },
>       { "virtio-pci", "x-pcie-pm-no-soft-reset", "off" },
> -    {"sd-card", "spec_version", "2" },
> +    { "sd-card", "spec_version", "2" },
>   };
>   const size_t hw_compat_9_0_len = G_N_ELEMENTS(hw_compat_9_0);
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


