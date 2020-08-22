Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k9WE6-0002Ik-H6
	for mharc-qemu-trivial@gnu.org; Sat, 22 Aug 2020 12:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9WE5-0002FK-Bp
 for qemu-trivial@nongnu.org; Sat, 22 Aug 2020 12:18:41 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9WE1-0001jy-RI
 for qemu-trivial@nongnu.org; Sat, 22 Aug 2020 12:18:41 -0400
Received: by mail-ed1-x543.google.com with SMTP id di22so4146898edb.12
 for <qemu-trivial@nongnu.org>; Sat, 22 Aug 2020 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hPwRXW4zmqimsF1rXbRonw/TPwj2MgH5J0yduwvBAWs=;
 b=jNqzEfrN6544f+QuHJDKmooTLKhyMU+jjwvoawSQLmzW+tVN+G9Tqy2jca6SmZMWNy
 PjNLx3pnAv/8CJsb8+Dj9ylTrRrcrFIBB1rSaoDJXogsoJARUEqUfMI3v1kkcA4PZnMZ
 LglfLf+6jWuBlqenwbZPS2ujjj+6m22SBBN92eDe4ox5befDBZeU4hqjX5cD7OVm5JU6
 kHppHxLtH3Y4ZlViCibOllPVpLHeNjSwAvod24/UUc7HZmwB6+DNYdGm2nTkZmViLIdc
 35eu+IN0qRxC87MEpFxNZs7SMhqduRk/8YixlGoxM5jzH8u7GNOOFRRFoIe/CQV2jTsh
 vCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hPwRXW4zmqimsF1rXbRonw/TPwj2MgH5J0yduwvBAWs=;
 b=RagjQnv4IIMvLHn8JpZqaXn5/F+ZKUYdKtpOGh7Ye+Bi280snh+/20fQnASdzlNXFF
 x29fkWerIA8bvF6dPs3eGYPD7REz3GfIGW3sSCHaxbzNd5KKW4jPczate+HAf4s5ySlM
 yA2bZnj7g02Ha+7upcHOUjkAFE620oOUKwFMvtpk4y1cYuASvHAvXpqNbH9NwOCb/xJO
 LhNMrFFAkO/J5Rfvluuye8ugkYdozBjaXKMXVVElky7iOZQnq/U3ILUQKdyAH2ljFtcL
 v/AD8M+ORFwLtXrJbfFWd5tN7ulQjF1yMbiThIOHw3dvSEFqNj6/XxSfwuNmTEbgxYiA
 yVNg==
X-Gm-Message-State: AOAM532ANJLfx2RyHRJIkmLVNrH7hTZm5pxhxjO8+EWrvhW9AgUw7ka8
 B2IyvPYNDU/wb7EnbUVjYuxuH5pi1OWDz3dUyVxSIA==
X-Google-Smtp-Source: ABdhPJyaJ/IblAMVcwnSLCdmP7GrXZE3LfBKtSmb5Jx8IxFNmoPR/sGQWugOfORMD7MsLF8SwYhUrUY/MhQg60Ol//s=
X-Received: by 2002:aa7:c594:: with SMTP id g20mr7635626edq.146.1598113116248; 
 Sat, 22 Aug 2020 09:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200822150457.1322519-1-f4bug@amsat.org>
In-Reply-To: <20200822150457.1322519-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Aug 2020 17:18:25 +0100
Message-ID: <CAFEAcA_VexUZ70aL+6ecf2MNoFCVtRfPOUJf2Z8DQJqPDJbAKA@mail.gmail.com>
Subject: Re: [PATCH] util/hexdump: Convert to take a void pointer argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Li Zhijian <lizhijian@cn.fujitsu.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 Zhang Chen <chen.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Aug 2020 16:18:41 -0000

On Sat, 22 Aug 2020 at 16:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Most uses of qemu_hexdump() do not take an array of char
> as input, forcing use of cast. Since we can use this
> helper to dump any kind of buffer, use a pointer to void
> argument instead.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> -void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t =
size);
> +void qemu_hexdump(const void *ptr, FILE *fp, const char *prefix, size_t =
size);

Changing the type seems reasonable, but it is still a pointer
to a buffer, so I think keeping the name 'buf' is more descriptive.

As an aside, is it just me that finds the order of arguments
here a bit odd? The pointer to the buffer and the length of
the buffer are closely related arguments that are widely
separated in the argument list order, and the FILE* that
you might expect to come first doesn't. "fp, prefix, buf, size"
would seem more logical. Not sure it's worth the effort of
changing, though...

thanks
-- PMM

