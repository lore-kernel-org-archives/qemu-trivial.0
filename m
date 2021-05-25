Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llWwz-0007xp-Nh
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 09:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwhr00@gmail.com>) id 1llNOH-0006dx-Fc
 for qemu-trivial@nongnu.org; Mon, 24 May 2021 23:05:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kwhr00@gmail.com>) id 1llNOC-0001Tx-D8
 for qemu-trivial@nongnu.org; Mon, 24 May 2021 23:05:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so5381421wme.5
 for <qemu-trivial@nongnu.org>; Mon, 24 May 2021 20:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YqCJnwE7IWC8ZRzBkEwU2H0R1owf6i82Zf+UnLuvLPg=;
 b=hBn9bOGmpluTCJ/XopmfAxy85twx3WE+Gim0vJ/HsD8F94IN3b41cEKYVR8pGJDDn+
 TBaXW6PvHreMD5hiyIRVE9GilV/5H5VUewgyV3CHssx6I/AK6qv5jTuCZiilXTxccDBs
 zyRffmoDt2kvBXGQ+u2eZay7r1xarZJ8MsDut4uDs4il51nGY9aSWDjzTqc8QlQSoqd5
 kCzkp09f1mWX+P/IEyq9HYc3WO/SqcpGh/uYZ+8fnSvNORGwm2R3tZxxS9CBr2JsMp0i
 g6x6WsMxGhODns6OE+9cyo9juMhjDSElPWULZjN2Oko4dEQUWD16fmKS4xYkMg1cFP1I
 zAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YqCJnwE7IWC8ZRzBkEwU2H0R1owf6i82Zf+UnLuvLPg=;
 b=tjXjKxFVywMlcO+S033ltkdeUYFbQMz4SSGjkufUgirM7lXSeOFliOJqwxFTV4Me7i
 mObzIdcqsf7i9nXxflD3kQE6IRpkQA9z6+zqdZ33cYWDX2h6aKPNvoJ1Q4CeaRNbfzKD
 tLcwL7bijKUlVXCIEJ+Fy/RJPLvLNZIlUozLg37PfeljWMzXIby5QuILIb0G1EcyDtP3
 pzqUrGIQkEoYfPX78jwrztbW+g1LasT25bPsmIRu2pjrwREmes6QYuS4xMFi+lRdBY9h
 nLJVG9hjQs45W+8clbInCeVlCbZFJwJ0CXAF+w6ZlDm071X7YiliIcLfzRCJs1fZZTIO
 kYog==
X-Gm-Message-State: AOAM530Vn3NCVIRRZ8kvfTMnFAbFQEee8ANy/NinAjLWw8W/eiLQCsof
 JUY6pv1bnNVpP3ZJzi9ivoeZQuqAsftuxQcMC1/M/ypNGNA=
X-Google-Smtp-Source: ABdhPJzNxUofomok4FcYL81OnVa+Yu1Yp9t9ALGWMWvKQnP2t39V9kGx7Zc8XMA2GL83LLDsc6RmnIsFj5iwOBO2kYY=
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr22613689wmg.31.1621911948185; 
 Mon, 24 May 2021 20:05:48 -0700 (PDT)
MIME-Version: 1.0
From: Yasuo Kuwahara <kwhr00@gmail.com>
Date: Tue, 25 May 2021 12:05:37 +0900
Message-ID: <CAHfJ0vTnA5_H1CEKHQ9eJe0hzT5SuqhMEQAJuAZhSFJz2mYjeQ@mail.gmail.com>
Subject: [PATCH] tcg/aarh64/tcg-target.c.inc: correction of rotate bit number
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008751e005c31ecd75"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=kwhr00@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 May 2021 09:18:23 -0400
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
X-List-Received-Date: Tue, 25 May 2021 03:05:57 -0000

--0000000000008751e005c31ecd75
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

--0000000000008751e005c31ecd75
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

--0000000000008751e005c31ecd75--

