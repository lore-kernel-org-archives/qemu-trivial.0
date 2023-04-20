Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppPsO-0004hO-Ca
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2023 04:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPsN-0004hE-Dd
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 04:42:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPsK-0003HY-Ok
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 04:42:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso363336f8f.2
 for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2023 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681980163; x=1684572163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOq17SJpO0dezW32yH4ryi1U0v1B+3eKi102UjcKc4Y=;
 b=G4lHfzrnH+2K9wsKjD6qpVR/BDoPh8ux3J7tI66Vi4lS66sgVsL3A4egzEIDWbV+53
 Wr0eGl/chFIn91OULa6oYrPEwyYrhkkeJIy1KY+Krn/YTfJeJb/kwIW+/QRMOM6mBEbP
 1U3UIbkeLiikddztPIVx5v/WI0t+5nMB13t1TbiWkYVHyYJvnCGjTdkVVBHOh0ZYiklg
 /Q3qD0cc9S13LD7QdxNcyw8U59btBuTtoWWSqVgIDA0bRMkd1x30D7Gb1V4lsguAPO8P
 P8y9YITY2i+TiXhwp5jYfH9weuS2CSEAAXXWSgg9HnOmD7QDlvcEvltdsQiev+eq+Py2
 V3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681980163; x=1684572163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOq17SJpO0dezW32yH4ryi1U0v1B+3eKi102UjcKc4Y=;
 b=enEVPjpG7fHUorZjbH3kuzmFIWypTwSwcujNeyIA3U9WpowFhq+dyTOCbbg8mx5wva
 TcSWhooSpFWj6GERhMiAZ+JFXwQIdgSw/rTf+vUgmOK1BVZuOXT16iDXbr5Qdtt8/bgx
 5Yaq5GvNUrDyAwTVfv4z79yzveAglHsu4NFYWpF93OIPPcyrw7uUWgo47j4x/4mroK+p
 jfoQxKCPNrKA3E/S4PWxPHZXJT08qHaeU+Qol/sm2uYVAMq/V8Frp8rKpV6b/P7OlJKR
 nNQrppb0Zvo2VLk5xwO5N6DnvhIFtj2SWB99qOzdcWyuL6tqOGn6LXGWtcRDj6NAwDlP
 I2YQ==
X-Gm-Message-State: AAQBX9dZdqZ4HlO5dM1UKLqSKgZuU75RFtmIFpgrDEKJVRCCwummtkK7
 rVljC7gWj7RH5J7BnED+fbrSDA==
X-Google-Smtp-Source: AKy350Zvhb0Cf3y+dCa27l1xKdqkcoJcstICR5l+Cfpr8otjK2ZemzrQsp25NU7CZdxEDjEOZOXWcg==
X-Received: by 2002:a5d:494e:0:b0:2f7:85e0:de75 with SMTP id
 r14-20020a5d494e000000b002f785e0de75mr756119wrs.19.1681980163137; 
 Thu, 20 Apr 2023 01:42:43 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d5643000000b002e4cd2ec5c7sm1327311wrw.86.2023.04.20.01.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:42:42 -0700 (PDT)
Message-ID: <8566fbca-deb5-f65d-c624-166381479958@linaro.org>
Date: Thu, 20 Apr 2023 10:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] cpu: Remove parameter of list_cpus()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-trivial@nongnu.org, Yanan Wang <wangyanan55@huawei.com>
References: <20230419124831.678079-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419124831.678079-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 08:42:47 -0000

On 19/4/23 14:48, Thomas Huth wrote:
> The "optarg" parameter is completely unused, so let's drop it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/exec/cpu-common.h | 2 +-
>   cpu.c                     | 2 +-
>   softmmu/vl.c              | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


