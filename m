Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2erl-0005eV-FA
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2023 16:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r2eri-0005e2-6G
 for qemu-trivial@nongnu.org; Mon, 13 Nov 2023 16:53:06 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r2ere-0003jk-W7
 for qemu-trivial@nongnu.org; Mon, 13 Nov 2023 16:53:04 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so7661547a12.0
 for <qemu-trivial@nongnu.org>; Mon, 13 Nov 2023 13:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699912380; x=1700517180; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1cfqOQxFSILDkSp2DTNj1jhl1bOT+HIOtitrRoDIf0k=;
 b=J0H0mk07PlzyJHH5VN2YNsECD/O+qREo33FhqQ7PvOZaPt4llYz4hdvKYlJV/awM4U
 reulD/xITWbydRWvRZ+/sIP53nrdSGgr/W5DAfkZIbu9psL8w+hT8cl8b2a06H33hydc
 WcywbnJXKiWjKl1TRoCfj4/xlkMqrS+wpSuSw6x+zggL0wyilFiwjk9djjUnopatBTaz
 rNONEFsfYEFlYHd+HG04oLKgOzWKn2KNk4PG71sR+X2tR7LZNYY6EMP0wa62f2S+amHv
 KZJz0q4qEsglgPHtBtnhOprMuC56BhfSktTAIeI85R/8ehYsRFunxdk/iuFZr5I2Lpp+
 wdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699912380; x=1700517180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1cfqOQxFSILDkSp2DTNj1jhl1bOT+HIOtitrRoDIf0k=;
 b=KrIRs6xRn2RbuQFPrR5t6h8D6jpzp/Ekjlzwn57SmgWrnubi48835pLG8JDrNMSCRB
 DOtM5De+kFryYb5qohgrJ0d8N5iM/DN/V3R+HDZT4JvAWwtkBHaqLwim5HQvjq7Nd2Eb
 faViIHOLQqKb2PPgvacRjOUGdG7tQLWjcsLz1E+OeMKzD1EbjIomrLaEYKrY8g6Jd8BR
 RkWDLeNBJ4x0AGxAbe+dxnMxqNNQUzk6/wiX0qfMBR9dvy6Jzs+IfUpsSiWz0KvXZaED
 qLut4dm0Fj/9r51pKA2eBuwo+ILyPpVNyuFkSVEMnibQ7R5hqTATKomV/QOXd0/S9z/+
 ycag==
X-Gm-Message-State: AOJu0Yxhxw//+WrLq1rT5VdACSp2D7eQ+654lzuE294+ovZTeXKM0INb
 7caAfZd6iQTCFHSuruF4c+ebtg==
X-Google-Smtp-Source: AGHT+IFgk0wOX3sN9GDkUC0DYL2DIEi8fIc5KpMCLkLhpgtd29TZ/sEwFdlJ7KwcEBLpHrAglSLFpA==
X-Received: by 2002:aa7:d699:0:b0:543:f7f5:83e5 with SMTP id
 d25-20020aa7d699000000b00543f7f583e5mr5615282edr.29.1699912379812; 
 Mon, 13 Nov 2023 13:52:59 -0800 (PST)
Received: from [192.168.69.100] ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a056402051400b005333922efb0sm4215687edv.78.2023.11.13.13.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 13:52:59 -0800 (PST)
Message-ID: <cc03e6fb-a60f-44c0-ac74-3491128db420@linaro.org>
Date: Mon, 13 Nov 2023 22:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spelling: hw/audio/virtio-snd.c: initalize
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20231113212033.2457365-1-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231113212033.2457365-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Nov 2023 21:53:06 -0000

On 13/11/23 22:20, Michael Tokarev wrote:
> Fixes: eb9ad377bb94 "virtio-sound: handle control messages and streams"
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/audio/virtio-snd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


