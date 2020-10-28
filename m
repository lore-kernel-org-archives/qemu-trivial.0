Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXiCN-0002fD-I8
	for mharc-qemu-trivial@gnu.org; Wed, 28 Oct 2020 05:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXiCM-0002f1-1o
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 05:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXiCK-0004FJ-4C
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 05:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603879010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VmWqhfUdjE1b1F+NtHcflN2U1YXzDlDg+55f/0RKfzM=;
 b=Ez7SII1TDbo7snYebgKq6ldCpsl+KnT82vPrnqGhH9CdKW3xkevZNA1HvicjKqTy6Cc7IX
 dA0QdBwhZl5PzVLefqLjkCdIRZjHfxCvm5SX3OjTVV04QHn4/x/YKrELjY/rsIY5PTak07
 L9b43TAiTKRh3vEuOe0j6kkRWESZnpI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-J-8lCZTDMOyAq5tURtmHYA-1; Wed, 28 Oct 2020 05:56:49 -0400
X-MC-Unique: J-8lCZTDMOyAq5tURtmHYA-1
Received: by mail-ed1-f69.google.com with SMTP id dc23so1888078edb.13
 for <qemu-trivial@nongnu.org>; Wed, 28 Oct 2020 02:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VmWqhfUdjE1b1F+NtHcflN2U1YXzDlDg+55f/0RKfzM=;
 b=QPAIk0fMoGmEdV/fitTeYGBJgmIcIQl/vWvDG2OaKb7uwyiPIao30QQ2lWOeK3Uk5T
 jg/8TCRknSvfuv7ETtT36SPHPlbzc1ezJ7MaziIw+i47z94A/YKp9iB9PndhOFqFPVyp
 5BBJ+21HjMauwwiPqGRCDo9fXkpe3MWdauHFjyiyqKwkEX0qpoltlRIdE+2B4vBqDzZM
 Lp3cmEzqEMJhZAokjAdB2Tg0BP5cc02CNx1mv21FqSfGOpd39S8CdduUvKSwEtAdB7sk
 WmoxqM3CzNATcKGD/p26KM4ZFXwYHeLp9KO1AA1PYRDu9u9R05pG7vQBN5lW2fGGO4Pw
 MZ3w==
X-Gm-Message-State: AOAM530Cx1yQ47MzIo2Apgcb19XWStGAkWvlAX20uagX7CkZPV+M/yQi
 grNlm4Nly9du9iL/dDZAwdn+yDdphkOuBc9G/ESIgoWkyUIrIy6EDS5mDPtmcjgfKsqpz0q8NLO
 6ievLVQLa87DHWwGV0A==
X-Received: by 2002:aa7:c704:: with SMTP id i4mr1049087edq.51.1603879007582;
 Wed, 28 Oct 2020 02:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR/i+MBh3XeFcPndAalgCgvJeDxpjOBl1Vrgn5ZFKaJ6yE0slhYP8muPoz4q1H0k7NYR/WVw==
X-Received: by 2002:aa7:c704:: with SMTP id i4mr1049064edq.51.1603879007392;
 Wed, 28 Oct 2020 02:56:47 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id g23sm2566746edp.33.2020.10.28.02.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 02:56:46 -0700 (PDT)
Subject: Re: [PATCH 8/9] target/ppc: silence the compiler warnings
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>,
 zhang.zhanghailiang@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-9-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <77fb89c5-daa2-0039-bdba-cce0f9895195@redhat.com>
Date: Wed, 28 Oct 2020 10:56:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028041819.2169003-9-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Wed, 28 Oct 2020 09:56:54 -0000

On 10/28/20 5:18 AM, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> target/ppc/mmu_helper.c: In function ‘dump_mmu’:
> target/ppc/mmu_helper.c:1351:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
>  1351 |         if (ppc64_v3_radix(env_archcpu(env))) {
>       |            ^
> target/ppc/mmu_helper.c:1358:5: note: here
>  1358 |     default:
>       |     ^~~~~~~
> 
> Add the corresponding "fall through" comment to fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  target/ppc/mmu_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 8972714775..51749b62df 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1355,6 +1355,7 @@ void dump_mmu(CPUPPCState *env)
>              break;
>          }
>  #endif
> +        /* fall through */

I'm surprise the compiler emit a warning for missing comment,
but don't emit one for superfluous and confusing ones (when
building a ppc32-only target). You'd need to put this before
the #endif.

But instead of this band-aid to silent warning, replace the
TODO by a LOG_UNIMP call, and add a break before the #endif.

>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
>      }
> 


