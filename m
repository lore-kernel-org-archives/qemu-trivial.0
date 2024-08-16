Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1seqLG-0000QI-7u
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2024 02:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seqLB-0000OZ-DN
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2024 02:21:37 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seqL8-0004IG-8D
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2024 02:21:37 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so3663293e87.0
 for <qemu-trivial@nongnu.org>; Thu, 15 Aug 2024 23:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723789292; x=1724394092; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gN/IDNnIVqePOUl3+INdjUuo1e/RhZoKy6s/qPCWKbQ=;
 b=WQ0dDKSkvegmMV9kd9ZQvyvrcNLNaCeWYZlZLs3AF5ev7q4Ajb422QiiCQGVH6i7NF
 LNnAXqTv/n71GHnA9XeJxLbLxvRRSsBf8nFCZ3ztcB/UdqbTzy+aMDu3t8UfeCkFL1yG
 VAsDPHL6+hqat1l0NwceGzlZE+rr/u097bQLeIxWuvRSZNT8mP0nHGeKmJ6fQbn3vD7M
 A4OLj4pwIERgGL5mqYdN91U65DnGrmhqM27Da+xakyEZevlAehOD4ElOfk07ff99nGaZ
 kcKWX3eLlEtvC7jpxyBEkc8ciSFRlQj1eZxCATFhpZtLLl0sbAAZBpcL86qZT3K7dqrC
 Q/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723789292; x=1724394092;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gN/IDNnIVqePOUl3+INdjUuo1e/RhZoKy6s/qPCWKbQ=;
 b=hG0opTlalBmzIuZbBE3zCGzgeWDJ76AiggSeQdeBC4txjKsy7VIdBTQwkK850sYVM0
 lS2LUISKAspa6ACrhnLlT3e4NdUgXbX5YIAtd6Or8zLV1EX1qNRF1CFteLMWGCaD7B2n
 QJgRVQiYQoCMOI0+CZ3DMWQQQLqtYnwH1Nj7P8H4aMybJycJE8oLN1BJbc4W/TUjVLly
 FOS6NIErPKLxVr1yiE2E5By5Ln4qYv7M74veZstqz66PmnE17HFqoOhc2Bp+wllcx13j
 zF8rXcRWPR2w6ghkU1mgW38snYTnBfm4/kkzwk/ppJ1OojLRKRt12gRbDxMJ0t3PNptQ
 Xy7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjX4fCsBeHlcT7wX2RR17F7jDX01WrIU+bJzCBYRLYxnp9ZjxpYoqQXe3hwspnHsb7XWm34v6kAg8wGjO2ej49UV+sHuWlvg==
X-Gm-Message-State: AOJu0YzLzjCjEKhGQqBhSmbJ2k4erLH5AEKnoMU9+OLSpyPKtFCJou7j
 +sito7KVwBboWojqrXBQnVe4p3yc1Ydw94bOU9d1WwqPzv+S0+x1iS14xnPwIk4=
X-Google-Smtp-Source: AGHT+IEa2KUSICyrEZCI46tZGlAlao5lx1DfUbEZ5609WVaQc4E2Td19rNhAnjAalT5tjPNh2pYAaQ==
X-Received: by 2002:a05:6512:118e:b0:52c:76ac:329b with SMTP id
 2adb3069b0e04-5331c6bdaeemr1283662e87.35.1723789291403; 
 Thu, 15 Aug 2024 23:21:31 -0700 (PDT)
Received: from [192.168.69.100] (cor91-h02-176-184-30-185.dsl.sta.abo.bbox.fr.
 [176.184.30.185]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396d4b2sm205670166b.220.2024.08.15.23.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 23:21:30 -0700 (PDT)
Message-ID: <31202ec6-d108-4dd9-a103-f534f36c2821@linaro.org>
Date: Fri, 16 Aug 2024 08:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kvm: replace fprintf with error_report/printf() in
 kvm_init()
To: Ani Sinha <anisinha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, kvm@vger.kernel.org,
 qemu-devel <qemu-devel@nongnu.org>
References: <20240809064940.1788169-1-anisinha@redhat.com>
 <8913b8c7-4103-4f69-8567-afdc29f8d0d3@linaro.org>
 <CAK3XEhM+SR39vYxG_ygQ=hCj_bmDE3dOH6EPFQZbLYrE-Yj-ow@mail.gmail.com>
 <CAK3XEhPZ8X1-Ui6pJ+kYY3Er-N-zW0f5MqpLyaU7t2d3qaQXkA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAK3XEhPZ8X1-Ui6pJ+kYY3Er-N-zW0f5MqpLyaU7t2d3qaQXkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 16 Aug 2024 06:21:37 -0000

On 12/8/24 11:59, Ani Sinha wrote:
> 
> 
> On Mon, 12 Aug, 2024, 3:23 pm Ani Sinha, <anisinha@redhat.com 
> <mailto:anisinha@redhat.com>> wrote:
> 
>     On Fri, Aug 9, 2024 at 2:06 PM Philippe Mathieu-Daudé
>     <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
>      >
>      > Hi Ani,
>      >
>      > On 9/8/24 08:49, Ani Sinha wrote:
>      > > error_report() is more appropriate for error situations.
>     Replace fprintf with
>      > > error_report. Cosmetic. No functional change.
>      > >
>      > > CC: qemu-trivial@nongnu.org <mailto:qemu-trivial@nongnu.org>
>      > > CC: zhao1.liu@intel.com <mailto:zhao1.liu@intel.com>
>      >
>      > (Pointless to carry Cc line when patch is already reviewed next line)
>      >
>      > > Reviewed-by: Zhao Liu <zhao1.liu@intel.com
>     <mailto:zhao1.liu@intel.com>>
>      > > Signed-off-by: Ani Sinha <anisinha@redhat.com
>     <mailto:anisinha@redhat.com>>
>      > > ---
>      > >   accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
>      > >   1 file changed, 18 insertions(+), 22 deletions(-)
>      > >
>      > > changelog:
>      > > v2: fix a bug.
>      > > v3: replace one instance of error_report() with error_printf().
>     added tags.
>      > >
>      > > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>      > > index 75d11a07b2..5bc9d35b61 100644
>      > > --- a/accel/kvm/kvm-all.c
>      > > +++ b/accel/kvm/kvm-all.c
>      > > @@ -2427,7 +2427,7 @@ static int kvm_init(MachineState *ms)
>      > >       QLIST_INIT(&s->kvm_parked_vcpus);
>      > >       s->fd = qemu_open_old(s->device ?: "/dev/kvm", O_RDWR);
>      > >       if (s->fd == -1) {
>      > > -        fprintf(stderr, "Could not access KVM kernel module:
>     %m\n");
>      > > +        error_report("Could not access KVM kernel module: %m");
>      > >           ret = -errno;
>      > >           goto err;
>      > >       }
>      > > @@ -2437,13 +2437,13 @@ static int kvm_init(MachineState *ms)
>      > >           if (ret >= 0) {
>      > >               ret = -EINVAL;
>      > >           }
>      > > -        fprintf(stderr, "kvm version too old\n");
>      > > +        error_report("kvm version too old");
>      > >           goto err;
>      > >       }
>      > >
>      > >       if (ret > KVM_API_VERSION) {
>      > >           ret = -EINVAL;
>      > > -        fprintf(stderr, "kvm version not supported\n");
>      > > +        error_report("kvm version not supported");
>      > >           goto err;
>      > >       }
>      > >
>      > > @@ -2488,26 +2488,22 @@ static int kvm_init(MachineState *ms)
>      > >       } while (ret == -EINTR);
>      > >
>      > >       if (ret < 0) {
>      > > -        fprintf(stderr, "ioctl(KVM_CREATE_VM) failed: %d
>     %s\n", -ret,
>      > > -                strerror(-ret));
>      > > +        error_report("ioctl(KVM_CREATE_VM) failed: %d %s", -ret,
>      > > +                    strerror(-ret));
>      > >
>      > >   #ifdef TARGET_S390X
>      > >           if (ret == -EINVAL) {
>      > > -            fprintf(stderr,
>      > > -                    "Host kernel setup problem detected.
>     Please verify:\n");
>      > > -            fprintf(stderr, "- for kernels supporting the
>     switch_amode or"
>      > > -                    " user_mode parameters, whether\n");
>      > > -            fprintf(stderr,
>      > > -                    "  user space is running in primary
>     address space\n");
>      > > -            fprintf(stderr,
>      > > -                    "- for kernels supporting the
>     vm.allocate_pgste sysctl, "
>      > > -                    "whether it is enabled\n");
>      > > +            error_report("Host kernel setup problem detected.
>      >
>      > \n"
>      >
>      > Should we use error_printf_unless_qmp() for the following?
> 
>     Do you believe that qemu_init() -> configure_accelerators() ->
>     do_configure_accelerator,() -> accel_init_machine() -> kvm_init()  can
>     be called from QMP context?
> 
> 
> To clarify, that is the only path I saw that calls kvm_init()

We don't know whether this code can end refactored or not.
Personally I rather consistent API uses, since snipped of
code are often used as example. Up to the maintainer.

>      >
>      > " Please verify:");
>      > > +            error_report("- for kernels supporting the
>     switch_amode or"
>      > > +                        " user_mode parameters, whether");
>      > > +            error_report("  user space is running in primary
>     address space");
>      > > +            error_report("- for kernels supporting the
>     vm.allocate_pgste "
>      > > +                        "sysctl, whether it is enabled");
>      > >           }
>      > >   #elif defined(TARGET_PPC)
>      > >           if (ret == -EINVAL) {
>      > > -            fprintf(stderr,
>      > > -                    "PPC KVM module is not loaded.
>      >
>      > \n"
>      >
>      > Ditto.
>      >
>      > " Try modprobe kvm_%s.\n",
>      > > -                    (type == 2) ? "pr" : "hv");
>      > > +            error_report("PPC KVM module is not loaded. Try
>     modprobe kvm_%s.",
>      > > +                        (type == 2) ? "pr" : "hv");
>      > >           }
>      > >   #endif
>      > >           goto err;
>      > > @@ -2526,9 +2522,9 @@ static int kvm_init(MachineState *ms)
>      > >                           nc->name, nc->num, soft_vcpus_limit);
>      > >
>      > >               if (nc->num > hard_vcpus_limit) {
>      > > -                fprintf(stderr, "Number of %s cpus requested
>     (%d) exceeds "
>      > > -                        "the maximum cpus supported by KVM
>     (%d)\n",
>      > > -                        nc->name, nc->num, hard_vcpus_limit);
>      > > +                error_report("Number of %s cpus requested (%d)
>     exceeds "
>      > > +                             "the maximum cpus supported by
>     KVM (%d)",
>      > > +                             nc->name, nc->num, hard_vcpus_limit);
>      > >                   exit(1);
>      > >               }
>      > >           }
>      > > @@ -2542,8 +2538,8 @@ static int kvm_init(MachineState *ms)
>      > >       }
>      > >       if (missing_cap) {
>      > >           ret = -EINVAL;
>      > > -        fprintf(stderr, "kvm does not support %s\n%s",
>      > > -                missing_cap->name, upgrade_note);
>      > > +        error_printf("kvm does not support %s\n%s",
>      > > +                     missing_cap->name, upgrade_note);
>      >
>      > Similarly, should we print upgrade_note using
>     error_printf_unless_qmp?
>      >
>      > >           goto err;
>      > >       }
>      > >
>      >
> 


