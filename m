Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rPQvw-0004dm-Cb
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jan 2024 12:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPQvu-0004bM-M9
 for qemu-trivial@nongnu.org; Mon, 15 Jan 2024 12:39:34 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPQvs-00005N-Sn
 for qemu-trivial@nongnu.org; Mon, 15 Jan 2024 12:39:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so7917349f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 15 Jan 2024 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705340371; x=1705945171; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pkxj2qOj0omw6OidKXo9Q1FGu90qhueEyEMCxfoDgbA=;
 b=qeYZ3uwI0WSS/2l9B1ny8przK7fWdkOdOl5hgxLJkVFm8+pG8J16BFrrEBuMirn70W
 kraCu+DsXR+yxb4NrE622Kv+SlKtRD6u1EWm7c1OR7GNsA4YLwPMGQcbgTHOStyuBGes
 AO/EqkSXBsfXGO6uCoidsxqL21H4fAD8PG3mKs/7Z9Q6cN0ToD4Ii9L8lMu8b+FNuL3m
 kc/n6D2E6tyHgh84lrZaluek1eULW55T2qof/tHWKnhNPu5YL8niVpCM/omD/BRClGN0
 +v9BHvpOS8y1849YWvhSnusUgedVi7rPBOvv/BT/6BaWVZfxM/nyrJ/m1neMdEr5baOp
 7+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705340371; x=1705945171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pkxj2qOj0omw6OidKXo9Q1FGu90qhueEyEMCxfoDgbA=;
 b=LtP88N2ylpPjDxXqX3w+8GlLMU0mV0bvx+37QmMa9/yyUHjaSNrDUTTJY8zWKQU8Cd
 thLe/AhXP6sPGt201wCQqvvYfcMA4WI1gP4Kh7uNhrCehlsEKp0BQ2Yrj/KJBPaOaOo4
 u6tLvWjLnvPBen3a9SB3QF4/qMISsl2BpRaH0D3bai5G1lbYlm1GBORvr1JNn00Z19RU
 BKJkNVkjPsPH6jPy+8ukMhheCGQJ/4JudkSNKmvSmEeH4Sbhv3ZaECrOkCDiFEiMx2tR
 XJnqK6z3AkYV3Cw4f/r6k38rYoKp7fYlDz3mCLqLBHO+Z7caKd5OZXsBl5c1YCUVBXvL
 TJig==
X-Gm-Message-State: AOJu0Ywb5QUu2Dn2UNBWii7HuMzwM5LN/CJ9PdgrcGZUMl8nCwG9/Fxx
 6TQ72UDM7VumvbQhmSguDtySn2hJT57IXCIjPGbx77iT9UhlRg==
X-Google-Smtp-Source: AGHT+IFC8ZExPEPAo6j23a3UhvemsCQmtr0eHukHBU6xc14NTJB1SNlrQ4e3cQXYjGQ/wSqg0nFyuyjOtfN2dtwWZNc=
X-Received: by 2002:a05:600c:228b:b0:40e:4492:ffa with SMTP id
 11-20020a05600c228b00b0040e44920ffamr3397448wmf.61.1705340370953; Mon, 15 Jan
 2024 09:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20240112100059.965041-1-thuth@redhat.com>
 <20240112100059.965041-6-thuth@redhat.com>
 <7f24e391-e3ba-462c-ba30-2ea7ddb62795@linaro.org>
 <fdbe4b2d-b63a-4fcd-9747-08d713e17d22@redhat.com>
In-Reply-To: <fdbe4b2d-b63a-4fcd-9747-08d713e17d22@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 17:39:19 +0000
Message-ID: <CAFEAcA-9EnvXKcrECsAKCMHPobLch4mKU0Yvb2+ZKALcFSiqaQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] qemu-options: Remove the deprecated -singlestep option
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Jan 2024 17:39:34 -0000

On Mon, 15 Jan 2024 at 13:54, Thomas Huth <thuth@redhat.com> wrote:
>
> On 12/01/2024 16.39, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Thomas
> >
> > +Laurent & Peter
> >
> > On 12/1/24 11:00, Thomas Huth wrote:
> >> It's been marked as deprecated since QEMU 8.1, so it should be fine
> >> to remove this now.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>

> > StatusInfo::singlestep was deprecated at the same time,
> > can we remove it?
> >
> > IOW could we complete your patch with this?

> > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > index ca05502e0a..08bc99cb85 100644
> > --- a/qapi/run-state.json
> > +++ b/qapi/run-state.json
> > @@ -106,25 +106,15 @@
> >   #
> >   # @running: true if all VCPUs are runnable, false if not runnable
> >   #
> > -# @singlestep: true if using TCG with one guest instruction per
> > -#     translation block
> > -#
> >   # @status: the virtual machine @RunState
> >   #
> >   # Features:
> >   #
> > -# @deprecated: Member 'singlestep' is deprecated (with no
> > -#     replacement).
> > -#
> >   # Since: 0.14
> >   #
> > -# Notes: @singlestep is enabled on the command line with '-accel
> > -#     tcg,one-insn-per-tb=3Don', or with the HMP 'one-insn-per-tb'
> > -#     command.
> >   ##
> >   { 'struct': 'StatusInfo',
> >     'data': {'running': 'bool',
> > -           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' =
]},
> >              'status': 'RunState'} }
>
> Uh, oh, that's a bigger change already ... can we safely remove the field
> here without upsetting 3rd party apps that rely on this interface?

That was the whole point of marking it 'deprecated' in the JSON,
I thought? We don't think anybody's using it, we've given fair
warning, isn't the next step "remove it"? Markus, you're the
expert on QAPI deprecations...

-- PMM

