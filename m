Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVBCn-0007Se-O8
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2023 08:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVBCi-0007Aq-1R
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 08:00:11 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVBCg-0002nB-3W
 for qemu-trivial@nongnu.org; Thu, 23 Feb 2023 08:00:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l25so10216169wrb.3
 for <qemu-trivial@nongnu.org>; Thu, 23 Feb 2023 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i1PVANsEkSrJDMy2jC3iUiPhW80VnOCf3W+q+O+w/4I=;
 b=ptKCBPJ4Xvgi1ftlaDRmK4EQwzQ3SdtpPKTjWkVzIbWQs6rwGLnXL6jD4BC+VKosb/
 i4uFGR9NABFRGc89TzOYQ1/+RNKum1/a2uVToZy8N706qsUpVh0G6qeY9uLDT8BW+vHz
 VqQogYnm0Ryju/ruUBm9wSnhfz1GC8vcMbIjnBFogbv9sAtGTJoUTx76/QbxUKbKaffI
 MIjNXyy/1mYQe7OT+2dsN9RkO1mX7HOxBGyudmCDVi9FKsU3bP6Z9Y5MIzU3NfmsviJL
 yOYmS+FPaw0M0+chX18PW/xQHquToAgKfkMFUOP4AzDlz6yezGrpEvQ9QSkOftjNL9up
 OZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1PVANsEkSrJDMy2jC3iUiPhW80VnOCf3W+q+O+w/4I=;
 b=wHM9wn0DeeznCwZ160n1JptQfeTv+R89uuTvjQijgUW6GNApHUHbtB2KkgdDl8n/EO
 DFwG2meTtlN3DLfr1q7RhA/NiFQJ01cgvioA5gCyGe8r8cQYKt9WcgbPnTv41yB3PAGF
 fVzljJdV4ADE0HBKGvA831oquRL0xPN4si4EHd2NbTIntFpCpkAK1b5Nk8PEPBvtbYji
 2zjf+XZRSRf3ztxHYrYGMMttDS+Z5fk5I5BSWqXYb+E1mpXKd5cnJnyRNg5G6Bm2zr37
 YNkUvVQaE6AC/qVMDVLXRMC60tyQLWmN0JfziTCqejlWG/eJvTIubRWs8UZwb18IWKVJ
 kORg==
X-Gm-Message-State: AO0yUKV237TcHxwWuRUqtmsM/VfwU7hrRzJLsMfSNQsBTjs/CkG7+miC
 yw0CUk+HMdlbGaaMT7OAxPKxbA==
X-Google-Smtp-Source: AK7set9G9VNXiBjXoBkZMXWPgqzeB/T0x9CWcnEPQw7PIUOAIxLsTFcTdHDh8qcQNJJ8GslopW2otQ==
X-Received: by 2002:adf:f946:0:b0:2c5:6287:bd30 with SMTP id
 q6-20020adff946000000b002c56287bd30mr9732380wrr.26.1677157203351; 
 Thu, 23 Feb 2023 05:00:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b002c567b58e9asm12108142wro.56.2023.02.23.05.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 05:00:02 -0800 (PST)
Message-ID: <3ff9033e-8f47-8f7f-00a2-8eca05b481eb@linaro.org>
Date: Thu, 23 Feb 2023 14:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] hw/qdev-properties: Constify Property* in DeviceClass
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230203101224.25796-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Thu, 23 Feb 2023 13:00:12 -0000

On 3/2/23 11:12, Philippe Mathieu-Daudé wrote:
> Qualify some Property pointers as 'const' when the
> structure is accessed read-only.
> 
> Philippe Mathieu-Daudé (4):
>    hw/qdev-properties: Constify Property* in object_field_prop_ptr()
>    hw/qdev-properties: Constify Property* in PropertyInfo::print()
>      handler
>    hw/qdev-properties: Constify Property* in PropertyInfo::create()
>      handler
>    hw/qdev-properties: Constify DeviceClass::props_ field
Ping (trivial).

