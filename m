Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qQPLj-0003iu-HM
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2023 05:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQPLi-0003iV-JH
 for qemu-trivial@nongnu.org; Mon, 31 Jul 2023 05:37:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQPLg-0006xN-W5
 for qemu-trivial@nongnu.org; Mon, 31 Jul 2023 05:37:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so6321373a12.0
 for <qemu-trivial@nongnu.org>; Mon, 31 Jul 2023 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690796275; x=1691401075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC+dnKa/qp5jrTcc1wAu0yckcU8SthpzOdgpibtn6NY=;
 b=JQHF1SuH3gXRAOjr/1oCY335+4Pfjc6WCesNsdRIHzR4jo26mHmMYi9iUMnuzOkzww
 ziSd7ss/VKhZ9BTfRs395ODCCscLlSH1FG8Hmzg3E8WRwuooyhZ42N0YO6FqaaMfKIK1
 6FHnxfRQdW8SjMdQR7jmqYmqTTUKoLvcD3GHa1eVAUX3Nfw6UvEpjdrj87RFTVt3bV9n
 otaneX/YsmBirxMKlHga4FI6VHHojiwPGuZMKEjXunS9JuluZx6/CBmXEocT1j+u04jf
 cp8Kmv5uHnSJmykpvDKYjivMvIKEz91gcE/Ub3onWb/KXRG1sD4hP0vIuWG9FdCSV4On
 GYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690796275; x=1691401075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZC+dnKa/qp5jrTcc1wAu0yckcU8SthpzOdgpibtn6NY=;
 b=RigPHOU/EspRmY1AQEcrvnstqOddfRMb/FZ1j81PCnmFunprDMkX9wwAZ2/uVraP5z
 zRPMPFbDzQOa9CV8dhomt55xqnk1MrmiTt5WXRXobQJh97VmjZqvu45VN5bMcDzcd5mR
 yLN/ZRJ1MxlDhx+PzT2fmTv/PJhi3mGCCMDUV7IquTqPtHG4pAeJUvgwj5ZZtrhW9I9Z
 dE0iYHSRz1oXBb1x2Y5+tR3Eu29aj66B3V5DRxLhfNE17iX64OMDw5CIrjK5LIMR63AK
 f39OAavMYk2gQhy7jRKbcsr/7dJVvIuA/Zy4w5qToKlaaH1joWmCLhkw7dCS1VqkbmGq
 +dcg==
X-Gm-Message-State: ABy/qLaEE8DuCG+juO0dZmLrtULX9lgKxcacmDcABabIhMXAk+TVS7mk
 p8HDBi6/W6Lyxe7jtFfo+Bbhjqm1IJJCGzuoW3uQJw==
X-Google-Smtp-Source: APBJJlGmaB+suTXADjLNNJSjrtzdrugR6VgJuOR02qXeYZ2I2ZOGupmRrdBOGSOkdxkR+1+vZsr0X5kXOlV0E3o3zYA=
X-Received: by 2002:aa7:c401:0:b0:51e:fbe:dc81 with SMTP id
 j1-20020aa7c401000000b0051e0fbedc81mr7643168edq.3.1690796274966; Mon, 31 Jul
 2023 02:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230730180329.851576-1-sw@weilnetz.de>
In-Reply-To: <20230730180329.851576-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2023 10:37:43 +0100
Message-ID: <CAFEAcA_SEUFgM8R=W0Ddm-UCPJhc=exMcXPaQJHg4tCqt3De9w@mail.gmail.com>
Subject: Re: [PATCH] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 libvir-list@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Mon, 31 Jul 2023 09:37:58 -0000

On Sun, 30 Jul 2023 at 19:55, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

