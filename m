Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTfXC-0006re-Td
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2024 06:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTfXA-0006p9-I6
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2024 06:35:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTfX7-0001cs-IU
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2024 06:35:46 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58b966b41fbso6711800a12.1
 for <qemu-trivial@nongnu.org>; Tue, 16 Jul 2024 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721126144; x=1721730944; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V56vDIqVAmmofi4MPaP03VMccsDzzQeV+azCpJzQJvU=;
 b=lGmylZVk3CaKMHaLmG1JYwQRQJqcdLkSLPkhGzZnasmgr/m/dsGNszTA2SJWxApVab
 5ieOfcMBzEVleviHWoF0yfDCFwXVtKniZZ5hB+brt9phFZMDZr8owSM6Y+wIIQlVFjIv
 fV5iVJJTlGTB4VF0fElBP/y7XtrfAoZXghsCIVNxzr/y8rbdKcAYv8bC/t8UqptysXty
 E86UrnfXxKNoIdVHZQtFFUIZis52SY7FAHYiKYSusJeZORb5f76x+nCCugzKH2g4HdsK
 YC6nU/D6fWPpKSzCBkPr7aETp1QMLf9QItP5fc9H9KkpJlCBbQ+myBPiPDgFWm4vsK7K
 bOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721126144; x=1721730944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V56vDIqVAmmofi4MPaP03VMccsDzzQeV+azCpJzQJvU=;
 b=hh520yGlGBdvQcLlTt0iGSG3bWwTbfx2xxzg0t3uuII24KnUjgby/MpB+fk+dUHwlk
 u7jZYW2bVgQ3sxoce557+N0lRrUHCScqCg6KB/cm+0XAv5EklLTfwe/+ETHxJINl9cBK
 j/RzjQy/SWb2NXe3SkIbhbypuwcuGwL9Av7sbuYHqsVBzm5Si6+X4RLCp6Dgb043mLvI
 8ClC061TkNpcDDAfanp28NIsL1t6jZdzFE66pkfMKWONNlHY1C1MSkY+VhnVloF4Jx2k
 GY+lox1IYhG+HEVvsKjNFwAOFUpmMWFyrJoGelIAixO5J3Xuo44n3qiuek9k1MR463UJ
 Mp3Q==
X-Gm-Message-State: AOJu0YxdRIk7tmlZP+Jif7HggGF60i6saYFHK4ELtdAfsXMbQ/tE5APY
 gZpYpeXIAoNZ6zTd57blBIHAmrchv0YR0IrieaCxK0IGx0EpUq72WT7Xbe9zplUgsqInirRGZVp
 MDdBuuIN9kWeuarEC1ZffWbZa6C61jt9Vq5L1yQ==
X-Google-Smtp-Source: AGHT+IEsNBulhfo7eC0OVSbKQrVkkjGDI0nJ9vBZooB97e6aIydoxIT7pIfv9rG+WxLfIefjqZMbiFlk1zucM/Ae1wk=
X-Received: by 2002:a05:6402:4581:b0:58b:9e7c:bcbf with SMTP id
 4fb4d7f45d1cf-59ef0ad1232mr1083461a12.36.1721126143538; Tue, 16 Jul 2024
 03:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240713160353.62410-1-me@samjakob.com>
In-Reply-To: <20240713160353.62410-1-me@samjakob.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 11:35:32 +0100
Message-ID: <CAFEAcA82m+8K8rWDMBehPp=NGUezHZPn1LVoyU3DJ3LWq+ZnAw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
To: SamJakob <me@samjakob.com>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 16 Jul 2024 10:35:48 -0000

On Sat, 13 Jul 2024 at 17:04, SamJakob <me@samjakob.com> wrote:
>
>         It is common practice when implementing double-buffering
>         on VideoCore to do so by multiplying the height of the
>         virtual buffer by the number of virtual screens desired
>         (i.e., two - in the case of double-bufferring).
>
>         At present, this won't work in QEMU because the logic in
>         fb_use_offsets require that both the virtual width and
>         height exceed their physical counterparts.
>
>         This appears to be unintentional/a typo and indeed the
>         comment states; "Experimentally, the hardware seems to
>         do this only if the viewport size is larger than the
>         physical screen". The viewport/virtual size would be
>         larger than the physical size if either virtual dimension
>         were larger than their physical counterparts and not
>         necessarily both.
>
> Signed-off-by: SamJakob <me@samjakob.com>

Thanks for this bugfix; I've applied it to my target-arm.next
queue and it should get upstream within a week or so.

-- PMM

