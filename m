Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTIHG-0000bO-8n
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2024 05:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIHA-0008SH-8I
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:45:44 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIH7-0005qv-Gg
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:45:43 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so23447805e9.2
 for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2024 02:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721036738; x=1721641538; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PtMKmWDIJNHQwV+uoj77VsPuBuqd+52I+yrh1pXwqzI=;
 b=w/wXhV0onZS+utJottJNo/3AiMfx4nJvYSu6+aULpHoyFTLmuxDzxPtGHC8RmW5yiU
 p51QCeicF7lwEJE7KzPC4z4+T1Ya+MqmuBnhs6IGbfVolk1Y4M2gWvZ1DwMvcwOVHdcV
 8YfB8T56udqv+B2WivEi/CjGyGw9h3roRR2+QJbl5sza897Prd+CIBYGUx1NmVm9EMfE
 0VgAWP7qtfS+WhwckZfWadhFl3rwhoS6XuN2Sb1Ha5lqZPWLTtMIsopzVN/wNaAiiTuW
 juMfJ2k5MruXeWwXCA9LSGUgbmQl/sk9KmtiPR5+8E//cyJKELn2kH5cY4O8pb7t1T1Y
 iLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721036738; x=1721641538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PtMKmWDIJNHQwV+uoj77VsPuBuqd+52I+yrh1pXwqzI=;
 b=SalV5dhjq8Cr9V4pU1dkDvWXtF2lfEtkDxILG3LYgZ1ljl2h07eRsArpditnqSij9k
 phA5wkb0/0CK/E8Bz49PWGJdE3VFRcsD+WOnp3atz8kxfy9IWVL8H0d/XnA+rGAkaCL7
 HP+0rqIWseonQkXtenbWVs3hpigftTzI6wApRZ3YFwh1R3g1L2a2AsokVriZgzMcPcq5
 m7z4yqb0UanqFA76WaE4mG91g925a/P/bpkEWHJMpaant+txC1BSm1HWqjNqXVlfAL2v
 qGARcMmR9Txj0bBQqZRnft695BcW5q5djAAbXZN4Wso4QzLcLirNSKzkNWnO43732+m9
 MkKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlOO8VO8tcWia1FIwDhx5eAQYSa4C3N7fHoRHPWZOBqdm17WV4c+cnesxvzHig5Amh7GQ1UGpmuQ/yjiW9PdPNQ6mb8NjRqg==
X-Gm-Message-State: AOJu0YxrlC8bBUrZ8G8NeUejwKoCPgYKOymUnW1Ed/fK7SKhjubABUXM
 VLnOVtzcObPxEW2AEEAeD6lBRN22M88ED0xcIBPUZaVoIVF7EgB4TahvV3vWtvY=
X-Google-Smtp-Source: AGHT+IHs9PUUzkmJf8S3W924f0HpNzeBGa/URZYU73LyH3UZr/XtuUwG8YT4MR6I2oLqCToJ5mO/Xw==
X-Received: by 2002:a05:600c:4850:b0:426:627d:5542 with SMTP id
 5b1f17b1804b1-426707f9088mr113112395e9.28.1721036738568; 
 Mon, 15 Jul 2024 02:45:38 -0700 (PDT)
Received: from [192.168.121.175] (91.red-95-127-43.staticip.rima-tde.net.
 [95.127.43.91]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a14d32e8sm105851445e9.17.2024.07.15.02.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:45:38 -0700 (PDT)
Message-ID: <2fba3e7e-b5f3-4129-9628-954b727a25c5@linaro.org>
Date: Mon, 15 Jul 2024 11:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] backends/hostmem-epc: Get rid of qemu_open_old()
To: Zhao Liu <zhao1.liu@intel.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20240715082155.28771-1-zhao1.liu@intel.com>
 <20240715082155.28771-6-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240715082155.28771-6-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Jul 2024 09:45:44 -0000

On 15/7/24 10:21, Zhao Liu wrote:
> For qemu_open_old(), osdep.h said:
> 
>> Don't introduce new usage of this function, prefer the following
>> qemu_open/qemu_create that take an "Error **errp".
> 
> So replace qemu_open_old() with qemu_open().
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   backends/hostmem-epc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


