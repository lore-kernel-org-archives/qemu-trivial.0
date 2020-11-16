Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kebdD-0005je-Bo
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 05:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kebdB-0005hR-Id
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 05:21:05 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:42098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kebdA-0000S9-36
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 05:21:05 -0500
Received: by mail-ed1-x543.google.com with SMTP id v22so18113606edt.9
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 02:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/SGwtQj0c5Xilj94THJB66Dl2N5KaXiw9S/1YE9nhQ=;
 b=fGkN+Id6qTHFGKaO3RMFFgpygWYiYLF9KX2BfZuhUYSdISbIUntJU4R9iJxFivf+OQ
 RR99aFzOs4ev/b+zIJMwmBt1c/A05txs4jH1MnO9Xp+xVUI2hE0GY6iLaYXjT76sfPAP
 Hhsox6z+fRuCz56uiuJh/VCoEur9j18ke04zYlAYYz7AUK0hNHgTvl/EijchGa8Xz1m0
 QyEwNTiGlD66PPlrNI2rTg+PY29Q6PPWbKdFEI4PU/KbpPtKFl+vIviU1teY7OtZn5qF
 FoKdyT0wUlYkPqKnAzH04pt4mqvBNj3vD3FvOU1W6uIha9rAakXBbiyNa5OXbAtxdetO
 Dpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/SGwtQj0c5Xilj94THJB66Dl2N5KaXiw9S/1YE9nhQ=;
 b=RT7uy1eRuqfZAGmH0CAmYRXx2+x75rmT9rZv9v9Utxw31h2lZaVzAKWVR1IdSJmtmw
 y48HICIJRJNJdGvZoiBX3Fn/t33KHWFthiCUs81IqNv8wOHN63a6pRIr6cdTDzX0e38Y
 GKZqt6m4tU3lamRChVrCYjfIGHyE7RC+1gy7lVvxJeQv46oqw9/EC+da3s51vKH+T9iN
 DRg7hKG7yZAIm3R+HgyxO2z6HfesOJcn6Ex9gOmMEhFN1ne4aaSsxSCN+1vNpt42KV+l
 46iK5xiLaUTrRc2kjsgKG2SmDMjgsB/7zVZ8NVESSVWuPqs8k8BUsTk32tQe4ac0vQwh
 dfaA==
X-Gm-Message-State: AOAM532RHKnaF2TarExuDIMD0xIPDAEovWyLdLaASufK3iD4X/YHKtJL
 C4nsQWw6FXz93QuzwZwxBsr1zWHRwTXQfJ14gdG7MA==
X-Google-Smtp-Source: ABdhPJzk/770J+DCzjxgQHIlToeW3E2o/GIoRg7Cmw9IlrWg9hxbnaZ24TrCBPMWtBkBpmdZXhEl5+oE0xtU6L9z8DU=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr15142965edt.204.1605522061985; 
 Mon, 16 Nov 2020 02:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20201115123503.1110665-1-ganqixin@huawei.com>
In-Reply-To: <20201115123503.1110665-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 10:20:50 +0000
Message-ID: <CAFEAcA_g_+adkJX5KTAQz9HbD-d7wyXVaBkT63OVntuw+5OM1Q@mail.gmail.com>
Subject: Re: [PATCH] ads7846: moves from the hw/display folder to the hw/input
 folder.
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 16 Nov 2020 10:21:05 -0000

On Mon, 16 Nov 2020 at 03:08, Gan Qixin <ganqixin@huawei.com> wrote:
>
> ads7846 is a touch-screen controller that is an input device rather
> than a display device, so move it to the hw/input folder.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

