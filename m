Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHmLI-0006Yx-DR
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2023 08:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmLE-0006Xn-VO
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 08:49:33 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmLC-0005JV-HK
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 08:49:32 -0500
Received: by mail-pl1-x631.google.com with SMTP id g23so17995951plq.12
 for <qemu-trivial@nongnu.org>; Tue, 17 Jan 2023 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8anxIq5hgvxPMQKsdn153nvHji6oJ6b2PwG1YXky2M=;
 b=aGvSmg2PaZz8BvzUOlic/7ywzi9y9Tna3JrheajOfghlO/f6EoSStsSGpsTnDpEsvm
 as/aXZhOUDbSWaDCcQ6Z/FGtllls73MS4WpeN5XsuGX6cq+IcVDVzX9Tq571+Sekw+D3
 pQptZ4M/rS4oGQbQdmFfgYLHrruK233kn/FUwQMxgGWTOz4PbXxboro2U7z/jC0Gzk0m
 rD8CXV1aiLJ2QzKAjOuyub8b6MVtMdAqKeKi9B7cPsMI4a5VHwKNVNK5GMzC6NJvNeWK
 Ic2eRHrwZv/LN4smEtG9QMWsZA/maLKeGvRZTNfjJBczYEYWkKURFmmo9YlqotLCXpJF
 UdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K8anxIq5hgvxPMQKsdn153nvHji6oJ6b2PwG1YXky2M=;
 b=Abi2ZsjmeB8mRAa7E7rqnISv9j4qKNeDC2xdx5JSHMI/gUVO/kxYCVOLOvZfVhAyd5
 EObyCkwtduokHtZqxx12S/WGqtXXuNUOvSGnGwPSg5BRm/aM7tQuFDi3jZFzD1A6aDGt
 BlecGham6Yf0dq08gdUoDMtJJiJtlONgioJw4nhSZiqOtXrLfj0bYpv4fNth5Zkfkzpw
 KQL0GibJZPX+yVVxmB7QP+fRrl7VsbWMYtrIIcxb6uQDKXpf4y/8qAioadDcI5azPCBW
 qYgCuEF6Qg2lgQ0clORpdnyp2LeChR3D4AyzeYbDkZkXRbV6Hk6UgbTvie1DjE9CrbdR
 qW3A==
X-Gm-Message-State: AFqh2kopHe5BBN0wzIxUEf4hZ+CaFy6XAHpRiUekOrAprOtvWhqOWuj9
 gyG0xNq7Pp40YVAut+VVWDId/cF+//rb2jhZamX62A==
X-Google-Smtp-Source: AMrXdXussQ/EWu4TzuZqpTagBs0AkOKxTkPIUXLgxhQJMzD2EZw0nqdUfIhrOxm6XC6lWlcCFjDT4PP3ev4i4LwAe6g=
X-Received: by 2002:a17:902:7045:b0:194:957b:e80a with SMTP id
 h5-20020a170902704500b00194957be80amr237243plt.90.1673963368938; Tue, 17 Jan
 2023 05:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20230111085016.44551-1-philmd@linaro.org>
 <86fc15b7-6880-b628-c9c6-c4cc1d602eeb@vivier.eu>
In-Reply-To: <86fc15b7-6880-b628-c9c6-c4cc1d602eeb@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:49:17 +0000
Message-ID: <CAFEAcA-vfE7b0qCZn1tDLK-dQRNTpUiwaWXBy2JOY5XMLTQMBQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/i2c/bitbang_i2c: Housekeeping
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Jan Kiszka <jan.kiszka@web.de>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 17 Jan 2023 13:49:33 -0000

On Mon, 16 Jan 2023 at 17:30, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 11/01/2023 =C3=A0 09:50, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Series fully reviewed.
> >
> > Since v2:
> > - Use array of const pointers to const (Richard)
> >
> > Since v1:
> > - Fixed overwritten RECEIVING_BIT7 entry (Richard)
> > - Picked R-b tags
> >
> > - Remove unused dummy MemoryRegion
> > - Convert DPRINTF() to using trace events
> >
> > (series used as base for follow-up, better if merged via ARM tree)
>
> I can take this via trivial, what do you prefer?

I'm putting together a target-arm pullreq, so I'll take this.

thanks
-- PMM

