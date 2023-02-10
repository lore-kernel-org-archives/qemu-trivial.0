Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQT1d-0004yP-Sq
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2023 08:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQT1a-0004vt-F7
 for qemu-trivial@nongnu.org; Fri, 10 Feb 2023 08:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQT1W-0000LR-8k
 for qemu-trivial@nongnu.org; Fri, 10 Feb 2023 08:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676034064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2E3Oj6IcrDe/mQwS5k+kn08DFACEhZms1K1KPGljjU=;
 b=O98oS3DhLl/m8TtTex0HyX4dIudjHjkzxirN+46iwOYLnpMfAGkiNHLGxBafNW4F8CPt4I
 O1MRMBNAsaW3mpqjga6fwimlXBALkplXHx/ulp8Vplfcc6M328/RyXRJtmruCaZ41I2eWV
 mjsrZidaZP6twZEcrRaB0EKuxuc51nA=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-_JCnHdqFNIOuLhotdgBQlg-1; Fri, 10 Feb 2023 08:01:02 -0500
X-MC-Unique: _JCnHdqFNIOuLhotdgBQlg-1
Received: by mail-oo1-f71.google.com with SMTP id
 z28-20020a4a655c000000b0051a9ebddf80so2064288oog.2
 for <qemu-trivial@nongnu.org>; Fri, 10 Feb 2023 05:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T2E3Oj6IcrDe/mQwS5k+kn08DFACEhZms1K1KPGljjU=;
 b=27jIsH8uc38mTUVtnO2qvWFfPQZBMrEF2UE0iH6ezaZRTku2eqAZsnfZIJzBLyoqSn
 FK6waxbR/ZsFNCObEU1bbvbvY+T+m/hVDHA6psOmn7mvHSNpmZ87+F+SBzLY8yxd3Mhx
 5mCYvf+Ha/rhOuvXl8iccsTkdx5/kFgAeUpa104Gt1KXomhrzAG/BP9LGfzSos4EiOXK
 svdcKummd/GB7/DA/Y1Ydvz8NJqzBgFhNwPpJTme3htYB9C0IhHMOCwqwfpz+DI1r6t/
 SUFnTApPsbHAIm7eXfX0Z23GPUnSF54NDGL4azZopYUT/4LXn2wKA8WUSH4DXHlFgQph
 A4VQ==
X-Gm-Message-State: AO0yUKUOAwpyRXCqPj0wsqN0LobrLRVmMRCXDC1mu8n3biQ+BYZ8C5js
 FH7BeDJRT6xjEX3M24E+04PE+WQslYXYlN9RlZI/HBcK2ZK3bDSWXXrh7+1Rsf7tQJfsBQVXim8
 k3MvMEpMMBWx2fDRE5A==
X-Received: by 2002:a9d:7849:0:b0:68d:3fc8:7c0a with SMTP id
 c9-20020a9d7849000000b0068d3fc87c0amr2834876otm.5.1676034061918; 
 Fri, 10 Feb 2023 05:01:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/R5X1KvIW8PHouzbJ04gow3rKIGfUGrGd1KCGB8YS8wMkGqHcOHglPVCvZpMm2XATDZEbdWA==
X-Received: by 2002:a9d:7849:0:b0:68d:3fc8:7c0a with SMTP id
 c9-20020a9d7849000000b0068d3fc87c0amr2834803otm.5.1676034060179; 
 Fri, 10 Feb 2023 05:01:00 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-85.web.vodafone.de.
 [109.43.178.85]) by smtp.gmail.com with ESMTPSA id
 n129-20020a37bd87000000b0070648cf78bdsm3448781qkf.54.2023.02.10.05.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:00:59 -0800 (PST)
Message-ID: <dcb1964f-6402-aa5e-33c9-4cbf1edd91e3@redhat.com>
Date: Fri, 10 Feb 2023 14:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] include/hw: Do not include hw.h from headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>
References: <20230210112835.1117966-1-thuth@redhat.com>
 <09b35ac7-367c-d039-b544-70b5cb1ab795@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <09b35ac7-367c-d039-b544-70b5cb1ab795@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 10 Feb 2023 13:01:10 -0000

On 10/02/2023 13.45, Philippe Mathieu-Daudé wrote:
> On 10/2/23 12:28, Thomas Huth wrote:
>> This include is not needed here, so drop that line.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/hw/ssi/ibex_spi_host.h          | 1 -
>>   include/hw/tricore/tricore_testdevice.h | 1 -
>>   2 files changed, 2 deletions(-)
> 
> Possibly more?
> 
> $ git grep hw/hw.h $(git grep -L -w hw_error)
> hw/pci-host/mv64361.c:14:#include "hw/hw.h"
> hw/ppc/pegasos2.c:13:#include "hw/hw.h"
> hw/sensor/dps310.c:12:#include "hw/hw.h"
> include/hw/ssi/ibex_spi_host.h:31:#include "hw/hw.h"
> include/hw/tricore/tricore_testdevice.h:22:#include "hw/hw.h"

Oh, I only looked at the headers in include/ ... but you're right, these 
other files also don't need it. Thanks, I'll send a v2.

  Thomas



