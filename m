Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1romkN-00037s-4r
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2024 12:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1romkL-00036Q-CF
 for qemu-trivial@nongnu.org; Mon, 25 Mar 2024 12:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1romkJ-0005fG-My
 for qemu-trivial@nongnu.org; Mon, 25 Mar 2024 12:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711382422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7ajNf2mEI7Vgjl13S2irvMPOHQEJyx+bYr5nq17bwg=;
 b=HON6PQXSrcOXHI+h4gBYXC2AO4ir5wXTnbrKVKcpmFQ2tHpKDGlL/GoQ76ifpGI7XXbwvg
 ysLTys9o8UEBI5m3ETOS/2wLir90OIHAEnrIfxMZdH0RVo3ExvMlDqw8q9sfif1Kd7WNsf
 xk4Ax8Sr91NOupqXYeDLvCCwxzq2b98=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-Ne7Y3BZAPGetULvgUqdZrA-1; Mon, 25 Mar 2024 12:00:20 -0400
X-MC-Unique: Ne7Y3BZAPGetULvgUqdZrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4140f58ac00so24747935e9.3
 for <qemu-trivial@nongnu.org>; Mon, 25 Mar 2024 09:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711382419; x=1711987219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4letdqinZvN99CL2TEUtT5XNPzr7JXOoEpfS/heBK4=;
 b=mQZoi+CV9IsgabzyeeeMtRdjSwZyROz4ojHR1JW3KUZ2fs5sm0NLFnM5fIWYdKtl6I
 DZOKYsS3P1AcYjyV/vVl8QrwF9KmZLnpyQ+BwfZ30h7ovUqAo28fB9lAyV3DudDhbgH6
 4rUZtXc5xnALBmT3nr3ufySE81YElY/fO+xGabYdhO2/YVM2OMlHHTaSD9nIEaBg0vTi
 XujIaW16w0hbAlp0UpUxJVzixs74SHXjOdK6qZtDJrWsKvZawTUFf645MYSIBrgbIZzb
 NKwZGmxHpqoJUjLn+6zcYj5ZnQsy/cDYjf2mpKD4EsA9uRAtl08AEIcg6U9nQt3R12t/
 AW9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOUGdwqVrD2XuMsnujB68wOcN6ViQLyQaLKvunddM0WhHVv3oxjj1ZuSGK+nfouluUH0wu9F6ymj+anFs+v94ea/Tm5xvOQw==
X-Gm-Message-State: AOJu0YxR2ZCMxWvzlniqkgFmXxT4esCCabnnVxMGyuux9m5UhtwcMQ1l
 z8mszAE4l5GKdUwIp47HdC0dvaA1N/6zzPbrUToP6eNsWd3SX6AjzldDGqFqJHr+MD3t7inWYIv
 8LvWm17Logc0YQKSfpdTQPOV7QLxshSMEmHUHyh7GGtplhgKrz9sMlqI=
X-Received: by 2002:a05:600c:19d4:b0:414:8a28:6c89 with SMTP id
 u20-20020a05600c19d400b004148a286c89mr1733418wmq.31.1711382419337; 
 Mon, 25 Mar 2024 09:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgwFHt0WDC3tqpFoTCgxB6da/9DbKzFTQpKZ547dHKNVP+pv3bKEHhhlmi1rirCYkQcH3GjA==
X-Received: by 2002:a05:600c:19d4:b0:414:8a28:6c89 with SMTP id
 u20-20020a05600c19d400b004148a286c89mr1733395wmq.31.1711382418990; 
 Mon, 25 Mar 2024 09:00:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b00341bdd87fcasm7669617wrq.103.2024.03.25.09.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:00:18 -0700 (PDT)
Date: Mon, 25 Mar 2024 17:00:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>
Subject: Re: [PATCH trivial for-9.0] hw/i386/fw_cfg.c: fix non-legacy smbios
 build
Message-ID: <20240325170017.5b830e37@imammedo.users.ipa.redhat.com>
In-Reply-To: <ca6b1ae9-14b9-413b-93dc-a28d930b0e3a@linaro.org>
References: <20240325130920.349521-1-mjt@tls.msk.ru>
 <ca6b1ae9-14b9-413b-93dc-a28d930b0e3a@linaro.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Mar 2024 16:00:25 -0000

On Mon, 25 Mar 2024 14:40:21 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Hi Michael,
>=20
> On 25/3/24 14:09, Michael Tokarev wrote:
> > When building qemu with smbios but not legacy mode (eg minimal microvm =
build),
> > link fails with:
> >=20
> >    hw/i386/fw_cfg.c:74: undefined reference to `smbios_get_table_legacy=
'
> >=20
> > This is because fw_cfg interface can call this function if CONFIG_SMBIO=
S
> > is defined.  Made this code block to depend on CONFIG_SMBIOS_LEGACY.
> >=20
> > Fixes: b42b0e4daaa5 "smbios: build legacy mode code only for 'pc' machi=
ne"
> > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > ---
> >   hw/i386/fw_cfg.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> > index d802d2787f..d5e78a9183 100644
> > --- a/hw/i386/fw_cfg.c
> > +++ b/hw/i386/fw_cfg.c
> > @@ -70,6 +70,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgS=
tate *fw_cfg,
> >       /* tell smbios about cpuid version and features */
> >       smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1=
_EDX]);
> >  =20
> > +#ifdef CONFIG_SMBIOS_LEGACY
> >       if (pcmc->smbios_legacy_mode) { =20
>=20
> But then having pcmc->smbios_legacy_mode =3D=3D true without
> CONFIG_SMBIOS_LEGACY would be a bug. IMHO what we want is:
>=20
> -- >8 -- =20
> diff --git a/hw/smbios/smbios_legacy_stub.c b/hw/smbios/smbios_legacy_stu=
b.c
> index f29b15316c..7d593dca98 100644
> --- a/hw/smbios/smbios_legacy_stub.c
> +++ b/hw/smbios/smbios_legacy_stub.c
> @@ -13,3 +13,8 @@
>   void smbios_add_usr_blob_size(size_t size)
>   {
>   }
> +
> +uint8_t *smbios_get_table_legacy(size_t *length, Error **errp)
> +{
> +    g_assert_not_reached();
> +}

Agreed

Philippe,
shall I post a patch or will you do this?

> ---
>=20
> >           smbios_tables =3D smbios_get_table_legacy(&smbios_tables_len,
> >                                                   &error_fatal);
> > @@ -77,6 +78,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgS=
tate *fw_cfg,
> >                            smbios_tables, smbios_tables_len);
> >           return;
> >       }
> > +#endif
> >  =20
> >       /* build the array of physical mem area from e820 table */
> >       mem_array =3D g_malloc0(sizeof(*mem_array) * e820_get_num_entries=
()); =20
>=20


