Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qMq4d-0004cK-R2
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2023 09:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qMizF-0004mv-FX
 for qemu-trivial@nongnu.org; Fri, 21 Jul 2023 01:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qMizE-0006D6-1I
 for qemu-trivial@nongnu.org; Fri, 21 Jul 2023 01:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689918450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mn4XBVWBCL8ZIljSGr83Iab5k2j9NL4naaA37hvvN/g=;
 b=Yy7+lB2KqUeO+VThKDUNv5H1Spsu0+Ez5P3yb0MV0do24diyvD1LUqJYBMGvclM3XIbK8O
 +EHunwnjz8l5zjwSHidzG1ij32/K+hJdjqjMANe5TOHqXPWw/uw8s1ZuZulqb1KV+/Rv9T
 VdNo5YgS7igYhaSf/0/i6lK8/j4FzwA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-2KwsuUC_Oq6-_TAtXhp0ow-1; Fri, 21 Jul 2023 01:47:28 -0400
X-MC-Unique: 2KwsuUC_Oq6-_TAtXhp0ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso8461165e9.1
 for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2023 22:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689918447; x=1690523247;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRNKBCGIReEaFarTFdLZSDHOKOhDNS0oAM+2ebDglKo=;
 b=LOY1uqentoeifW+/5OF46TvWICjkgBgBD1PNCvC4QzJ7499yUbB58/S+4RPhwB2HGx
 QltkvWNyqha9jdcv/J8EKARlbG2PAOqKqvKXk32bEYoqsgMECG/zfwF9frylK+SVo+Ki
 LvvylpCD2M91sCKFUuwZY38Gb3MMOhrxuhoBwgV7s4U8Uma+9lO5+H9eAtX0i4eXeJHp
 1GkPnN2c9/P6+9C1mV4RuJ7XcABwjfHBkCrsD1h7lnVU8GiLqTC5crQLnpElpSPCZ3k6
 5xlOHUUKoVVEWiWGgx2H1GeshPzuAdohaynlbAoBHyi+CsF3Z1lEAX1sLqN78nWYuDiD
 6R4Q==
X-Gm-Message-State: ABy/qLZvJOUPRhXX3rKS5x0uD+AqeQA5dzaF+bqLXLLSyrJFp0OPDe81
 39Ka5jCtO7I8kdZ3qL6WLswF1b/4QpEdwmWTbbzyTM7gSfCIxL5vpqNNu/7xlyDlB1qyKdiiKDy
 HUEV3vHWgWXrIemB6tg==
X-Received: by 2002:a05:600c:22d7:b0:3f8:c9a4:4998 with SMTP id
 23-20020a05600c22d700b003f8c9a44998mr504645wmg.28.1689918447516; 
 Thu, 20 Jul 2023 22:47:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlECo47Q7fjrFq+JoPSPS3mlE/F7qaPvjvxX7yIfv4QBnyvD8AEZWYuVWwPFd1S+/HDOyPOyTg==
X-Received: by 2002:a05:600c:22d7:b0:3f8:c9a4:4998 with SMTP id
 23-20020a05600c22d700b003f8c9a44998mr504632wmg.28.1689918447231; 
 Thu, 20 Jul 2023 22:47:27 -0700 (PDT)
Received: from smtpclient.apple ([115.96.204.236])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a7bc8c2000000b003fb225d414fsm5330034wml.21.2023.07.20.22.47.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jul 2023 22:47:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH RESEND] hw/pci: add comment to explain checking for
 available function 0 in pci hotplug
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230711070301.4353-1-anisinha@redhat.com>
Date: Fri, 21 Jul 2023 11:17:19 +0530
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org
Message-Id: <6A006523-121B-439B-A322-246475C941CF@redhat.com>
References: <20230711070301.4353-1-anisinha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 Jul 2023 09:21:34 -0400
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
X-List-Received-Date: Fri, 21 Jul 2023 05:47:33 -0000



> On 11-Jul-2023, at 12:33 PM, Ani Sinha <anisinha@redhat.com> wrote:
>=20
> This change is cosmetic. A comment is added explaining why we need to che=
ck for
> the availability of function 0 when we hotplug a device.
>=20
> CC: mst@redhat.com
> CC: mjt@tls.msk.ru
> Signed-off-by: Ani Sinha <anisinha@redhat.com>


Can we merge this while we are still in rc0?

> ---
> hw/pci/pci.c | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e2eb4c3b4a..6db18dfe46 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1180,9 +1180,14 @@ static PCIDevice *do_pci_register_device(PCIDevice=
 *pci_dev,
>                    PCI_SLOT(devfn), PCI_FUNC(devfn), name,
>                    bus->devices[devfn]->name, bus->devices[devfn]->qdev.i=
d);
>         return NULL;
> -    } else if (dev->hotplugged &&
> -               !pci_is_vf(pci_dev) &&
> -               pci_get_function_0(pci_dev)) {
> +    } /*
> +       * Populating function 0 triggers a scan from the guest that
> +       * exposes other non-zero functions. Hence we need to ensure that
> +       * function 0 wasn't added yet.
> +       */
> +    else if (dev->hotplugged &&
> +             !pci_is_vf(pci_dev) &&
> +             pci_get_function_0(pci_dev)) {
>         error_setg(errp, "PCI: slot %d function 0 already occupied by %s,=
"
>                    " new func %s cannot be exposed to guest.",
>                    PCI_SLOT(pci_get_function_0(pci_dev)->devfn),
> --=20
> 2.39.1
>=20


