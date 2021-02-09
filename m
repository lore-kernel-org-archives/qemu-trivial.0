Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9QMF-000511-U5
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2021 05:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9QME-00050B-AP
 for qemu-trivial@nongnu.org; Tue, 09 Feb 2021 05:34:58 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9QMB-0005R0-Ss
 for qemu-trivial@nongnu.org; Tue, 09 Feb 2021 05:34:58 -0500
Received: by mail-ej1-x62a.google.com with SMTP id y9so30378305ejp.10
 for <qemu-trivial@nongnu.org>; Tue, 09 Feb 2021 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iWIoga2rAheDo3uR/3PscI62+8jQ+somKc63+qovdqU=;
 b=ItI7jfxSpOHNNQfddxUBJutbXIFHnnoBRhAKufG06DwKZt1PRNp0aXpXeD4KRsnqjc
 U4JzNCRrh1gf5bZ48tA/eh3XxXfJs89c6VxDHn4sMDlDMeL376SCPJb2Tbz3kHBt9yIX
 sUjwYE8b1u7JcbZdLi81w4qRMIliqDaJ92TtbkYiIOO5J7GfcIo3RP5pudo+sBquz70S
 SFjLEI/XAXVyFpmmS1OVZiKE5+hFLlef1OGVx2s5X5mmw/dt7VXv7SvqrpX+E3yluKjE
 G8kcx9iAITz23ZPTkAAWPTXg95mNZZ7KmzAbEW9Uq2M3DyIW/RbNAKfQVsM2CxXP27QR
 LuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iWIoga2rAheDo3uR/3PscI62+8jQ+somKc63+qovdqU=;
 b=VWB5alDmv/ySBN9WInGa1MhsbjPI3zhlOrdezN/dGCnuHcZPcNdXMKLzpED1C7vH9N
 ldRvRYDwluaQl4cF/nOduviM7KMk+s39OrNU7CKW+zBQYOoocWCFV9xHdf0kUjQIF9DV
 mnSKZ6W9qm+1ov+zpKkWRaP+5nPfr8zNRnoF2JwAtXA+lAu8Vm04Oi8TGHsTVDTxBTu7
 yVZIzwq/QEOA3FomSlP+/589ZT1uFGaSI7falgyg4eSosbAGdAlcV1QjW/q0HehgkoT0
 ziSPbD0O+KW7wGxnuZ8HuvzpXN4mBSJ0QqFbgemvRCRX6VcD9dbc9WSQevnq9bV8i2Gb
 hWCA==
X-Gm-Message-State: AOAM531n3krumib9VezdfZ5eYfJvgoJ2a7iBtepZgFIcqYrKRf1TCwkM
 A+i6WllDIobeaKuDDrusPbp2OMP6G60UenKDEWPd+g==
X-Google-Smtp-Source: ABdhPJxG9iMxYhElEFeJbahNsNVayn1vKoUqJyB1TyL0RvdjALBpCwUyu0swVsbmMSPOHoCqEhvlviNT3sOZ0lWBXAI=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr21768519ejc.482.1612866894091; 
 Tue, 09 Feb 2021 02:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20210208113729.25170-1-peter.maydell@linaro.org>
 <87czxabs54.fsf@linaro.org>
In-Reply-To: <87czxabs54.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 10:34:43 +0000
Message-ID: <CAFEAcA-=KymVWUsSMn3WBNkmeeiAqj8fUE03BDpcKFo5mDgSoA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Tue, 09 Feb 2021 10:34:58 -0000

On Mon, 8 Feb 2021 at 13:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Noticed this because my recent patchset which touched gdbstub.h
> > didn't cause check-maintainers to add the gdb stub maintainers
> > automatically.
>
> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Do you want me to pull these into my tree (with your other set)?

Yeah, that's probably best I guess.

thanks
-- PMM

