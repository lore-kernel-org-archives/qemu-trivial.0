Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rpT1z-0001vU-L8
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2024 09:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rpT1x-0001uh-NS
 for qemu-trivial@nongnu.org; Wed, 27 Mar 2024 09:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rpT1v-0001ey-MY
 for qemu-trivial@nongnu.org; Wed, 27 Mar 2024 09:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711544962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0I86kTNYOKrCXN/nN2NxIZLiLpsAdoBdvgJZ+LHEbU=;
 b=Q4m7cYoAZMzjzz44p8AXww6vJXmv0SDQAxNhPKK4VjRW3hDFivh6X+d9gwV9QredoGWNOY
 zdQTXqDZ1C+YMmakP9qtlqTsG0+SDkFayWc34CGQVTrynYDvcG6XSp8qLi3q0fqR50Sqkn
 q7JIedxgBtXAVfJudt2DxUO684VK8Fw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-uJZQchZrMzi7Vr14cuKKzQ-1; Wed, 27 Mar 2024 09:09:20 -0400
X-MC-Unique: uJZQchZrMzi7Vr14cuKKzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41481ad9364so29740525e9.0
 for <qemu-trivial@nongnu.org>; Wed, 27 Mar 2024 06:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711544959; x=1712149759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0I86kTNYOKrCXN/nN2NxIZLiLpsAdoBdvgJZ+LHEbU=;
 b=oZ9VzLy2gAcBkSJ84KsJj8h60XpRWo7StMd5+m+FJsd2r9GgPPLrKOiwTKAe0p/Lv2
 g7fX6RTZ89ePh/P9x1GRwRp3mp4d+V6RnroZGVQZx+2fzm6pjVjKv+zzeO5JRI2uI5Gy
 Bw8dCF/fWzrhqC+jJXIXGAmKkMhH6ROKuyz/U9v2dnx2O3SspAjQzDieEnO3Orwg9F7O
 6Ehcb3yFu1969rJKy8B4awYJUsLDL8LYxQM9qIdQ2oldy6R4QtlFfu3O49966q+DDtsc
 RO9M/OkXV5TA01M7WIvNFDvSIbApOS64yYAh/uZrl8xdkonP9/3GzHqzUdHBK0e6zXAE
 OAbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYzn8WJBiZ2Z+Ap64dWSkDeTpaEd0BR4rlLhxy29hTC17Bk+x+jVfaa4fbWtyEjIfjEs6jfmrw4DfpRxo8DRPw4OnmBfC7Iw==
X-Gm-Message-State: AOJu0YzvND2jEyVjEdf0iTqpDnYEBbds7y+dJyb6hQa+0e7o2P0PKTDa
 afO9kbkw3P8IWtHIOGeRil4lcxjJnNCAmLlsMz94ETcSXKHwVlgLShdg7TA8MTTqsFYhOPNXkLh
 aOaAGPn5ZOAGgHNy73IzA1d0kYUR/8egPQEC4wYgkctu7rFdqyd7w2jA=
X-Received: by 2002:a05:600c:4f06:b0:414:24d:7f9 with SMTP id
 l6-20020a05600c4f0600b00414024d07f9mr2684499wmq.1.1711544959072; 
 Wed, 27 Mar 2024 06:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7P6UsvagMdr7a+OE7ugtmmSKernCYFg3RggG3pjjUyipxPftz9JsEcV4eqRDLM65xFgemtg==
X-Received: by 2002:a05:600c:4f06:b0:414:24d:7f9 with SMTP id
 l6-20020a05600c4f0600b00414024d07f9mr2684473wmq.1.1711544958685; 
 Wed, 27 Mar 2024 06:09:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c45ca00b004149536479esm1491588wmo.12.2024.03.27.06.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 06:09:18 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:09:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas
 Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Bernhard Beschow
 <shentey@gmail.com>, pbonzini@redhat.com, devel@lists.libvirt.org,
 richard.henderson@linaro.org, mst@redhat.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
Message-ID: <20240327140917.69d86539@imammedo.users.ipa.redhat.com>
In-Reply-To: <ZgP5x3ECYGevla1-@redhat.com>
References: <20240326125104.90103-1-imammedo@redhat.com>
 <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
 <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
 <20240326171632.3cc7533d@imammedo.users.ipa.redhat.com>
 <ZgP5x3ECYGevla1-@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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
X-List-Received-Date: Wed, 27 Mar 2024 13:09:25 -0000

On Wed, 27 Mar 2024 10:49:43 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Mar 26, 2024 at 05:16:32PM +0100, Igor Mammedov wrote:
> > On Tue, 26 Mar 2024 14:29:58 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> >  =20
> > > Hi Igor,
> > >=20
> > > On 26/3/24 14:08, Thomas Huth wrote: =20
> > > >=20
> > > > s/iaspc/isapc/ in the subject
> > > >=20
> > > > On 26/03/2024 13.51, Igor Mammedov wrote:   =20
> > > >> ISAPC machine was introduced 25 years ago and it's a lot of time s=
ince
> > > >> such machine was around with real ISA only PC hardware practically=
=20
> > > >> defunct.
> > > >> Also it's slowly bit-rots (for example: I was able to boot RHEL6 o=
n=20
> > > >> RHEL9 host
> > > >> in only TCG mode, while in KVM mode it hung in the middle of boot)=
   =20
> > >=20
> > > I'm quite opposed to this patch. QEMU models various very-old /
> > > defunct hardware. I'm pretty sure Bernhard and myself are OK to
> > > keep maintaining it, besides we are working in separating it from
> > > the i440fx+piix machine. Also, this machine is particularly
> > > interesting for my single-binary experiments. =20
> >=20
> > it would not be fair to ask you or Bernard to deal with every
> > case where ISAPC related code gets in a way, nor it's fair to
> > ask other contributors to ensure that their patches don't break
> > semi-working ISAPC or refactor code that relates to it.=20
> >=20
> > [
> > for example I'd like to refactor smbios parts in the image
> > ACPI table builder, but the I'd have to do it for legacy
> > part as well without means to verify that. Sure it can be
> > done but at cost of extra time spent to rewrite something
> > that would never be used and to find test env to verify
> > touched code.
> > ] =20
>=20
> Is SMBIOS even relevant for isapc ? IIUC, the first SMBIOS spec
> is from 1999, while PCI has been around since 1992.

Theoretically SMBIOS can still be used with isapc,
(that's how I've tested factoring out legacy part by running
RHEL6 in TCG mode)=20
Whether it's used in practice somewhere else is unknown.=20

> IOW, we shouldn't even be exposing SMBIOS with the isapc
> machine type. If we address that, then isapc has no impact
> on your ability to refactor SMBIOS code.

It's question of whether we are willing to do unthinkable,
i.e. to break QEMU <-> guest ABI for isapc case by removing
corresponding fwcfg entries.

With migration ignored it shouldn't be a problem.
Question is: does anyone care about migration with isapc?
If not, I'd gladly axe smbios legacy parts in 9.1


But given how easy one can spawn old qemu environment to
run something on isapc, we are loosing a chance to cleanup
QEMU code base touching following=20

    m->option_rom_has_mr =3D true;                                         =
       =20
    m->rom_file_has_mr =3D false;                                          =
       =20
    pcmc->pci_enabled =3D false;                                           =
       =20
    pcmc->has_acpi_build =3D false;                                        =
       =20
    pcmc->smbios_defaults =3D false;                                       =
       =20
    pcmc->gigabyte_align =3D false;                                        =
       =20
    pcmc->smbios_legacy_mode =3D true;                                     =
       =20
    pcmc->has_reserved_memory =3D false;

they are all marginal but in shared code, and removing them
makes code a bit more easier to follow (especially when it
comes to memory layout).

> With regards,
> Daniel


