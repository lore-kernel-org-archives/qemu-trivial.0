Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTIGR-0003K1-Av
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2024 05:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIG7-00030J-Hu
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:44:41 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIG3-0005Ra-HI
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:44:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so23440935e9.2
 for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2024 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721036672; x=1721641472; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOAqUmobpFO1Jx0eFtVmkOJtUM11wxqJzutKMTITd/I=;
 b=ieynYuFSnfbUL30WQMIeX5HhhX21RM7WPvRBqp0vVEaLIH3i9NSdDuFVPVWGvYiKU0
 +CaU50pYkgup8pAZ2v4AjboFdEcSUEvTjKIGwLpzk+/b4GYqKl3bNY8HH/ecoLj7yeph
 UsE1U64rsujASZwYoXuhJUenjBdaJdqLARMZcHoXYKdS2i5e+Oz8qXAaMhzFDKwn1p4Q
 aoc3odKNvezqVUOFEdf++BrTqu3yUA9sDETTdpb/W35OqzkeSYEzlW1mTOfvEh3rYf/8
 mCqWqnd18wgUhfhwy8hqOKmd3xMxNgV+wWN1blegPMJaNQD9NH1o/EX3xDaPFkAvXu3y
 Tp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721036672; x=1721641472;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOAqUmobpFO1Jx0eFtVmkOJtUM11wxqJzutKMTITd/I=;
 b=v1RrpoO+uEYaY9jI2MfRaNCVUAswDPmq09z903xzJEaapmBXIBQ9zyp4JGZxVHsXvS
 oXX+yNQwHI3G/IqlfSV7Spa52+np0f8tJdtgE/XuBBdt79CVBQNbapfiD97Ta7uDtNVT
 LbxbkMHV7nsOjPkTpKp1sBigrxFQww1sC/GQokaymwl8Vy3ScpW03Rx2Bh+y4QtelCw5
 dRJe446T1d4L/Bn+qqBsjSY4HhofjKQb5dx7sM290pJDlaxCoNthr3GCidfKfUT+CxlE
 4ykPoYIUsq5qTB8xPPq0sexPQi26CBxJCDLpd+Ik7ip9uf5ANDQp8DOc3R4oQiv0sLop
 Vymg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqFdU2hEkASnCWw4nbw9/K/b6SmEAZxG4cH0D0d0+ahI1r/EAK8QklPEuOiAykdca3+Z06SQ+Q1wuc64+vK+cO8djcEkPTpQ==
X-Gm-Message-State: AOJu0YxQtQ0tGQLxZm9uF6Ax9LEYGlvtlq7t3PCHoOvcElAqrKLa1wtp
 5JzuSmkX062CwABT7i29I4elLZrHrl9gCF/EAOT8smZ/E6h4PzG+24K2MuKsz/0=
X-Google-Smtp-Source: AGHT+IEXFsGo3BdrUqln/kFZze0xcuuDnqJbpOi3UiXGHCpQ9feWbUY7zpjv6vC5gT7SlF2ywvqEIg==
X-Received: by 2002:a05:600c:41c4:b0:426:62c5:4741 with SMTP id
 5b1f17b1804b1-426706c903emr114944755e9.2.1721036672455; 
 Mon, 15 Jul 2024 02:44:32 -0700 (PDT)
Received: from [192.168.121.175] (91.red-95-127-43.staticip.rima-tde.net.
 [95.127.43.91]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426740d88bcsm165008935e9.1.2024.07.15.02.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:44:32 -0700 (PDT)
Message-ID: <9946ada2-ecf6-4a4c-9415-915d400240bc@linaro.org>
Date: Mon, 15 Jul 2024 11:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] hw/usb/host-libusb: Get rid of qemu_open_old()
To: Zhao Liu <zhao1.liu@intel.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20240715082155.28771-1-zhao1.liu@intel.com>
 <20240715082155.28771-3-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240715082155.28771-3-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Mon, 15 Jul 2024 09:44:49 -0000

On 15/7/24 10:21, Zhao Liu wrote:
> For qemu_open_old(), osdep.h said:
> 
>> Don't introduce new usage of this function, prefer the following
>> qemu_open/qemu_create that take an "Error **errp".
> 
> So replace qemu_open_old() with qemu_open().
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/usb/host-libusb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


