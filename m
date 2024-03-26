Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rp6TE-0008Fn-6b
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2024 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rp6T7-0008EB-Ri
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 09:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rp6Sv-00069a-AA
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 09:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711458223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmn360mOV5sLCmsqTMXQHAiGMcocSSPlKyI/nFqpC/Y=;
 b=M+AUKByuvzgdKIHHGp1JgoZEliSTYiwSs1JSKSxCxFfkSK9jzq8qa31QlpLwyRIjcJOo8j
 r3S/sLfwCNgSHN+ZKvvXNTXHTg819nfrdtYIqt01ES8hhEjPI1517WbDE7H62sTKKOrnVC
 MJCstaTfuoYek0LvM0skj9UySX5mwSw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-TZtH8pxRNlqD4lsbBNzizg-1; Tue, 26 Mar 2024 09:03:41 -0400
X-MC-Unique: TZtH8pxRNlqD4lsbBNzizg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1e09e32e5a2so29610795ad.0
 for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2024 06:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711458219; x=1712063019;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtPpFL5icBpEgA04izrcHDf2hvVGMn5FegeO1sDid1Q=;
 b=uYcbSo+z29XHqvNG+4UDBGxU4YtdfV/00w27gXW17D5GmqPJbMZ4YEG37t8lZJrmNc
 00kH5jRn08pSRVmt740Y7RKGVOB372Epxv79Z67uuIOVYTKRC4f1Y6CV1iyYBwoP9ZkZ
 DLk+eXRjzGtBWf/ieKQ99Z3kH/CVwuMH9v3LPRvDkbCJHChKac/jP4IRgFaE7X0DIG7g
 gVzTC11I/aBf24hIyOakqSwaZc4JSVq7QmetdRk1yP8RD3e+3nVKFrgqYAhC2IQP/YgZ
 JLHA2+NWAHjGU1650HiqNfVBZ6C2MiOqpvQJshAl0Ur5lb2MpkMlZhnw8QiXkVK3Fb2b
 s6iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULFbjDWDA5gcmshxnrqPJKjmO9Y1jyxmM5N2l3MR+8BMcWYaOaEGILpGtofo2W9q7cdTruB1fekmpiawjQfFY2jTUwSTeDZA==
X-Gm-Message-State: AOJu0Yz7NV6Xj6MrTOMYTrQWOiSQUUASQ5Gn3/DqAEvbJcGtNrz5Bkfs
 xXPB24rVdFGaMaXLzuJre4c1Th0tJdVCP58M/k0bkua42VToTLRIWgxr02hM1sEe+Rg8K81c+6+
 aeiRgT0ICp3r1VHeZBDyrwyOlx9b0O9Ox8/1ND60Y6ZvRQ5tQbM6y9Bg=
X-Received: by 2002:a17:902:e88a:b0:1e0:b1af:9b with SMTP id
 w10-20020a170902e88a00b001e0b1af009bmr10608434plg.43.1711458218923; 
 Tue, 26 Mar 2024 06:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMuPiZd1oToW5wB8Xo7umdg+NKZNMZcYhz+ZRBHZE1jldIrgV/4LG11bqz/lALhTf7RidsBA==
X-Received: by 2002:a17:902:e88a:b0:1e0:b1af:9b with SMTP id
 w10-20020a170902e88a00b001e0b1af009bmr10608395plg.43.1711458218515; 
 Tue, 26 Mar 2024 06:03:38 -0700 (PDT)
Received: from smtpclient.apple ([203.163.237.163])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170902ce8400b001e0da190a07sm2283298plg.167.2024.03.26.06.03.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Mar 2024 06:03:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240326125104.90103-1-imammedo@redhat.com>
Date: Tue, 26 Mar 2024 18:33:23 +0530
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tsirkin <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org
Message-Id: <1C2BC09E-E687-42E8-A7D4-D05F491AE432@redhat.com>
References: <20240326125104.90103-1-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 26 Mar 2024 13:04:01 -0000



> On 26 Mar 2024, at 18:21, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> ISAPC machine was introduced 25 years ago and it's a lot of time since
> such machine was around with real ISA only PC hardware practically defunc=
t.
> Also it's slowly bit-rots (for example: I was able to boot RHEL6 on RHEL9=
 host
> in only TCG mode, while in KVM mode it hung in the middle of boot)
>=20
> Rather than spending time on fixing 'the oldest' no longer tested machine=
 type,
> deprecate it so we can clean up QEMU code from legacy fixups and hopefull=
y
> make it easier to follow.
>=20
> Folks who have to use ancient guest that requires ISAPC can still
> use older QEMU to play with it.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> docs/about/deprecated.rst | 7 +++++++
> hw/i386/pc_piix.c         | 1 +
> 2 files changed, 8 insertions(+)
>=20
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7b548519b5..5708296991 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -226,6 +226,13 @@ These old machine types are quite neglected nowadays=
 and thus might have
> various pitfalls with regards to live migration. Use a newer machine type
> instead.
>=20
> +``isapc`` (since 9.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +These old machine type are quite neglected nowadays and thus might have
> +various pitfalls with regards to live migration. Use a newer machine typ=
e
> +instead.
> +
> Nios II ``10m50-ghrd`` and ``nios2-generic-nommu`` machines (since 8.2)
> '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>=20
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 18ba076609..96f72384dd 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -921,6 +921,7 @@ static void isapc_machine_options(MachineClass *m)
>     m->default_nic =3D "ne2k_isa";
>     m->default_cpu_type =3D X86_CPU_TYPE_NAME("486");
>     m->no_parallel =3D !module_object_class_by_name(TYPE_ISA_PARALLEL);
> +    m->deprecation_reason =3D "old and unattended - use a newer version =
instead";
> }
>=20
> DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
> --=20
> 2.43.0
> _______________________________________________
> Devel mailing list -- devel@lists.libvirt.org
> To unsubscribe send an email to devel-leave@lists.libvirt.org


