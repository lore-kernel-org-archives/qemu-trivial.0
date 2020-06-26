Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jom41-0004Ef-Me
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 06:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jom40-0004CS-DJ
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 06:58:32 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jom3y-0005Qk-9h
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 06:58:32 -0400
Received: by mail-oi1-x241.google.com with SMTP id s21so7680563oic.9
 for <qemu-trivial@nongnu.org>; Fri, 26 Jun 2020 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5Z5SdaTsCaKDtDfyJe4e2nj6mxnbAhmjCKC/915jtI=;
 b=beZLCNj0HJ+v6LJ04dDsCVrW2bnCGzQJRMOssnVz20YtOcdaG1DR37ImC4lv0TATXd
 oDcU9cA3Nrn+5kNt7qU/ei1zXaSnfcWlYNMYcSaiK16pHN4mEElefj0VdJkkQJkzFPqM
 1+pZibKUvomUMyNIGIAlaPWKWVsL/v9R2Ufw+TLgrST6o9D9kfqCHOFQTtD/+lK3z7mr
 wgh8sjpDXy+lnK5l8EVQ/qftexKkOgsbmh7CkF4s4PJLyw1D/idf9QfyhvYz6q4phDct
 mjUXHOc0DN7Dj9TJLuBQ0ZbwvlD8sIqPt2r5IU8fyrP3/sZGlSGAfRhf4Gbs2dMQzeJM
 X/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5Z5SdaTsCaKDtDfyJe4e2nj6mxnbAhmjCKC/915jtI=;
 b=GfjfklZGW2SenRrUqYUJdXWUryYLvwuuLxqbX+2bXVA7tbBfx5izgdv6FjjCGqqDdo
 eCpC12zJyUgw3iyM/QGBWncAvdjpAEXbAZF5nKVWCAHSWMofXJ+fP90qL5zuMOhTn1DA
 7h1LeFqacOHakE9lzsO/vWePYo9Z1ux5gm+ue3mNVHq8aUisPrYMHxxVMiGnAQUazqXy
 PaEHRaaSPKISE/yEaI6EIHbx13JiTUqIEmnHqjZcUtPTGCvNn4jNqQ4+PybnFNNbs0aN
 rW82ZJN6ubOzrWSrclGGQHFdxUYLnNGXRekVva5yDC71jMVmN4BmH76b1c9KF6vaMY4E
 oFRg==
X-Gm-Message-State: AOAM530i3o3bRXf7LeoBZE6QIuQ9xYqrfemkHWoQsEw284ZvNhjjY+OA
 zP9RKU67wXOIznF/IncCE4efwoSDGtkghEqMcIGGvQ==
X-Google-Smtp-Source: ABdhPJzB4Vl5GTl6F4C/KBux7jIKmk4Gwainz5s6WHAwdhiywendX5f9dOtzdnHUzFv6RdoE6uQ6fL42UbIImlhBEQI=
X-Received: by 2002:aca:568c:: with SMTP id k134mr1793487oib.48.1593169109139; 
 Fri, 26 Jun 2020 03:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzxVaM2UHMjpOiwL-bM2GZb8KwSrXf1=+LTUy53mZGRWw@mail.gmail.com>
In-Reply-To: <CA+XhMqzxVaM2UHMjpOiwL-bM2GZb8KwSrXf1=+LTUy53mZGRWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 11:58:18 +0100
Message-ID: <CAFEAcA9NheeyXgiU47nhS6t+vhH7BmzGKcsB7K+_W+S56KjGMw@mail.gmail.com>
Subject: Re: [PATCH 3/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 26 Jun 2020 10:58:32 -0000

On Fri, 26 Jun 2020 at 11:11, David CARLIER <devnexen@gmail.com> wrote:
>
> From 56890fa5728d11c72232348b3f3273e2df31c197 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 10:40:58 +0000
> Subject: [PATCH 3/5] Checking mlockall symbol presence
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

