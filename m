Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llWx3-00080N-RT
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 09:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwhr00@gmail.com>) id 1llTdy-0007SZ-8I
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 05:46:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kwhr00@gmail.com>) id 1llTdv-0000KB-M2
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 05:46:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id q5so31455083wrs.4
 for <qemu-trivial@nongnu.org>; Tue, 25 May 2021 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6AF0NWrKHZig9WLhVf4Fn8k365LH4FZZuaL5y32vImY=;
 b=ZoAIH/WHXRCSo12qqiIVMN7Nvw9XHmugoaAJr8+AEkTxjhKhaeh3Lbn40grzPk/cSi
 Nh1A/Y4JsMeL8q6086VlmEFuwzGsGPGWXiFNqn8zaaIpENDeJJ0cKARVJMjN9AyiRdtV
 4H7ZmhVNK66RK+dExN8JdQ6Tfu25p6oWpz5L9Q2nNGGcdg6c5rMYK9W/J4LplQD2U53k
 q+Rmsgc9qt4TS8zmIlkYnhe5Pr7NXd5SsORCQKNLUwAI9w3M+VUR+sovC2RvJXCeonAI
 QcZ5Af0/oT8AsVHoH/JP4Ks7tBmcMXBtF/0zrOjdVEb0ViptDGZ9zr/LLEBpJJLENinv
 16LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6AF0NWrKHZig9WLhVf4Fn8k365LH4FZZuaL5y32vImY=;
 b=kUktE8sodecQJnY9MnuQfSJ2adxW2QP0Ho9Tzl10Lt1ANQLSnNh7JFt5LziMIscwdd
 k1XBAaciIfWut0xLgKnZpOmkWlpri/95g+6goVtyEdU6qaiU+X9UN2J0hUT3S+jXk1si
 bO9z4K6fqoCnf5phW/D5wD6VWjZhYw4h7Kf5eMxYtwYoIJ3SlESihYYjMsfEE4xm25Gf
 oOSNu+Gs9NqNL0QMcSQkRL7I2+Wj6A+4Gu33fSKWwLHUNRv1cTR2RK+8pIL/XRyjTKBI
 THToUibcAcLMnc/XgkM3R0sll1DcqmcsUpXUjX1R9BuHGiOsKdta2aLESO+/tIHirXF9
 HLmg==
X-Gm-Message-State: AOAM532fDsLIhIzDimLm7A7jh6wPcYBswe5Tf+QcMAdtW0MWosjZG4kp
 Ae1Zw3KuSjDWwM4zSLs27A5h0vdCn05Ejkqj41Qe0YQk8sk=
X-Google-Smtp-Source: ABdhPJyy+C7V3keICCSEaCVf1jsD0hFYC1UmaNdtmGPbUv31asML/c5Tw8Ss5arhoxUkDAmBeRy5xbi+rBp89FETTF0=
X-Received: by 2002:adf:db42:: with SMTP id f2mr26450119wrj.5.1621935990033;
 Tue, 25 May 2021 02:46:30 -0700 (PDT)
MIME-Version: 1.0
From: Yasuo Kuwahara <kwhr00@gmail.com>
Date: Tue, 25 May 2021 18:46:19 +0900
Message-ID: <CAHfJ0vSXnmnTLmT0kR=a8ACRdw_UsLYOhStzUzgVEHoH8U-7sA@mail.gmail.com>
Subject: [PATCH] tcg/aarch64/tcg-target.c.inc: correction of rotate bit number
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000088d10f05c32466e7"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=kwhr00@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 May 2021 09:18:24 -0400
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
X-List-Received-Date: Tue, 25 May 2021 09:46:34 -0000

--00000000000088d10f05c32466e7
Content-Type: text/plain; charset="UTF-8"

The last argument of tcg_out_extr() must be in the range 0-31 if ext==0.

Before the fix, when m==0 it becomes 32 and it crashes with an Illegal
instruction in Apple Silicon.

After the fix, it will be 0. If m is in the range 1-31, it is the same as
before.


Signed-off-by: Yasuo Kuwahara <kwhr00@gmail.com>

---

 tcg/aarch64/tcg-target.c.inc | 5 ++---

 1 file changed, 2 insertions(+), 3 deletions(-)


diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc

index f07ba98aa4..5bd366f2d4 100644

--- a/tcg/aarch64/tcg-target.c.inc

+++ b/tcg/aarch64/tcg-target.c.inc

@@ -1291,9 +1291,8 @@ static inline void tcg_out_rotr(TCGContext *s,
TCGType ext,

 static inline void tcg_out_rotl(TCGContext *s, TCGType ext,

                                 TCGReg rd, TCGReg rn, unsigned int m)

 {

-    int bits = ext ? 64 : 32;

-    int max = bits - 1;

-    tcg_out_extr(s, ext, rd, rn, rn, bits - (m & max));

+    int max = ext ? 63 : 31;

+    tcg_out_extr(s, ext, rd, rn, rn, -m & max);

 }



 static inline void tcg_out_dep(TCGContext *s, TCGType ext, TCGReg rd,

-- 

2.24.3

--00000000000088d10f05c32466e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">The last argument of tcg_out_ex=
tr() must be in the range 0-31 if ext=3D=3D0.</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Before the fix, when m=3D=3D0 i=
t becomes 32 and it crashes with an Illegal instruction in Apple Silicon.</=
span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">After the fix, it will be 0. If=
 m is in the range 1-31, it is the same as before.</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Signed-off-by: Yasuo Kuwahara &=
lt;<a href=3D"mailto:kwhr00@gmail.com">kwhr00@gmail.com</a>&gt;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">---</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>tcg/aarch64/tcg-target.c.inc | 5 ++---</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>1 file changed, 2 insertions(+), 3 deletions(-)</=
span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">diff --git a/tcg/aarch64/tcg-ta=
rget.c.inc b/tcg/aarch64/tcg-target.c.inc</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">index f07ba98aa4..5bd366f2d4 10=
0644</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">--- a/tcg/aarch64/tcg-target.c.=
inc</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+++ b/tcg/aarch64/tcg-target.c.=
inc</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">@@ -1291,9 +1291,8 @@ static in=
line void tcg_out_rotr(TCGContext *s, TCGType ext,</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>static inline void tcg_out_rotl(TCGContext *s, TC=
GType ext,</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>TCGReg rd, T=
CGReg rn, unsigned int m)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>{</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>int bits =3D ext ? 64 : 32;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>int max =3D bits - 1;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>tcg_out_extr(s, ext, rd, rn, rn, bits - =
(m &amp; max));</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>int max =3D ext ? 63 : 31;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>tcg_out_extr(s, ext, rd, rn, rn, -m &amp=
; max);</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>}</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>static inline void tcg_out_dep(TCGContext *s, TCG=
Type ext, TCGReg rd,</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">--<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">2.24.3</span></p><p class=3D"gm=
ail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fami=
ly:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><br></span></p></div>

--00000000000088d10f05c32466e7--

