Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qt6F6-0001yd-Ql
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2023 09:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6F4-0001wG-IE
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 09:05:42 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6F2-0007fr-Tw
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 09:05:42 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so6947896a12.2
 for <qemu-trivial@nongnu.org>; Wed, 18 Oct 2023 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634338; x=1698239138; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2FVEUw7KfkBYV0yc0+PIqfcxykuRA7HXBZWEjvJKfO8=;
 b=nhJivvn/pIC314vB9Vsb2mle5GS1FYQ5xApnzoeXntmiFW2DnSs4GgS21Ku0+zKYZD
 iWDP+JfTy9Z/wlJQcBTcDcTBHuNGcFiAdQsi9v69O/oMo8XTjbhkgJThMMpe0KOczQep
 zOcxd5ZFvweZHvW+en/Q7xnkB2SjWyvq5Q8EaT/zYrUgHuHLXnU4BseSOpMw5sMICQoy
 ornl3IHysayQxHM1QRNS+8UJu+cC1R8eWMBZTwCu6nhPlLvUpXkSv0MqwbdEYtIXqUZy
 UZcOreSC2l2VBBty/9j+N4E57JNZjNS3dKRyzorfjUzZs+KML7uUtC9oTZnUaxFc977y
 Hi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634338; x=1698239138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2FVEUw7KfkBYV0yc0+PIqfcxykuRA7HXBZWEjvJKfO8=;
 b=TcZKErdjxO9wyH+Il324Z984/kkYpGNaAqC9hD28o6v4wzad+NreGEHeHF4zg+1CIc
 wtZ9VZffygx5E5/ohAhl0cenWZSMKIGZzZwlpQ1Mn9gcJrezSBRWq4zWQDW60NPg4rHd
 OFGXTbUzWwnTQtF2q14StSF6tJhWrzMy+AlNB/E+JePU8dO7g+rhexPNke1ZXChnt2jR
 G8AL+L1LJd9DXiWlOzVWTNs6s9g7ekHfJpie16AJFu9B4KU8pk9ORxexlgu2WtOycYhC
 Te4lKX5+r/LJNCFKtC0jPrijb2CSbSw1KtSVs0okDCop4mTM573oI5rJSI2qc/ECgdP1
 PZPw==
X-Gm-Message-State: AOJu0YwcctoKuOUrVjYFtqerNTAaUj/WB/GiDchpXfRWFRoa+eMchWrn
 HNWT1WR8LJBb/LHWvTQB2Hz4JA==
X-Google-Smtp-Source: AGHT+IGRY8/YNz8jfAMJYLwe4xbQutn7OqK2O5YzmUq0YHdzaKrNpJhGD1RV0n1V4yvnZSYXK8TNhQ==
X-Received: by 2002:a05:6402:40ce:b0:53d:d8ad:4d46 with SMTP id
 z14-20020a05640240ce00b0053dd8ad4d46mr4937506edb.36.1697634338804; 
 Wed, 18 Oct 2023 06:05:38 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 b42-20020a509f2d000000b0053e43492ef1sm2845752edf.65.2023.10.18.06.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 06:05:38 -0700 (PDT)
Message-ID: <7e8c556e-7afe-bb09-03bc-d9a0c7a56ce7@linaro.org>
Date: Wed, 18 Oct 2023 15:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add include/hw/openrisc/ to the OpenRISC
 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stafford Horne <shorne@gmail.com>
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>
References: <20231017154242.234133-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017154242.234133-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Wed, 18 Oct 2023 13:05:42 -0000

On 17/10/23 17:42, Thomas Huth wrote:
> hw/openrisc/ is already listed here, so we should mention
> the folder for the headers here, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


