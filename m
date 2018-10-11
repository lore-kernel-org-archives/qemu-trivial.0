Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gARzo-0003qt-AP
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 23:50:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gARzm-0003qD-5E
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 23:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gARzl-000566-EU
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 23:50:42 -0400
Received: from mout.gmx.net ([212.227.17.21]:35263)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <xypron.glpk@gmx.de>)
	id 1gARzh-00051C-5O; Wed, 10 Oct 2018 23:50:37 -0400
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx103
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0MTBfe-1gHZYl49xO-00S7lL;
	Thu, 11 Oct 2018 05:50:34 +0200
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx103
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0MTBfe-1gHZYl49xO-00S7lL;
	Thu, 11 Oct 2018 05:50:34 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Thu, 11 Oct 2018 05:50:26 +0200
Message-Id: <20181011035026.23517-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010185445.10290-1-xypron.glpk@gmx.de>
References: <20181010185445.10290-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l2Oz9NoUti0aOdNumimRmZqmqde0CJJPl2babal3cETfPOT49Ag
	UbPx1MnvwgwL1WT3uQ/WsMQb8nCdspxTaSw/O6vIDNOtnulByNRMK4xu8snUOz4HShUge7V
	SIi9ZSiZvlydYyAy5YDj0F7a5ZVpXEQQHHsKTnmFin9WUfLW4G6UsEtFw8C+FJkSqERWUHx
	y9sgP/rcjwDYtKdadjI1w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:zJzduwCZSLs=:+gyVEpeVnOLP7yqshNwsOM
	ldoS/djttjVvsYI3GX3214MPvMMCcB1UiS6dly8sh43b7tkaP3uEtuU7ujgiA6j64Yk5tuPQz
	gQU/7LgYzq8PJ7oISLAabEMUZzN/l2Er2sGTYkd5BSbCxxqgYoQgsg+qFa5ZWDe89gSFTR1OG
	M1Th4TdCVeiRMpubrFyabdkPoW2k+y57df+9XOYO/5yNRyHhe6AOZmyMa/SkH9vXtWIqpuf5f
	hz/BqsCMDwt96uC5pmYKHUIaYxajtO7XXhMA3xj4ApMGVzCRFNQExcdnONhA8tF6EYXIUzcOB
	WWBoyqiCqAneZ34n22fyh/kPY5FuBaSo+hy84/QEZM0OauY604Qkh8cXcu+bNCP02lGrDdX+O
	aT2zSTwfvuyci+osymvZgJkKrvG8ayiNaDYyx+cE6ZGCsMH5b0YmdVHf+7LsbD/54Rq7fanZO
	Ock74E6ebnY4rgUS2MX/+ruQNb305wrVBhKU7rkv4s8qRg43suWqn4vBhkZKodlDgx8beNBon
	E46Qi5JTAXIFz92Po2bOLC21XqrcjxjABEqMiR6UJOYauGauPwHuP+ycjjs6ztFYvH9bNp89G
	Nve8tcZa+nVp52CB0csefB2ATeFTqjhppUrXShdTDzDARlwss8drCI0Ey0suLVrpIc1Nr60Ol
	hyGYEZpgKmP6MB3OGXERIfpUfBaw4014qlRGrJSUmtMjddNJsQ0FDWPCp6Qoum+cOVnZPizSh
	xtLpbcztLCi08yVUjtb1BK4P0vXhpMvJstdSjn5RfGH4JRm2TXoNAI+yu40XnnCngCKl5Gzw8
	D1/Mjm/QGeE+BYlJQWcFniUgggcXg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.21
Subject: [Qemu-trivial] [PATCH v2 1/1] hw/arm/virt: provide a model property
 in the fdt
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 03:50:42 -0000

According to the "Devicetree Specification, Release v0.2" 'model' is a
required property of the root node.

Some software like the Debian flash-kernel package rely on this property
to identify boards.

The patch sets the model property to 'qemu,virt'.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
v2
	use the recommended format of the model property
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e..abe366895a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -200,6 +200,7 @@ static void create_fdt(VirtMachineState *vms)
     vms->fdt = fdt;
 
     /* Header */
+    qemu_fdt_setprop_string(fdt, "/", "model", "qemu,virt");
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-- 
2.19.1


