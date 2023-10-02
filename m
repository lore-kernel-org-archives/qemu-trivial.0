Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnCJP-0003xT-Jk
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 02:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnCJD-0003t6-8q
 for qemu-trivial@nongnu.org; Mon, 02 Oct 2023 02:21:37 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnCJB-0006a0-29
 for qemu-trivial@nongnu.org; Mon, 02 Oct 2023 02:21:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40537481094so164952495e9.0
 for <qemu-trivial@nongnu.org>; Sun, 01 Oct 2023 23:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696227690; x=1696832490; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gsulDdSK/1/gCR96/cf9l3Ukow8+J41+2WNW7E+fQZ0=;
 b=xX/i94x/DTkLZUSxbxHwD7R5rlB54Ifw+oq78Xrp1Bsb8Ix/gqXobbXf4Higw6V/jO
 Du+geTcka1E7WvZwTHtG0w4S7dutks8P3alRkn/fOC3F8zoBo7SOy5IQr2FTn+0nXHb0
 evbPi6lrIj7emaKOfeHrRRvvf5Puso5EnVZbVwKqdgV30/GnniIqD3iub3h9j1aVN3+Z
 hjmdj9248mBGpf0mbmhoeO5mh5KyGd9GJ9c6nXtlWMQyNXR/zQ0xvTX1o4DgrtTm9nLQ
 ruUSiwcDYySTfsInn2zPuvswzv+HAn3UjTJOlWGZWCYB2Dcmzv5A0pdyHLqNbvwieLLh
 xDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696227690; x=1696832490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gsulDdSK/1/gCR96/cf9l3Ukow8+J41+2WNW7E+fQZ0=;
 b=anoYz8phspIF2v1ORiD7fOs6KQi6ATT0pWrgM7T7Amt35chiShcuSWWwfCiR8PutGh
 zguj0wFc6VkLrXRFn+auNOeDPHjgGFf7dTYC8TY0euYjKJFwOkaMp4iFrn1LJtNzeVjX
 RXNGRCJjSgLoRYkWYkjI5NYR4N18NbIHh26YgBYlKrX1KhRatXqfxaD/XaxHSKIls+t0
 NmGDy9dbKA6MuyYmwknIEO0of131on6WSuK6CHxhUZVh+nZee0Knlucp7sBBMfpGc6LL
 8FDMB5ENPanNngzEqDhW0WlJsHnb26mxBQLMsGqjtHNqDnTK9WbRUzt0o7X26NkvLMoP
 RuvQ==
X-Gm-Message-State: AOJu0YzmgvPp+QTUeFNwCvY9lD1/N2a2aJd02htmOpuVn21KxiNfi1LE
 yQaHVdWnHxLxEtL/818YLPsms6VyvSOb03Jy0zs=
X-Google-Smtp-Source: AGHT+IFYDmntpn2582TrK1qs8h+hNFxyBv1/T1ouliR1JnUEWdv8MKB3M5OcI6dgikhN1EYnhbm+Hw==
X-Received: by 2002:a05:600c:215:b0:405:1c19:b747 with SMTP id
 21-20020a05600c021500b004051c19b747mr8351840wmi.15.1696227690355; 
 Sun, 01 Oct 2023 23:21:30 -0700 (PDT)
Received: from [192.168.69.115] (sto93-h06-176-172-7-203.dsl.sta.abo.bbox.fr.
 [176.172.7.203]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b004065d72ab19sm6494164wms.0.2023.10.01.23.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 23:21:30 -0700 (PDT)
Message-ID: <d6bf75cc-a101-c2b8-a8a0-271766a27ad6@linaro.org>
Date: Mon, 2 Oct 2023 08:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add the CI-related doc files to the CI
 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20230929131636.394715-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230929131636.394715-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.058,
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
X-List-Received-Date: Mon, 02 Oct 2023 06:21:41 -0000

On 29/9/23 15:16, Thomas Huth wrote:
> The docs/devel/ci* were not covered yet, add them to MAINTAINERS
> so that the right people are put on CC: for related patches.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



