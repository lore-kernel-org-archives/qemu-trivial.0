Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAL4I-0007tJ-Gu
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 16:26:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gAJdU-0005B5-W4
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 14:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xypron.glpk@gmx.de>) id 1gAJdU-00068s-5k
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 14:55:08 -0400
Received: from mout.gmx.net ([212.227.15.18]:38343)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <xypron.glpk@gmx.de>)
	id 1gAJdP-00066Q-Li; Wed, 10 Oct 2018 14:55:03 -0400
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx003
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0M54L0-1fkY1K207y-00zIO0;
	Wed, 10 Oct 2018 20:55:00 +0200
Received: from LT02.fritz.box ([95.222.187.17]) by mail.gmx.com (mrgmx003
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0M54L0-1fkY1K207y-00zIO0;
	Wed, 10 Oct 2018 20:55:00 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Wed, 10 Oct 2018 20:54:45 +0200
Message-Id: <20181010185445.10290-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iXB/pkhqGiuNR5s7f7RQ0Xvcvfs144WPqFWeYZHecig6XrVMdwl
	dgmdwBAA1MeuWRWuNN3Muw6jtJRsW/PUIDJ4igzQcE6Cloi1VyM6SbH+IYxz2e1l0cfgL21
	ss4HonjVZvTOYIJhI2lBgLDl7Nn+mEQ8r1kmjMCYP3qCmDEg49ZRL0X/oqxkPBjbn/SuStB
	ro+4pYPBjaEJLd3ovzigg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:BbKaM8EdanY=:i9FC5WB7QOpwTGlKAL1Cs1
	XOSc8n3T2UI3V3aJdHM0prv2FPa+8mJGQEinhSDgOFzZyN/AJKUab/URBhwTww4EaI2QK9udt
	p3culn8iMwOQeo4G5u44FH+8Rt6aCLX0VNgEMHjiUXkElad0RNKIgypWwdbCYrcjPGsmPs4Z8
	RsuvL2Bit0dwFAkHT1UoV/ZeZ+rFSmhTCItksa/UWc81N6fVAOGEpByy54HX4kHxPpJOeP9xf
	g0BwHslhl7MUMIkz9lnT2hDXyug2anvib6PknOf0nR/4POuhMA+ufSRwwFizvPxuALv8uU2T5
	LayaS33DX96J4zQHUcIeNSzFTwXEK6g7xaX5MYSwxRR992KnVAX/Jru4qxwjms/EBNYiu0UAD
	i0OSrjZ+CCSj+tCmyXZPJedPbh+aLY9ULV0CBLAP8yG1xGRzxg5nqaUfSkrnmig9V9FUCfbEe
	PXL7IQnOyKjVhL85K30G1GDM5/9nw5qd/666a+QWhfC9n8dszWDLNJQH+GphV69yHKnAu+3f8
	q23SzJeED/Ccedv0iQi9eo2wucCSxkgVNMoVOm5kg9wGMOv54gCiPmMJF9HHHW8HaXmRt+hkJ
	0hOK5aZehpbzd5P+FVq4CENLvju6GRR+ofedbTXXIt+nmnu5u/JuII6j8gBAKXXU3L6WguWY7
	gQ4q7Q+mUVuWWfgHaLXrYEu1uxaTMFJf+dSl8kZZGMa5bcMHGKPvxQ4Nl7UqlZBk8Obuw0/5+
	f90Ga3dZyfxnESm2y7LfkQ+DTYMjp/W94O1Yf2ZcW0G4InsdilcFrx5FNMBOMZe+tVofLomvU
	it2nAhvtL8IhJrdUR/A2TZDnPylTw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.18
X-Mailman-Approved-At: Wed, 10 Oct 2018 16:26:53 -0400
Subject: [Qemu-trivial] [PATCH 1/1] hw/arm/virt: provide a model property in
 the fdt
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
X-List-Received-Date: Wed, 10 Oct 2018 18:55:09 -0000

Device trees in the Linux kernel generally provide a model property. Some
software like the Debian flash-kernel package rely on this property to
identify boards.

The patch sets the model property for the virt boards to 'QEMU virt'.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
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
+    qemu_fdt_setprop_string(fdt, "/", "model", "QEMU virt");
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-- 
2.19.1


