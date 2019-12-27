Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ikxPu-0002v7-4F
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2019 16:45:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ikxPr-0002uz-Fr
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2019 16:45:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ikxPq-0005FT-B8
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2019 16:45:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33792
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ikxPq-0005F5-7K
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2019 16:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577483101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmbc9ZLKA4lyNlXb4Mp9QVKNZbDD5QoaM2f7T/+jMrg=;
 b=Pg1KqUglT3berTdpwvgQDkx5w4PQoMv/RUbbvv3y3AM3uX/cyweXgR38wAHTO1xakMOVe3
 qaAxi9e0ZZEKIAw+ojo/92OsmMmLppmMmNoOg9gM++TTS0lwzaJklQ4T8AmuasWbP3GNL8
 rnG/oe766EgE0iwcWREfs1tG+073Q7k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-J08l3OpvN1iQqcAEuAoUnA-1; Fri, 27 Dec 2019 16:44:59 -0500
Received: by mail-wr1-f69.google.com with SMTP id d8so7973808wrq.12
 for <qemu-trivial@nongnu.org>; Fri, 27 Dec 2019 13:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eHhU0ykQiE9dJ4DGpJIPGvyaJ/cwOCNG9yskkZAS2K0=;
 b=ZJpJ/MMH5lN0l2eZH9eKLWVuYbAa+hDQaxLmukHArCKTdbK6uJik8UnlwVBSg6kcgq
 RgRmuyDZzzBuRMSN1mnyXaAEPFWd+6NXvAHQNcTo4+3uSdcCJ/4ahYhNmUaQSRmTDzYk
 MDCiPqOafiyC15alsigSNW3DATYbdRxgh5tIiYPf9C1oXi7CKR0APSCGms66rrntICwN
 RWT40TouTdM2Qb0/BPiDxoy/o+LEaZgK04AZ1AfQ7zj5VOLNa7lgU/ooAj70XvqjY+K5
 /v2QbZCCMjgw01Q+6JhmvxWlNFC2cdMckmo3ctSTljI94/+UCn2Q8oYQn1sXSEerp/ga
 dynw==
X-Gm-Message-State: APjAAAXQEpr3MuESKyxuEenPhwrCbB/euPxY9tSyNBjoeH+twxcXh8VW
 YZJJ3/EUeZ/7GWBnFgZlaQbJQHLb6hwcnmcC4mFN/eto8S5fywdzo9bt5ugKevwsG9Pr3fFuJAQ
 fLEv70Rc+tnY/iYwk+A==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr49556709wrm.338.1577483098321; 
 Fri, 27 Dec 2019 13:44:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxgoQpV8XoKLA0K4WRE/zn/lbR6vSbizIVxpNXqzU+P3VOjKxSIigPbU+14gPCFUyvPT4MSg==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr49556692wrm.338.1577483098041; 
 Fri, 27 Dec 2019 13:44:58 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id b137sm12867884wme.26.2019.12.27.13.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2019 13:44:57 -0800 (PST)
Subject: Re: [PATCH v2] target/i386: Fix handling of k_gs_base register in
 32-bit mode in gdbstub
To: "Marek Dolata - mkdolata@us.ibm.com" <mkdolata@us.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Doug Gale <doug16k@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <62c3c3385b014ce1a6ca07f88973bf95@us.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2defe319-c1ed-922a-c375-6fda1ed68292@redhat.com>
Date: Fri, 27 Dec 2019 22:44:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <62c3c3385b014ce1a6ca07f88973bf95@us.ibm.com>
Content-Language: en-US
X-MC-Unique: J08l3OpvN1iQqcAEuAoUnA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 21:45:04 -0000

Hi Marek,

Thanks for Cc'ing the maintainers :)

Still the same error occurs:

   Applying: target/i386: Fix handling of k_gs_base register in 32-bit=20
mode in gdbstub
   error: corrupt patch at line 21
   Patch failed at 0001 target/i386: Fix handling of k_gs_base register=20
in 32-bit mode in gdbstub

Please use a version number when you repost a patch, this is patch v2=20
(next should be v3).

On 12/27/19 9:07 PM, Marek Dolata - mkdolata@us.ibm.com wrote:
> Fixes: corrects clobbering of registers appearing after k_gs_base
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1857640
>=20
> Signed-off-by: Marek Dolata <mkdolata@us.ibm.com=20
> <mailto:mkdolata@us.ibm.com>>
>=20
> ---
>=20
> target/i386/gdbstub.c | 4 ++--
>=20
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
>=20
> index aef25b70f1..572ead641c 100644
>=20
> --- a/target/i386/gdbstub.c
>=20
> +++ b/target/i386/gdbstub.c
>=20
> @@ -350,15 +350,15 @@ int x86_cpu_gdb_write_register(CPUState *cs,=20
> uint8_t *mem_buf, int n)
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->segs[R_GS].base =3D ldl_p(mem_=
buf);
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
> -#ifdef TARGET_X86_64
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0 case IDX_SEG_REGS + 8:
>=20
> +#ifdef TARGET_X86_64
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (env->hflags & HF_CS64_MASK) {
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->kernelgsbase =3D l=
dq_p(mem_buf);
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 8;
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->kernelgsbase =3D ldl_p(mem_buf=
);
>=20
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
> #endif
>=20
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0case IDX_FP_REGS + 8:
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpu_set_fpuc(env, ldl_p(mem_buf));
>=20
> --=20
>=20
> 2.24.1
>=20


