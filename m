Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qdTZR-0005yW-VE
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2023 06:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdTZQ-0005y9-Jx
 for qemu-trivial@nongnu.org; Tue, 05 Sep 2023 06:46:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdTZL-000543-TK
 for qemu-trivial@nongnu.org; Tue, 05 Sep 2023 06:46:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401d67434daso23916565e9.2
 for <qemu-trivial@nongnu.org>; Tue, 05 Sep 2023 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693910762; x=1694515562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jObNrs6JMJwdrbyl5CFUVN9vOVh6iUppq7CGKT4gBRw=;
 b=BLXJ522QNKX/C4raS9saFUEj484INQL12kg8YKUUwOuvBWTD/lpEKHZwHJnYezmNp6
 vCzgFmpWaBQxZxI6EdOQ/5yHigWoOECoJNOH22uvXrph+YcnpHgXdLXNZ/2Jrn5CXHir
 ChOhSpohziH5BsIulJvTGw0baWXFM0Hw84fbT116mr2LHMNjjFLcV4uJ92mDG/Fn31Ow
 HwdtNQI5e5YGhTMqSUyaY8HXoXVUzADnihUG75SVNG+wclgPTPcXgW6HL/jb12B1Jj1c
 qG6535pZ1j69ZNUHf4dd3ezmA/ejsTBaZisppjtqgSOANNRwH4G6/B5oQtS1orBjAcgj
 087Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693910762; x=1694515562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jObNrs6JMJwdrbyl5CFUVN9vOVh6iUppq7CGKT4gBRw=;
 b=dXjYeyW/Uy2ar88je4jydz5+JSRGUbNGxeTR443MWwQS1zxMkm3P/gqKYMibsETCmJ
 hxea/1IgtRS7kImATk20UbO3y2xFDS9H4dYz4YO3saBAzoxqD+ZQftzU3gTbXBsYJ+KN
 N+a7kmQDiza4+fG9DPy/by6G7p9wi5s3Ck/X1aH8pBTH5VvfNJ5NUCte41Trs6C42Ekz
 l3nLGnpwGoZMsewcKx73P2I9hrJkf4kqPYkueug0JPQ5gKOczIObP621DQCTJXxkoZ8U
 CL2x+DGDxG2lV/C80p3f/uunQlEb5CkFbrxhIb6k6qYxWpUyE4pBZlV/mWoTsBipIrGk
 DSVQ==
X-Gm-Message-State: AOJu0YwMLkCTxxZLVBN7MJ1L9GMXE389cGICLagq4kfoXcl4TKIvElin
 hUVWg6yE8OyQj52kQoyG/d3vFg==
X-Google-Smtp-Source: AGHT+IFYIE1iRtBhObBhc6koK1hYhp6cBlaCPE3eiwKfB95tD4ferb1STvftzZr+S8TTG0M3WXpKkA==
X-Received: by 2002:a05:600c:3b8a:b0:402:bcac:5773 with SMTP id
 n10-20020a05600c3b8a00b00402bcac5773mr7389261wms.38.1693910761992; 
 Tue, 05 Sep 2023 03:46:01 -0700 (PDT)
Received: from [192.168.1.34] ([37.69.27.38]) by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c218200b003fef5402d2dsm19839232wme.8.2023.09.05.03.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 03:46:01 -0700 (PDT)
Message-ID: <08c7b39a-0bfc-4891-8cdb-76a188b84758@linaro.org>
Date: Tue, 5 Sep 2023 12:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH] docs/system/replay: do not show removed command line
 option
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230905100757.298689-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230905100757.298689-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-List-Received-Date: Tue, 05 Sep 2023 10:46:08 -0000

On 5/9/23 12:07, Paolo Bonzini wrote:
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/system/replay.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


