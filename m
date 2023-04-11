Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmDZL-0007gT-R6
	for mharc-qemu-trivial@gnu.org; Tue, 11 Apr 2023 08:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDZI-0007fu-Ar
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 08:57:52 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDZF-0006Td-R3
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 08:57:51 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50489d2f5e0so1844946a12.3
 for <qemu-trivial@nongnu.org>; Tue, 11 Apr 2023 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681217866; x=1683809866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
 b=jaSZLb17ZlVYLTLZRNEYLeS3zUtfdUvTukc1hQcIHMr6SKWiBHZc1BDGCTF3rLzXw/
 qqD2l1dW0n63eu5Sav3OmLx5TcsibaqMa1LxAXtJrLzt4ZuH3IxVBPrb44zhNH8xdFt1
 RLlCilnrSO2LDBVyNr1VR5mLSbl1bsjw4cuuV4IHNfs0P7KpICO1iM6hJ1DsIVBZ+a8Z
 ALUTsq3G68B1ErIkJob8xKaoPT4RW/z6rglIcVbo4ohH+egUPAFIPin3A5JdradG5ObN
 c0k26Xgn5ql8pjumqVAnzdo/HBF31EpZr0PNeEHIh1nJT5aGZgjlK+nhPWHTcgamg4kX
 ylAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681217866; x=1683809866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
 b=QaX4wV7bSl/AVF1Q5WP1WDKWk+US5L6+D3vtot0TAyx7b6kjqc32JQWysia7hSx6hE
 yruwPnvfhCzSfvi6YbuidUfjYmOyscrknWSk6lgDChytZS+Km2bOR/n74znI2Nnsd0RF
 tIfpyvUMR9kPIYo/QM2sFy1xOYC9xxJqlIYsNRlG9kHiIfT09tXtcEJdc/zZVWLqPwnv
 rO+TrFkyFSoD7XBC4EViZIAtZ5Q9p9R/WpXGetAnEHa74mq1qHhzKVh+qX5FKIkS+BtQ
 uJKOx0RE/onN3I5MLSV+AJleX6WG+yBYtvm8pvDEOyRRG6idr7CbqZVM8XTb4CEPVPJR
 SITw==
X-Gm-Message-State: AAQBX9e2J60vCY/7R5L9bQBgE0ItoWTswRmKpS1UzOBPpLwBRXHoO1mT
 SBEwyhZK8gfHoFjrPDPAqc2VHvlSgEGeYL72NdFD2A==
X-Google-Smtp-Source: AKy350ZyDGQlfo2poXM5BF/S9Fnj+GRGIJHzH+Ef6vY+uap5YJ8JkM75kXGC4GxAoGHs0936/W5QV1bimFo6iUlYilI=
X-Received: by 2002:a50:d0c3:0:b0:4fb:7e7a:ebf1 with SMTP id
 g3-20020a50d0c3000000b004fb7e7aebf1mr6726356edf.6.1681217866332; Tue, 11 Apr
 2023 05:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230409200526.1156456-1-sw@weilnetz.de>
 <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
In-Reply-To: <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 13:57:35 +0100
Message-ID: <CAFEAcA_cQF+GmQy2hy1VW1fbhioyWaYnU2iHg3-f13G4D5NsPw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Fix some typos in comments (most found by
 codespell)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 12:57:52 -0000

On Tue, 11 Apr 2023 at 11:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 9/4/23 22:05, Stefan Weil via wrote:
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >
> > The patch does not change code and could also be applied for 8.0.
>
> But not user-facing, so can wait 8.1 :)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm.next for 8.1; thanks.

-- PMM

