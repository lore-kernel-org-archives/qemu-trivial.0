Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrLRG-0003wC-2F
	for mharc-qemu-trivial@gnu.org; Sun, 28 Nov 2021 09:45:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olivier.heriveaux@ledger.fr>)
 id 1mrIyI-0007IX-HH
 for qemu-trivial@nongnu.org; Sun, 28 Nov 2021 07:07:55 -0500
Received: from [2a00:1450:4864:20::32c] (port=50970
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <olivier.heriveaux@ledger.fr>)
 id 1mrIyC-0004rr-SX
 for qemu-trivial@nongnu.org; Sun, 28 Nov 2021 07:07:54 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 133so12299442wme.0
 for <qemu-trivial@nongnu.org>; Sun, 28 Nov 2021 04:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ledger.fr; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQoro6MoOyYUvAaYJa4JACu0dwvVZreQOV6JS13Ptk8=;
 b=O8oFiQ9hBBzTUG3fwHvqRw/rehQB6sfWHINy/iPzv+bnE2OAPQl6iK106Sp9ALyeb9
 lLORORU2R/exVSlwLONfqfpWwL+Kk9HB6E18RgKzpX49tb3qd9H2zW2oDEvPfDLdfw7E
 UHwSaj5eSJp0kQzs8msP/GaTdTsvvxM461KTiQOnJQ/chgfbcY5vj9M9EjyU6k6+QHta
 85RjVXRiGyyiGRU06vhtLyTtwidaubv8MAxx8ajMg8AXzDX/pKYsh8q/8GrOYaEmfiEl
 d94AuQgWVJzwgrn9iV5KTtElto1R0U3aCVl0Ef5adFI8Q+1EkdDAeLbL3RRUfCBEOBmC
 Psqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQoro6MoOyYUvAaYJa4JACu0dwvVZreQOV6JS13Ptk8=;
 b=WEO5tO159Bv7Exb4eBLIOuom8fQA0AzWu8/By+iN8ak3G4KMEs1jLas/wNRP/IF8Yv
 TFT9Lc3BuEs7qFR+Zwzeafhz6qj5fNr2SIrXoaAi9KC/FcxOWUq29m3o277iPIHBjdO4
 KKaDSsXnZxKnfubii5a/VgMN2kzMtBvuy40D9y3IYqBKzjB43EnctD8tHQ05l8vzTY7N
 Fc5XlDnPiBYhdr7Fs+FLwSD45Ttoaxyj+JWVMf5DVIaf9SDfbyG/VFcshjRzA2tkreic
 8HcahWrXe6SybqHQpOzzA/pnHxoTT/lK3Gn0/Yjm5B9pU4oz7ssg+7oCgL+Z+ikpeTCl
 4nHQ==
X-Gm-Message-State: AOAM533mvJlL4pt/sNuLngkpGM/QKazhJkyEjv7OmFrBFeB4CPZIkeGG
 pBdTAuf1TucTKQMCgmCjyw1LsXlkGUGgQs+kL8mL37DJRoYzAAcNNcYCyrWM4JS2We2Q2NOfxhB
 3B5ziOAvOKSo=
X-Google-Smtp-Source: ABdhPJzUiz1it6NzEKL5qyf1c/cyMCSWnpK8b3/lpkvKdeQmiFxAey8i60PE6/9BU8c1KeYnKGjy8A==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr29579780wmi.61.1638101265614; 
 Sun, 28 Nov 2021 04:07:45 -0800 (PST)
Received: from LPPS0075.home
 (2a01cb08019bba004d97cdf5dfbba74f.ipv6.abo.wanadoo.fr.
 [2a01:cb08:19b:ba00:4d97:cdf5:dfbb:a74f])
 by smtp.gmail.com with ESMTPSA id m20sm19183537wmq.11.2021.11.28.04.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 04:07:45 -0800 (PST)
From: =?UTF-8?q?Olivier=20H=C3=A9riveaux?= <olivier.heriveaux@ledger.fr>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 =?UTF-8?q?Olivier=20H=C3=A9riveaux?= <olivier.heriveaux@ledger.fr>
Subject: [PATCH] Fix STM32F2XX USART data register readout
Date: Sun, 28 Nov 2021 13:07:23 +0100
Message-Id: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::32c;
 envelope-from=olivier.heriveaux@ledger.fr; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 28 Nov 2021 09:45:57 -0500
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
X-List-Received-Date: Sun, 28 Nov 2021 12:07:55 -0000

Fix issue where the data register may be overwritten by next character
reception before being read and returned.

Signed-off-by: Olivier H=C3=A9riveaux <olivier.heriveaux@ledger.fr>
---
 hw/char/stm32f2xx_usart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 8df0832424..fde67f4f03 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hw=
addr addr,
         return retvalue;
     case USART_DR:
         DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->usar=
t_dr);
+        retvalue =3D s->usart_dr & 0x3FF;
         s->usart_sr &=3D ~USART_SR_RXNE;
         qemu_chr_fe_accept_input(&s->chr);
         qemu_set_irq(s->irq, 0);
-        return s->usart_dr & 0x3FF;
+        return retvalue;
     case USART_BRR:
         return s->usart_brr;
     case USART_CR1:
--=20
2.17.1


--=20

Les informations contenues dans ce message =C3=A9lectronique ainsi que cell=
es=20
contenues dans les documents attach=C3=A9s sont strictement confidentielles=
 et=20
sont destin=C3=A9es =C3=A0 l'usage exclusif du (des) destinataire(s) nomm=
=C3=A9(s).
Toute=20
divulgation, distribution ou reproduction, m=C3=AAme partielle, en est=20
strictement interdite sauf autorisation =C3=A9crite et expresse de l=E2=80=
=99=C3=A9metteur.
Si vous recevez ce message par erreur, veuillez le notifier imm=C3=A9diatem=
ent =C3=A0=20
son =C3=A9metteur par retour, et le d=C3=A9truire ainsi que tous les docume=
nts qui y=20
sont attach=C3=A9s.


The information contained in this email and in any=20
document enclosed is strictly confidential and is intended solely for the=
=20
use of the individual or entity to which it is addressed.
Partial or total=20
disclosure, distribution or reproduction of its contents is strictly=20
prohibited unless expressly approved in writing by the sender.
If you have=20
received this communication in error, please notify us immediately by=20
responding to this email, and then delete the message and its attached=20
files from your system.


