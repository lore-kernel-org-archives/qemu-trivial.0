Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPpFa-0002eM-7s
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 08:42:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amarkovic@wavecomp.com>) id 1gPp18-0003gU-Kz
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 08:27:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amarkovic@wavecomp.com>) id 1gPp16-0007gD-Ju
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 08:27:38 -0500
Received: from mail-eopbgr710095.outbound.protection.outlook.com
	([40.107.71.95]:22976
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amarkovic@wavecomp.com>)
	id 1gPp0z-00076e-Le; Thu, 22 Nov 2018 08:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FRHLJ/OXDEuPJuRI8mlusNHdD1EEFuJla2wILDbu/F0=;
	b=MJWfYZdyMshh6KnxOIk+ko+Y6j75Z7ZVIWJ1a4D6B3sN09nc2f+NtRKE8go6CKWES65uTT/bB3cs6P2g8v1yCAEWkwZZfgHKl7KC3XZHT4OvpNqZX/JGSyzIQDXT+J+GllURy2g5brLSUVNqEmUpWIAUnr2hdNQVqcWp8O7FIz0=
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com (10.174.81.139) by
	BN6PR2201MB1252.namprd22.prod.outlook.com (10.174.81.140) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.16; Thu, 22 Nov 2018 13:27:11 +0000
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com
	([fe80::7488:a500:daaf:3897]) by
	BN6PR2201MB1251.namprd22.prod.outlook.com
	([fe80::7488:a500:daaf:3897%3]) with mapi id 15.20.1361.016;
	Thu, 22 Nov 2018 13:27:10 +0000
From: Aleksandar Markovic <amarkovic@wavecomp.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
CC: Stefan Markovic <smarkovic@wavecomp.com>, Paul Burton
	<pburton@wavecomp.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	David Gibson <david@gibson.dropbear.id.au>, "qemu-ppc@nongnu.org"
	<qemu-ppc@nongnu.org>
Thread-Topic: [PATCH] MAINTAINERS: Add missing hw/pci-host entries
Thread-Index: AQHUgmOqOcjz+oz7TkCZ4RFtnVyahqVbx9wI
Date: Thu, 22 Nov 2018 13:27:10 +0000
Message-ID: <BN6PR2201MB12510FB3F495AE15BD4E006CC6DB0@BN6PR2201MB1251.namprd22.prod.outlook.com>
References: <1542891760-13937-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1542891760-13937-1-git-send-email-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR2201MB1252;
	6:CXyvEn5bIT4MXeXsaPRHcJjoXj96gOb6FHY4m7ROu3TbRrHhaVFtkQPF/46rhFazbJt1OgE3MTDIPlTP9/mDo9OttG13zgd373JopCOnZYPHeLtMbAnUMzNYib+7lPwHBLjMWBA0RW4tj0ov9Cz6MtH/LV1AZOzvbEHfHDpIx3ZPWsTqE4Zu88SVuvRQOMJvrfdbYB7BjR+TxgWrN9CDA7uscqP4+HoGSrq8+ck6wR5Qo4DUXOqHNVB/FHpAeYlk3GB/851eDKQW4UIRzza+ueOt7dkHSTX/EKIPztAwGe3Ww8OAK6Byvr6NdZUZGAVB36dXt4F+jS1RpwQ7Macozmxw/MJ4QsHyDCXNdlod996mTq56+jMY2QTSwk7leCpQpCQpWhea24VBwQ4qQfVRZ2fMNSV0QHqN6ZxkEId4ULGnbpnc86spE/xJhoTDEsX1PFuryVkTScyKn47a4Cwq0w==;
	5:YlfoQs4yrsEoBsHZXSmMEUNUgkT5dmOlyO2KRjVQv3/+nD8n/U6JknVoz0JGXYkUue3ngRX4nf80CbDvmNKZEBBYUVG9iwjA0Wkn8d+OM1FioPxKn9Y2/+U3+T5kHSWNOuCQCkgn17H0UpzuiUfDkkIAUk1pg+cmgeONLeU7DT4=;
	7:/ekKA5dHEBNpAPIxCBpn3jPQWHNFqD5bdhPJNWIqEVhKbbWaFaCXAXDxRcdVuBpnM4z4ecEl4CHsp4H0mKDQI7W0OFne9dOrdM0awDM7tY4rKvw3KcKqS0n1BQX8luA10loKSSDqklyftcPuDcUq9A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10019020)(346002)(366004)(396003)(136003)(376002)(39840400004)(189003)(199004)(97736004)(66066001)(8676002)(508600001)(6246003)(25786009)(4326008)(68736007)(106356001)(105586002)(71190400001)(7696005)(71200400001)(26005)(55236004)(6506007)(53546011)(102836004)(8936002)(86362001)(186003)(6436002)(81166006)(81156014)(76176011)(2201001)(99286004)(256004)(14444005)(486006)(316002)(229853002)(5660300001)(33656002)(74316002)(476003)(11346002)(446003)(7736002)(305945005)(14454004)(3846002)(2900100001)(2501003)(6116002)(9686003)(2906002)(53936002)(110136005)(54906003)(55016002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR2201MB1252;
	H:BN6PR2201MB1251.namprd22.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 599d792f-460c-4fdf-259f-08d6507e3520
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR2201MB1252; 
x-ms-traffictypediagnostic: BN6PR2201MB1252:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=amarkovic@wavecomp.com; 
x-microsoft-antispam-prvs: <BN6PR2201MB1252D99BC4B428FE9D938EDCC6DB0@BN6PR2201MB1252.namprd22.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231442)(944501410)(52105112)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(2016111802025)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6043046)(201708071742011)(7699051)(76991095);
	SRVR:BN6PR2201MB1252; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR2201MB1252; 
x-forefront-prvs: 0864A36BBF
received-spf: None (protection.outlook.com: wavecomp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Y7sFgyQLLukAnMRxqYnHzOPdfQZ6tY3/84GCzqIBxeLjKUyd/JDsG6Ke9KTf1RBHLx/d2D8MqU0l3EEF07abZoGXajiqV+mgTZ6311dhVAjo78V8AHDS9Om5So3l+cMavBLKtSdtKqx5qJjZuFNc691ItLJARyKZYjZTN8Yw8ivxMbY20ZxtTKC67FQk9BEmZaFCl+JxZPLl7dQq8b3N7BGEQnaMC7sXaP9k7EflDJSFx0L6BoDjY8f7lGOg+E/UCZBmkgKq9QDPfoXhUIyoQc/j/QzwoSPu+rwitlm+DQ7b2IV82kDn4QtvqDp/ge6ikfBqNmjk5NkbQmHUMzKIpcxuZwoGmshFjdzMREyLLW0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599d792f-460c-4fdf-259f-08d6507e3520
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2018 13:27:10.4332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1252
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.95
X-Mailman-Approved-At: Thu, 22 Nov 2018 08:42:33 -0500
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add missing hw/pci-host
 entries
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
X-List-Received-Date: Thu, 22 Nov 2018 13:27:39 -0000

Thomas wrote:

> Bonito belongs to Fulong-2E, Sabre belongs to Sun4u, and Mac-Newworld
> and Mips-Boston were missing the header files.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

For MIPS bits and pieces (Fulong-2E and Boston boards):

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

For others:

Acked-by: Aleksandar Markovic <amarkovic@wavecomp.com>

THANKS!

________________________________________
From: Thomas Huth <thuth@redhat.com>
Sent: Thursday, November 22, 2018 2:02:40 PM
To: qemu-devel@nongnu.org; qemu-trivial@nongnu.org
Cc: Aleksandar Markovic; Stefan Markovic; Paul Burton; Mark Cave-Ayland; Da=
vid Gibson; qemu-ppc@nongnu.org
Subject: [PATCH] MAINTAINERS: Add missing hw/pci-host entries

Bonito belongs to Fulong-2E, Sabre belongs to Sun4u, and Mac-Newworld
and Mips-Boston were missing the header files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6522621..46a5581 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -876,7 +876,7 @@ R: Stefan Markovic <smarkovic@wavecomp.com>
 S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 F: hw/isa/vt82c686.c
-
+F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h

 Boston
@@ -886,6 +886,7 @@ S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
 F: hw/pci-host/xilinx-pcie.c
+F: include/hw/pci-host/xilinx-pcie.h

 OpenRISC Machines
 -----------------
@@ -938,6 +939,7 @@ F: hw/nvram/mac_nvram.c
 F: include/hw/misc/macio/
 F: include/hw/misc/mos6522.h
 F: include/hw/ppc/mac_dbdma.h
+F: include/hw/pci-host/uninorth.h

 Old World
 M: David Gibson <david@gibson.dropbear.id.au>
@@ -1029,6 +1031,8 @@ M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc64/sun4u.c
 F: pc-bios/openbios-sparc64
+F: hw/pci-host/sabre.c
+F: include/hw/pci-host/sabre.h

 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
--
1.8.3.1


