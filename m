Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qMluN-00055x-7A
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2023 04:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qMluJ-00055a-Hh
 for qemu-trivial@nongnu.org; Fri, 21 Jul 2023 04:54:39 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qMluI-0002oc-2L
 for qemu-trivial@nongnu.org; Fri, 21 Jul 2023 04:54:39 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso25432361fa.1
 for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2023 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689929676; x=1690534476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jNCXf9YMSUnAJuA7Fka9xK6DSgmOkU/mGcJw/b8eOUg=;
 b=rPLFtnnSGWi5JbXoMkH7yKiK/uVt4WggFUPpk/iYGGTPGTYGS9jvgoG6eSDZlTB+sg
 v2/TLFLrHWukZUGjfgLBIA0CMkXB6GA9zBPecAmqwnv7p8LAtBaKAzwFN/VIMryHCFvd
 PUfFcRSyokMUsX2vObllOhtfyvNMwocOsUGbVHc6vVnLOgU3bvAMwmm4IxuxSaU327JZ
 i3tWHATFGCaEZsqtjbbUPb86gSLKsLvTDex82n9yNNbYDw5yldoe7KFzBt2MKvPz78yv
 wvwnz1l5tV/WdwgoLN6TcqS9zNzrxxa6EngToZEfjAJt3veLwtyggL0rr9h098hLg6UZ
 FBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689929676; x=1690534476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNCXf9YMSUnAJuA7Fka9xK6DSgmOkU/mGcJw/b8eOUg=;
 b=B23cWzcsvBPVAlDw3uSACOK096qPzGuz1Wcq3jyDvhDuPxc0sOrI4ud5e3msViYz34
 YW+tEFiUyLhXXSoc48PouFC3RllD9nVhdiCpMzWZJKXfbo7byfuHZHwOzIn1ArMvoYqM
 tg4fJtocmsWrNMs0uPwDm+ErQzeGdi8UuaiE3jrqaJheMT939zvISc3v2W9WIAnO3sGA
 Xm13c3qiSeCeQEvT4+0UgRSA9fR4IoL+pPlYFbMIrbeg8zBJbgEfoPD8YDyVj3Y46863
 u0e2bxRqTZ9YwLnTykMwZieJyZRvbbQhAx7+hobycVhsNbOFYrJMFT+M9ca/CtlwlAxY
 W7mA==
X-Gm-Message-State: ABy/qLZQLBsdkhxccz11ZCeHV+t6Jmyrz9mns4l5qR7/Ip3DyQ1wLDXv
 AOSC9k+2ltUIMo9K0fnAwWvL0g==
X-Google-Smtp-Source: APBJJlG1nej+YPsdulB7VyUQWesH2CUpm2uJ+tHpKQUD/LJspKrbwgEz/SJmR1WVyiu6IN2E/6822w==
X-Received: by 2002:a2e:9845:0:b0:2b9:4805:a039 with SMTP id
 e5-20020a2e9845000000b002b94805a039mr868925ljj.51.1689929675997; 
 Fri, 21 Jul 2023 01:54:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.192.5])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03e630sm1154018wme.0.2023.07.21.01.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 01:54:35 -0700 (PDT)
Message-ID: <c11c615a-21eb-93dc-1a24-8aedee64d810@linaro.org>
Date: Fri, 21 Jul 2023 10:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH-for-8.1?] hw/virtio: qmp: add RING_RESET to 'info
 virtio-status'
Content-Language: en-US
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230721072820.75797-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230721072820.75797-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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
X-List-Received-Date: Fri, 21 Jul 2023 08:54:39 -0000

On 21/7/23 09:28, David Edmondson wrote:
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   hw/virtio/virtio-qmp.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



