Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ikv4f-0002eo-Ee
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2019 14:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ikv4c-0002eH-KE
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2019 14:14:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ikv4a-0005Hn-Hd
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2019 14:14:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ikv4a-0005HQ-EW
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2019 14:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577474095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOtHWLZD3gMUE8ZLMiqKA+xfr8aRLG+h2PTQQlJZXGE=;
 b=NPb69vLMJHYrUFOpIGG8ryAbaGb7+rRawHMLZXif7vGiTcBV79tn8EgBMuFpNPkRtfsz2t
 bG7vX7qBKIvenFuk7R4mkqf0BX1+VUAKcAIWc/BPzbJnY/h3Ln/L22GbTh0VSW/bZAhzUI
 IQe+G/WsCF8AmXMh2E5EQCQ6QsAPDE8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-pbrfmvqmN8a3Wl1Xek-Cuw-1; Fri, 27 Dec 2019 14:14:52 -0500
Received: by mail-wr1-f72.google.com with SMTP id d8so7810031wrq.12
 for <qemu-trivial@nongnu.org>; Fri, 27 Dec 2019 11:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=69OYBx5AUrmqOpXDBKa83VuAn5ZdgbJjVvg3NNVLsuE=;
 b=PbrAXw0MtV/8EOGtaECDyxL2hAsp0d6tgXJS/Q8HxQVord5jQ04u/AGm2Bs4NfK54G
 opz5vgQhPKVIVaPnbIWcBY7Av9/dhmMSnM4Pd0l+t79C//d263whJzQ1qIYPHDSiGrus
 SWfvxk1se9JbcErI5D2RcDPZqz4WpTIWnp00bwjltBD7CMP4UBTe5IP2hZ0ZjuRxg7JS
 xdgkY3lZLMtqb9RJSowR+RdYmcE/z+zJTMKQkNu44JBxlF/gjdZGPmRYhCneyfQtXCNe
 VACXQAsOvaFZbRijGDy9gKi+CtR+JC6sfJWqJa1YWFiraG9qZfp7yjfzZdpBeiUAv+s+
 XGJg==
X-Gm-Message-State: APjAAAWZwrMOaGiT8lEE/V8zDAHw9yf4FmXkaiXLY6nnF9vnx4rkjI1F
 xzWmD/1fR0H7ffo3woDAJzUaTEZhATHZqoCq7D6bAMb57+qVHJ4CFkYQpvscHraNe1ihwqX/w7C
 cKpr7okjZ1becK0O3dw==
X-Received: by 2002:a1c:6809:: with SMTP id d9mr20777446wmc.70.1577474091363; 
 Fri, 27 Dec 2019 11:14:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWUVxeRFDF2HV633egro9bQBFeYD1PqAO8Mfxij5sHpQkdcDp0krwZXGj6aXOgn6AhDkGyYg==
X-Received: by 2002:a1c:6809:: with SMTP id d9mr20777427wmc.70.1577474091067; 
 Fri, 27 Dec 2019 11:14:51 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id o7sm11892001wmh.11.2019.12.27.11.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2019 11:14:50 -0800 (PST)
Subject: Re: [PATCH] /target/i386: fix gdbstub k_gs_base issue
To: "Marek Dolata - mkdolata@us.ibm.com" <mkdolata@us.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Doug Gale <doug16k@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <f392e1a15634455d8af668b28b88f3b4@us.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f29f72e8-8b80-c064-599a-a706979a425b@redhat.com>
Date: Fri, 27 Dec 2019 20:14:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f392e1a15634455d8af668b28b88f3b4@us.ibm.com>
Content-Language: en-US
X-MC-Unique: pbrfmvqmN8a3Wl1Xek-Cuw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 27 Dec 2019 19:15:00 -0000

Hi Marek,

If you look at the other patches, you'll notice no leading slash is=20
used, so please remove it when resending.

Maybe you can use "target/i386: Fix handling of k_gs_base register in=20
32-bit mode in gdbstub" as patch subject.

Please Cc the maintainers. See:
https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer
Doing it for you now (adding Richard and Eduardo).

On 12/27/19 3:41 AM, Marek Dolata - mkdolata@us.ibm.com wrote:
> Fixes: corrects clobbering of registers appearing after k_gs_base
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1857640
>=20
> Signed-off-by: Marek Dolata <mkdolata@us.ibm.com>
>=20
> ---
>=20
> target/i386/gdbstub.c | 4 +++-
>=20
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
>=20
> index aef25b70f1..7228d20674 100644
>=20
> --- a/target/i386/gdbstub.c
>=20
> +++ b/target/i386/gdbstub.c

I am having troubles trying to apply your patch:

Applying: /target/i386: fix gdbstub k_gs_base issue
error: corrupt patch at line 23
Patch failed at 0001 /target/i386: fix gdbstub k_gs_base issue
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

The information on the wiki might help you to use proper format:
https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch

>=20
> @@ -350,14 +350,16 @@ int x86_cpu_gdb_write_register(CPUState *cs,=20
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
>  =A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0env->kernelgsbase =3D l=
dq_p(mem_buf);
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 8;
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->kernelgsbase =3D ldl_p(mem_buf=
);

You can add here the

#endif

>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;

and remove the '#else return 4; #endif' lines.

>=20
> +#else
>=20
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
> #endif
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0case IDX_FP_REGS + 8:
>=20
> --=20
>=20
> 2.21.0
>=20

Regards,

Phil.


