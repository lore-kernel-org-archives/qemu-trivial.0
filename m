Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oik6k-00089P-Cl
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2022 18:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1oijtl-0006Iy-Bz
 for qemu-trivial@nongnu.org; Wed, 12 Oct 2022 18:08:21 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1oijti-000226-6I
 for qemu-trivial@nongnu.org; Wed, 12 Oct 2022 18:08:19 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e20so66605ybh.2
 for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2022 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KkHguknvAFk7BEm9X9Q7YbQ0YifkJ0YknRfDZIpP6m0=;
 b=dmOyThPaD4Sg/qN5e9vGIj0g2ntJJzxIDs0rw0pISOuQ8t9ejgslWEV08skLiDtKAM
 Oh8Z28PEG2sVjBow64sxY9T3vDcR9ZULkI9tb+ceMWXpGrRtvUH5Lqsl5nJLHzqxre/T
 Op0b8ct7lzABhJcUAPAkKNt0VR87LyCieMN1j+U57QTgtF6z8j3PbYEgWVF7GcQRJO22
 lysWn4MHovwWUAZXlguYgPOXLJYDT0EZ1YVClmBB1n7jLJXZ9VcFr6DJFyGni600Ic7h
 Oxz1+YOqGcgbtXiVQfNfD6yxw3XJNgey2g5178PL7HevBU2RL3unQRW4+Q4CDiDT9iE4
 6/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KkHguknvAFk7BEm9X9Q7YbQ0YifkJ0YknRfDZIpP6m0=;
 b=Nxq0geraHAiL7oKeLoSNxgY5KbC7hqZzyZ3OgSSVvoeJpcrJ+x9T1bcKWG5L5ur7kK
 ZYmLYu4+99AhdcURDOqBu9GnJurOsynELmL6InUdUSmx5gD2Hoigw4lESK3C2iychlwV
 /JKP5KoD0huQRJaaaJGalnhiXwsfiqq2lx/RXGM2oKrVktxSDkTp7EUajDNKaZz7s210
 3ao7AxWQ2ebQ09ZD59YaHaAdi/mhmgbtOwNgJTbTaREDqkfmRBJtNLIXmnqz/t98xmQ0
 WHG97zAoc1sqS1UwEgJqC5H3mdZLzzQlX58k5Bz5VAjiVkxTgqkwAST+0Viu5zWs1Pen
 AIFg==
X-Gm-Message-State: ACrzQf3nhCQcKTqK4FmR1XRlCm+q+z3ntfB8/Eg+RJp2I80FL4jlF3oG
 fgZOK3VJ/5Em7w6ViM4rU/GXEfzd3vwwhf+Us9xaqg==
X-Google-Smtp-Source: AMsMyM4y2jlRpqz7QkGFqjWPV/aL2mPv5SarBXlUlMyBieAIgI0zQgUQu/w0lMbSrAJE5S8vky3Ue7qF+wz5T4+1Vx8=
X-Received: by 2002:a5b:a0f:0:b0:691:6fea:deda with SMTP id
 k15-20020a5b0a0f000000b006916feadedamr30106867ybq.377.1665612493341; Wed, 12
 Oct 2022 15:08:13 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Wrogg <cwrogg@umich.edu>
Date: Wed, 12 Oct 2022 18:08:02 -0400
Message-ID: <CAG7Es25Xv=WmA3VbgB2DzMZ7D9XYLe9CAnA3q2mHxiKHONvjcg@mail.gmail.com>
Subject: [PATCH v2] Properly sign extend BBIT branch offset during calculation
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-trivial@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: multipart/alternative; boundary="000000000000ffd8dd05eadda0bc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=cwrogg@umich.edu; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Oct 2022 18:21:44 -0400
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
X-List-Received-Date: Wed, 12 Oct 2022 22:08:22 -0000

--000000000000ffd8dd05eadda0bc
Content-Type: text/plain; charset="UTF-8"

The Octeon specific BBIT instruction incorrectly computes
the branch offset. The 16 bit value is not sign extended.

Signed-off-by: Christopher Wrogg <cwrogg@umich.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1251
---
 target/mips/tcg/octeon_translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/octeon_translate.c
b/target/mips/tcg/octeon_translate.c
index 6a207d2e7e..90f7b105cb 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -38,7 +38,10 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     }

     ctx->hflags |= MIPS_HFLAG_BC;
-    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
+    a->offset *= 4;
+    a->offset = (target_long)(int16_t)a->offset;
+    ctx->btarget = ctx->base.pc_next + 4 + a->offset;
+
     ctx->hflags |= MIPS_HFLAG_BDS32;

     tcg_temp_free(t0);
-- 
2.30.2

--000000000000ffd8dd05eadda0bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The Octeon specific BBIT instruction incorrectly computes<=
br>the branch offset. The 16 bit value is not sign extended.<br><br>Signed-=
off-by: Christopher Wrogg &lt;<a href=3D"mailto:cwrogg@umich.edu">cwrogg@um=
ich.edu</a>&gt;<br>Resolves: <a href=3D"https://gitlab.com/qemu-project/qem=
u/-/issues/1251">https://gitlab.com/qemu-project/qemu/-/issues/1251</a><br>=
---<br>=C2=A0target/mips/tcg/octeon_translate.c | 5 ++++-<br>=C2=A01 file c=
hanged, 4 insertions(+), 1 deletion(-)<br><br>diff --git a/target/mips/tcg/=
octeon_translate.c b/target/mips/tcg/octeon_translate.c<br>index 6a207d2e7e=
..90f7b105cb 100644<br>--- a/target/mips/tcg/octeon_translate.c<br>+++ b/ta=
rget/mips/tcg/octeon_translate.c<br>@@ -38,7 +38,10 @@ static bool trans_BB=
IT(DisasContext *ctx, arg_BBIT *a)<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>=
=C2=A0 =C2=A0 =C2=A0ctx-&gt;hflags |=3D MIPS_HFLAG_BC;<br>- =C2=A0 =C2=A0ct=
x-&gt;btarget =3D ctx-&gt;base.pc_next + 4 + a-&gt;offset * 4;<br>+ =C2=A0 =
=C2=A0a-&gt;offset *=3D 4;<br>+ =C2=A0 =C2=A0a-&gt;offset =3D (target_long)=
(int16_t)a-&gt;offset;<br>+ =C2=A0 =C2=A0ctx-&gt;btarget =3D ctx-&gt;base.p=
c_next + 4 + a-&gt;offset;<br>+<br>=C2=A0 =C2=A0 =C2=A0ctx-&gt;hflags |=3D =
MIPS_HFLAG_BDS32;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0tcg_temp_free(t0);<br>--=
 <br>2.30.2<br></div>

--000000000000ffd8dd05eadda0bc--

