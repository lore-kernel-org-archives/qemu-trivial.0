Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ks8SA-0007k4-Hs
	for mharc-qemu-trivial@gnu.org; Wed, 23 Dec 2020 13:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1ks7cY-0003Os-QJ
 for qemu-trivial@nongnu.org; Wed, 23 Dec 2020 12:08:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1ks7cW-0004iq-Uh
 for qemu-trivial@nongnu.org; Wed, 23 Dec 2020 12:08:18 -0500
Received: by mail-ej1-x633.google.com with SMTP id ga15so114661ejb.4
 for <qemu-trivial@nongnu.org>; Wed, 23 Dec 2020 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vPpVGgcAXL2PwIXst/xwALEt4ZL/m2lP62nRZEdNTzk=;
 b=QKebtpqqU6bnoIRJfyh+txgqqyrbYhLt+EfKJapCuEYp8zJ1EfEN3Wj7qeaz9bYiEf
 RphSZg/Urq23dyi1j2lnj5oUgl+ODu4C7epa1x6d/NCnBCg+cZfnNEO5aLbsbLsOxor/
 KxygXCf1eWGgAm4zNV/Z3q1koJLDCl8ZU+1Wkxjet/P7lA7AG4y81d6DTp8YUpIS06PP
 YQRdzvfHw8JclNIIm+mYRUJucojVWWqGB8AdvxNJo0VViKZBzFowkDAN+8WJjQozzCcB
 HdnQOS4Ng+M82fF6OFdJ0VlYYgG2E66eABQaaF5IrhPekSxJFrf+HQNrC/NLT4ynBcoW
 QOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vPpVGgcAXL2PwIXst/xwALEt4ZL/m2lP62nRZEdNTzk=;
 b=taoiJcDdtI/J54SwkrUPutSVSUIZtozCqtfdXyrY12BSYQ2hB32jmGEm6xUmWextZa
 OdRTkUv1rTQ6rE95Ilufk3cBgXyXHFTfTuZiYim1EomAx4asncSRfCPzhLBgs+3TvC5g
 G5h1YWa37pAG8K3CNT4T6kj/VaQKCq6Oz6GjzkYMil+xtC/T5YvAZ074+XtnwiSOEzpD
 1QC8cEng0g8BiNwJENZdhFmaCt73PDH4QHgdZc+Qr7Nxv5m0VCz6D1CzosOCal8ZEzyA
 HH3db+0YIL1/JPFda1nA5b2/aBRPE6oVpbLCG73DRnwx+t3/+IiAP78/e5GhBTHUaP22
 gBDg==
X-Gm-Message-State: AOAM5325CNrAROnx0TPZvzmF8CGjYgcNLyMTInpRNIuBriN9TirvKXDJ
 rXfnHSdbS+5H2al65YKheLBjkno8diLx0iMQh3A8RKRwx7DYaw==
X-Google-Smtp-Source: ABdhPJzwY9EYddPqWaCzYl/QDof+1FLnay/4Ur5autIFztYquDpswIA2ZTAM6aXdVOrr2sqblGn6GszGDqBwfHUIrkM=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr24883048ejr.482.1608743294813; 
 Wed, 23 Dec 2020 09:08:14 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
In-Reply-To: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Wed, 23 Dec 2020 18:08:03 +0100
Message-ID: <CAOkUe-B9QSMJQdC9VtrF6BAyT987sJ4KD_=1HLKtM8xX46tdow@mail.gmail.com>
Subject: Fwd: [PATCH] gdb: riscv: Add target description
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009f4a2105b724bcbc"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Dec 2020 13:01:37 -0500
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
X-List-Received-Date: Wed, 23 Dec 2020 17:08:19 -0000

--0000000000009f4a2105b724bcbc
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Wed, 23 Dec 2020 at 17:28
Subject: [PATCH] gdb: riscv: Add target description
To: <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, Palmer Dabbelt <
palmer@dabbelt.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, <
qemu-riscv@nongnu.org>, Sagar Karandikar <sagark@eecs.berkeley.edu>


Target description is not currently implemented in RISC-V architecture.
Thus GDB won't set it properly when attached. The patch implements the
target description response.

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 254cd83f8b..489d66038c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -556,6 +556,15 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };

+static gchar *riscv_gdb_arch_name(CPUState *cs)
+{
+    #ifdef TARGET_RISCV64
+        return g_strdup("riscv:rv64");
+    #else
+        return g_strdup("riscv:rv32");
+    #endif
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -591,6 +600,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void
*data)
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
+    cc->gdb_arch_name = riscv_gdb_arch_name;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-- 
2.25.1

--0000000000009f4a2105b724bcbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <b class=3D=
"gmail_sendername" dir=3D"auto">Sylvain Pelissier</b> <span dir=3D"auto">&l=
t;<a href=3D"mailto:sylvain.pelissier@gmail.com">sylvain.pelissier@gmail.co=
m</a>&gt;</span><br>Date: Wed, 23 Dec 2020 at 17:28<br>Subject: [PATCH] gdb=
: riscv: Add target description<br>To:  &lt;<a href=3D"mailto:qemu-devel@no=
ngnu.org">qemu-devel@nongnu.org</a>&gt;<br>Cc: Alistair Francis &lt;<a href=
=3D"mailto:Alistair.Francis@wdc.com">Alistair.Francis@wdc.com</a>&gt;, Palm=
er Dabbelt &lt;<a href=3D"mailto:palmer@dabbelt.com">palmer@dabbelt.com</a>=
&gt;, Bastian Koppelmann &lt;<a href=3D"mailto:kbastian@mail.uni-paderborn.=
de">kbastian@mail.uni-paderborn.de</a>&gt;,  &lt;<a href=3D"mailto:qemu-ris=
cv@nongnu.org">qemu-riscv@nongnu.org</a>&gt;, Sagar Karandikar &lt;<a href=
=3D"mailto:sagark@eecs.berkeley.edu">sagark@eecs.berkeley.edu</a>&gt;<br></=
div><br><br><div dir=3D"ltr"><div>Target description is not currently imple=
mented in RISC-V architecture. Thus GDB won&#39;t set it properly when atta=
ched. The patch implements the target description response.<br></div><div><=
br></div><div>Signed-off-by: Sylvain Pelissier &lt;<a href=3D"mailto:sylvai=
n.pelissier@gmail.com" target=3D"_blank">sylvain.pelissier@gmail.com</a>&gt=
;<br>---<br>=C2=A0target/riscv/cpu.c | 10 ++++++++++<br>=C2=A01 file change=
d, 10 insertions(+)<br><br>diff --git a/target/riscv/cpu.c b/target/riscv/c=
pu.c<br>index 254cd83f8b..489d66038c 100644<br>--- a/target/riscv/cpu.c<br>=
+++ b/target/riscv/cpu.c<br>@@ -556,6 +556,15 @@ static Property riscv_cpu_=
properties[] =3D {<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>=C2=
=A0};<br>=C2=A0<br>+static gchar *riscv_gdb_arch_name(CPUState *cs)<br>+{<b=
r>+ =C2=A0 =C2=A0#ifdef TARGET_RISCV64<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn g_strdup(&quot;riscv:rv64&quot;);<br>+ =C2=A0 =C2=A0#else<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return g_strdup(&quot;riscv:rv32&quot;);<br>+ =C2=A0 =
=C2=A0#endif<br>+}<br>+<br>=C2=A0static void riscv_cpu_class_init(ObjectCla=
ss *c, void *data)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D=
 RISCV_CPU_CLASS(c);<br>@@ -591,6 +600,7 @@ static void riscv_cpu_class_ini=
t(ObjectClass *c, void *data)<br>=C2=A0 =C2=A0 =C2=A0/* For now, mark unmig=
ratable: */<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;vmsd =3D &amp;vmstate_riscv_cpu;<=
br>=C2=A0#endif<br>+ =C2=A0 =C2=A0cc-&gt;gdb_arch_name =3D riscv_gdb_arch_n=
ame;<br>=C2=A0#ifdef CONFIG_TCG<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_initializ=
e =3D riscv_translate_init;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tlb_fill =3D risc=
v_cpu_tlb_fill;<br>-- <br>2.25.1</div><div><br></div></div>
</div></div>

--0000000000009f4a2105b724bcbc--

