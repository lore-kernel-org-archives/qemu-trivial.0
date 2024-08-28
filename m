Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sjHyi-0000jl-Ee
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2024 08:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sjHyh-0000dN-0c
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2024 08:40:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sjHye-0003wj-U1
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2024 08:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724848842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiC1avQ3zqXk1po6JfgBzN8n4F8yDAR/eCUXrc0+mtk=;
 b=YErTJZp2gyGB46anJUum4HtoiFvDetItL+qxmA08fGHOr+LI1kmw6LVjoK49oZE8mngZtG
 wrEMMUul3+aQCCo3Bg5yw+vqgao+O58dZv6fvATaDdLzYuISpOML6OOyPHW2Th803mqd5+
 hGHMnzlk4wiU5d8y1djGDIkr1tKgXSk=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-CaSq0uKlNxeouA_2_Ic0aQ-1; Wed, 28 Aug 2024 08:40:41 -0400
X-MC-Unique: CaSq0uKlNxeouA_2_Ic0aQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-70ac9630e3aso5433791a12.1
 for <qemu-trivial@nongnu.org>; Wed, 28 Aug 2024 05:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724848840; x=1725453640;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uc9V6Z9gsEBagLDtoMdvf9aNrKWRZsqunldE/a+zhwg=;
 b=ZR1pz8hwqVqW3C7AACf9jbrp07MPWBS7grpJN3o4Ws0nY7W76K8lG64908c9UQaPzr
 lV7b9NQrq1KJt7NF00XyiQBr/UcbIz1pzAseNcUzGnd+ultaP2g4NHcrejEXiHnbgXth
 8vElNjViXclXwR0HfX1u6zRzFgybBCIvXREBYePPaEHYA+sx3OXGfbguJqMyJlPhN4FT
 5tVXIGQ1cpxzCyct6o8hhWJs+3Gi7U1zCarvhk/of0seYRJFp6g0yJLGi3dnnurP/N+Y
 MYGfjgkhzmpUilkK+ROAPgJr17WUMSaCWxXCNqvF+zwVQ/VxRKf2ZRbu9KGzoPDFCKob
 bTgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlE5BO3Zld9PZklVwKnRNeVYb+nldXTSSB9QOweppzy+F/7yzIpIYhYpf8WXvSe8nHkf3KaVPbX44iJLU=@nongnu.org
X-Gm-Message-State: AOJu0Yy1VGE3DqwwjcsJlVtpElkTXu69flXQ5o6g+J93OoIcRP1pjf9r
 IUdcKu1XXsa+fgk9VXK+OKVfYTdc8L/wJvCLSzj29XTdBNcvCtEzUaVhdYjrPL9kZApWFkOGwaX
 0uuXWIZlWeZlun0Dnz+NOm8elk1kYgT0sQCt4IDIHPf1bhJ6JZ9KpXD4=
X-Received: by 2002:a05:6a20:cf90:b0:1c6:fb2a:4696 with SMTP id
 adf61e73a8af0-1cc89d6bac4mr16366398637.19.1724848839914; 
 Wed, 28 Aug 2024 05:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2OkywfwyMS5jMSJTc/hbRwLB1qeRez6eb9hJnBZAq/ieouxWUiQeqH6pzUCsYQoGaTa9WeQ==
X-Received: by 2002:a05:6a20:cf90:b0:1c6:fb2a:4696 with SMTP id
 adf61e73a8af0-1cc89d6bac4mr16366374637.19.1724848839471; 
 Wed, 28 Aug 2024 05:40:39 -0700 (PDT)
Received: from smtpclient.apple ([115.96.157.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385566490sm98202755ad.38.2024.08.28.05.40.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2024 05:40:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v5 1/2] kvm: replace fprintf with error_report()/printf()
 in kvm_init()
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <87ikvkriw3.fsf@pond.sub.org>
Date: Wed, 28 Aug 2024 18:10:24 +0530
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, kvm@vger.kernel.org,
 qemu-devel <qemu-devel@nongnu.org>
Message-Id: <E66A6507-F348-49F9-8887-1CE24A5827EF@redhat.com>
References: <20240828075630.7754-1-anisinha@redhat.com>
 <20240828075630.7754-2-anisinha@redhat.com> <87ikvkriw3.fsf@pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 28 Aug 2024 12:40:47 -0000



> On 28 Aug 2024, at 4:53=E2=80=AFPM, Markus Armbruster <armbru@redhat.com>=
 wrote:
>=20
> Ani Sinha <anisinha@redhat.com> writes:
>=20
>> error_report() is more appropriate for error situations. Replace fprintf=
 with
>> error_report() and error_printf() as appropriate. Cosmetic. No functiona=
l
>> change.
>=20
> Uh, I missed this last time around: the change is more than just
> cosmetics!  The error messages change, e.g. from
>=20
>    $ qemu-system-x86_64 -nodefaults -S -display none --accel kvm
>    qemu-system-x86_64: --accel kvm: Could not access KVM kernel module: P=
ermission denied
>    qemu-system-x86_64: --accel kvm: failed to initialize kvm: Permission =
denied
>=20
> to
>=20
>    $ qemu-system-x86_64 -nodefaults -S -display none --accel kvm
>    Could not access KVM kernel module: Permission denied
>    qemu-system-x86_64: --accel kvm: failed to initialize kvm: Permission =
denied

You got this backwards. This is what I have:

Before:
$ ./qemu-system-x86_64 --accel kvm
Could not access KVM kernel module: No such file or directory
qemu-system-x86_64: --accel kvm: failed to initialize kvm: No such file or =
directory

Now:
$ ./qemu-system-x86_64 --accel kvm
qemu-system-x86_64: --accel kvm: Could not access KVM kernel module: No suc=
h file or directory
qemu-system-x86_64: --accel kvm: failed to initialize kvm: No such file or =
directory


>=20
> Note: the second message is from kvm_init()'s caller.  Reporting the
> same error twice is wrong, but not this patch's problem.
>=20
> Moreover, the patch tweaks an error message at [*].
>=20
> Suggest something like
>=20
>  Replace fprintf() with error_report() and error_printf() where
>  appropriate.  Error messages improve, e.g. from
>=20
>      Could not access KVM kernel module: Permission denied
>=20
>  to
>=20
>      qemu-system-x86_64: --accel kvm: Could not access KVM kernel module:=
 Permission denied

Yes this seems correct.

>=20
>> CC: qemu-trivial@nongnu.org
>> CC: zhao1.liu@intel.com
>> CC: armbru@redhat.com
>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>> Signed-off-by: Ani Sinha <anisinha@redhat.com>
>> ---
>> accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
>> 1 file changed, 18 insertions(+), 22 deletions(-)
>>=20
>> changelog:
>> v2: fix a bug.
>> v3: replace one instance of error_report() with error_printf(). added ta=
gs.
>> v4: changes suggested by Markus.
>> v5: more changes from Markus's comments on v4.
>>=20
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 75d11a07b2..fcc157f0e6 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -2427,7 +2427,7 @@ static int kvm_init(MachineState *ms)
>>     QLIST_INIT(&s->kvm_parked_vcpus);
>>     s->fd =3D qemu_open_old(s->device ?: "/dev/kvm", O_RDWR);
>>     if (s->fd =3D=3D -1) {
>> -        fprintf(stderr, "Could not access KVM kernel module: %m\n");
>> +        error_report("Could not access KVM kernel module: %m");
>>         ret =3D -errno;
>>         goto err;
>>     }
>> @@ -2437,13 +2437,13 @@ static int kvm_init(MachineState *ms)
>>         if (ret >=3D 0) {
>>             ret =3D -EINVAL;
>>         }
>> -        fprintf(stderr, "kvm version too old\n");
>> +        error_report("kvm version too old");
>>         goto err;
>>     }
>>=20
>>     if (ret > KVM_API_VERSION) {
>>         ret =3D -EINVAL;
>> -        fprintf(stderr, "kvm version not supported\n");
>> +        error_report("kvm version not supported");
>>         goto err;
>>     }
>>=20
>> @@ -2488,26 +2488,22 @@ static int kvm_init(MachineState *ms)
>>     } while (ret =3D=3D -EINTR);
>>=20
>>     if (ret < 0) {
>> -        fprintf(stderr, "ioctl(KVM_CREATE_VM) failed: %d %s\n", -ret,
>> -                strerror(-ret));
>> +        error_report("ioctl(KVM_CREATE_VM) failed: %s", strerror(-ret))=
;
>=20
> [*] This is where you change an error message.
>=20
>>=20
>> #ifdef TARGET_S390X
>>         if (ret =3D=3D -EINVAL) {
>> -            fprintf(stderr,
>> -                    "Host kernel setup problem detected. Please verify:=
\n");
>> -            fprintf(stderr, "- for kernels supporting the switch_amode =
or"
>> -                    " user_mode parameters, whether\n");
>> -            fprintf(stderr,
>> -                    "  user space is running in primary address space\n=
");
>> -            fprintf(stderr,
>> -                    "- for kernels supporting the vm.allocate_pgste sys=
ctl, "
>> -                    "whether it is enabled\n");
>> +            error_printf("Host kernel setup problem detected."
>> +                         " Please verify:\n");
>> +            error_printf("- for kernels supporting the"
>> +                        " switch_amode or user_mode parameters, whether=
");
>> +            error_printf(" user space is running in primary address spa=
ce\n");
>> +            error_printf("- for kernels supporting the vm.allocate_pgst=
e"
>> +                         " sysctl, whether it is enabled\n");
>>         }
>> #elif defined(TARGET_PPC)
>>         if (ret =3D=3D -EINVAL) {
>> -            fprintf(stderr,
>> -                    "PPC KVM module is not loaded. Try modprobe kvm_%s.=
\n",
>> -                    (type =3D=3D 2) ? "pr" : "hv");
>> +            error_printf("PPC KVM module is not loaded. Try modprobe kv=
m_%s.\n",
>> +                         (type =3D=3D 2) ? "pr" : "hv");
>>         }
>> #endif
>>         goto err;
>> @@ -2526,9 +2522,9 @@ static int kvm_init(MachineState *ms)
>>                         nc->name, nc->num, soft_vcpus_limit);
>>=20
>>             if (nc->num > hard_vcpus_limit) {
>> -                fprintf(stderr, "Number of %s cpus requested (%d) excee=
ds "
>> -                        "the maximum cpus supported by KVM (%d)\n",
>> -                        nc->name, nc->num, hard_vcpus_limit);
>> +                error_report("Number of %s cpus requested (%d) exceeds =
"
>> +                             "the maximum cpus supported by KVM (%d)",
>> +                             nc->name, nc->num, hard_vcpus_limit);
>>                 exit(1);
>>             }
>>         }
>> @@ -2542,8 +2538,8 @@ static int kvm_init(MachineState *ms)
>>     }
>>     if (missing_cap) {
>>         ret =3D -EINVAL;
>> -        fprintf(stderr, "kvm does not support %s\n%s",
>> -                missing_cap->name, upgrade_note);
>> +        error_report("kvm does not support %s", missing_cap->name);
>> +        error_printf("%s", upgrade_note);
>>         goto err;
>>     }
>=20
> With the commit message corrected:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>



