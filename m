Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rranV-0001Yg-PD
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 05:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rranG-0001WF-Af
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 05:51:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rranA-0007MJ-HF
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 05:51:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4155baa696eso15866705e9.2
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 02:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712051454; x=1712656254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bcvOj38qscvdE13E2r65sAnB0s0YG0iJ6Y0PeuaNSUU=;
 b=FFG6pB4iMx/GVGqqGtAMcCY2sUDx4rO+DDP03erHRI3jyS0hza3fiSQGHd9yuuMX8J
 ZYrFojMY1zNatw1LYC+O1whvzBxj8p+jyCv+UQPzc/SbC0I18toOJa36JXNFob/E1467
 vNRM2GkbtGsjC7Jf7DiX3BMZ93U74wBuh6hFaISLt8FSGrMNtXPzK2zDzY1iAN21fNRq
 gZ75W5wW70PKhf9EMvUQ2q8YCOOCXSUBwfyc6EWv/g460TLeizZ/5tZEHJPxpZkQrEEI
 rZrhmSyu3ynCBzgKpAoRQCwhZvjJj2xRlDXu8Bj4w3iZ7kAJSLs8HvVR8rH8qZ51SIAm
 yY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712051454; x=1712656254;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bcvOj38qscvdE13E2r65sAnB0s0YG0iJ6Y0PeuaNSUU=;
 b=Lonc690hR2Mz3IZASqyYKBeMjb7rdWhAisonrmZK6iczynSV+Y4MFSzP/K62SLXWg/
 yPVOdjMVuWCmja7Kj7qy1jMjWN6D7Pk+rXnUDXnJ+dpA8u5VbuYupYHgYrD02K0Iu1oL
 Jb0ip8H1TeJOcZRiccnHwvcyOLEYZ/79HNdCLzAc5fehA/65p7xxVOFAQd/zvYKSOsvb
 JcJuFjPxwyXX0BZk3T00Cb6rZEdM5XAkbSbR//Qg72vQe27lpoReeXRBB3UDR2D++r76
 5uSqESQsdfZU6fdoMWFwGY6Yg1oXnBPHVAOeOx7OIiqxB/c2vtYuGAuPHAsatfpOF1SS
 dlcA==
X-Gm-Message-State: AOJu0Yyx6c9iz+ok8bsFtI1NGGDwQr+YUAYHuOHRmPQeXT+Nf1Tw4De8
 kPiYEhpDXoztu+2gQKn1f6nsrwHAmWDAp+O/79FkMG1bGylzYS7BAirgDWHLxOwp2It9EyyC1X5
 /TIk=
X-Google-Smtp-Source: AGHT+IHQ9bA3Kv4ofi8GPbYkWN6t7n5FtlO/T35QMJhd3WqrelEQOvj4c56CMf0MU9ebi/rvVy5rXA==
X-Received: by 2002:a5d:6d49:0:b0:341:e4f4:4399 with SMTP id
 k9-20020a5d6d49000000b00341e4f44399mr7196055wri.68.1712051454448; 
 Tue, 02 Apr 2024 02:50:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d67c3000000b00341ddb65b07sm13729198wrw.63.2024.04.02.02.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 02:50:53 -0700 (PDT)
Message-ID: <d960f4d5-1570-4b07-a1fd-2bd1267d661b@linaro.org>
Date: Tue, 2 Apr 2024 11:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch for qemu-project/qemu#2247 issue
To: Michael Tokarev <mjt@tls.msk.ru>, liu.dayu@zte.com.cn,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, jiang.xuexin@zte.com.cn
References: <20240401174355899iU6IFrpOQSiGe36G4PToz@zte.com.cn>
 <298819da-145e-4478-901f-66241a23f03f@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <298819da-145e-4478-901f-66241a23f03f@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Tue, 02 Apr 2024 09:51:07 -0000

On 1/4/24 18:52, Michael Tokarev wrote:
> 01.04.2024 12:43, liu.dayu@zte.com.cn wrote:
>> hmp: Add help information for watchdog action: inject-nmi
>>
>> virsh qemu-monitor-command --hmp help information of watchdog_action 
>> missing inject-nmi which already supported in Commit 795dc6e4
>>
>> Signed-off-by: Dayu Liu <liu.dayu@zte.com.cn>
> 
> Applied to trivial-patches tree, in the following form:
> 
> Author: Dayu Liu <liu.dayu@zte.com.cn>
> Date:   Mon Apr 1 17:43:55 2024 +0800
> 
>      hmp: Add help information for watchdog action: inject-nmi
> 
>      virsh qemu-monitor-command --hmp help information of
>      watchdog_action missing inject-nmi which already supported
>      in Commit 795dc6e4
> 

Fixes: 795dc6e46d ("watchdog: Add new Virtual Watchdog action INJECT-NMI")

>      Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2247
>      Signed-off-by: Dayu Liu <liu.dayu@zte.com.cn>
>      Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
>      Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>      [Mjt: decode and word-wrap commit message and add Resolves: tag]
> 
> Thanks,
> 
> /mjt
> 


