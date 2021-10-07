Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYPZk-0000Tu-TB
	for mharc-qemu-trivial@gnu.org; Thu, 07 Oct 2021 05:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mYPZh-0000RW-Qc
 for qemu-trivial@nongnu.org; Thu, 07 Oct 2021 05:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mYPZf-0004bI-JP
 for qemu-trivial@nongnu.org; Thu, 07 Oct 2021 05:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633598422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpoSAzsk/ZIe+WgHmuQVj9nQLrk5d/zN6GhZNJAPDpI=;
 b=YdCq/wQAmHyzcaM/c7sDyTngdLyjKFhaxSs8JF7xDjUsyj4Qrq3KMgqQ1/zq0W7MaOzKmZ
 iDjaw4nc76G9DzjjFQkQMf4UvQDeKFuMB1pdZr+KuijiL2mGV1MMhqbKPQ9KPhqN2CheAO
 8gz7b9cEko64LVm3/0iVeRtry47Eldk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-HfMRyivmOvOiWnlooBiyKQ-1; Thu, 07 Oct 2021 05:20:21 -0400
X-MC-Unique: HfMRyivmOvOiWnlooBiyKQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o2-20020a5d4a82000000b00160c6b7622aso4086191wrq.12
 for <qemu-trivial@nongnu.org>; Thu, 07 Oct 2021 02:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VpoSAzsk/ZIe+WgHmuQVj9nQLrk5d/zN6GhZNJAPDpI=;
 b=zXsl5dncAI4FCEpur267sTNWiSro9qaSHJX9PvyzPuJwQs472EIU2FOhB6AIa1KQUU
 e1qNwm+wQuwtd+3hLFhzG0OudNeanewnfsF9UpnpPEtd24c3/+EKfzF1fyV/NKpKC+rp
 Bz2x7ERYdccVHLpfG4SWMIZXbOCj80ypgyNxF08WZaovlyOeey5AoJ3l7Piyiq/RLUan
 PW1ZNVW5eLbw5uJU3AmdJ7cllFBH8GbJFoWICL6F/u+nvSTOetRVL9gZ5NPIGstwhxaT
 Nw7qxfpQeQlzgCYBG5naW4tQVYOEyzQn+9XB6DkmvBVH1Q3bDKlY7lDpvurI+vj5XW7p
 4VDw==
X-Gm-Message-State: AOAM530D/jpNAbvnQmnygeOLkPDImiUprofmojq7LoZie/eqPCFC2ZZ7
 HEQUHqlgqMLzboXUgTeJpqAbwFxM3PB7yQ+O88js3ni2t1Jk8iKDvD7OSczau351+lo9/rZmoJo
 TTM/bIPKEi3knyKY4cLlAYAF2IeAFNFrQCeSPVgtX1BiQpggA8yVvYInsablxn4ZqAQ==
X-Received: by 2002:adf:aa96:: with SMTP id h22mr3968898wrc.405.1633598420002; 
 Thu, 07 Oct 2021 02:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu1+iTPqzWrm/+3Q4adjrDSmxvHPdu1iSzCrizlPPL6yMu8lRyHMtVPYReMV8O7+NTdzFM9g==
X-Received: by 2002:adf:aa96:: with SMTP id h22mr3968847wrc.405.1633598419657; 
 Thu, 07 Oct 2021 02:20:19 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6886.dip0.t-ipconnect.de. [91.12.104.134])
 by smtp.gmail.com with ESMTPSA id d24sm7549339wmb.35.2021.10.07.02.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:20:19 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer of the 'Memory API'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org
References: <20211007091949.319404-1-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ffd067bc-ffa5-9339-8e66-f107a26ec720@redhat.com>
Date: Thu, 7 Oct 2021 11:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007091949.319404-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 07 Oct 2021 09:20:26 -0000

On 07.10.21 11:19, Philippe Mathieu-Daudé wrote:
> Having developed interest with the Memory API,
> volunteer to review the patches.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..32b668e92fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2502,6 +2502,7 @@ Memory API
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   M: Peter Xu <peterx@redhat.com>
>   M: David Hildenbrand <david@redhat.com>
> +R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   S: Supported
>   F: include/exec/ioport.h
>   F: include/exec/memop.h
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


