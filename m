Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIVGn-0002oO-3f
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2023 08:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVGk-0002ns-Td
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 08:47:55 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVGi-0004KJ-88
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 08:47:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id l8so1568627wms.3
 for <qemu-trivial@nongnu.org>; Thu, 19 Jan 2023 05:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9bXHeVoIwT+PFteQaUrDnF54U3Z1lr4pR5sb9PrLKo=;
 b=UZZpvSb4HeeCGugClpiXUn0wdsWW+TuXI4dyAXbKgqI691dXcSWVmUs9ufQDp0iddi
 xmQYed+iCc+i609dG0nv18sljoe5q45gArshR27Oz7+pHwgLdmmZeo5dO0wNjOqSskg7
 DBKxsaNMDGtbEfQppznD76T1wMinxwpRDvKyQ5aL8e6mIr/Q2ZLUGCfiLsnFCFv6yMT4
 SniebIt8AZQd1UgTWAs3tKI0Abpfv8ThUjYAte7cRX0B8PSLoVwnAvhcvLc9ddcodJgN
 0ACIqkZZ7zQIpYZLE1dUVPAs1j3eSAlMBuEwMgxRdhwiILUQEHuwVWg+Y183I4KYJd4U
 ld+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9bXHeVoIwT+PFteQaUrDnF54U3Z1lr4pR5sb9PrLKo=;
 b=qdcPQR+pB0n0FbnKGbTDHGQfkwgP/16a3xym1//O5CTq+yu0tywwETa0m7d26KnAIN
 hstMWSQIdtqONHoLwjqCCOjlR7Yi28I5Oopyno1M5CG0Yft7GOqvnOPi2mVCbDb7FXOb
 5pKwE+/zGUt90NOWL6fd0dJm2M8IfNWrJ/hmKrWXS8ei2J37kFrd/KFRIQaNHTQxcbhP
 ZEFLDVIzUcbu95z8Q/xJJ5WNa41qS1aeHIlRT9D8K4+wv7r0lLa1ew0J1bPDei+PqBA7
 msCZ5DFcaM+AM9fUWqIWRcJb/yj0fx4jrTMlRvaBxsFIAB5nANmglvyTXt52Cnw+auoF
 DihA==
X-Gm-Message-State: AFqh2kpeYugKJALSiH5jETz3ib5ljXYo56uN2wJl32Yw9zP+msT6ubj/
 lNHVlbfV76ayyCcsGS/mDB7lUw==
X-Google-Smtp-Source: AMrXdXtI9XL85z8VUY4QYxeYDFuacm97AViyYtNU0fx9peSC7l2A/xkDBE0lg8/rPN3GjRUdogGNBw==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id
 ip16-20020a05600ca69000b003d564bfccb8mr10260651wmb.12.1674136070678; 
 Thu, 19 Jan 2023 05:47:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003d9de0c39fasm6447017wmq.36.2023.01.19.05.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:47:50 -0800 (PST)
Message-ID: <b99714ad-8191-f830-26f0-4ed3f12a0d8f@linaro.org>
Date: Thu, 19 Jan 2023 14:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] configs/targets/nios2-softmmu: Add TARGET_NEED_FDT=y to
 the nios2 config
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20230119125745.2028814-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119125745.2028814-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Thu, 19 Jan 2023 13:47:55 -0000

On 19/1/23 13:57, Thomas Huth wrote:
> qemu-system-nios2 uses the functions from libfdt in hw/nios2/boot.c,
> so this target has to be marked with TARGET_NEED_FDT=y in its config
> file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configs/targets/nios2-softmmu.mak | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



