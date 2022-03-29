Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZDyl-0004E5-7h
	for mharc-qemu-trivial@gnu.org; Tue, 29 Mar 2022 11:41:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZDyh-0004AN-JJ
 for qemu-trivial@nongnu.org; Tue, 29 Mar 2022 11:41:53 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=40636
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZDyb-0002Ec-S5
 for qemu-trivial@nongnu.org; Tue, 29 Mar 2022 11:41:47 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id f23so1779128ybj.7
 for <qemu-trivial@nongnu.org>; Tue, 29 Mar 2022 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03ybgrX5WteLjC0iYEhC8Q4NWeO7R30zohy5xd/xiPc=;
 b=j5+nRr25tFdCFDyobBf9JiX4vPgz2u9x75O/Mm3XVdnPATXG30qrF67gWUcppA34Y5
 NefSz0UvE0870ZhCS4+Cj9ouvzF0p8yWev3+CPflnT/bgGF8MQ3lTE8mnMiHzrZ3MOze
 pI+5D3ZQaGrH24g8XKvB+ebiVpjS6oGu1uMJ6nA0PIAM9Buu0i9VOj1mGFTP3gzlA6FV
 mdFz9SAYoP+YSvzgttlnk3AfmSKUWmoXf7sSF8t4onCAz3oxU4Zvxo8uZlkUe4egnCh8
 HAzh3RwBh3HsFvy4EJYSN5H7d71/d8VV4p+8T3KTC+QKoBfoMnahX+kLyCcFl9Zio8W2
 qAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03ybgrX5WteLjC0iYEhC8Q4NWeO7R30zohy5xd/xiPc=;
 b=LwpQo9bsy1jxxxSSS5bB+gFXHp8BBMXDQ8O9txTHW2fKeP19WxxR4BVpWpUghyRsA/
 6CWHQVkGNvO7xXljYrXs8PkK/rUPC2Dy2cDC0RQt2PHyAetLzRGTTkcWiqlaaFwSz13k
 tCuBXvD+NFTGTIsWEHdZkGQIfCzYGh1xyLFTittH1Nv+KSJgdUkZOfh/GMhl9JxFFma7
 aToTFmIlMwSfBAyAoLLk80jySUdH8Lz721DPZvekKDAg2gpgd6lm0kJp1BBpNnkSJA8y
 LonFH2+b3FC5Ay+DC5/hZqBEc6Un1IwFa85X7K9UA7NGWsQaB4rD2ddal+6/Zc8ImxHQ
 N4OQ==
X-Gm-Message-State: AOAM5314tsFTedgDIqL8a/JbOFERVwtgbpY4dTRgw9JaGulNDIREHFV9
 3xgyyKZ5XWhycORzQ8yG8JMooxx7XGTJPv4K1utpUQ==
X-Google-Smtp-Source: ABdhPJxdxaUV6zbJbW5EvvisXgF8/aOI6hoqZIg3Gn88NMk2u+P94cZEWHMle4/4lE8NdaOQml4HYGp6QrivNRlu26s=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr28681339ybq.67.1648568504014; Tue, 29
 Mar 2022 08:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220329151955.472306-1-thuth@redhat.com>
In-Reply-To: <20220329151955.472306-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 15:41:30 +0000
Message-ID: <CAFEAcA-VU+UiWt0D0u7rAzERSxy89FxT760nk7aL0pcNc5i+tg@mail.gmail.com>
Subject: Re: [PATCH] target/sh4: Remove old README.sh4 file
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 29 Mar 2022 15:41:53 -0000

On Tue, 29 Mar 2022 at 16:22, Thomas Huth <thuth@redhat.com> wrote:
>
> This file didn't have any non-trivial update since it was initially
> added in 2006, and looking at the content, it seems incredibly outdated,
> saying e.g. "The sh4 target is not ready at all yet for integration in
> qemu" or "A sh4 user-mode has also somewhat started but will be worked
> on afterwards"... Sounds like nobody is interested in this README file
> anymore, so let's simply remove it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

