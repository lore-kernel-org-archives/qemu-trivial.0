Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKngn-0003Bi-Oo
	for mharc-qemu-trivial@gnu.org; Mon, 30 Aug 2021 16:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKnge-00039Y-AB
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 16:15:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKngc-0003Q5-AW
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 16:15:20 -0400
Received: by mail-ej1-x633.google.com with SMTP id n27so33771815eja.5
 for <qemu-trivial@nongnu.org>; Mon, 30 Aug 2021 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZHxqII6pE72vP1yX9i41mIgsKVp3Raa/v4NDJVfcxM=;
 b=qQ7la5ngyYE+rrBSYfuSlulO+sgiNAUuIrjrViyvC1IUDhVF7ffqeMrZLQFZsWJ4FW
 A2SoXkYmzh1qXSAfGjsefzEBfyKZJQNeQAO/S4K8+SVDh4/iIn3S7w5YSRVPzvKk8zu1
 IyQlAyLC7gifBvw5Z4j/VeOuWfcmNIqnp9uiW5ROd1FAREBKKNsFWcr+pGYqAHpr/3Yk
 8pbVYSCnlA1ypcLUb32eH8oS9TSaFOaHqc/JpwemcjJIVsJYIjX8k8KaGS+fW8mWMbQ7
 PTUSa5Xx2aK/YgypCgb2MkSwCCg2/F/jF9BhlxQ45wXIlwFftcEBhnZmY7EAW8U8mXTn
 i4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZHxqII6pE72vP1yX9i41mIgsKVp3Raa/v4NDJVfcxM=;
 b=N2tSoAJuHD8FtCH5ep8qI2uvBVg3/ZBlSJT2nrmQ4WmEIzGslqQk76xmlBSQTv9Xqn
 c6hfQDcPWok7PU19LRMIBcd66684y9d9/rRX19WLNhtj4iwxfoXWyqEuYGXJKOE6PSEO
 a8InQXv4ZlhuMLNPNLg9jf2u4lv09StmLvqCupRyhKBKF8JAP1dCdhboKTl0TnaEBeKF
 TrdKwHghri6zZd6TsyipftDJI6VxrBRP+O2mglLZu2xzbgPAPEu5bThng3V+qLIrhDbH
 0XXZ4BnSE6fWEeQvjZc9Z86/0Icv0jzJ7NLSlDf8kWdULioWtBS6zL6ogz9iaajBlWdW
 yjbw==
X-Gm-Message-State: AOAM530+glV2H47VWqp0tVCMlUwFDbaZDKGnIWOJ/aubS8MYi9qYaBa7
 +AFQEBIu+b/SDBkkAumLCeXL12C33tju5WpX8zQbyw==
X-Google-Smtp-Source: ABdhPJxNbYcf3zDhoAE+d1zSPUTffTrsWA8fm1Cr92qAvtCcsPeoJ4lVHzWxUX7F6+54iN1FPzT7Q4b7GYt9LJR1IZ0=
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr24792012ejc.482.1630354516646; 
 Mon, 30 Aug 2021 13:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
 <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
 <CAMnW+q_6Vd0os7AEVVyM30m1kzev_3j8MWusXV1kp6jmUmRqcg@mail.gmail.com>
In-Reply-To: <CAMnW+q_6Vd0os7AEVVyM30m1kzev_3j8MWusXV1kp6jmUmRqcg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 21:14:28 +0100
Message-ID: <CAFEAcA-PSg6puCy95bskoFzq1a0F60O43cAkz=k73SXLZxO0nQ@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Johannes S <johannes.stoelp@googlemail.com>
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Johannes_St=C3=B6lp?= <johannes.stoelp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Mon, 30 Aug 2021 20:15:20 -0000

On Mon, 30 Aug 2021 at 20:37, Johannes S <johannes.stoelp@googlemail.com> wrote:
> In my opinion we should use 'unsigned' data types here for the ioctl
> request in the ioctl wrappers or would you prefer to keep the ioctl
> wrapper definition as is today? What is you opinion?

I think I would vote for following the type used by the ioctl()
function as declared in the headers for both Linux and the BSDs,
and using 'unsigned long'.
(We should change KVMState::irq_set_ioctl too, to match.)

-- PMM

