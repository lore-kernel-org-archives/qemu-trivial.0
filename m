Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYVgq-0005EV-Gv
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 00:39:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1TYVgl-0005Dg-Ui
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 00:39:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1TYVgi-0003Sn-Sa
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 00:39:03 -0500
Received: from mail-pa0-f45.google.com ([209.85.220.45]:55571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1TYVgi-0003Sd-Kg
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 00:39:00 -0500
Received: by mail-pa0-f45.google.com with SMTP id fb10so57137pad.4
	for <qemu-trivial@nongnu.org>; Tue, 13 Nov 2012 21:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=6yskgyA28LLcdtI5uJlODBxQLflNGW/4DN2XmBUbJk0=;
	b=l1CzgZpBmHxZU6BB+p6sLl3B14qShWx22lY5Ii2dDa3wFU76EmgH9qRCt7n/9jLdK6
	8I2f5xzFhvk0kT8SjVK+4JlLRsh2zQjCmwcYyL26Vcb5NEuKKgtSyQxuy4Gh4NBqFkFA
	QSlsQCWngMFEv2s7r8iwSlDRPPNa/7P4Xyc0qw8csnCdsU6iA1+8Af45BWz6K8FzvRI6
	6Lzc5WgsfZjP373FvejOv1N974M0zUoTsWjfqxbwsb9TExMn9jRAggPcu52bU2dnL7Lq
	9s/mz0xLo06Yk+Guq1oHrSanD9lQR9ffGBRlHtwEoZpQWe+RSWkrhLipJDQaeYUcCk/M
	90HA==
Received: by 10.68.254.8 with SMTP id ae8mr59997351pbd.46.1352871539205;
	Tue, 13 Nov 2012 21:38:59 -0800 (PST)
Received: from [192.168.0.141] ([114.247.222.194])
	by mx.google.com with ESMTPS id iu8sm7157234pbc.71.2012.11.13.21.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Nov 2012 21:38:58 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Jia Liu <proljc@gmail.com>
In-Reply-To: <20121114024954.GA63683@cs.nctu.edu.tw>
Date: Wed, 14 Nov 2012 13:38:44 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E9C0C71-C831-482F-9555-2CC2088B2F27@gmail.com>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
To: =?utf-8?Q?=E9=99=B3=E9=9F=8B=E4=BB=BB_=28Wei-Ren_Chen=29?=
	<chenwj@iis.sinica.edu.tw>
X-Mailer: Apple Mail (2.1499)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Possible wrong microMIPS opcode encoding
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 05:39:07 -0000

Hi guys,

On Nov 14, 2012, at 10:49 AM, =E9=99=B3=E9=9F=8B=E4=BB=BB (Wei-Ren Chen) =
<chenwj@iis.sinica.edu.tw> wrote:

> Hi all,
>=20
>  While reading microMIPS decoding, I found a possible wrong opcode
> encoding. According to [1] page 337, the bits 13..12 for MULTU is
> 0x01 rather than 0x00. Please review, thanks.
>=20
> [1] MIPS Architecture for Programmers VolumeIV-e: The MIPS DSP
>    Application-Specific Extension to the microMIPS32 Architecture
>=20
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
> target-mips/translate.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index f6fc0c2..01b48fa 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -10385,7 +10385,7 @@ enum {
>=20
>     /* bits 13..12 for 0x32 */
>     MULT_ACC =3D 0x0,
> -    MULTU_ACC =3D 0x0,
> +    MULTU_ACC =3D 0x1,
>=20
>     /* bits 15..12 for 0x2c */
>     SEB =3D 0x2,
> --=20
> 1.7.12.3


try this, it is a example using exist frame.

diff --git a/target-mips/translate.c b/target-mips/translate.c
index f6fc0c2..04b2aae 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -10371,6 +10371,8 @@ enum {
     MFC0 =3D 0x03,
     MTC0 =3D 0x0b,
=20
+    MICRODSP_ABSQ_S_QB_OP =3D 0x04;
+
     /* bits 13..12 for 0x01 */
     MFHI_ACC =3D 0x0,
     MFLO_ACC =3D 0x1,
@@ -10452,6 +10454,9 @@ enum {
     MFLO32 =3D 0x1,
     MTHI32 =3D 0x2,
     MTLO32 =3D 0x3,
+
+    /* bits 15..12 for MICRODSP_ABSQ_S_QB_OP */
+    MICRODSP_ABSQ_S_QB =3D 0x00;
 };
=20
 /* POOL32B encoding of minor opcode field (bits 15..12) */
@@ -11274,6 +11279,14 @@ static void gen_pool32axf (CPUMIPSState *env, =
DisasContext *ctx, int rt, int rs,
             goto pool32axf_invalid;
         }
         break;
+    case MICRODSP_ABSQ_S_QB_OP:
+        switch (minor) {
+        case MICRODSP_ABSQ_S_QB: // ABSQ_S_QB
+            break;
+        default:
+            goto pool32axf_invalid;
+        }
+        break;
     default:
     pool32axf_invalid:
         MIPS_INVAL("pool32axf");

Regards,
Jia.=

