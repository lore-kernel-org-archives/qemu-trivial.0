Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFRJH-0006jN-5t
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jan 2023 21:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFRJF-0006ia-48
 for qemu-trivial@nongnu.org; Tue, 10 Jan 2023 21:57:49 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFRJD-00046E-Jc
 for qemu-trivial@nongnu.org; Tue, 10 Jan 2023 21:57:48 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so18562488pjj.2
 for <qemu-trivial@nongnu.org>; Tue, 10 Jan 2023 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
 b=fYMUKpZjtNEpGTdFZKnoLH+0+WyztHfXy97FP2b/lSny2shAJmjvuV9dnNxf6gHeLo
 NXQAUDEULCI3uHiIGkLWEE/a1V7QF15sJ0ieMmplD7hnLwoNyEtU3qfehI5j53CRYgQ0
 k2w+zftk05pEIkwG1n47JfW8E2EeDGb9uhaarXiZW8g3OI0mH15WY1mDn9I9Q/l7l88N
 AvCWPDG3NVyLyntKiP+Qusr0BFFxCGG/ESiIVjIg2IpaFUdVdpmibJT3cvrnoV0+1OSb
 SRQ4b6GacXjD+cLVk4h74oQOO2Pwekr/Cmw9N4tSQnSrXxH42idUoOIb3IgN4uvocXU/
 bAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQ2CB58YKxPVDH8ptf5VYn34nkrclyuEszfQZpKf+Lo=;
 b=NniBItRMwCqPx+dGG357+9uSqDOsNaTjuKlhFvykCOUblBp5nRFbmlES05ywwgDqLN
 9WGeA9L9lq0dv46q5cohfDnjou1NM77Xs3w/6koHLuIAZDdNwCe7LkZoqLJFOSGrqAgf
 5TlGDR94wd+YQ8nXB1mIc0zPO3Hd96ffHxaefGbDTHA9O+oobCwRRazTaAOwKkRr8hlz
 3bKHNPGru8370SN6nCom++TK/psQ7cU/dE869ZxA0iI9ph4q2W8L1WDhEurAwoMWN1pp
 5nEPypnK5LtjxMO46y+MtnzRekLhmhmMIHZADgWTz5fTxvBpJn4Wiqj8Ly4inxVwPax3
 j5mA==
X-Gm-Message-State: AFqh2kqBVuxO5PTxpg/HlAkfLoqH47AEw/JjXc76BAA5yOERw53mV8FN
 g0Iauf2v8ymRRd9a29JcQfjWBg==
X-Google-Smtp-Source: AMrXdXuI4GCpR6DV9ahHc2mcZoDoHFAoJbQPAWpJlphA3GHbVCXNq/KpzaOgkyffWxmNM23ETTsePA==
X-Received: by 2002:a17:902:850c:b0:192:bbe9:4cab with SMTP id
 bj12-20020a170902850c00b00192bbe94cabmr34295733plb.24.1673405866167; 
 Tue, 10 Jan 2023 18:57:46 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net.
 [63.157.97.90]) by smtp.gmail.com with ESMTPSA id
 c6-20020a170903234600b00189b2b8dbedsm8799877plh.228.2023.01.10.18.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 18:57:45 -0800 (PST)
Message-ID: <dd853782-cdee-3e5c-c6c9-802653537e70@linaro.org>
Date: Tue, 10 Jan 2023 18:57:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
 <20230110082932.24386-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110082932.24386-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 11 Jan 2023 02:57:49 -0000

On 1/10/23 00:29, Philippe Mathieu-Daudé wrote:
> +static const char *sname[] = {

Oh,

   const char * const sname[]

should have caught that the first time.


r~

