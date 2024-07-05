Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPiKN-0001sT-M5
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jul 2024 08:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPiKL-0001o6-EQ
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2024 08:46:13 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPiKJ-0006PI-L0
 for qemu-trivial@nongnu.org; Fri, 05 Jul 2024 08:46:13 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52e829086f3so1718861e87.3
 for <qemu-trivial@nongnu.org>; Fri, 05 Jul 2024 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720183570; x=1720788370; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5NVMv4AboV1wj7lPPlne7miK0vMDkmY7UdvILUOuREg=;
 b=kEx0OdD/aHF+xen8bQ7hn9c/Yq7Q/0yEU008dP8WNlwbZzz88b6plX968aPvrgYXfc
 mPznU8YD2K2GPzz2vHxIs/xPO19l6wRu7NiANsAZobkgglG78YThnrOfHr1dJgLLgfVd
 13inHIDAvx3TBPJG8nwkGrneplVD1Q6uWuT5f5e4tWi0yQarcwsJJghMZLiFazyXMza6
 i177Nwcwqz8n+ZuGMVa7yR8N4i++UrGxs53AToSQQQyw6vM1zaUEiUEyZUD9cr3eJyeY
 GJKb9I0pJT3/zX1e2Gmx41Hsjh30s6pSEoKwxO4rQtN74eiIDIWpAK4FsViZjPNymCA7
 3JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720183570; x=1720788370;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5NVMv4AboV1wj7lPPlne7miK0vMDkmY7UdvILUOuREg=;
 b=AMkz1bdCJFbsrUyqjMjC56nPcsEcXRBzpyHeeZUfwK/PeYoWalmya6g+ecIU14ZMM0
 bSab6w9HVkOPblH3Cn844efVadTd5bugObWhgmc+o2PktRcj1Mxr7LWFl5YLl3ES9LfG
 NMnM0MnPD2yq7d/MZA9pY17qImuut/0t0sH69b3J4fdiuvU54LzsC6bukrR2p3elV5ak
 16GChNv6cO/4zLDG5gQB1FBR5BU+/zvQfHGQe1E9jC7gcVJgdfFxZgLMxS5AtlPe76UO
 O2UjOEX0DM1fHzQUiJX78RNNGT1zUSRMo+Zd58WVmdiomRlzBQP9hPXfFE7e5v2DfZfM
 iplg==
X-Gm-Message-State: AOJu0Yxuzig44wlaW8KYhFTOaEM1+e8lpSivF3Dksryv/8mOxsG8FNXC
 uiHDilTXr0pXMq8BZ8w7uBFHyZDn3uyQ6EcrcsjypFhR4RmqNrixAZSeDyFmBqM=
X-Google-Smtp-Source: AGHT+IHHOFdhc7dOaP8Kgv3NZkEtuwgFepROnjqx5uJa6K3g2KUzG/GxTZtGvO9HklDj+AkGSHvJKw==
X-Received: by 2002:a05:6512:3b4:b0:52e:830f:38a7 with SMTP id
 2adb3069b0e04-52ea0628c5emr3218696e87.21.1720183569820; 
 Fri, 05 Jul 2024 05:46:09 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.163.129])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679f9783d0sm3708376f8f.9.2024.07.05.05.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 05:46:09 -0700 (PDT)
Message-ID: <b822017b-bd83-4cf1-8ecb-22d998b1b99a@linaro.org>
Date: Fri, 5 Jul 2024 14:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system: Enable the device aliases for or1k, too
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org
References: <20240705090808.1305765-1-thuth@redhat.com>
 <73a0498e-8f66-46ff-a4f2-fcb6b80f9d42@linaro.org>
Content-Language: en-US
In-Reply-To: <73a0498e-8f66-46ff-a4f2-fcb6b80f9d42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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
X-List-Received-Date: Fri, 05 Jul 2024 12:46:13 -0000

On 5/7/24 14:39, Philippe Mathieu-Daudé wrote:
> On 5/7/24 11:08, Thomas Huth wrote:
>> Now that we've got a "virt" machine for or1k that supports PCI, too,
>> we can also enable the virtio device aliases like we do on other
>> similar platforms. This will e.g. help to run the iotests with
>> qemu-system-or1k later.
> 
> Indeed, since 2022 in commit 40fef82c4e ("hw/openrisc:
> Add PCI bus support to virt").
> 
>>
>> While we're at it, sort QEMU_ARCH_LOONGARCH alphabetically into
>> the list.
> 
> Suggestion: a preliminary patch sorting 1 arch per line ;)

Done here:
https://lore.kernel.org/qemu-devel/20240705124528.97471-1-philmd@linaro.org/

> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   system/qdev-monitor.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


