Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pI6nM-0004tg-V2
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2023 06:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI6nK-0004sx-L1
 for qemu-trivial@nongnu.org; Wed, 18 Jan 2023 06:39:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI6nJ-0000WJ-5i
 for qemu-trivial@nongnu.org; Wed, 18 Jan 2023 06:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ka9Jf2XCNMoMy8Dt7ZoXwMoenV/FGjsTW1lCF3tzpU=;
 b=MCNDvrJc27r2vjUt+ACJVpHqZ6+uCe7bFPUweT7vLtZtKp8xGpyQkvv1mwflVoHrnNE+0z
 wWZ9+osHHgePyrQYg6uHVhIGOUVY3pchqx8EukOLOSD++m1R+HHvaKLYnwZ1gVhF7Zv6Bz
 s+rs+CuHwn2xyU1vYXwk56dYDAVI/wU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-aW844DA9NUWp7w8xy40K3w-1; Wed, 18 Jan 2023 06:39:49 -0500
X-MC-Unique: aW844DA9NUWp7w8xy40K3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d400b0049e1b5f6175so5729326edb.8
 for <qemu-trivial@nongnu.org>; Wed, 18 Jan 2023 03:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ka9Jf2XCNMoMy8Dt7ZoXwMoenV/FGjsTW1lCF3tzpU=;
 b=yXjsM/jg1c3O+N56Cxicff+RsCv2ak0LbrRMvMrCBq9qn9qMp3izHRPh9CERVBhVbs
 PwX9u9qshsKFtPETkuAsUQAZOhUe8wpT9z1DFbDqdV+lWC4L1Kbb0qq8Rfgfh0IqSqlt
 CV53j8WkMKGWFuKRvNvxqUkR/F6RHty5TYxxEh1FzsEmd4UVeag1gtV3vb+dpHQek9kk
 yvABlKk7OpVFWzXytoIdPdzrc6aDCTosiXypgPyvVF1V/gLwHnM03yx6KPmS+0oEJXqh
 rTmiKReEB7jUtePXajkMv37yA3iBUBxfSFGePTdgs2etZQZsu2iT5eCWc6CrFBoTjQVf
 /JUg==
X-Gm-Message-State: AFqh2kqEmZL5BXPxDdiOWgPX8VZrOuUGM3oeHxyNhqkmMxzBLXZHdKJR
 1szMy2YuJ1MTyoowOQIKKzDj7nsYVh1YLC6Nmc5z3sHdlh0Wfch6BwNXOGC97RkKgG+4x4hHmOD
 Hl8ZRBQwresEnRKAKJg==
X-Received: by 2002:a17:907:207a:b0:872:32eb:9df8 with SMTP id
 qp26-20020a170907207a00b0087232eb9df8mr6884905ejb.45.1674041987900; 
 Wed, 18 Jan 2023 03:39:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsE2XJumGwA2gloRws0HDy8YquNK4OskMibBV6ma1b20T81d47q56+zxLtrDsOD1mTUeJ/cOQ==
X-Received: by 2002:a17:907:207a:b0:872:32eb:9df8 with SMTP id
 qp26-20020a170907207a00b0087232eb9df8mr6884880ejb.45.1674041987603; 
 Wed, 18 Jan 2023 03:39:47 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 w5-20020a50fa85000000b00491c819d6d2sm14041813edr.44.2023.01.18.03.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 03:39:46 -0800 (PST)
Date: Wed, 18 Jan 2023 12:39:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 7/7] piix3, ich9: Reuse qbus_build_aml()
Message-ID: <20230118123946.0b282e2c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116152908.147275-8-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-8-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 18 Jan 2023 11:39:54 -0000

On Mon, 16 Jan 2023 16:29:08 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

I'd squash it in previous patch, and rename that to something

'remove no longer needed isa_build_aml()
 =20
 isa_build_aml() doesn't do anything except
 calling call_dev_aml_func() on bus children
 along with other places that do the same.
 Move that into ... and cleanup those places
 as well.
'


> ---
>  hw/i2c/smbus_ich9.c | 5 +----
>  hw/isa/lpc_ich9.c   | 5 +----
>  hw/isa/piix3.c      | 5 +----
>  3 files changed, 3 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
> index ee50ba1f2c..52ba77f3fc 100644
> --- a/hw/i2c/smbus_ich9.c
> +++ b/hw/i2c/smbus_ich9.c
> @@ -97,13 +97,10 @@ static void ich9_smbus_realize(PCIDevice *d, Error **=
errp)
> =20
>  static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
>  {
> -    BusChild *kid;
>      ICH9SMBState *s =3D ICH9_SMB_DEVICE(adev);
>      BusState *bus =3D BUS(s->smb.smbus);
> =20
> -    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> -            call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> +    qbus_build_aml(bus, scope);
>  }
> =20
>  static void ich9_smb_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 0ab0a341be..d5d4b0f177 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -813,7 +813,6 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEve=
ntStatusBits ev)
>  static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
>  {
>      Aml *field;
> -    BusChild *kid;
>      ICH9LPCState *s =3D ICH9_LPC_DEVICE(adev);
>      BusState *bus =3D BUS(s->isa_bus);
>      Aml *sb_scope =3D aml_scope("\\_SB");
> @@ -835,9 +834,7 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Am=
l *scope)
>      aml_append(sb_scope, field);
>      aml_append(scope, sb_scope);
> =20
> -    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> -            call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> +    qbus_build_aml(bus, scope);
>  }
> =20
>  static void ich9_lpc_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 283b971ec4..a9cb39bf21 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -306,7 +306,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error *=
*errp)
>  static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
>  {
>      Aml *field;
> -    BusChild *kid;
>      Aml *sb_scope =3D aml_scope("\\_SB");
>      BusState *bus =3D qdev_get_child_bus(DEVICE(adev), "isa.0");
> =20
> @@ -322,9 +321,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml=
 *scope)
>      aml_append(sb_scope, field);
>      aml_append(scope, sb_scope);
> =20
> -    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> -        call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> +    qbus_build_aml(bus, scope);
>  }
> =20
>  static void pci_piix3_class_init(ObjectClass *klass, void *data)


