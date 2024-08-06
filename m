Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sbEzX-0004PP-R0
	for mharc-qemu-trivial@gnu.org; Tue, 06 Aug 2024 03:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbEzR-00042P-Rh
 for qemu-trivial@nongnu.org; Tue, 06 Aug 2024 03:52:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbEzP-0006oX-BK
 for qemu-trivial@nongnu.org; Tue, 06 Aug 2024 03:52:17 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so28304966b.3
 for <qemu-trivial@nongnu.org>; Tue, 06 Aug 2024 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722930733; x=1723535533; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7PdkskWn9cxxIFtpEDmbr02VE7ggSAA3JWm/2RuISdo=;
 b=S6QayyoSIRDbVYgzCQuKAwdD068iyMleP67Xb3QowGINRJmoOexkk5eABwUCuVbbMT
 7lezJshZPqnCB6s50QiglxShQ7B3chFtdq5YQdUOGEFOZ/u28I37VFcnR+rr5yf/9OZe
 o61rEHr6kxz9OuhztbIdhaXsD55W/9s3pkgVQQjKHJGgUWGUnox+gOL8J8qOxQqy9bRH
 JF6N3rxY4+nTDjqUJPlEcWMBEimKihcM+obulEe0oFUzqsVjiEnN9/O9tyWGA3hIvUx4
 XyyDPb2Ji+rGs92DTMbfOPLy7QgKBq5CSwY+O1Uwsv9txTup9MaE8QXsRt7J1ZcTLHzM
 UySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722930733; x=1723535533;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7PdkskWn9cxxIFtpEDmbr02VE7ggSAA3JWm/2RuISdo=;
 b=iTByi76G4cQ7LyK05n/y68lU0/aMT8wxYKkAXKi9Kz0TDFYIcBPNFXcTTRCnSxsaUK
 4Y03KIPPyDIt4sQWW4tjNUBVFOOxO/afo+N2y/Gz/rXYvezv5sPLR6yuT0JGcSvpBhmf
 P1OSLf4jf52kSO6YRyG3WTwpPjlPFgwwEVNnEzbTLn4FsvSTdFVWRSFiq4h4V00xHfXM
 AILDTze6vYoEe9d/BT6ao+HvQVp2zdrs6FaYh6dwBdkqHATsDaKxp2N69fyj7QfrkKqD
 O2QgKfUGFa74b6RpafgUYBjhHit77W1KgpHzpsCnI3qHxojJcs9L1DVxShOPe2JeEIBX
 1LrQ==
X-Gm-Message-State: AOJu0YyomHSTSQJuQz51q/xOx5HNTRw0Djx/kWuqe2tzG1uwfd2C8TXY
 u5wT2L/7ao0EZeeLH5ttctqOxcwG8XMBtEbMUwkI/qIFFNKhVGWOmQLgnUwNSCQ=
X-Google-Smtp-Source: AGHT+IEHcfyuBQP0wfWSqzlhqxcg/6zNcVAUv7JBAGFyB+Fdui90tiL4Gt2QdB6myckm5ofK9Tx7tw==
X-Received: by 2002:a17:907:eab:b0:a7a:b0a0:ebdb with SMTP id
 a640c23a62f3a-a7dc4e282f4mr1146223166b.22.1722930733130; 
 Tue, 06 Aug 2024 00:52:13 -0700 (PDT)
Received: from [192.168.69.100] (cor91-h02-176-184-30-206.dsl.sta.abo.bbox.fr.
 [176.184.30.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3be2sm528793266b.38.2024.08.06.00.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 00:52:12 -0700 (PDT)
Message-ID: <87c18c11-436f-4044-87bf-748fe6330032@linaro.org>
Date: Tue, 6 Aug 2024 09:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs/specs/pci-ids: Fix markup
To: George Matsumura <gorg@gorgnet.net>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
References: <20240805031012.16547-2-gorg@gorgnet.net>
 <20240805031012.16547-4-gorg@gorgnet.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240805031012.16547-4-gorg@gorgnet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 06 Aug 2024 07:52:19 -0000

On 5/8/24 05:10, George Matsumura via wrote:
> This fixes the markup of the PCI and PCIe Expander Bridge entries to be
> consistent with the rest of the file.
> 
> Signed-off-by: George Matsumura <gorg@gorgnet.net>
> ---
>   docs/specs/pci-ids.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



