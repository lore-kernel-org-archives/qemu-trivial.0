Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtal4-000450-VK
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2023 17:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtal3-00044l-QP
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 17:40:45 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtal2-0000Ji-EB
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 17:40:45 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so274481666b.1
 for <qemu-trivial@nongnu.org>; Thu, 19 Oct 2023 14:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697751642; x=1698356442; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EjopA27rRiWdYW2uvmQgTqz6C8hzHp8lMBO0zXs9HhM=;
 b=mJEjkIcHMpoT8K1NAfuLQvvkbg9LVnNZq0+E2Gqczu8QnPqiRcFME2Y5pC5mHJ4/BV
 QS4qYP/1QNJzS6+tbfwkF5xTaQG0tXVgiTp5HfhaHNjOEXIXMCWqRWpUjQ8dwnD4dd1j
 jctNCDsPDmWX60r5nNdaWCm+NXEYoKio2C0Qy/X4/eMJplFG/WO46OhC2mXLIpUZuSJs
 NRksdWxINCTWQJtcjZrLHfALHQZxl6mmsZ5VKsjCEHpTEQCTVBmCc6PxmGzgMqDorClv
 kwUj0Eu+9DZoHagGqvqEGmpk02sKVoSlDnGYu356H/3jQuzU4TCrpjOdCFpd1KXxSKy3
 i9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697751642; x=1698356442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EjopA27rRiWdYW2uvmQgTqz6C8hzHp8lMBO0zXs9HhM=;
 b=K+RJjXuyP5MCld0QZUk4BIad66dUjVvz+SzeF8fjnqf0ZOPxRHTU2rAfxUob9uu8kW
 vD95l7thEikRur43aw2Rh60XbUPz5C8QH6Rim6QU7YngZg5sphN6cV/Zy01vtk8opMBA
 /ZNH9X77BfPrpC/K382pA0ZBMLOVTSZEli8KsPvJJYfHqNVpiyVeGg26iv0/ALRrwevd
 Z5MyM8xV38W+KwWQPhkR8Dv7QkPMEWRb5T6RqWq0Bl0N/qbMDIoQcRUluy4X2GOZEfFZ
 D0YHQumUsrg0q/lTB/OoRID9G8c/ZOZgIzmahxO1/BZE5TziB4tmLBUjgGYqUeNYaq1/
 wkxA==
X-Gm-Message-State: AOJu0YyhkiZzuPeXEQJkqlSYWqgaikIR8n+J1vesFZlfMPeTnmgtRmaT
 V1wJGiJGb2H9srlhQMwPOpwPpg==
X-Google-Smtp-Source: AGHT+IGOYVwU1wsij2Jr8UeB7SjCMQREhpfFnU4Jkxdd9fTelelcFa9PTIp6IhqwaVxdyYH8v3VfhA==
X-Received: by 2002:a17:906:ee8c:b0:9c3:dc6b:b7ad with SMTP id
 wt12-20020a170906ee8c00b009c3dc6bb7admr2709984ejb.22.1697751642395; 
 Thu, 19 Oct 2023 14:40:42 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 bm11-20020a170906c04b00b009a193a5acffsm223157ejb.121.2023.10.19.14.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:40:42 -0700 (PDT)
Message-ID: <3493f5dd-92cb-8afd-5566-60642c32e2a5@linaro.org>
Date: Thu, 19 Oct 2023 23:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add include/hw/intc/loongson_liointc.h to
 the Loongson-3 virt section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>
Cc: qemu-trivial@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>
References: <20231017153345.233807-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017153345.233807-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Thu, 19 Oct 2023 21:40:46 -0000

On 17/10/23 17:33, Thomas Huth wrote:
> The corresponding .c file is already listed here, so we should
> mention the header here, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Thanks, queued to hw-misc.


