Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA96C44500
	for <qemu-trivial@archiver.kernel.org>; Thu, 22 Jan 2026 09:38:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vir8T-0000OJ-FV; Thu, 22 Jan 2026 04:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vir8S-0000O0-Ba
 for qemu-trivial@nongnu.org; Thu, 22 Jan 2026 04:37:52 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vir8Q-0005DX-Sq
 for qemu-trivial@nongnu.org; Thu, 22 Jan 2026 04:37:52 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-790884840baso7789927b3.0
 for <qemu-trivial@nongnu.org>; Thu, 22 Jan 2026 01:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769074670; cv=none;
 d=google.com; s=arc-20240605;
 b=PiJwetYtxS2LcszEPPjF9Ehb6TYzVhs6yJekkbsQKp59Hdwv6slQpuUoR7gOcALMWL
 pARjyundxG2HV8AeR0wlL+Y6BhH7/I46GG+8yO8s0G0N7Wr/CKfXAA7OVF4qjcft/O6l
 MU0OMOPYWQHTdVBG9FD8ej3Uj9bMYgQUE+kjlOWUEyxsqsby2bDciisz6mO2h+Vuam91
 YzXgaO9jBppnQ1zmBVF5F3zk/CZEjDc0PRJaKfDjyGRvwBOIpja2+HbsJQlAB+ExjIhs
 y9FSDwln94VUce52OdQXwImmCR2guiL9+fuJYbBYgt3mLVkfFd2cRsE+dYu6neZkzy7A
 bvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0D1DR/Md0HCnsjLVs/nolihT4oEEbYWZcbxqhhuPxkM=;
 fh=yCkLA3iMS175e+g6nOnv4Zq6rxiEzR0dlUt6LE2/gvY=;
 b=el20CEpfcjasdlxA201HQoZiMqRgbf/oghceOLkm9tfPM87B4uRiDBMqJv84MKgEkQ
 zXmDbniaV/uMfNHGjVBrmfvyVitUyf4zL/G+Ef9piAJ/Qq+uxc034xYuRqKUv5b5PJFy
 uGRgmTjsyILsHo5lgMZQdMmMMFZ5lAESSAfumvIb2mBsEoBQC19DHoqm1hoY4Th9nXXO
 0nm4lnab2/suHqMlS/MgIuKp6+FpBbuQErH7HWvsb5+UgMoEtqmYIgRypLUN5NOC/bI1
 Shaie9ZMKLKGKqHkZFolfPbA+vx1w7cFqLULsfeRtPHDJ7TO1f4DNLLw14pa+3Q3zL0x
 OkjA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769074670; x=1769679470; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0D1DR/Md0HCnsjLVs/nolihT4oEEbYWZcbxqhhuPxkM=;
 b=q4BCH5sB1ebilXL3k8raJ1KublVd6Xm2uq/IkfjDoumHTHtjnpwkuTwhLez7DqQWiY
 NmSIb80CQfmR5PMtDIGYLa6xWPLT43DGRRzQzGTu30ECloOD7CAER/fpdnSNOKU/4Ojn
 JO6NizEyw5UF7VthDk51s5v4DnNkoc07X7qbKPK/nGyu+NaAMXUmJfXRG856bGzHsPS8
 0ZECXsKMNAjGHo7onZZT4sEKZimtDD5Gx9xDV/i1nSDHAepgcf/fS3MLK0Xhq4o8DAJB
 Lyr9VdEwq+l83GED4N57w1dFSP9oS5EuR3CF3RNitEmWCdvJdVxTdCfnlAba3NiS9TmC
 g79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769074670; x=1769679470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0D1DR/Md0HCnsjLVs/nolihT4oEEbYWZcbxqhhuPxkM=;
 b=n1UEzMCsBzmAJ1NFrPlK/8sEVSlzvMGO9r6HSa1Lx4eVtelN2+pUXI0oFdFCfTbDRQ
 OFQKm2ZNMw6lpQ7B4XT12c1v94jxMiaQQw24Tcqu/QxoG0ZthxeRMOFTPlwnU0kT9SIs
 YcuNa5hVAVgpH9OOITTmlYPgNjUPPX47Ronfluz8DQrAcAtD91OQJgha6A9pn88TS1r6
 qkRwNGuP46MP+zTtD0xO1/YKu6UlIrCCAcEpO+hfTyeKpor0ZfZgTS2RMMMrN6T6rhrY
 kb7VHX9GAEnncQfCFI4ytnD8jffUu9EAKif2QndvhbnMqzoGwr1KibuBKI7cmkpQ3nnj
 rOGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlRpmUldrmbR3EMQylEn1XQ3nKbRQpshKZFJjqzXCJyMe+3tJEfWyGKIruKIUwqOUNYToe1hPWcxX+b9Y=@nongnu.org
X-Gm-Message-State: AOJu0YxptfdWNLswnen5894bpKuVWeOCn4TN44/3i68R3f1osjxQpBYa
 BTjEykI5k6f3AG1gpXG8CSOTzi9wUnDpFQYpZhVPpDcoQHO2aUhF3FghducluCLd4PwVJHNHXxY
 tFmqdhpjlV4PjU1kToMBulYh6cIgvajXAehCNHK2uDw==
X-Gm-Gg: AZuq6aIsCAnh1omkewCIl/xAGQqlG8UBP8YqZ6fitByC7RPxv0PTAuu8Ay7ntmfJu83
 R29EDbIj8BhSIaLD+pcTj3n7jXdqkuEeBvj4EXcV21CxXKNYEZwG7Ub6wZkCIIkRIJpzt+ZyzqK
 UqmNZd/vLDDda9tKjoZjNUeWFWC2KZyFtXxRvDPJukII9gHWR2zhx6FC1fWCbU5iwviryT+usFc
 Xdh8lToidUD4w0kLOmRTsQZlr35fykYq0ZsFVjCcPMnlzAVybee0rm43n04R1xs5ryTmnBcsRwN
 q7V9
X-Received: by 2002:a05:690c:909:b0:78f:b163:74b with SMTP id
 00721157ae682-793c53c5a71mr171746267b3.59.1769074669665; Thu, 22 Jan 2026
 01:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20260122090352.9901-1-thuth@redhat.com>
 <aXHtxBfuIRsJ3P_M@redhat.com>
In-Reply-To: <aXHtxBfuIRsJ3P_M@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jan 2026 09:37:37 +0000
X-Gm-Features: AZwV_QgMVUCGuGW9Eb5Q7AUL7sFLQt9sGdF6GvYEulqMfc2abXHYliplFfhKLs8
Message-ID: <CAFEAcA8QNKwmOndVbq3eTkihpKjD0t01mAJ7DJLOQA3JqkkmWw@mail.gmail.com>
Subject: Re: [PATCH] Replace CONFIG_WIN32 with CONFIG_WIN64
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Kostiantyn Kostiuk <kkostiuk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Thu, 22 Jan 2026 at 09:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Jan 22, 2026 at 10:03:52AM +0100, Thomas Huth wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > We stopped supported 32-bit Windows hosts a while ago already, so
> > let's rename CONFIG_WIN32 to CONFIG_WIN64 now to make it clear
> > that this switch is not about 32-bit Windows anymore.
> >
> > The patch has been created with a simple sed statement:
> >
> >  sed -i s/CONFIG_WIN32/CONFIG_WIN64/g $(grep -rl CONFIG_WIN32 *)
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>

> > @@ -2422,7 +2422,7 @@ config_host_data.set('CONFIG_GCOV', get_option('b=
_coverage'))
> >  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
> >  config_host_data.set('CONFIG_LINUX', host_os =3D=3D 'linux')
> >  config_host_data.set('CONFIG_POSIX', host_os !=3D 'windows')
> > -config_host_data.set('CONFIG_WIN32', host_os =3D=3D 'windows')
> > +config_host_data.set('CONFIG_WIN64', host_os =3D=3D 'windows')
>
> While relevant to qapi file conditions, from a C code pov all of these
> are redundant as the compiler has all these facts built-in
>
>   #ifdef CONFIG_LINUX =3D>    #ifdef __linux__
>   #ifdef CONFIG_POSIX =3D>    #if !defined(_WIN32)
>   #ifdef CONFIG_WIN32 =3D>    #ifdef _WIN32

checkpatch will warn about use of __linux__, though, so
hopefully we don't get more of them in new code:

WARNING: architecture specific defines should be avoided
#4761: FILE: block/file-posix.c:4761:
+#ifdef __linux__

It fails to catch _WIN32 because it's looking for "__".

thanks
-- PMM

