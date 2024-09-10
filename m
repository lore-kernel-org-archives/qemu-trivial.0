Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzhB-0008JV-N6
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 08:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1snzhA-0008GA-38
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1snzh7-0000kd-HW
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 08:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725970204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+x3LTte3EDw2YVn9G0en09BnY+YMkddWzmuoS9sQ2cM=;
 b=E8YRdRgqNYKnBeCTgjHvbw0hIvpR5NvVmbYAwOn8mKDp7nHpvJViEotE05z6twB74Jjihm
 dxSAbz2jtQTs44v+2516e7867wxVriRh7YIqTjCi0Ssv/wsDNT6520AdD4vCLCHb7QYilX
 CwDCowQ0Xv6kbrF6fUizs1rd0Xa2roM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-MnCBxmkRNNS9C8LyAvyrHw-1; Tue, 10 Sep 2024 08:10:02 -0400
X-MC-Unique: MnCBxmkRNNS9C8LyAvyrHw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7a9a71b17a3so573336885a.0
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 05:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725970202; x=1726575002;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+x3LTte3EDw2YVn9G0en09BnY+YMkddWzmuoS9sQ2cM=;
 b=X9L9U+YNpMo2gT9WBXO8s3Cm1iSlHMT9Uz5n9LD+verKLIsnpmG8B1CyktKpt9JShH
 BDfSVpZZpZmtiLxo7ePIgOrHMJhOb13zZJ6aPVzQmiosdXMj7LmRthLG3GSWMU/g+/gk
 Nttf9kwyVdJK6VPkApGHpB1XlLJdq+/f5ZsnFvmp1K8VxLOXBMC2upUPPcI3YsmEWdOb
 CizkFL6rPDdoPK8ezx3ZH0P2fPXW/ShQob6S2kKDfTE/S9UYd4NVNe3lFskpIOk6qXLg
 kKSSwcGyn4I01rmyHrK4oiyWJKCOlXw1upA9H0ZjYMonvoMbdln5P55hzM94rRmBo9Wg
 LwlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWNxYNu88ZlgGz0Re8EJUhQTNLJGMVXvZoBrw2WZkyZCWNXk+6pgIhHhmmth5nEOQtF67dvZHjim1zEig=@nongnu.org
X-Gm-Message-State: AOJu0YxPA8zIxzI41TCl/d/a1LmwFOQCscwvo88FjEF3Cqf36GP6ZbIP
 mhqnowszROl1eiiiO/dxsum36kLLunyxDpXADbKWHcM8oUAf0cJYzY/8TtAdoGXw/PGvtK3E9jN
 5WHSRbBb4TCWNjHanRb+KGRXIToV0Eb9rRr2kOl0q6/9d9h/HQMcGW98=
X-Received: by 2002:a05:620a:17a9:b0:7a9:bf2a:d7c8 with SMTP id
 af79cd13be357-7a9bf2ad945mr545667685a.41.1725970202431; 
 Tue, 10 Sep 2024 05:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjsP0PuAumCkuEVypR1GgIpms99HHt5HNN1m1fAY9dU9YvGNvRj60FFI7eumyeZT94Yhy1WA==
X-Received: by 2002:a05:620a:17a9:b0:7a9:bf2a:d7c8 with SMTP id
 af79cd13be357-7a9bf2ad945mr545662385a.41.1725970202133; 
 Tue, 10 Sep 2024 05:10:02 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-178-122.web.vodafone.de.
 [109.43.178.122]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a9a7948814sm302519185a.14.2024.09.10.05.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:10:01 -0700 (PDT)
Message-ID: <280613d1-bae6-41ec-9a29-a3f1526709a5@redhat.com>
Date: Tue, 10 Sep 2024 14:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] license: Update deprecated SPDX tag GPL-2.0 to
 GPL-2.0-only
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
References: <20240910115131.28766-1-philmd@linaro.org>
 <20240910115131.28766-6-philmd@linaro.org>
 <3849f9dc-57ce-4924-ba90-b2ad912ccd60@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <3849f9dc-57ce-4924-ba90-b2ad912ccd60@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 10 Sep 2024 12:10:08 -0000

On 10/09/2024 14.04, Philippe Mathieu-Daudé wrote:
> On 10/9/24 13:51, Philippe Mathieu-Daudé wrote:
>> The 'GPL-2.0' license identifier has been deprecated since license
>> list version 3.0 [1] and replaced by the 'GPL-2.0-only' tag [2].
>>
>> [1] https://spdx.org/licenses/GPL-2.0.html
>> [2] https://spdx.org/licenses/GPL-2.0-only.html
>>
>> Mechanical patch running:
>>
>>    $ sed -i -e s/GPL-2.0/GPL-2.0-only/ \
>>      $(git grep -l 'SPDX-License-Identifier: GPL-2.0$')
> 
> This didn't catch the full list, this command does:
> 
>    $ sed -i -e s/GPL-2.0/GPL-2.0-only/ \
>      $(git grep -lE 'SPDX-License-Identifier: GPL-2.0( \*|$)' \
>          | egrep -v '^linux-headers|^include/standard-headers')
> 
> Thus squashing:
> 
> -- >8 --
> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
> index e5a47eab64..4dc4c31da2 100644
> --- a/hw/net/igb_regs.h
> +++ b/hw/net/igb_regs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * This is copied + edited from kernel header files in
>    * drivers/net/ethernet/intel/igb
> diff --git a/tests/tcg/loongarch64/system/regdef.h 
> b/tests/tcg/loongarch64/system/regdef.h
> index faa09b2377..b586b4e86d 100644
> --- a/tests/tcg/loongarch64/system/regdef.h
> +++ b/tests/tcg/loongarch64/system/regdef.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2021 Loongson Technology Corporation Limited
>    */

Looks good, you can keep:
Reviewed-by: Thomas Huth <thuth@redhat.com>



