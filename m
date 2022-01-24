Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBuV9-0002q8-2z
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jan 2022 03:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuV1-0002pP-Iw
 for qemu-trivial@nongnu.org; Mon, 24 Jan 2022 03:14:52 -0500
Received: from [2607:f8b0:4864:20::52a] (port=39864
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBuUp-0004Af-97
 for qemu-trivial@nongnu.org; Mon, 24 Jan 2022 03:14:47 -0500
Received: by mail-pg1-x52a.google.com with SMTP id j10so2536682pgc.6
 for <qemu-trivial@nongnu.org>; Mon, 24 Jan 2022 00:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VGOLPUjWXL582ox5OdmcrTLkXshDHUoXK2SnAwqHmIk=;
 b=mTjVgVejNUnT1rFAI/li5UYQnssr72ZojgidHdak/yvY0v0/3zEseKaSZ5LyXF0y2Q
 KD6r+R3h99RawrM7TVfB/+fcmdL4SoF8v6SpfQmV4XCiPjyDH5iHb3AFi/OfGVYNcKu3
 wLVc1uAdrSOF1ySD95GL3YpKAsPN+6Q0YjRfP7DZG/Ku2gKp2yDKG3KAMvasgOt/rRER
 M7uErW1ZSEfAwLhtuVbzPgYiRy8+ppdq3gBX8Dc7OGSna+htUGUzixEulZERa3tvU+YY
 oGxFumyYlXyjxKvFkRoTZadzv3Yls3dC7aYfO5f76+W3kUfn0sT9d6xlGODttCuB//P2
 I6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGOLPUjWXL582ox5OdmcrTLkXshDHUoXK2SnAwqHmIk=;
 b=kdICxD5PgxCMTSf9PPuNGdCBK4/HUx0YcL1s3oRTuBWzesQIMVEDxXYaQetxcKdJr+
 P6IOUi/AnjtiueduQqwkZmcOX1hF12hSQ+qX4Eh6ckg5qYslR+WliuiRkpjqVdTdvbnt
 UBOja4eyJuvn1xnRe47nJdcHq2s2Gshz/tasDWJn23zX2c3zAZUT/EcrwEt7GRczlbQ1
 h3yMjUjJKfk/smQMBtuMO2//R0/Z0UthKe+a5WcBXoW8jlVhwmve5kROq9U5q79awWuh
 YYVuAY9cHsBZV69yWH4CKgtmiGztcHXLkpv3IM3gjByH65xiN79D9e1IWpx6ZSQ/CM8R
 igOw==
X-Gm-Message-State: AOAM532Cht6KyB+5qvxl2zfJjZCNqKaw4EEavQKzqUYaEg4kzPxXUEuv
 sQXwwKKZbA8B99/N+S3quz+dP8YxnVdL1V+M
X-Google-Smtp-Source: ABdhPJzXCiois9Tp/pBMIg8BOhllHADEMqvOGElnGzs7KFn6B4luXfFjeZfSdtiehP42WIJ7J1EeXw==
X-Received: by 2002:a63:b544:: with SMTP id u4mr11063924pgo.160.1643012073536; 
 Mon, 24 Jan 2022 00:14:33 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id v16sm12260816pje.8.2022.01.24.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:14:33 -0800 (PST)
Subject: Re: [PATCH] target/avr: Correct AVRCPUClass docstring
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-trivial@nongnu.org
References: <20220122001036.83267-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74427e5b-8acd-1945-8cc8-0c857a92134c@linaro.org>
Date: Mon, 24 Jan 2022 19:14:27 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122001036.83267-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jan 2022 08:14:54 -0000

On 1/22/22 11:10 AM, Philippe Mathieu-Daudé via wrote:
> There is no 'vr' field in AVRCPUClass.
> 
> Likely a copy/paste typo from CRISCPUClass ;)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu-qom.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

