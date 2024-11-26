Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tFzFn-0005N5-UV
	for mharc-qemu-trivial@gnu.org; Tue, 26 Nov 2024 12:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFzFm-0005Mj-CH
 for qemu-trivial@nongnu.org; Tue, 26 Nov 2024 12:21:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFzFk-0005jj-DT
 for qemu-trivial@nongnu.org; Tue, 26 Nov 2024 12:21:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-434a1639637so17516605e9.1
 for <qemu-trivial@nongnu.org>; Tue, 26 Nov 2024 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732641691; x=1733246491; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X+YmXYa6M/2mv3GlzO6CQ61A8CDisrf5NEnTnbbO9oM=;
 b=RlUXttGBbGjGF4J+Fm9e+1lMoEEtOWcGeIbqYjl3qp+TAGKVX63NOD21C2IaLSSYvK
 D5caQhHYZ7HYGH9kPEosCNRIrK7+ImR421gaQIZA8V3klp3+lDdKdX8VD8lxLCGCZMal
 HR7uJx3L2rmW+FApJwBHxPhvHYiLnxvffmPc+zDBzTugrF0InMasZs320BMPh4weuhlO
 aO0Bq4g2llI0sw4zGdEYgdU0FXi46C7zPuCsJ62I94ZRHRUmJ5SgqMArfMgmXL/6/9qK
 kTtxurANcZHIcYRBX8A9cG+aeUh43Rk9jgU/A6iy9YPJGtt1/sL47J3pxfS2tNApPW9g
 l53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732641691; x=1733246491;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X+YmXYa6M/2mv3GlzO6CQ61A8CDisrf5NEnTnbbO9oM=;
 b=kzH3PphRVpBhNzBJkhSoxhx+G/tLpM/zdaP0VSs+kQH4zuFngElYOZYInBRu7NSPAA
 2LJtdC2WYt0AIoZIP7gp+1jnV6U7c4WP40ksqKR+oJ9jIu4266mLEdMk9CjK1bxpLTef
 zY6yJYCk2TwI91GE3lWF9D0cYhs6fenrK0u+UTwwFi4j8/89J1YEy2nSMIUFSJIHfU9a
 konrObsxBXBT16wN+H9EhElf0xNxHULiXCUB67L9CYD34OKzTJGqNS173S99GBJ7qd1J
 LugypcUSTBObYcP6KhcwSnDvO7Lc4Rv5DrQQMLLvpPrikU5zsHgtKrYmkp0LsxBrhJ/E
 LMkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZyjfPoaBLXIOYA37k7uGKYIwyEhPofCnGO1CdeOkg0Yqon/AxFk7AAqTJfO/zJVBjTLZrOFs9HrqixBo=@nongnu.org
X-Gm-Message-State: AOJu0Yw9xDG7i9yKFEyTkZVDHo0S7F6Zhz4y0QK0b2BFUvps24L+UHSV
 sshhRayhFeBNEXEOcm2FYCWzSykfq96dWDN81z7hc6xai4lsfHhuLBfLf7WW23I=
X-Gm-Gg: ASbGncsdOJ9e30gFTjPGyODXbvIWfcBrJvTVigI/2wU0ACxQeB1oD0F2oicL0BW9RLO
 lvedrisIFAqD0OUtRdMhv0RMwJ6jLj8YOClgzkI7wEfEmwz49AkDfxIQnceKrcxq65Ib+mNKoWP
 A5sRK/mJogve2Q+1Kn7mMAGATsjUuHtZLe3C5uazdb+0+AIG/gIZGPSodoV+boW/VAhfV4Z2p+u
 +icdGFWVCabSn7aMZpvNoo2YTjSreJi+fxV2K9weBXWp3JHs6ZCijalNeuHxxj25Q==
X-Google-Smtp-Source: AGHT+IHtga1Lwt5aO0gGPLwE0I3v/2SP0Yr+j2NTOIO7KZe6inUzwNwORG+mm9e4+F3H+ZXgBTOdZQ==
X-Received: by 2002:a05:600c:3d86:b0:42c:b4f2:7c30 with SMTP id
 5b1f17b1804b1-434a9de3d10mr759605e9.23.1732641690909; 
 Tue, 26 Nov 2024 09:21:30 -0800 (PST)
Received: from [192.168.69.146] ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad627bsm13833987f8f.12.2024.11.26.09.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 09:21:30 -0800 (PST)
Message-ID: <815aabd4-b423-4fb9-a370-7c6fd12b847d@linaro.org>
Date: Tue, 26 Nov 2024 18:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/timer/hpet: Drop the unused macro
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20241126163046.3344931-1-zhao1.liu@intel.com>
 <20241126163046.3344931-3-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241126163046.3344931-3-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Tue, 26 Nov 2024 17:21:34 -0000

On 26/11/24 17:30, Zhao Liu wrote:
> HPET_TN_CFG_BITS_READONLY_OR_RESERVED is not used in any place since
> HPET_TN_CFG_WRITE_MASK has been already used to check and fix the
> writable bits in hpet_ram_write().
> 
> Drop this unused macro.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   include/hw/timer/hpet.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/timer/hpet.h b/include/hw/timer/hpet.h
> index d17a8d43199e..71e8c62453d1 100644
> --- a/include/hw/timer/hpet.h
> +++ b/include/hw/timer/hpet.h
> @@ -58,7 +58,6 @@
>   #define HPET_TN_CFG_WRITE_MASK  0x7f4e
>   #define HPET_TN_INT_ROUTE_SHIFT      9
>   #define HPET_TN_INT_ROUTE_CAP_SHIFT 32
> -#define HPET_TN_CFG_BITS_READONLY_OR_RESERVED 0xffff80b1U

Never used AFAICT.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



