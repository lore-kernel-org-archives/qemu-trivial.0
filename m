Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1khaGP-0002kt-B9
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2020 10:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khaGN-0002hs-O1
 for qemu-trivial@nongnu.org; Tue, 24 Nov 2020 10:29:51 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khaGL-00022N-40
 for qemu-trivial@nongnu.org; Tue, 24 Nov 2020 10:29:51 -0500
Received: by mail-ej1-x641.google.com with SMTP id k27so29018673ejs.10
 for <qemu-trivial@nongnu.org>; Tue, 24 Nov 2020 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YIK4rT06OEVfS5PAOFn7t9VN48hP6GRhcSimvXcCgSQ=;
 b=CttcBkkcNyEqepfnn77FAVRKHMb7jYBvZrAZhZ6szTgFuj8XrMMpVLtuYzl1J3jS1K
 MqS56Ge6WgO4SoOI1l/yOc+7N6l84nsa/vMrJo6INkKUO2unSVHKW5jwHcJCV7xmN9wH
 rnxR2pQ21uh/kvzCtNCq0eOo1uBIuwE/qRAETiue8/KXez4QO7s1rhhWk3pU362HZvlE
 5HGa/1rFLN9fscHiEzlzsri03FgpseSnYxun2RXx3p0Ja22kCqyCO/HEv+i3lh7NJCi8
 vn5A10fbIrn2+NqN02RK698saIMoDDWtu/lauHu24Cz03EWs31/mowHhjEyLXtocwlre
 3JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YIK4rT06OEVfS5PAOFn7t9VN48hP6GRhcSimvXcCgSQ=;
 b=k3I0TyRznuCU1EwyPAAalmNsClbPNrO9e2rTphOorpY0XsPKrVg0/HTgViRF3eZAaw
 cQZ4lqrvqptejr0xw0WgAd+VjNOI/Gu8nZX7etnvFAagDf6Gc2Lvrc7Yz+cb3xUX+L1/
 Kcp6+l7XvteOxG4DVkpIlGc2qrixY4gu/P7MIC3rgnf3xhCRpisHYYTjMPdqorPLbtsn
 lwhWQJJwkDqIw7HevhsZ/J97nil4ZWICHxJbPPfsSD3pI8S8xScGtBBlurbUlejjFhkN
 /2gy7JK63znmXHtb2OsqUG9icKts5Ieb7CAOnWJLsRpBNEvRHwI8nXxnkHiDJn9lM9PF
 eyFw==
X-Gm-Message-State: AOAM532y5IswfXb5e7Bux0+de5EWbSp0lAf18cN2HoS5wOK0RYv/G7VH
 JIPeX5wb6jez/1a03PjkpEsHSCsAkRW5anu8nbmrvQ==
X-Google-Smtp-Source: ABdhPJzYQbyOdV6QzHuci89/tFe1qmzC5izCPxllk7FamFiBMRWddCBalqN/+pVoS7iFB4JD0Z2wuOIeEzrzF2X8Pkk=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr4504401ejq.407.1606231787291; 
 Tue, 24 Nov 2020 07:29:47 -0800 (PST)
MIME-Version: 1.0
References: <5F9AC6FF.4000301@huawei.com>
 <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
 <5FBCF8F0.9060103@huawei.com>
In-Reply-To: <5FBCF8F0.9060103@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 15:29:36 +0000
Message-ID: <CAFEAcA985RuM96HP4mvHmU-ffAsQWv4hFFABXQ2ZW_t5Uts7vg@mail.gmail.com>
Subject: Re: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
To: Alex Chen <alex.chen@huawei.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, QEMU <qemu-devel@nongnu.org>, 
 Yuval Shaia <yuval.shaia.ml@gmail.com>, zhengchuan@huawei.com, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Tue, 24 Nov 2020 15:29:52 -0000

On Tue, 24 Nov 2020 at 12:15, Alex Chen <alex.chen@huawei.com> wrote:
>
> Hi everyone=EF=BC=8C
>
> Who can help me merge this patch into the master branch? This patch may b=
e need for qemu-5.2

This code has been like this since 2018, so this is not
a regression in 5.2. At this point in the release cycle
(rc3 imminent) I think it's best to just leave it until 6.0.

thanks
-- PMM

