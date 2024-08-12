Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sdRjy-0006S5-1H
	for mharc-qemu-trivial@gnu.org; Mon, 12 Aug 2024 05:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sdRju-0006JY-KJ
 for qemu-trivial@nongnu.org; Mon, 12 Aug 2024 05:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sdRjs-0006vZ-H9
 for qemu-trivial@nongnu.org; Mon, 12 Aug 2024 05:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723456399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaNd/0SeJ2+vXikjwkP3r5pLGCe1rmKQoREGvBy59qk=;
 b=EVBwVeJjlQMAmrwa6/Cjyj/wql7FcmTZ5Q+TH43fu9rEea2v1plBSFk1nKMNh55o6AAOHs
 HnVW+96/6Dl+nYZQH8T7XUlMU/X//wCTu7xyq/Fc8ZKdBFoFcF7AXVBu1hHTrvq8IjquL3
 CT+8YDGm1KyHEQ9wgoS5rG1s3j3QN3k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-RRDLoWJYPvWfMt7rWnUtyQ-1; Mon, 12 Aug 2024 05:53:17 -0400
X-MC-Unique: RRDLoWJYPvWfMt7rWnUtyQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a7d2f42df2dso523548566b.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Aug 2024 02:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723456396; x=1724061196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaNd/0SeJ2+vXikjwkP3r5pLGCe1rmKQoREGvBy59qk=;
 b=c0B+mMKeBE0NRiFd8mmGnjLG77vUWUHOK7F6Zhuw5U9dZ9ahFsygTSlxEcpf4Yh50H
 njUXUaWbkHiFcE+xujyHE1GaIytmXbGwZWI5QNX8yrBWjkXy7vjGhFMlQW6Eosym40tx
 2cH+69WzFwXXQuuNkJNynVWcBLu00XVyVu7d7o/MnIq/vmeHwEyPQW9NxY8WNmiabjlk
 5i/Ic/dCKNXCyuXVEkKjUEheEKa4xpvQk/xv7JBUSI69O9Wo0GyFS43jC7e0Ad8t3qHd
 pYz+daQkQUSKHJFciW7SIM7PV+7hmrPDxleitpF4LSJN52Cc3BY6GWMhdyQZLw3w5hls
 LkSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSxYcyfkPNVmnyec6b7NsMC39DAl7pGeXtt3H0EOkSl4WBq8KQbkItcVCo6CvCF28h8I89Mh3JugBjwKo+oLQOiSsDHkWAVA==
X-Gm-Message-State: AOJu0YyDskqlnPPwMapS9vsH6qWEpD9H0/E9R/v8tiSuOeSdcMfuEM4+
 lYws2ZxheTa/EtKR+71187WN8lfH2s12yCjgLYjzpeOUz5hFzPHlHKjB/dNdJtyd3SVC0pXBdoz
 UHqGWto+K+shiKn15Ow7HL8XSIP/JL7N2jL1QVcSwu3vYKugKAynUKw6giU81FxAq2g8pRaKdIO
 ybxHf0cWlJK99UL85bBiBH8TRC8NTrBTtpVQ9zVj1pGwo=
X-Received: by 2002:a17:907:dac:b0:a7a:bcbc:f7f4 with SMTP id
 a640c23a62f3a-a80ab795802mr667107066b.14.1723456396353; 
 Mon, 12 Aug 2024 02:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTpvWhvzJKJINItgkEHZvMCgHN2cqJ5ObqV2x/QDvdU+IVRKhPZr+44cYlBD1rk5d7utrzPNmjj/9yTQ7l2g8=
X-Received: by 2002:a17:907:dac:b0:a7a:bcbc:f7f4 with SMTP id
 a640c23a62f3a-a80ab795802mr667105066b.14.1723456395764; Mon, 12 Aug 2024
 02:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240809064940.1788169-1-anisinha@redhat.com>
 <8913b8c7-4103-4f69-8567-afdc29f8d0d3@linaro.org>
In-Reply-To: <8913b8c7-4103-4f69-8567-afdc29f8d0d3@linaro.org>
From: Ani Sinha <anisinha@redhat.com>
Date: Mon, 12 Aug 2024 15:23:04 +0530
Message-ID: <CAK3XEhM+SR39vYxG_ygQ=hCj_bmDE3dOH6EPFQZbLYrE-Yj-ow@mail.gmail.com>
Subject: Re: [PATCH v3] kvm: replace fprintf with error_report/printf() in
 kvm_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 zhao1.liu@intel.com, kvm@vger.kernel.org, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 12 Aug 2024 09:53:24 -0000

On Fri, Aug 9, 2024 at 2:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Hi Ani,
>
> On 9/8/24 08:49, Ani Sinha wrote:
> > error_report() is more appropriate for error situations. Replace fprint=
f with
> > error_report. Cosmetic. No functional change.
> >
> > CC: qemu-trivial@nongnu.org
> > CC: zhao1.liu@intel.com
>
> (Pointless to carry Cc line when patch is already reviewed next line)
>
> > Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> > Signed-off-by: Ani Sinha <anisinha@redhat.com>
> > ---
> >   accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
> >   1 file changed, 18 insertions(+), 22 deletions(-)
> >
> > changelog:
> > v2: fix a bug.
> > v3: replace one instance of error_report() with error_printf(). added t=
ags.
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 75d11a07b2..5bc9d35b61 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -2427,7 +2427,7 @@ static int kvm_init(MachineState *ms)
> >       QLIST_INIT(&s->kvm_parked_vcpus);
> >       s->fd =3D qemu_open_old(s->device ?: "/dev/kvm", O_RDWR);
> >       if (s->fd =3D=3D -1) {
> > -        fprintf(stderr, "Could not access KVM kernel module: %m\n");
> > +        error_report("Could not access KVM kernel module: %m");
> >           ret =3D -errno;
> >           goto err;
> >       }
> > @@ -2437,13 +2437,13 @@ static int kvm_init(MachineState *ms)
> >           if (ret >=3D 0) {
> >               ret =3D -EINVAL;
> >           }
> > -        fprintf(stderr, "kvm version too old\n");
> > +        error_report("kvm version too old");
> >           goto err;
> >       }
> >
> >       if (ret > KVM_API_VERSION) {
> >           ret =3D -EINVAL;
> > -        fprintf(stderr, "kvm version not supported\n");
> > +        error_report("kvm version not supported");
> >           goto err;
> >       }
> >
> > @@ -2488,26 +2488,22 @@ static int kvm_init(MachineState *ms)
> >       } while (ret =3D=3D -EINTR);
> >
> >       if (ret < 0) {
> > -        fprintf(stderr, "ioctl(KVM_CREATE_VM) failed: %d %s\n", -ret,
> > -                strerror(-ret));
> > +        error_report("ioctl(KVM_CREATE_VM) failed: %d %s", -ret,
> > +                    strerror(-ret));
> >
> >   #ifdef TARGET_S390X
> >           if (ret =3D=3D -EINVAL) {
> > -            fprintf(stderr,
> > -                    "Host kernel setup problem detected. Please verify=
:\n");
> > -            fprintf(stderr, "- for kernels supporting the switch_amode=
 or"
> > -                    " user_mode parameters, whether\n");
> > -            fprintf(stderr,
> > -                    "  user space is running in primary address space\=
n");
> > -            fprintf(stderr,
> > -                    "- for kernels supporting the vm.allocate_pgste sy=
sctl, "
> > -                    "whether it is enabled\n");
> > +            error_report("Host kernel setup problem detected.
>
> \n"
>
> Should we use error_printf_unless_qmp() for the following?

Do you believe that qemu_init() -> configure_accelerators() ->
do_configure_accelerator,() -> accel_init_machine() -> kvm_init()  can
be called from QMP context?

>
> " Please verify:");
> > +            error_report("- for kernels supporting the switch_amode or=
"
> > +                        " user_mode parameters, whether");
> > +            error_report("  user space is running in primary address s=
pace");
> > +            error_report("- for kernels supporting the vm.allocate_pgs=
te "
> > +                        "sysctl, whether it is enabled");
> >           }
> >   #elif defined(TARGET_PPC)
> >           if (ret =3D=3D -EINVAL) {
> > -            fprintf(stderr,
> > -                    "PPC KVM module is not loaded.
>
> \n"
>
> Ditto.
>
> " Try modprobe kvm_%s.\n",
> > -                    (type =3D=3D 2) ? "pr" : "hv");
> > +            error_report("PPC KVM module is not loaded. Try modprobe k=
vm_%s.",
> > +                        (type =3D=3D 2) ? "pr" : "hv");
> >           }
> >   #endif
> >           goto err;
> > @@ -2526,9 +2522,9 @@ static int kvm_init(MachineState *ms)
> >                           nc->name, nc->num, soft_vcpus_limit);
> >
> >               if (nc->num > hard_vcpus_limit) {
> > -                fprintf(stderr, "Number of %s cpus requested (%d) exce=
eds "
> > -                        "the maximum cpus supported by KVM (%d)\n",
> > -                        nc->name, nc->num, hard_vcpus_limit);
> > +                error_report("Number of %s cpus requested (%d) exceeds=
 "
> > +                             "the maximum cpus supported by KVM (%d)",
> > +                             nc->name, nc->num, hard_vcpus_limit);
> >                   exit(1);
> >               }
> >           }
> > @@ -2542,8 +2538,8 @@ static int kvm_init(MachineState *ms)
> >       }
> >       if (missing_cap) {
> >           ret =3D -EINVAL;
> > -        fprintf(stderr, "kvm does not support %s\n%s",
> > -                missing_cap->name, upgrade_note);
> > +        error_printf("kvm does not support %s\n%s",
> > +                     missing_cap->name, upgrade_note);
>
> Similarly, should we print upgrade_note using error_printf_unless_qmp?
>
> >           goto err;
> >       }
> >
>


