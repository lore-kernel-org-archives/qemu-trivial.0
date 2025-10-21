Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07D6CCD184
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Oct 2025 15:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vBEg1-0008Fv-Qm; Tue, 21 Oct 2025 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBEfy-0008Ez-Lo
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 11:53:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBEfw-0007Pg-Dx
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 11:53:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3313750f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 21 Oct 2025 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761062006; x=1761666806; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KZ69YW3o/ePIBmzVDZBdMJkANEHjJp/sF786gwRA3Mw=;
 b=ffgDoE7tUvo61kUbQ8EZTfyea6XtlxefQy65z5RIz74/+ZDhc7yLreXTlpCXyxKVN8
 hmX10Ccf2dW+QS1xfa5VMNYnHl1Hdb6+wxdh+r3E0UkiZtt9g6epAzj7QZl50UveVoNj
 Xl9UydEy+j8ySJxlcvW4f2QUu8deMPeXNp6FG3X1EXw9N3Sz0qxTXEcDk13h9Zb5SiiP
 uA1w2+dYOnYMMq9ArX7WqWf1G5Je6GI4S67OBcN5Wu3uxEdsEJDTnDyCaqLjeNlVWqtl
 ntf5FSyZ6VXMaHaumDgbSztZ8pY27vzLjPFi3G183w5PMcbHVhqIX29YSpnVguOfLuNV
 cMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761062006; x=1761666806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZ69YW3o/ePIBmzVDZBdMJkANEHjJp/sF786gwRA3Mw=;
 b=YyDEqV6Un3EVA/aAKtJpqZaJathZYwibdaWoZvd2+YRO5GBgKqLXdkSolGYSdTOitS
 lrJarb1WkqEgALgAoHrNcIEwdBtcMGmg3L5beGWgDnUYK4MHjrj5Epe2yLJskYez8AoA
 T+uTbdXpuT0pPXTarVuqr00HjwFhujVw4xZMxMPJzrqx+S5c79tdlCOag1eM0ERxZkSG
 3Zv3Yx1RNfJxlDxucY+ixQX9Q3GQZp2cf008eV+zcd9UidTxOizBh66v5TKdDWrGgr9l
 Z+GO7Q7qCT4jbT7uVtiCYVSkXKNfCggWfr3o6CiUPLATQ/QDel8TgHCWDqQh1OZRw56k
 jJug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUBRU4XYAtCaKlY622d6XEju2dkOBho5wnYa+I5yd6hXxc1hVgPXCl6+AXc5QLpjXA5TYF3DtlOpby4AQ=@nongnu.org
X-Gm-Message-State: AOJu0YwAxRCft+CjDnCxozQjHqgNHoq3KG9+anAK1pP3ZIpdCDCYZwZU
 uFqFz510S29/bzOYycUbsQAA9DHMCYGpJOorPEp9UFFEdCZS95WjEG/Czw08Kr8qbHg=
X-Gm-Gg: ASbGncvvUwtbKgmKShgqW3kPyJ6kWWemrvCleF7+Zqr6EjXsFw+tp7wmNpw8AlVdOQm
 5KMXOLf9IHhwtaItI0f4QELW4rOyjgq1BXF5NvuadLmxCe4cMQ9GXFIeFABdvwV4bwZcGapTl0C
 SPp50PpsuuymNwd+i8QmSrXBIrX4BmlC2SWdS0VqXq11QrCqkWv6N9UrqgLTFqOwpFq1ImVHh3s
 K6+RN1RYlMqnLE87g7EYc5XJVAxJw9CDf0LaKN32sTHdzhZNJ63y9P6IFFdVfmN1AjCnobICMFR
 plg8ZhsrJ5oxz+B4Lag1XOzT45zrpkOkV0+FFsaDpvJW1mz18myQg2dfW+TuCQo9X+ZP7jcLdbn
 +swqoDuux18TQhULNcamu/Ecppt/eZqcDGPg0btMSo5JJOdkGWx6k7fx4GRsoelnC1aGumxfQ0f
 fSnYvucsf/Uiu8j61h8pbYJG1lQnafwTPM4tGHk+h6Pnw=
X-Google-Smtp-Source: AGHT+IHL2e+xkqrY2z45o8okqwvYRzoRFUyKTPAOhBYDif7RCGI5WWGGcqLjIX5xt/og3eQoETXiqw==
X-Received: by 2002:a05:6000:290f:b0:428:436d:7d7e with SMTP id
 ffacd0b85a97d-428436d8072mr7663928f8f.60.1761062005961; 
 Tue, 21 Oct 2025 08:53:25 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c56sm21201225f8f.18.2025.10.21.08.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 08:53:25 -0700 (PDT)
Message-ID: <af8debe8-8bde-4e16-840e-9d1c760e23d0@linaro.org>
Date: Tue, 21 Oct 2025 17:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] hw/rtc/mc146818rtc: Assert correct usage of
 mc146818rtc_set_cmos_data()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
References: <20251019210303.104718-1-shentey@gmail.com>
 <20251019210303.104718-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 19/10/25 23:02, Bernhard Beschow wrote:
> The offset is never controlled by the guest, so any misuse constitutes a
> programming error and shouldn't be silently ignored. Fix this by using assert().

Would be nice to document the prototype.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/rtc/mc146818rtc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

