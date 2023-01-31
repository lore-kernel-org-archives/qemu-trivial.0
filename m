Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMxYC-0001Ao-DB
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 15:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvzo-0006Hc-1l; Tue, 31 Jan 2023 14:08:44 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvzm-0005rh-C2; Tue, 31 Jan 2023 14:08:43 -0500
Received: by mail-ed1-x535.google.com with SMTP id u21so15421933edv.3;
 Tue, 31 Jan 2023 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rbx9lZKYybUGDiuqfOstHksGOjQZPphBpzZ3hm5xmLc=;
 b=o8XGPlc4cAHUTZqwkt9f57rCkqBtZOWVomoovt/agau8LWpyfdU1n+uhy4NnWdrgVx
 myfbhsWW3Ksr3aUCo3nkdIW+YwcqA6sw9oa9WuiEZ5WKN5HT451AHNvKeHbp8N1TBgon
 JNJGWpxT1onlPW78eYmzJKrCMIxIvGmZUpTcMKgK8JgLs33+sVjpOkUt5pKITQmvffm+
 y6zlT5KcV4s1Tbtd/7Zx4gmPKP7t1e+wtThkB21z0QRRCFT5APCwBbsgyC0fwB9DGcWE
 Rzi/XapM3AE98fo1Wed/wZ6vNKAb/T9/UanwXZRY3FuWzeEFv+PJxtLHbF7ZM0kqzZ2n
 WyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rbx9lZKYybUGDiuqfOstHksGOjQZPphBpzZ3hm5xmLc=;
 b=Vs4N7cdytwz1G4DDSGN6ZnqgIVojDi7qaexM6jC1Gk2Qn0jlptn7bTnZAmQjA0BFbp
 /Dlbq8wJc0uTjkV+P74Q4RyWQaJCXTDsZMGGlPsKgbqmAL3Nyt8bL31dChWRs+um2kak
 XwskrcVE6B00SNhdFDk96LWGP32U8FrNBgpV5raQqhpkPVX40z1g1P2DlEKSWSULymPK
 Nh8lIGgHMH/9Y0qt78ngPW8ZXzSs0GRtEBGG4uezI3fp57XbUoMfdrk6osiY3nArBaAH
 RTD4LQ9Lqdoq6Ozuiuj01b2amSjZiehjjn20xPUIpeebowKVVUSlKPcwO8EqeVCdGQjq
 0G6w==
X-Gm-Message-State: AFqh2kpfFKvj4H+lOeqnaovS4KXRurpYQRGzW0HteRoM42qISWNG3eGO
 MH8nlD8YJkHGRJ0ePrQIpf1fX0/OigSLxlSJexM=
X-Google-Smtp-Source: AMrXdXu17HSJ/OpDBjSaTQe6MTkpMsv0mhGVRjGYz1WipMGiz8OcACISRX5lzfaMs+K9yBPdhth7CcAORdnloK7B4PQ=
X-Received: by 2002:aa7:cc99:0:b0:499:cfee:8d96 with SMTP id
 p25-20020aa7cc99000000b00499cfee8d96mr10462452edt.21.1675192119976; Tue, 31
 Jan 2023 11:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20230131182048.15535-1-vlaomao@gmail.com>
 <CAFEAcA-7S75kL=GOiAO_pem=3RkacGL4mKe6dehibrbLc-k2uw@mail.gmail.com>
In-Reply-To: <CAFEAcA-7S75kL=GOiAO_pem=3RkacGL4mKe6dehibrbLc-k2uw@mail.gmail.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0JzQsNC+?= <vlaomao@gmail.com>
Date: Tue, 31 Jan 2023 22:08:25 +0300
Message-ID: <CALUgVpd_XoW_zi4s9KOhifmUL+-eAJzWWui+zD-8OE-w6iRnxg@mail.gmail.com>
Subject: Re: [PATCH qemu 0/1] MAC address falls to permanent
To: Peter Maydell <peter.maydell@linaro.org>
Cc: dmitry@daynix.com, jasowang@redhat.com, qemu-trivial@nongnu.org, 
 qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=vlaomao@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 31 Jan 2023 15:48:15 -0500
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
X-List-Received-Date: Tue, 31 Jan 2023 19:08:44 -0000

I cannot say for sure, but e1000 does not have this behavior, vmxnet3
in vmware also does not behave this way.
In addition, the address gets there only after a reboot, it does not
get there during normal operation, as you can see from logs i
attached. It seems to me that this is not quite the expected behavior,
isn't it?

=D0=B2=D1=82, 31 =D1=8F=D0=BD=D0=B2. 2023 =D0=B3. =D0=B2 21:48, Peter Mayde=
ll <peter.maydell@linaro.org>:
>
> On Tue, 31 Jan 2023 at 18:22, Vlao Mao <vlaomao@gmail.com> wrote:
> >
> > A bug was found with the vmxnet3 driver, after changing the MAC address
> > and rebooting, it falls into the category of a permanent address until
> > the VM is turned off.
>
> For some network device models (those where the hardware has an
> EEPROM and we're modelling "guest programmed a new MAC address
> into the EEPROM") that is the correct behaviour. Is the vmxnet3
> definitely one of the kind which is not supposed to have a
> permanent MAC address backing storage ? (It's paravirtual, so
> this would hopefully be indicated in the specs for it.)
>
> thanks
> -- PMM

