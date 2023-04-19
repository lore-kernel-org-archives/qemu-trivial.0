Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pp83L-0001vI-06
	for mharc-qemu-trivial@gnu.org; Wed, 19 Apr 2023 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pp83H-0001up-9T
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 09:40:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pp83F-0008Q2-No
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 09:40:51 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so23162305e9.2
 for <qemu-trivial@nongnu.org>; Wed, 19 Apr 2023 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681911647; x=1684503647;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wh96CBaUa/gSpe99ICrPIQ4LiaaJ+PwVs2L98yBOVpI=;
 b=BIT48XKTsrXROylkjIBkEL4qBZXCsOxkFHT89hMQ8DFyWs/EkC5U4tS8Bc5wgt9O0E
 AgeEe6VyTNFkpdS0MI9mimvQbFHfMf9YnnvOEflm7dbv2YtUH8X76cH1YxLQnWeHVzks
 2HxrXAF7bxb3/PBL/8psrllnVSVwNo9dwoHGFVAGdlkhGYC0EVDL0jzh0U+m5NovuFbp
 dfZMo/A/dErtsTvkZBTZ7e8UW6NnPFUhK7FTnQmbi+YQ7ddWBj95Wkyo/X7pqlqY9LYD
 Gi6bHHWja2969+wusmCGI4Uas5KztQlY7DZqtgnwXSW8FI/CbVdY81rf9/Weq7y/TWrG
 j5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681911647; x=1684503647;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wh96CBaUa/gSpe99ICrPIQ4LiaaJ+PwVs2L98yBOVpI=;
 b=GcydUWlNIyWu4gSOq0aM3dcv0kD5RpghRxT5/pGwIdyd1b3RTgiKuN6vnrUyrnxzmM
 /C29Qp+TtYEK8OVwz3zcfpEEfhZbExSYdwvV/0QAYvp0e3zVm5zsLpmcisSyvwNGdfIj
 l+l3c83Y8/Q0p5MAOTJpzqiKPiSiVRKrwNrASxMgohR6/DhfmAsluhPWgwIToN9RCI8o
 SaiGFLn9I9hgxsSqzIuXaVheSrNX/aLKgApaYKSfM3mqN8fWPI3RedZ9z3qYBGmHWMqh
 040bNTsSsc3klhCpzRWKzLMtjuVA4bDHI8Q4S82wiQAuJRHWasl500ntTn/1jEf3KQQ3
 mxRg==
X-Gm-Message-State: AAQBX9dqvXfXTqwZpfMM5ou4k/JAM6fTIl3HR9zmD+C4TL56/+IuynKe
 g0dx/8AlxVNKrX9kVkA9GU4C6Q==
X-Google-Smtp-Source: AKy350a/dyOksqFCHZoI6zdlVaNjr+bWyZ2VZACXUqJTTJtewRTIgzSAfRi/E4X68FPlKSl2Z5m4Ig==
X-Received: by 2002:adf:e3d0:0:b0:2f8:5767:2d0d with SMTP id
 k16-20020adfe3d0000000b002f857672d0dmr5018661wrm.68.1681911647516; 
 Wed, 19 Apr 2023 06:40:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adfe988000000b002efdf3e5be0sm15850230wrm.44.2023.04.19.06.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 06:40:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C74C21FFB7;
 Wed, 19 Apr 2023 14:40:46 +0100 (BST)
References: <20230419124831.678079-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yanan
 Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] cpu: Remove parameter of list_cpus()
Date: Wed, 19 Apr 2023 14:40:41 +0100
In-reply-to: <20230419124831.678079-1-thuth@redhat.com>
Message-ID: <878reodm75.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 19 Apr 2023 13:40:51 -0000


Thomas Huth <thuth@redhat.com> writes:

> The "optarg" parameter is completely unused, so let's drop it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

