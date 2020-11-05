Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kakoa-0006j7-JU
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 14:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kakoZ-0006hA-81
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 14:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kakoW-0007Y9-8i
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 14:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604604050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0xgQtdulOoh02cnDSLdHlJ5v0w+t9rUfDHLb2Dlo9o=;
 b=RE48rmhtF5DFNNTeyIY+AFFaTgwNRznmitcLp2/bjitmkSyOrZ4j+HqahXDAD3cNfztONI
 spegi5bbjSWewwT2NaCnWd9cRYb+PW3fDYyD/yJdDs0pcusJJhDgQ2N/S6grZjZWhP8cy6
 rjK+0GaTDPAF8NZI/GciFv6l/F9H5HU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Nvk1RNTnN0Cc9JORLEcyVQ-1; Thu, 05 Nov 2020 14:20:49 -0500
X-MC-Unique: Nvk1RNTnN0Cc9JORLEcyVQ-1
Received: by mail-wr1-f69.google.com with SMTP id f11so1103071wro.15
 for <qemu-trivial@nongnu.org>; Thu, 05 Nov 2020 11:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t0xgQtdulOoh02cnDSLdHlJ5v0w+t9rUfDHLb2Dlo9o=;
 b=O9as/qAB3wUEGM8szobSp/LCZpA3TrIWR8DbLj/UiOVlkpZHmhB0YmHNayMJLs7HGN
 J5j5TmeAhmC2GIr0pK87Iqpi5GP2Waskug+ZB59GGvgVyST0JQeH5/E96EBQfKnraSgc
 MgFwPrb0cJfcwI6A6ZFm3ZqPkwDHxNXius9xSkXsk7JwmuIOJfr0ys7F40G9NBshn/fO
 /W0dTEgW0ns/xVmpKOsspKPjOlGa/EE2axic7GkFbX4q5QaA7Dz2HxKZQBmieX8CxG2k
 J1xzxWodnpGvHrj3EVhRKt4ZkxZf0Igckk1TguP3ssUmPZRfevVFokHYYBVCrZXRk4Ol
 5lBg==
X-Gm-Message-State: AOAM530WobDHxPdyZakgbSUAaiswySNvn+xh72/SxLvsxvJ+n62bNtC7
 YI+GqzO/4/0BolEFzSDN386F7Kv6G5J0WyLXN9NcGmTefN5xv3ZfYC9ApVhTTPICjPKiYzJ32wc
 DewpXVA8zEh4DhDAmDg==
X-Received: by 2002:adf:db44:: with SMTP id f4mr4795476wrj.168.1604604047209; 
 Thu, 05 Nov 2020 11:20:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2jKg6Kx/VFml1jPb++uW/A+bmxzZHzhCCNrJjrZMJhbFGDNmyfrL1NXdQVAfOUQDOCkFu1w==
X-Received: by 2002:adf:db44:: with SMTP id f4mr4795464wrj.168.1604604047092; 
 Thu, 05 Nov 2020 11:20:47 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u3sm4185532wro.33.2020.11.05.11.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 11:20:46 -0800 (PST)
Subject: Re: [RFC PATCH 13/15] accel/stubs: drop unused cpu.h include
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: julien@xen.org, masami.hiramatsu@linaro.org, andre.przywara@arm.com,
 stefano.stabellini@linaro.org, takahiro.akashi@linaro.org,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <233db685-910d-3317-4bf6-09111852a522@redhat.com>
Date: Thu, 5 Nov 2020 20:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105175153.30489-14-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Nov 2020 19:20:55 -0000

On 11/5/20 6:51 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/stubs/hax-stub.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
> index 1a9da83185..49077f88e3 100644
> --- a/accel/stubs/hax-stub.c
> +++ b/accel/stubs/hax-stub.c
> @@ -14,7 +14,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "sysemu/hax.h"
>  
>  int hax_sync_vcpus(void)
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


