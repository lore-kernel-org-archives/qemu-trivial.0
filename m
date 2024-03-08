Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1riVLw-0002JN-MH
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2024 03:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riVLi-0002Dz-GO
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 03:13:03 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riVLg-00061i-V3
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 03:13:02 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a45cdb790dfso208364566b.3
 for <qemu-trivial@nongnu.org>; Fri, 08 Mar 2024 00:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709885578; x=1710490378; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3hjr+hXi96y9rsK4LI2sGzcszVc/xuvXEWVv+y3/7f0=;
 b=CvQNaCAfpY+fjjo9HTimyCza+QxOZ0LZyfZ9vZqUUkX1dlJEzzJ9sMM62cf6BaeKBJ
 3AhuEbJfydMzxKcN0mraPfkJi6N7GZjmT7V+Jwho7ZryfpcbHjpWk6n7RpVRbRs3ChA+
 RHruoTDiOr1sPVQvCdZTSfk+OV6towZjR0ic2FM5QLtGQTsbLWGCmnd/0KMn1b/v+gws
 EoQsXW9I1MFkM6+LLzeUEI5MU19ftQB2ogOBgK/pafpJfP4JL5KNnMGv7afMDrmC9xIq
 9ZJGeZsJhOORtM5np2cRVKdtZgZlrwOGc5/zH6CmuSZZslz1/0IvKSg2JiSc1UiMOYjC
 e8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709885578; x=1710490378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3hjr+hXi96y9rsK4LI2sGzcszVc/xuvXEWVv+y3/7f0=;
 b=CRD8OuP10SYO3Iqjtr1XctPVfs35fP00Maj6mqlV6OQtxqWhacjfO1B/htyc3X50XT
 W8JUplrOs5lAD/BoRItDAfkrkrthh5OC19C3awROXrGv1O+MqbuTI0M5HPwonMl+vPsT
 u7OVfGpQKzU+ows64JBDtrrNcuK8F4gg5fKzbtm0yRFr1NPLeNIJ23l0cTYaAdsz+ti9
 4KIeFXQhCwVe34FXT5p2H8JASzyp0WPpuPDdHJ3H3ZJ2RBAQgAyXVgOzRT3mVk1we+kW
 w9wqQBcpeYe+qWd8pL8Tb8PbPtHQpBfmgkXZS9kbhdjepNdl/KeDyo8uXkiDf+U2hb2o
 9OJQ==
X-Gm-Message-State: AOJu0YwFmSUhNAoiAXzhTquNSzqAKqN/zqwLMoBICTrHsCEQsGdO1Rnv
 asIWi6HT7/h+iv8LjJv3U5Whbqh7XeYn0BvPTaKjKQKF4Cfuybc5nFmly+QLrHW7YDPCC1kMGJC
 F
X-Google-Smtp-Source: AGHT+IGW8vQzXPMXhNRDB9cqXkxwFEJO3I6JyONCsSyIMVH9IKVxvzU/vWff8R6P7LitdnR02xsbzA==
X-Received: by 2002:a17:906:eb4d:b0:a45:b36c:55c8 with SMTP id
 mc13-20020a170906eb4d00b00a45b36c55c8mr5392711ejb.38.1709885577659; 
 Fri, 08 Mar 2024 00:12:57 -0800 (PST)
Received: from [192.168.69.100] (pir44-h02-176-184-37-132.dsl.sta.abo.bbox.fr.
 [176.184.37.132]) by smtp.gmail.com with ESMTPSA id
 jl1-20020a05600c6a8100b00412896298afsm1327135wmb.1.2024.03.08.00.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 00:12:57 -0800 (PST)
Message-ID: <7cced4b0-0c95-4544-9599-a2ad994cdc98@linaro.org>
Date: Fri, 8 Mar 2024 09:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/i386/pc: Trivial cleanups
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240301185936.95175-1-philmd@linaro.org>
 <2062822B-3D5E-4D17-A913-0036249CFB50@gmail.com>
 <33636782-de00-4a9a-87e1-59beac29087f@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <33636782-de00-4a9a-87e1-59beac29087f@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 08 Mar 2024 08:13:05 -0000

On 8/3/24 07:05, Michael Tokarev wrote:
> 07.03.2024 21:57, Bernhard Beschow :
>> Am 1. März 2024 18:59:32 UTC schrieb "Philippe Mathieu-Daudé" 
>> <philmd@linaro.org>:
>>> Trivial cleanups, mostly around the 'isapc' machine.
>>>
>>> Philippe Mathieu-Daudé (4):
>>>   hw/i386/pc: Remove pc_compat_1_4..1.7[] left over declarations
>>>   hw/i386/pc: Use generated NotifyVmexitOption_str()
>>>   hw/i386/pc: Remove 'host_type' argument from pc_init1()
>>>   hw/i386/pc: Have pc_init_isa() pass a NULL pci_type argument
>>
>> Ping. Will this series make it into 9.0? AFAICS all patches are reviewed.
> 
> Philippe, are you submitting this through you misc tree, or should I
> pick it for trivial-patches?  I'm often a bit in doubt about patches
> you Cc to qemu-trivial@, - a few times we both tried to submit them.

Yes, series queued, thanks!


