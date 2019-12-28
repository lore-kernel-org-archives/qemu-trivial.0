Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilFPp-0004fz-Ry
	for mharc-qemu-trivial@gnu.org; Sat, 28 Dec 2019 11:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilFPn-0004eU-OG
 for qemu-trivial@nongnu.org; Sat, 28 Dec 2019 11:58:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilFPl-0000E8-DN
 for qemu-trivial@nongnu.org; Sat, 28 Dec 2019 11:58:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20702
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilFPk-00007v-V4
 for qemu-trivial@nongnu.org; Sat, 28 Dec 2019 11:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577552288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDik/qENimSiOTNyE7E+6Lmlst/8Rr8Dtv2Nv/DAZRk=;
 b=dAJDmdrNSvJvQ1lSVduZl2BPTEzWQh3vW6vu986yByoo1wkksDYCpOGqqGFlqsmctW/0M4
 cNvopNqM+iQ7foTueENVMnT7IY3ytQojH+WuTAB3NYlvppmWIwLTHVpZhLyT88IfOo92zP
 j5zsyDMNHbszp6dSaWs09mAMm3lgzn4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-xewEVzEhM4qAwqAoI0PNyg-1; Sat, 28 Dec 2019 11:58:04 -0500
Received: by mail-wr1-f69.google.com with SMTP id l20so8341818wrc.13
 for <qemu-trivial@nongnu.org>; Sat, 28 Dec 2019 08:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eAPYpgunDwkHnTrJpGjelWBSwhOarkRJCG3bFIaFXno=;
 b=t37AwsB1SIKkt29b8MrQK9OSpLW/ZYYnuLlBmLXkCKaP8Gpc7q6A2s7siYvW5WKcx1
 SBmnOAJlj97gEL0AvxarAtEBOBs+ViydTgBzDBsrmNlbwzW2hqhcl3z72CpNLdZn90eE
 GdmdZywI8xtS1co//1LOuCUiSvOpNCiZ2kVCUcdWsSa5ONefCazcgx8AP8vJDFzUktAV
 AMR/VZZp2s7k274dURfamsR6b+oYQSVTfnxj3z3nWqsWeFOt9nBU1PdXREAX8R90lh3g
 TSAa+hmb0lG4t2Fj2zU1Paliwgj5RJXL2WrcHzYO6B/TXrsjPDhQ8gGte/fMw4vVTts6
 ACvw==
X-Gm-Message-State: APjAAAWmLJzII5bMyUgf2HHQ67Q8tPNrXpDkCLL16eAHaLDgysTUtrvB
 GPGN/n8hB6dz21vUDMeI+ACJKxPlogp5IkbxMjTGEDRYT6Lrk2u0FAxTu6PxyLyL6w1eecO5FN9
 Ie3ImGR+ZTVerMtEEhA==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr25561366wmj.135.1577552283113; 
 Sat, 28 Dec 2019 08:58:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqybXEVye3NsPFqO6CMDAYzh75QR/hKvBd45IcXBziGwvLYRSDch4KXdpzckKsmYcptrC3F4qw==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr25561346wmj.135.1577552282748; 
 Sat, 28 Dec 2019 08:58:02 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id f65sm14960078wmf.2.2019.12.28.08.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Dec 2019 08:58:02 -0800 (PST)
Subject: Re: [PATCH V3] target/i386: Fix handling of k_gs_base register in
 32-bit mode in gdbstub
To: "Marek Dolata - mkdolata@us.ibm.com" <mkdolata@us.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Doug Gale <doug16k@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <2cf601fe9f2d4447ba4eec653df634ee@us.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b44c1837-037d-24f4-3ff0-6a36e3fea1e0@redhat.com>
Date: Sat, 28 Dec 2019 17:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2cf601fe9f2d4447ba4eec653df634ee@us.ibm.com>
Content-Language: en-US
X-MC-Unique: xewEVzEhM4qAwqAoI0PNyg-1
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
X-List-Received-Date: Sat, 28 Dec 2019 16:58:13 -0000

On 12/28/19 12:37 AM, Marek Dolata - mkdolata@us.ibm.com wrote:
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

Still:

$ pwclient git-am 11311411
Applying patch #11311411 using "git am"
Description: [V3] target/i386: Fix handling of k_gs_base register in=20
32-bit mode in gdbstub
Applying: target/i386: Fix handling of k_gs_base register in 32-bit mode=20
in gdbstub
error: corrupt patch at line 25
Patch failed at 0001 target/i386: Fix handling of k_gs_base register in=20
32-bit mode in gdbstub
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

I thought this could be due to this recent git change:
https://github.com/git/git/commit/5983ddc1652
and would suggest to try with:

$ git config sendemail.transferEncoding 8bit

but you use git 2.24 and this got introduced in 2.25, so I'm not sure=20
what's wrong. You could still try, in case this helps...


