Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lv1Vx-00032d-1k
	for mharc-qemu-trivial@gnu.org; Sun, 20 Jun 2021 13:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lv1Vu-00030a-HJ
 for qemu-trivial@nongnu.org; Sun, 20 Jun 2021 13:45:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lv1Vs-0005yO-3S
 for qemu-trivial@nongnu.org; Sun, 20 Jun 2021 13:45:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so1582462wml.5
 for <qemu-trivial@nongnu.org>; Sun, 20 Jun 2021 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:content-transfer-encoding:date:message-id:cc:subject
 :from:to:references:in-reply-to;
 bh=fbkSbDiYh//vTof0lRFLe+jc4sYTy3R3lL8DSiskKCo=;
 b=RLYZ6EvabCKjDTcBdV/IN5Sqq/gn7XIshbzjJLjWl0xoJ1SDMfFOfsVrbxLXF1Bvr0
 /C5fcPwjl4AZ2vbKTS67p1EeTpolbrSNLLJ0ciCbVKdEdl0Y7LPnWvDUw8jUihZZx0og
 eJfXIf9vGldeDk7sucjlvdyWpg5sZ4mZdRlwQO6jtbYX3Vye+jERRDFjiLXUooF/r4c5
 3MvBOIY8VIOg8wfZTBVWgBuIfE4H6+FtWqMiFqrpAw8golwxS2aIiXwxMEpyC06/DZcI
 yqR8/KSIextZ16gJgdikQdtOBOkxr9zpmWvR4O48RGQxr6ZSTGYMJfeg5Oi0exCN637u
 U1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:date
 :message-id:cc:subject:from:to:references:in-reply-to;
 bh=fbkSbDiYh//vTof0lRFLe+jc4sYTy3R3lL8DSiskKCo=;
 b=pCNlsqT5guNYQygs1uJdYLpgZdOset2+R//pZs2mB7so5uSICrHe3FCia2OUdBnC0b
 RHcmz6+jy9HfgTUNA1hx6VQIR3EVj4l0Sg6isFuEWmis39G+PFflwlC7x8TN5s9Req/V
 me6jP1C3t0/5lj2Brxmjxl6nPvmqTB+q2/ifJJI4saegGlCKTf2NAGH8X/RrMO/XQpCg
 Tm18Kd77EX4IR4aj8O7ao1GZpw/Y/t+jJcOyshXZcElwcDhBIVaDRJmhrTZnKdFsltYL
 M0ffqKmLOMawF9Z4GR/AU1u6UONUQzMPNVLdTrw+u7eksWN1ColwfKSMMrLrkp7EtRqb
 TSfg==
X-Gm-Message-State: AOAM530k2e7IfSDuTSJ5jT24tqzYjAtWf4c1atMeUHOq+WuEoRZaX8f4
 03VNXdMeGprlWb/WaGR1JQrv/hlBWkhrcNO/RZStGA==
X-Google-Smtp-Source: ABdhPJz1e/x3gR9lWsRwwtHPODt5xCVplCq51BgHqit0Db4NrM6icNmugEmd1gP8rvCB1h7/Q445wg==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr20730995wml.141.1624209678626; 
 Sun, 20 Jun 2021 10:21:18 -0700 (PDT)
Received: from localhost ([154.187.196.13])
 by smtp.gmail.com with ESMTPSA id o26sm14353657wms.27.2021.06.20.10.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jun 2021 10:21:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Jun 2021 19:21:16 +0200
Message-Id: <CC8MA0TV362K.3IM48EZO5FRZX@pythagoras>
Cc: <qemu-trivial@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] net: Replace TAB indentations with spaces
From: "Ahmed Abouzied" <email@aabouzied.com>
To: "Peter Maydell" <peter.maydell@linaro.org>
References: <20210614183849.20622-1-email@aabouzied.com>
 <CAFEAcA_h2wQF4nDMhu3WT9AzCEMV3jCkDpuuorTREYaGoKaEwQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_h2wQF4nDMhu3WT9AzCEMV3jCkDpuuorTREYaGoKaEwQ@mail.gmail.com>
Received-SPF: none client-ip=2a00:1450:4864:20::332;
 envelope-from=email@aabouzied.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 20 Jun 2021 17:45:42 -0000

Hello,=20

I just sent a v2 patch that should fix the indentation on that section.
Sorry it took so long.


Best regards,

