Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPPty-0006vg-OT
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2023 10:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPtw-0006vF-Cq
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 10:28:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPPtu-00035A-Ih
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 10:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675783733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKSc/8jFH0gXoMTCJMH5R6e3VIFiikeQr44IgDAeKQw=;
 b=LdhgFwsHOZUfVLiGjc9oJFsu916mrMs5dboqPavy0oM7dRFtXRya7bHE9km/f4C3nMcs/x
 i03ouCRN9e+VaJNUMc8uDMaUy7lz5HcXoU69yyoBayK587rZ1iHjdZ4M/vxGhk2KH2d0v7
 JAOvUZa/vAFcCEq39nbRZKfbQHF9T+4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-6yt9rne6MmiKxgLC0iEJ3A-1; Tue, 07 Feb 2023 10:28:35 -0500
X-MC-Unique: 6yt9rne6MmiKxgLC0iEJ3A-1
Received: by mail-qk1-f197.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso10134956qkp.20
 for <qemu-trivial@nongnu.org>; Tue, 07 Feb 2023 07:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKSc/8jFH0gXoMTCJMH5R6e3VIFiikeQr44IgDAeKQw=;
 b=qLDMGIheIEmAmO9wJdJLBamO+Isv4I8LJ7RohNZ3ugy0O2a6JJFSgFmZ0xejG/LsTI
 ulWodbQRwJ4gQB86PBbSuaUVmRcVlakJ74TRQiWwMk1u/whKes2Bsh6n6ucyRQZKwMi0
 NMJFGvwLWtLgAw/i4JG6kt8zbZK4iHl60vh63eWgMYtOn/+7xqh8CZDdZNEsqV+qjC7m
 TaPpOUfSOcvDVXXeFXm1m/EyjXIwOkHwUAlLIUayCNF3I5JwNwShXOQI4kd4Selr434n
 TH3oUJzk01vDHpN6qGsASAnzb1V8hlPdYk5etQrRffwwih8MZCfBSzs+T4eikQnoOg4i
 XuXQ==
X-Gm-Message-State: AO0yUKWc7hm0QOwQIq5wnEhgMtHhrJjQ+5egdWZlb4hExNQEkHuVDm74
 mbVVv1t4DP906lcJycPXnCHl11zecCx4noEH2Rso6WzKHsAnNg8JlI38RWEQ5X23FhsGTUp1t0q
 6BMdR1lNHfAAm0Ip9Qw==
X-Received: by 2002:ac8:5b10:0:b0:3b9:b2c3:9d2e with SMTP id
 m16-20020ac85b10000000b003b9b2c39d2emr6633113qtw.10.1675783714265; 
 Tue, 07 Feb 2023 07:28:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8PrpAbmaD2ax+rBXhyze3NX8v5etDQ6ce64r3iJ6PY/uNRNr9ecnIpZVQNvimtz5FBlxvypw==
X-Received: by 2002:ac8:5b10:0:b0:3b9:b2c3:9d2e with SMTP id
 m16-20020ac85b10000000b003b9b2c39d2emr6633085qtw.10.1675783714053; 
 Tue, 07 Feb 2023 07:28:34 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 q1-20020ac84101000000b003b86d9a3700sm9541856qtl.78.2023.02.07.07.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:28:33 -0800 (PST)
Message-ID: <e62be3f0-019e-d723-5df1-fc0d88b33ae4@redhat.com>
Date: Tue, 7 Feb 2023 16:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/10] hw/i386: Select E1000E for q35
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-3-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206140809.26028-3-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 15:28:56 -0000

On 06/02/2023 15.08, Fabiano Rosas wrote:
> The e1000e network adapter is the default network card for the q35
> machine. Make sure that CONFIG is always selected for that machine.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/i386/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 1bf47b0b0b..527b95df81 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -93,7 +93,6 @@ config Q35
>       bool
>       imply VTD
>       imply AMD_IOMMU
> -    imply E1000E_PCI_EXPRESS
>       imply VMPORT
>       imply VMMOUSE
>       select PC_PCI
> @@ -104,6 +103,7 @@ config Q35
>       select DIMM
>       select SMBIOS
>       select FW_CFG_DMA
> +    select E1000E_PCI_EXPRESS

Reviewed-by: Thomas Huth <thuth@redhat.com>


