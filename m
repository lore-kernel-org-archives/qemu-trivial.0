Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldU4R-0003M4-51
	for mharc-qemu-trivial@gnu.org; Mon, 03 May 2021 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4J-0003Hi-OP; Mon, 03 May 2021 04:36:43 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4E-0000i7-If; Mon, 03 May 2021 04:36:43 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M7am5-1leITu49bZ-0084Ca; Mon, 03
 May 2021 10:36:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/23] hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
Date: Mon,  3 May 2021 10:36:02 +0200
Message-Id: <20210503083623.139700-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gfatMJYP889OOCgB2QKlHfn7uO9ShSegbRZX37obyyqKxX/sLWJ
 o7jwhhp62frdEOkS8k6ArWwOKnOKIGTuuWA5pnGF8gEARryYsL3h1YlmESUgWRaeRbUXGvN
 bQ6ZU9DA/0QwmhuDmHjO3xg8detWWSXp6sUqSVdZeR34FZeJIEERW/utLqraoIH2XRuGzXw
 VIBZbuO5A4nuX9vgP1fTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D+H5w2tZp8M=:R8KyCY47C57ClaIR3Xew4k
 mVk3PK9L1CIA6ER9aZLsZrKgWDmCLHA5eRugCUeiVKrmAVLSSPZrZUetd6ZepmN9xczM4KgiF
 rkDnTyYkYWqPZ+mZTDFl0bL/jsXYZFB5e0aDvkJL64QcLLib/SDd3Q+onSaHFxKu6Kh23NgkS
 FhAURti9ywfG77w8aB1Z9RzoF83n3KueG+++9kU8YqwuzJzYglWkB39mVLN3BnCNlR8NMFCxd
 UU65CfrCHq/6p6M/0GZZ0McZRsDWMlR1ckIHIAr6mMwo9mMPH0n9z4lImXm/8BVRGUN3xq3ea
 3ZqjMg3vrmIlcnRiYKcZToPon7+FycDyqruExFe3SMB0FTr8yJfZnbzLufZVcwZJaqDGwCZce
 iXA96euc2jTah6mB9gA/Bz/B5p5hvqpZVFLin3r045Uvj4ttCYDhMdKbpsKUMOEKWQnKRrslP
 9V8AC8PJuDrLjO5Jv+7KmdSh0t4FMdW8KIMBVt6PCzuDAK0/ciJHlwOPd8zFLxjgy19SIh+qG
 KujI1i3Ga3oGTAjSSme6HM=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 03 May 2021 08:36:44 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Intel XScale PXA chipsets provide a PCMCIA controller,
which expose a PCMCIA bus. Express this dependency using
the Kconfig 'select' expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210424222057.3434459-2-f4bug@amsat.org>
[lv: remove "(IDE)"]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da74..b887f6a5b17d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -142,6 +142,7 @@ config PXA2XX
     select SD
     select SSI
     select USB_OHCI
+    select PCMCIA
 
 config GUMSTIX
     bool
-- 
2.31.1


