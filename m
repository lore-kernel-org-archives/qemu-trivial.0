Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1siv9K-0007hL-29
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2024 08:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1siv9I-0007fJ-IX
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 08:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1siv9G-0006ZN-Gs
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 08:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724761088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yeiaj2aQ+3/BY0yDLw8AuvGPrUIvoRd8RLxOC/eCwrY=;
 b=iNGsOfBxtFuyvFFDcVmn5Lt5d5ihiiQd/EVlQorVz0ihY0uXwVe2LFJ3JDvTqbH4Olksg6
 9uk+4Ts7oAXViW+mkLBj6dpocO+HDIXsZhzSuXR4Ti0XYYL84jsEQ2IW7GS9YqYFpaSbub
 KFXpsrwKK1kFi7J+4flkWvNpsx6U8Ks=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-86nSN5XcPByyOc2xN45SKw-1; Tue, 27 Aug 2024 08:18:04 -0400
X-MC-Unique: 86nSN5XcPByyOc2xN45SKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-371a82ceaa7so3084668f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2024 05:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724761083; x=1725365883;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3EiTPZ2qWaTRorA0xI6FP2nhQmqz8XNx/iknuS88GzQ=;
 b=im1+GtX63opxvfTud6asNUIN6uwM0lDQ8V7MxpJTZ6BhsmBmmbQHuFrQubgsCnsC3+
 2DZr5MMURWey6y2DJyZt8J2o7uKiZOqTezUd71XQ9hz3ahsRTl7oQ3HswRUpNCuWEPI0
 LxPT6OwQxKSl9/ixgSKdoPvpPlCWHIanC7UDbPyk/QyPcLwXofdVBvnnRC+FikbNk2Xk
 U7I96vMrtiYEnvA7lIc5Xk5HtZj468Pl8c3PZwm0FhAu/cUcD2oViB0NOx2yUxaVF+C3
 1JWzA7Zz+FKWF07g8MtnpyJG6eqv7L6xooadIdME7qas6VMzClTuKI29iWIClNVlo3pK
 mMzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaUqGX52vSG8Cx9DkZhvua4aQO0oL2u17kh0cNS4aD6weRTkK/aOZBkoS9bkhyhK57wnM1o9mzWNaqCd8=@nongnu.org
X-Gm-Message-State: AOJu0YyMmu8Os4ZVgiuM/a7/S7jDkYZaKV7EByEM0sPohOq/pgHompRw
 d9B66l+JjwCkYvLOeJqOb4hQLTm+dBQPb2d2zmWqO5o7kzZpTF2eJkCsIbkM/mxCFvW6lvVjlaj
 T4vurEhvLTWMQj/6sRln27QDq6sgpA8htARXihuykfGeCNvvII2u5RBQ=
X-Received: by 2002:a05:6000:b88:b0:371:8af5:473d with SMTP id
 ffacd0b85a97d-37311840cb5mr7924317f8f.12.1724761083122; 
 Tue, 27 Aug 2024 05:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKZ7lsET1X/0DxMuelSdo1KQrt6r0yhxj3/qYEXESLmw2vm2Thtj1uVKCxQA6nL30WO0oPuw==
X-Received: by 2002:a05:6000:b88:b0:371:8af5:473d with SMTP id
 ffacd0b85a97d-37311840cb5mr7924295f8f.12.1724761082506; 
 Tue, 27 Aug 2024 05:18:02 -0700 (PDT)
Received: from smtpclient.apple ([115.96.30.188])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730815b7eesm12909709f8f.54.2024.08.27.05.17.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:18:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v3] kvm: replace fprintf with error_report/printf() in
 kvm_init()
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <87v7zmmq9f.fsf@pond.sub.org>
Date: Tue, 27 Aug 2024 17:47:44 +0530
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, kvm@vger.kernel.org,
 qemu-devel <qemu-devel@nongnu.org>
Message-Id: <03C06183-B8ED-405D-8B9C-532E30B8E412@redhat.com>
References: <20240809064940.1788169-1-anisinha@redhat.com>
 <8913b8c7-4103-4f69-8567-afdc29f8d0d3@linaro.org>
 <87v7zmmq9f.fsf@pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 27 Aug 2024 12:18:12 -0000



> On 27 Aug 2024, at 12:00=E2=80=AFPM, Markus Armbruster <armbru@redhat.com=
> wrote:
>=20
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>=20
>> Hi Ani,
>>=20
>> On 9/8/24 08:49, Ani Sinha wrote:
>>> error_report() is more appropriate for error situations. Replace fprint=
f with
>>> error_report. Cosmetic. No functional change.
>>> CC: qemu-trivial@nongnu.org
>>> CC: zhao1.liu@intel.com
>>=20
>> (Pointless to carry Cc line when patch is already reviewed next line)
>>=20
>>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>>> Signed-off-by: Ani Sinha <anisinha@redhat.com>
>>> ---
>>>  accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
>>>  1 file changed, 18 insertions(+), 22 deletions(-)
>>> changelog:
>>> v2: fix a bug.
>>> v3: replace one instance of error_report() with error_printf(). added t=
ags.
>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>> index 75d11a07b2..5bc9d35b61 100644
>>> --- a/accel/kvm/kvm-all.c
>>> +++ b/accel/kvm/kvm-all.c
>>> @@ -2427,7 +2427,7 @@ static int kvm_init(MachineState *ms)
>>>      QLIST_INIT(&s->kvm_parked_vcpus);
>>>      s->fd =3D qemu_open_old(s->device ?: "/dev/kvm", O_RDWR);
>>>      if (s->fd =3D=3D -1) {
>>> -        fprintf(stderr, "Could not access KVM kernel module: %m\n");
>>> +        error_report("Could not access KVM kernel module: %m");
>>>          ret =3D -errno;
>>>          goto err;
>>>      }
>>> @@ -2437,13 +2437,13 @@ static int kvm_init(MachineState *ms)
>>>          if (ret >=3D 0) {
>>>              ret =3D -EINVAL;
>>>          }
>>> -        fprintf(stderr, "kvm version too old\n");
>>> +        error_report("kvm version too old");
>>>          goto err;
>>>      }
>>>        if (ret > KVM_API_VERSION) {
>>>          ret =3D -EINVAL;
>>> -        fprintf(stderr, "kvm version not supported\n");
>>> +        error_report("kvm version not supported");
>>>          goto err;
>>>      }
>>>  @@ -2488,26 +2488,22 @@ static int kvm_init(MachineState *ms)
>>>      } while (ret =3D=3D -EINTR);
>>>        if (ret < 0) {
>>> -        fprintf(stderr, "ioctl(KVM_CREATE_VM) failed: %d %s\n", -ret,
>>> -                strerror(-ret));
>>> +        error_report("ioctl(KVM_CREATE_VM) failed: %d %s", -ret,
>>> +                    strerror(-ret));
>>>    #ifdef TARGET_S390X
>>>          if (ret =3D=3D -EINVAL) {
>>> -            fprintf(stderr,
>>> -                    "Host kernel setup problem detected. Please verify=
:\n");
>>> -            fprintf(stderr, "- for kernels supporting the switch_amode=
 or"
>>> -                    " user_mode parameters, whether\n");
>>> -            fprintf(stderr,
>>> -                    "  user space is running in primary address space\=
n");
>>> -            fprintf(stderr,
>>> -                    "- for kernels supporting the vm.allocate_pgste sy=
sctl, "
>>> -                    "whether it is enabled\n");
>>> +            error_report("Host kernel setup problem detected.
>>=20
>> \n"
>>=20
>> Should we use error_printf_unless_qmp() for the following?
>>=20
>> " Please verify:");
>>> +            error_report("- for kernels supporting the switch_amode or=
"
>>> +                        " user_mode parameters, whether");
>>> +            error_report("  user space is running in primary address s=
pace");
>>> +            error_report("- for kernels supporting the vm.allocate_pgs=
te "
>>> +                        "sysctl, whether it is enabled");
>=20
> Do not put newlines into error messages.  error_report()'s function
> comment demands "The resulting message should be a single phrase, with
> no newline or trailing punctuation."
>=20
> You can do this:
>=20
>    error_report(... the actual error message ...);
>    error_printf(... hints on what to do about it ...);
>=20
> Questions?

Do you see any newlines in my proposed patch?


