Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1keec3-00083j-Qz
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 08:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keec2-00081S-Ao
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 08:32:06 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keec0-0001jw-J5
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 08:32:05 -0500
Received: by mail-ed1-x541.google.com with SMTP id l5so18678361edq.11
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 05:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wVNK869LYYO4+TwdW/v2+bqKYpO5DtOQj8cjmnI82NQ=;
 b=BjDaJENqg2vQ25Lzbo6dYbh+dIDQMBYfeHyUl9mETBsFHE+GQhFWS1HcPcVL+cAUnV
 HR7e4xLEX3RBaUk8MlskSyc1MCNKuda4hHZUqGBU8UUgie4GmShP7FLEgGiGp7FC57Vv
 oeEboFAarkF51y0aRLsncr5BlJBcYwR6F1IGU9AkRNzoaH8o3WKkKsIqwY+01JfiVJ0/
 PsE6iaD9ke2qqzz3q8gFCpGfDUE19JQDsJc+1Z+Sx8uUCiV5SVjR1404c40p5DuTbIf0
 5w1gpSmQoSS501pMweRRLoHx3v6PE7s5Z3Dcyb1P71NQ6VFhvS4X9nncOdAnsHdnlOK1
 wQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wVNK869LYYO4+TwdW/v2+bqKYpO5DtOQj8cjmnI82NQ=;
 b=LVTPSPp+73i46t5WcwxV0+ApiMTzDz9EzVmp7hoSR3WCDTH13jxh6Udhsvd96Fl1/C
 5KxkcV/lCfyo70WSvAK5AuZsKzmh23mloDewTQi5ObRipcf8lM+WMV96ZpdPiBaH2W45
 pw3XtKtfb20TUmbKh4vTiTfI2+s8dpof5v3D34MRrAWtzvnkD/xUnu/j/0POSsC5HZ3T
 fnNyyuQqERW5+xj0T4kpl5lFszFke5QHsFDNDgY6tB2p222fhzCVFXATx0j61GYidhUT
 agpnOYfOwJFcFGXQBKDUswo8aSpOzeTgKlNCDXTSP63jRy4rBY9PFBktVK6R6NzFo+5S
 A0XQ==
X-Gm-Message-State: AOAM5316O6yNA+AMRVW9alwkzhdGSlXrh2VR3isGswaeEM7sbZAS+Nup
 G9pgMGC/F0Xp7eGsLzpueXQuWDR+ube7nUaKCBNTnA==
X-Google-Smtp-Source: ABdhPJwR+21LooH6cNCMhYKVOC+T/Yok1BYZQl6WMg4fY1VejSaQRKZmvZ7KTjaKhr0Ra2t9UpcLel3iZvCNpiSnN0M=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr15844440edr.36.1605533522347; 
 Mon, 16 Nov 2020 05:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
In-Reply-To: <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 13:31:51 +0000
Message-ID: <CAFEAcA9nF=RFnjFoC6b3iCN2Cu_QFsWHzouiK4EZ8TFb6cZaeg@mail.gmail.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Gan Qixin <ganqixin@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 16 Nov 2020 13:32:06 -0000

On Mon, 16 Nov 2020 at 13:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Well, this is not an usable device but a part of a bigger device,
> so here we want the opposite: not list this device in any category.
>
> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
> types so management apps can filter them out? (And so we are sure
> all QOM is classified).
>
> Thomas, you already dealt with categorizing devices in the past,
> what do you think about this? Who else could help? Maybe add
> someone from libvirt in the thread?

If we could get to the point where we can assert() that
dc->categories is non-zero in class init, we would be able
to avoid further "forgot to categorize device" bugs getting
into the tree in future, which seems like an argument for
having some way of marking "really just an implementation
detail" devices I guess?

thanks
-- PMM

