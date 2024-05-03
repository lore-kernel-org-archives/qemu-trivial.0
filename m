Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s2sSt-00040A-HH
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2024 08:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s2sSr-0003zP-78
 for qemu-trivial@nongnu.org; Fri, 03 May 2024 08:56:37 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s2sSp-0007FD-It
 for qemu-trivial@nongnu.org; Fri, 03 May 2024 08:56:36 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34d7b0dac54so1699500f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 03 May 2024 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714740994; x=1715345794; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lxaYcWb+xBzcc9VX7AuLafdW78gfD1N26Mu9ghbppO4=;
 b=cEEuEprw8zDr2cAWeXQmatk853HdQ0vfQ6QMkIVoVXVn4rcG87xTFq5QW/PDlTu3L1
 vHOXT8iB4iplujTHs+dWvJkpaN9KRm7mXh5Vcm3GZvOm+tRv3lTf3YjbaF0rY3IUiWMe
 GQihV31mhvxcJ7YKzeyZFN9C4nvbmjhJWOCFrfvljptIJ43xeXGeRPNsfmhC0zFEf9Zn
 S5ZkDOQgTxOAdJCuoex8OF3tiMxOxXZ92Z6T+Pla2XBT1Ww7pRmf5iFcpkmOEdlLEKmF
 2K69bXrj7pn06O/bEVIGTS2gcbBRwta5in+TgMhygC0opCAvkkg5Qac1vkCcELLbjkjg
 YsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714740994; x=1715345794;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxaYcWb+xBzcc9VX7AuLafdW78gfD1N26Mu9ghbppO4=;
 b=F7JSiGoYfbKe9CJ3ndDgMDM0v9ZEB0CRfHUpsdhuIgjNCEiQyiWNHZ358vuIqYWKNp
 P8UmKOCeVECZ3DRI+WEEnXH0BNZLfO/OnvdJgu3oDwqQar+GLKz0yva1YlR+EetkQSyW
 awnjxfIfESDZA6e6csOr9wKqrLUiAgfqbXEttvCY3WHyxhY9VDarYBtVm8GII0s77KOg
 keT43i4BL4QNceltTPE+DEctGC7wOrvWVZkpaZtQXgzFITqiTyLhAoG4+cAODur61ftz
 NcSGeW9BveT+ZNm7dJVXMFnKnveZ9w7o5WrSWoqbOaVO4vDJqxIMJ+6sV4LRC948zc/p
 KGRA==
X-Gm-Message-State: AOJu0Yw0w8i3ghSxQasL0Bc4jOy2g9mBoY9MPxlpVFtZKGE+bWWegKhE
 rDT3tl+uFzGFK/nJeAbUimkpVfptCOT0eH+gf8oeI1o7KKcCPsybWxFL6aG/G0I=
X-Google-Smtp-Source: AGHT+IGjgkuM2400IXhyb4mZtHljeXHcKMz8kCvkPdJYwdp7Pvy2eyt9MCWdXupNK/EdbAWDhW7qDw==
X-Received: by 2002:adf:a309:0:b0:343:cee1:cbc1 with SMTP id
 c9-20020adfa309000000b00343cee1cbc1mr4981739wrb.14.1714740993871; 
 Fri, 03 May 2024 05:56:33 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.179.187])
 by smtp.gmail.com with ESMTPSA id
 m3-20020adffa03000000b0034db974d7a1sm3705170wrr.81.2024.05.03.05.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 05:56:33 -0700 (PDT)
Message-ID: <41d1f49a-5a2d-496e-859c-341b1abc1aa8@linaro.org>
Date: Fri, 3 May 2024 14:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ui/cocoa.m: Drop old macOS-10.12-and-earlier compat ifdefs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240502142904.62644-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240502142904.62644-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 03 May 2024 12:56:37 -0000

On 2/5/24 16:29, Peter Maydell wrote:
> We only support the most recent two versions of macOS (currently
> macOS 13 Ventura and macOS 14 Sonoma), and our ui/cocoa.m code
> already assumes at least macOS 12 Monterey or better, because it uses
> NSScreen safeAreaInsets, which is 12.0-or-newer.
> 
> Remove the ifdefs that were providing backwards compatibility for
> building on 10.12 and earlier versions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   ui/cocoa.m | 13 -------------
>   1 file changed, 13 deletions(-)

Thanks, patch queued.

