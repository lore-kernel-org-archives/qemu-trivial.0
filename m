Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sYreF-0000HU-85
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jul 2024 14:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYreE-0000Cp-3q
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 14:32:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYreC-0002CW-EZ
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 14:32:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4281f00e70cso18735035e9.1
 for <qemu-trivial@nongnu.org>; Tue, 30 Jul 2024 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722364351; x=1722969151; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ONfisXJNQoe9Z7S6EcbzXFkVUygBUs7h+VpdAEKqDco=;
 b=bOWDHJB39TCguohRsMpuCP6kNp+a6dhhxqee9RXpOIMTfyc69VouAJLBhzf5SwqV3H
 7p1Qjx5F9POLVeU5Ja8BxixWf1+GIm4onL/XmQMIGYilFiZIZ4NDnXutt4W0csRif7HF
 my9k5hWl+sXSlymSszAxPgQQX663BhzjkJ1wKBQ/aNGoUT/s5I/eCxweyehE+uPR8nJ0
 X4IJrhwm3d5UQzmfvTN7IkokKgmXUx92WE+SEo19xnAdLUVeH7jiCbS+V4rq8O3Dz3ia
 XloV6Q3sg/8CPRJOkNPcoBVfKtgJ5EQYYCkN1Mn1v7bPdLpZzQgqz+X3fKRGgkeKplFl
 OqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722364351; x=1722969151;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONfisXJNQoe9Z7S6EcbzXFkVUygBUs7h+VpdAEKqDco=;
 b=DZTIfAGP5FuLdgscDMCVyznKhykmJ6sDWkJ8BKWvfDZFH6f0EnItWrQHdXQgmK6ZH1
 mVID+2UQu6Qba5t8FsrsYyvtBLi8D69UacGVqRwaopCuU1u8ZhZFEc7THafotQzO7Uxh
 GePPotnhbgFdUc1FpYmQhcaUoNXagREvpY5lx5XW8z34rWLDoJ2Zxz32yGU7cELqd/bL
 5jQYGi2fAywA6se+0q7buyW9rgwQfRQEoRFEqBSWGCbUGjQS0IiKrMAbFok1FcO2tZCk
 TqDxHy0cjBgdPlDH477jdYCUOKivpRtsxfHri5Jok8qToTBAb+8FjZVQyvLgzM2yHPyw
 N25g==
X-Gm-Message-State: AOJu0Ywl2qsMc7ods16n2c1wEqeOuPz+4RgzeC6azV9R5jRlgA0sWllQ
 /8bFLfdPq4ALGatxsm+I4d+1MMMOgpiy2EsOh1Cxy1gmgVY+O6/cC13pFEx/AOiCoJTgSAj48La
 Hu3w=
X-Google-Smtp-Source: AGHT+IEheMKJ7H+QUoWPvukOqH45IDE5dC/iYmgIGDdjV0jrubNKK5ak2+nJ/T29a5xOjF8YJ1N8Hg==
X-Received: by 2002:a05:600c:4592:b0:426:5f09:cf57 with SMTP id
 5b1f17b1804b1-42811d9cc4amr77371575e9.19.1722364351052; 
 Tue, 30 Jul 2024 11:32:31 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281a26e1bcsm99323855e9.34.2024.07.30.11.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 11:32:30 -0700 (PDT)
Message-ID: <67087083-20ba-4a71-b547-0273604318ac@linaro.org>
Date: Tue, 30 Jul 2024 20:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] osdep.h: Clean up no-longer-needed back-compat for macOS
 10
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240730095939.2781172-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240730095939.2781172-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Tue, 30 Jul 2024 18:32:34 -0000

On 30/7/24 11:59, Peter Maydell wrote:
> Our official support policy only supports the most recent two
> versions of macOS (currently macOS 13 Ventura and macOS 14 Sonoma),
> and we already have code that assumes at least macOS 12 Monterey or
> better.  In commit 2d27c91e2b72ac7 we dropped some of the back-compat
> code for older macOS versions, but missed the guard in osdep.h that
> is providing a fallback for macOS 10 and earlier.
> 
> Simplify the ifdef to the "ifdef __APPLE__" that we use elsewhere for
> "is this macOS?".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qemu/osdep.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks.


