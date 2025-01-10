Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tW8tb-0005B3-Mj
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2025 01:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tW8tZ-0005AJ-Uy
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2025 01:53:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tW8tY-0004MK-Ff
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2025 01:53:25 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so18335115e9.0
 for <qemu-trivial@nongnu.org>; Thu, 09 Jan 2025 22:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736492002; x=1737096802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NysGpnhz+JRhaaLwqNVketbtskncAzhW/+7oJdgz4r4=;
 b=aB+bZH3AYFv5u/2XMSSRnv5Sx766xfgz2m1CNU92SI+FE7YSN5fbyehN3aFPaUzd8T
 XXRuMIVw6DcVHWQHVXaQpoLv7fxrrAo3vsRHk3ePcMG1p5Rl7V0/O8MVMAWtRKtWcSwe
 /197DiN/MKW7JQz3Tgz2u53LhN+QWKuaIRHzef8XPAmC51XDuLtxDPz8UCm7Y48vdyNa
 TNZgcUcmU4S9UcDNrRWbpbGu4WTZVocsKVXhXZE9P2Ds+WJVwSvxI6blC5eFRVRAwTN6
 otV6DpPdGVHQgaNa3ssQhEWwvEFQYf6tS7MQ/8IZYtiShBe5yXJ6EMfFFO23l4iRtHnh
 uIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736492002; x=1737096802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NysGpnhz+JRhaaLwqNVketbtskncAzhW/+7oJdgz4r4=;
 b=CfMYKqjRnMwWJ+29P1ukq0MhpuzDmkI+DcExm6KPxchtC96C9uJUiO3ubqMriBLWw/
 1rHGuIiAtp0N/kbrGuUikV34yNrFWQIlWWS+wQhGH9kcIR8/TKinIVG563pytvA6vt7r
 sBZLntBoNStVeMxzvWIJgTxo4TmdG5AmGl7QjCSs0ffMx2Fxl54q2vJDqD35gVb114v5
 qDR2FuDdXYZLRJYOM+7Wrutoxa0/Le+ATMG8pnfmkwrm4Zy3DqMWIJ+d9f5I6qAfVFMP
 /cTiajw2UM1P9ja7/CK6yrGE6balfXOKIkBrxB3eKE3s8Egq84tC8w8J/vbdDBKbizAR
 uS6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVZXECOyWuyBqyL56bs25ssBUPFWjjXjDwW68ELekzS0sfBhmWO+xJ98qPS1PztGJhnHAggoSpkffTLA4=@nongnu.org
X-Gm-Message-State: AOJu0Yx5UEnuVAf69ZpACVmBn9f78Z5OiNMPqHXkVVhUAvTGPSB4bLE9
 77mfjtQkITIjoUdnDiHnDFxttz97UEsOXq4GR9WGWAym7giATLyyoCaoM9iE+kw=
X-Gm-Gg: ASbGncuvy2fwnYK7/G87bbm+F47W6nHELhihEoDTDUBA0qguHIqI247LuSxsyAUsjdN
 4IGxzUUizIuveoslImf8JRV6M42CZn3mjzb+BEXXeq90jxrPsy741FtLZAAiuRShAnazA3UaBLc
 wbv3dLlj8r59tDKM1yWtQJZ8UdbyIQ0ILIlaTnBANbDnAbKQ7aT+vVQRKaOCbL2liRjs6C8dYUc
 vzisUkO+oEKadUuqTIk8WyOiwlwLUTli5eyZl2ySfoyUI+kgpWrKB58Qt0hQL2ZTRxzRsZUwoiz
 YqfjydJhrDZFRk56yFoytGxjez4=
X-Google-Smtp-Source: AGHT+IFjkW/LHk5V3Ii4A5kY2kxRjWTF5f6MfDNWIRjZLL1uP8uQRGhhqKrl2W9Bzj3Cm/HzBIfHUw==
X-Received: by 2002:a05:600c:46c3:b0:434:fbe2:4f with SMTP id
 5b1f17b1804b1-436e26e1d21mr27193915e9.23.1736492002171; 
 Thu, 09 Jan 2025 22:53:22 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37e36asm3631044f8f.5.2025.01.09.22.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 22:53:21 -0800 (PST)
Message-ID: <debbd5de-718f-4940-b428-91ce6f0d5ee5@linaro.org>
Date: Fri, 10 Jan 2025 07:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qmp: update vhost-user protocol feature maps
To: Jonah Palmer <jonah.palmer@oracle.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, aesteve@redhat.com, hreitz@redhat.com
References: <20241216170914.1346403-1-lvivier@redhat.com>
 <c9341f03-ecc2-4a62-860a-35ff2b660651@oracle.com>
 <6f1dcbe9-3a7e-475b-92ef-14f1d04ffc2e@tls.msk.ru>
 <511cf8f8-03ea-4375-abe0-317ac3131b1d@oracle.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <511cf8f8-03ea-4375-abe0-317ac3131b1d@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jan 2025 06:53:26 -0000

On 6/1/25 14:25, Jonah Palmer wrote:
> 
> 
> On 12/22/24 4:13 AM, Michael Tokarev wrote:
>> 16.12.2024 20:30, Jonah Palmer wrote:
>> ...
>>
>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> Should this be a Reviewed-by instead?
>>
>> Thanks,
>>
>> /mjt
> 
> Oof, yes, it should've been. My apologies, I was on vacation and only 
> saw this just now.

Already merged as commit 1e3d4d9a1a32ac6835f0d295a5117851c421fb5d.


