Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQtKp-0007h8-Oh
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2020 10:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQtKo-0007gf-G8
 for qemu-trivial@nongnu.org; Fri, 09 Oct 2020 10:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQtKl-00069S-MO
 for qemu-trivial@nongnu.org; Fri, 09 Oct 2020 10:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602253521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEgCb295nGJf+bxbOisbM2rQMfDEWKpR84WjsgHwmQY=;
 b=gtNVs2pprJgWg/uERmLEsmEWp5eePrNic+lGCK5G8mjAePm9BCX8EQ6StXKm8wRicl44Jr
 PpVAhMCJ2KVI3eDALIpiqkOTsmlDqWM2uL2r1LQhwY28Mw06hqo/y/hF2ikMqz4uC8Jrjp
 MbMOMmV61JuWq8LF24p1o1qQS36HtRs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-rlC4EKwuMNyJL63jyOu-hQ-1; Fri, 09 Oct 2020 10:25:20 -0400
X-MC-Unique: rlC4EKwuMNyJL63jyOu-hQ-1
Received: by mail-wr1-f69.google.com with SMTP id 33so5296090wrk.12
 for <qemu-trivial@nongnu.org>; Fri, 09 Oct 2020 07:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEgCb295nGJf+bxbOisbM2rQMfDEWKpR84WjsgHwmQY=;
 b=rYWz/tbl02deOZKE3Rc9XXu140BdZ45uKuNhX7Q2sjmmdFYz6LVRn44yVGf3qcbTlL
 IvN1hi/mTJJzis842GAga4eEWY5we7wmXRl45qko3B4dNu2WAtGQ4NiYOXFU8McnpiPj
 8SGA5Nxqimx2oGbDuZZFW7T6i4k+nbGzYbD7vTfIvkpzniCcN6Gg41On6RVVytmksPev
 m+Qub8m0srWz+HE+PeiQ+6/jglCETpFXgCwhUtIfF9Av9Ek6TInw3IL1JqxPz1Ex+tvu
 T8MCUNhQVx7wKn801ttMw6x0hywhCyaNLp5VSWuiqsP6/jOirOPytMWon9b+BrIKUowV
 aRzA==
X-Gm-Message-State: AOAM5337o+xfK/u/xEa7IeT6oUpNZWJuiHNBcUbIshjesgQRIsgmBCfa
 1be4iOwywdKNIandx4EDu4RcNlc28oS7eokiDzRz48GwigfvAhLYtq509qsyzYiJ7wYSNaPjnsy
 Xx2fLWq6dn9yBHCOgeA==
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr15888623wra.187.1602253518831; 
 Fri, 09 Oct 2020 07:25:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfoR+lEY2ufCPeSL6O72gWXrtRBzEDg+wPVGKDYDWyvKyaW7M3mTivbkUFb5+MEE1pQo29fQ==
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr15888608wra.187.1602253518662; 
 Fri, 09 Oct 2020 07:25:18 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id x65sm12853058wmg.1.2020.10.09.07.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 07:25:18 -0700 (PDT)
Subject: Re: [PATCH] hw/net: move allocation to the heap due to very large
 stack frame
To: Elena Afanasova <eafanasova@gmail.com>, david@gibson.dropbear.id.au,
 jasowang@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <8f07132478469b35fb50a4706691e2b56b10a67b.camel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a18674c-c3bf-2324-7897-cd4916690a13@redhat.com>
Date: Fri, 9 Oct 2020 16:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <8f07132478469b35fb50a4706691e2b56b10a67b.camel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.208, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Fri, 09 Oct 2020 14:25:27 -0000

On 10/9/20 4:02 PM, Elena Afanasova wrote:
>  From 09905773a00e417d3a37c12350d9e55466fdce8a Mon Sep 17 00:00:00 2001
> From: Elena Afanasova <eafanasova@gmail.com>
> Date: Fri, 9 Oct 2020 06:41:36 -0700
> Subject: [PATCH] hw/net: move allocation to the heap due to very large stack
>   frame
> 
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   hw/net/spapr_llan.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
> index 2093f1bad0..581320a0e7 100644
> --- a/hw/net/spapr_llan.c
> +++ b/hw/net/spapr_llan.c
> @@ -688,7 +688,8 @@ static target_ulong h_send_logical_lan(PowerPCCPU *cpu,
>       SpaprVioDevice *sdev = spapr_vio_find_by_reg(spapr->vio_bus, reg);
>       SpaprVioVlan *dev = VIO_SPAPR_VLAN_DEVICE(sdev);
>       unsigned total_len;
> -    uint8_t *lbuf, *p;
> +    uint8_t *p;
> +    g_autofree uint8_t *lbuf = NULL;
>       int i, nbufs;
>       int ret;
>   
> @@ -729,7 +730,7 @@ static target_ulong h_send_logical_lan(PowerPCCPU *cpu,
>           return H_RESOURCE;
>       }
>   
> -    lbuf = alloca(total_len);
> +    lbuf = g_malloc(total_len);
>       p = lbuf;
>       for (i = 0; i < nbufs; i++) {
>           ret = spapr_vio_dma_read(sdev, VLAN_BD_ADDR(bufs[i]),
> 


