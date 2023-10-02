Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnI5m-0006Y2-DQ
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 08:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnI5k-0006XR-Au
 for qemu-trivial@nongnu.org; Mon, 02 Oct 2023 08:32:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnI5i-0001T4-Ed
 for qemu-trivial@nongnu.org; Mon, 02 Oct 2023 08:32:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso134969815e9.3
 for <qemu-trivial@nongnu.org>; Mon, 02 Oct 2023 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696249920; x=1696854720; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cTWGFVavZxh7PssogSsuxHBwHAgLRCFhfA74ZbvKP/Q=;
 b=bvgmm9JcxWp7/Gt+audOfdz18HR6h/K3YW2uGnewPtaEF9mqxbqaVwb3o9AEjBsicz
 ey83I+TnbQuJLFCcrF28qBAxsWPwRomZynPve5jhwZR0Jkf/BS3kwFSgF6hLS1krzCch
 KriIrmaPdvrA1uRzcDnrJJGwipd65cLJcSOxO1M7UttPLKEz0/wkVmwAlg4SGtXWpTHH
 oxqg81qxyTGHu3uZ6NDXD231EA/1kSv5n/kqR6Hyvn/hUpHG1Z8bkIB+osbV04vN9j5i
 np2pS7qcKX0q6LA/OWVamNgU2zQ6PwDAPLjf0PFg208JO7LIQ0Q8ZI60zOfoSoEpIMSt
 x6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696249920; x=1696854720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cTWGFVavZxh7PssogSsuxHBwHAgLRCFhfA74ZbvKP/Q=;
 b=S7/cB3TmwRP01op5I0LQkJS/3HL3PxE4Uh3d0bvhezClGXM1+fCdzUmxih2MthTUUO
 WpDCtiuOWzA2YPhqr//y4a5NNSmQW9l7brXw2ejpN06xDKeMrgrubTDOJezjOkd29d4j
 7BQ8OqWekJ1602SwF5L4QH552dB2631eH1Ia5P7TQuXWnMHoCl3+pIXW2SzOS27bu78P
 uBC+yx5FcmKH9cBu8gutVQh+mggvBF8EnaR/AOuzlXV49YU2FixlYoufO94NpiZUVu+y
 b+dl1oaOBdW2pVCTyUqLomMkZRdBQ5x+5HMRJ5c/hKftGFKYVHzvm8b7Nz8wPP3wxq2i
 APEg==
X-Gm-Message-State: AOJu0YyuV3E+khyphjbSaIqvZEVA+wj0m+i2QlAKfMSMdfyI1Krq32i5
 2i34JYM5itQYmTDCw8/S9uzjtA==
X-Google-Smtp-Source: AGHT+IGJL9JWBBcbMWzt4BYp5rShVRqe44gmwWQhVYxa4K10/H15fp40L+P8WUeJrdWNgYCJsKZrRg==
X-Received: by 2002:a7b:c851:0:b0:405:3252:fe2 with SMTP id
 c17-20020a7bc851000000b0040532520fe2mr9560364wml.14.1696249920533; 
 Mon, 02 Oct 2023 05:32:00 -0700 (PDT)
Received: from [192.168.69.115] (sto93-h06-176-172-7-203.dsl.sta.abo.bbox.fr.
 [176.172.7.203]) by smtp.gmail.com with ESMTPSA id
 9-20020a05600c234900b00401d8181f8bsm7187191wmq.25.2023.10.02.05.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 05:32:00 -0700 (PDT)
Message-ID: <478a9f2b-e8ac-6078-f1dd-78c01137c25e@linaro.org>
Date: Mon, 2 Oct 2023 14:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add g364fb and ds1225y to the Jazz section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20230929140938.396565-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230929140938.396565-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.321,
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
X-List-Received-Date: Mon, 02 Oct 2023 12:32:04 -0000

On 29/9/23 16:09, Thomas Huth wrote:
> These devices are only used by the Jazz machine, so they
> should be listed in the corresponding section in MAINTAINERS.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>



