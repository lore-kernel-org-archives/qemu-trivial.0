Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRi9H-00065y-4s
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:27:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9F-000605-0b
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9B-00050T-Uf
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:16 -0500
Received: from mail-by2nam03on0079.outbound.protection.outlook.com
	([104.47.42.79]:36096
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9B-0004yS-Hi; Wed, 20 Dec 2017 12:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SAU8KHrWu6isb/pU4c0j0MFJrsWqwZd9KdqMJnzWvWo=;
	b=4SP1zvzEzcrJI0UAAcVLZiCMVViTze+qx1fVdw3YozL1s+ORFzGbWBYljWRFzoN0lfg3XKV2rQRpWFcQBhoZfqLbEUHQJAb+NBNQNxW+KJtGG2MfXmZeP/oKHa4KF00DIt+QMneKUmS71Atqku+mxTTvl9B8Dt38Iy3F+uYnhUs=
Received: from MWHPR0201CA0054.namprd02.prod.outlook.com (10.167.160.31) by
	CY4PR02MB3384.namprd02.prod.outlook.com (10.165.89.155) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 20 Dec 2017 17:27:10 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by MWHPR0201CA0054.outlook.office365.com
	(2603:10b6:301:73::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48429
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi96-0003pz-Su; Wed, 20 Dec 2017 09:27:08 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi96-0003UF-QT; Wed, 20 Dec 2017 09:27:08 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHR5C2008088; Wed, 20 Dec 2017 09:27:05 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi93-0003Ss-Dp; Wed, 20 Dec 2017 09:27:05 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:22:49 -0800
Message-ID: <cover.1513790494.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39850400004)(376002)(346002)(396003)(2980300002)(438002)(199004)(189003)(4326008)(39060400002)(106002)(54906003)(2906002)(77096006)(6666003)(47776003)(110136005)(5660300001)(316002)(81166006)(8676002)(50226002)(81156014)(8936002)(9786002)(356003)(5820100001)(2870700001)(478600001)(50466002)(36756003)(7696005)(36386004)(23676004)(106466001)(305945005)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3384; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT034;
	1:QqknXOX++yaPoHauKXmZw2jOL77WcpdaRp3kuv8BsDj6Lv0MuYs6yys/19uwjb57w9E6VyJA6n5CnKK+mSDsFrOmHj4ScVsc76q8g35BBKrlt5bc5YE4LsnURRi6FmXv
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 006e72c5-ea54-4116-5139-08d547cee6ad
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	3:D5SlNM2A+amobv/A7sDilsQY4sfNSnfVZcHQSB0dT2xneQadSTXJtLcmvRA03brnJmLIj+AgbovFQApnmxwzVgdTcVQOBf144lBBFBYwAfcuD/Bae3+XM+VGCJwEltcu+MOfu0+Rh+n6MTZYJImwwJ10tzS6EjkKmBCwqdFRuzRLNRcbKJhrNKO4CsKZW3EK3HQVxmN6KarSt4l8y04O6cXL9qCJEoUZO/EtgDyGwR59PEEHNaJXGSQlxcZOhsHnASIGt4od/C6D9AThVhliRgmmigs2P8hI95cmpOzT4nRscy/TfB+uZhIpWEysNJ4ruRfhtphvBXauKQwTEN0xFpHb7OZfDyy4QSFDuB0c2aM=;
	25:GNJjGWtiIeN0Jj1zcg8eF+W55zljtYbDJ24mnD0SvNEdiYGekZb9922q0x48MElqmrTjEN/oPN/XDGp7y4gry0PUzVSbVnvy5D1JuRG+3JvA+lGyupdKWs/w4CbHe/ecm95TLuIZIqzE6yK6jC+fSAdFz7SzbNno/fZj0ZGo4OJ/BddyxI5hqpNhUue0a0tI2da4pRwFh3WS0ci+nF6HeSnCfDg+YGhc5lUcED1/JaUuow65BWLtNGS2kizn+Xqg1uV8glicDr3k60DzuWZ+4gdQyB8y8cP8jFDWuVQsj6DN1Tx/TabJgYrWx+c7p2/KERyNlM7jj7e1dTtt8zlj0A==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	31:TPuVXDR1r9zGTf0OST0Ssv3u7cc/PzRY6wqYVXskcGfMuBa2z56ZhVYHjxJnIDB3n1mndQZKSL3AKdbIgrOxuK67TlFi9AbgThQ+bDGxobOXSh23ROJHno+SEqRwI6UMMv0y9e36Bul4hXIsueGtPnNZ+OtqHUhsnzJZInABiGzuF2LFp6nz+Y8HfuJuUYg5BL2GMsRjOshBFwn90vt/BWZNxE9x80Y5Bf/MitAzQv0=;
	20:9HnEWjb/4YbXLZpbs95Gm62YDHkN2Ylf3SAwZMI4NnuYKgYACiw6aLJrE29hvwWmNLwQZEjPBUdlS9ksJHVSZZuD3lBS9/EfdLp/twbBMuOknJImq0XBxe1XO1qwk4XbzFLFmN/Bz9F3ho7nYd/WQy5DJVo/5hoY/yE8Qx0Igk0Btn+C/uVKuJ5FgIQ9C4UiHQ/KH43+Y04gUk2xjQTtL6SqmZc4YFRDOLdjQOrmYLOO2VpkB0UHLMNFN2W/CD/ugJb52TaMPZo5w+Gqq6NhpQQeuOmQ4gavbAJsGwbsgWbfJjJRZsA3k99PmLn5aDEhs4pwLSmDK9gNuHfYOR1BphMgAjfuOYy6vrRM1GK9aIkSB70RDNA3nbujlt9bJ9+Uk/GyaZihlxe2Kh41NBZfIiC9+GVvvqRqSmnbc1GrknF9UZ0+I78FS60j8QPrhVgvejy1pnphhMYA/WtPiRy1zO9pNId7Qcj1ypvHdHcHRfQblEe2PYkAf81lwrHcQe0u
X-Microsoft-Antispam-PRVS: <CY4PR02MB33845B0830E09FCBBF4F52ACDC0C0@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231023)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR02MB3384; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	4:IRi/DGO72Z8xU1lPwkygqFaUC04vTCSwXUEootSqN39DtfWFBhu9eBZ/IvyoXso3Psr4qhCGzM9JsoDRpVCqrJ5JD+Vg3BDZ+ffitW4HZGhPx52P8cxkO7jr5u9sIfwR992mrOPBolp5i3O855ALWakb5YkgqwaRMxAm1aEyLyBsehdSG8Or93NELIWJ4xzhnrS1AcPY1GhnliubsZP3PPZTN2Cugv1zvFxjl9lc4Ma897bbfhbiRRyc+baHjglKeonu/gl3wUbfNc/DwtpFfLQcDB+s8RNcENlFMYA0j4v0T95A6tF2P1fNqhFdUX4G
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3384;
	23:+JKXbQ9d7Do03KGgeUrleTlOP8PIrqvMKmNzhNKrg?=
	=?us-ascii?Q?S6XYsP+DrcOi/MyYdE206712KRoGEkTHdENN+/UmKtCYUEj0Am9TvmmgwlXI?=
	=?us-ascii?Q?CXm9wE2hlo32+zzCB7TtGbmf7rqsKrb9v3lJbO3Pr2whgYnghlaCHRfx8D41?=
	=?us-ascii?Q?RyfctIbhzabuLogM83fmdpE7kvuN1FAiEh7tuaDbF1b0ngA3cmU304o0VdmF?=
	=?us-ascii?Q?0X823jknA/54/xREO4j+8MQTlWx7dkxjw8ZpQsECtwcnmCgUG3iJ7Y5qzM2B?=
	=?us-ascii?Q?mZ8TS6FB+hQfOdtzvqw8ukpwKXXQaCCH6m/LOt8hZZEpgHGmYZuNLOYUnG5Q?=
	=?us-ascii?Q?8nCbUCSpQZ0YEH8ahY1n5LwokvLMtd+5ezK7P/pI05UXoyrBt3LlZnKavm4u?=
	=?us-ascii?Q?Per4qRKIUuy4QuVv1ChOOSdu5FKSG69ZmeDSuxb3FpmljXLeRjF1Oa46Zrdy?=
	=?us-ascii?Q?vlcbOSMP8wF1g39WNG951OxUB96692i50Ytt+H+hZyv1cgdhcjK9hteatv2w?=
	=?us-ascii?Q?Akwow+/flzKtOOaeNJmBddrdB+TvLyDnGiRcfkLeyQnflSVaSZ+Xklf0JWeC?=
	=?us-ascii?Q?NMAmHaz8nbCdwTWdOXonX8FuWV0hySvwhHpTBsI80e4FPzrKBGvc8CnROSBk?=
	=?us-ascii?Q?mpzVbW1K4bHzju/12efUCll0VW5iSmmcNr388T6N2prk4qNBqSL3/TXtr0jv?=
	=?us-ascii?Q?qYHyI8oeaWieWNucuHgs1N604eBegr2wsTONuQGjwGN9XHoFPGwMd2hGq8pf?=
	=?us-ascii?Q?hEoZSeyORrzW68rMR9fd24ooRiwgzz2vm/wkMhRiYW2IbHTmohkA0HHopgnD?=
	=?us-ascii?Q?G0ViZMs7R2PZtaP0jfwjUCtiKaCAa6djRcmJol7RogVMuYZ2R5ggYTdHA9vP?=
	=?us-ascii?Q?URMdG/Q4d92fBQwCiJ54MJxpimZM4ozqw/PWyrDEvuN28rCHkyHhhguL/vdQ?=
	=?us-ascii?Q?jlQxKgFdOVys9ZpjbrqIzg/aJoIh/Xsmqva1po3Tg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	6:kk64Jo/K8yjynguWDReqdyPuqp2x/Fsl4QdWndtHu702foQ8tmlGc8J22RTtdJ6aehLENT8kevzysCYe8UUQDBFrbAwc03S/4pkoTpVra4Vc8UVLHSNVzAnupu7Cl9G178jZ1O96qs6ITBYWCXk7bONlqBOPxHPfcHYvYS2VxbLa8BJ2tX9stNgGQozkCtrbutgSSBvpb3gWMliHBWFsIdD1q9QFqPIrRAbE6JnXQIwqi/smc3RIMJaecOLVHow5OasUT2fOs5pOhUVf/eV6Yp0Aiq2FUqGT93zAOAc7bc8RshnnfmpGin1zbecUZxvjORMVyw4Pe5U+F1Bah8X6ODSLzVipzR6lXk/1VVAKhkU=;
	5:qZ+shPVyq5rwZ09u0CmBZBhR5O2tSNfipKgLRGo/fMtAO0HqeIHV1zDT3+G21q1FcCZjL1SI/fp/joGoSzBeCfKL4h0wAicgMefG6wAtbOkunVGQxJo9ivjapS0Nj0ZbdgYJiIKr0VG/uON5CT2HU+IOK4ySP8SmZUyOyrnGxBY=;
	24:y78sNgij9uMgrDUX/frzMFAkQ3LCmAC053RCipkBOZ2662Gmy5bCrpc1yZ0KzAnFT9wUoggngCul9X+a0PoJWzeVIOSBN/CFkfxH782Wivo=;
	7:iFwhjEqmvWUF+69M84pECovLdWdTabeuqUm5soUDplRViMQmTBSFqsVSaHsDYR/rM3fxhzrUf+kN5HKChcf1iWZodmi0gDNTrjX5wxebSYg4huBq/HI6zCg9jTvndt3fe893Pats8Z1Yb2zwMLkJsuCi7sQtCzb3rdUYAw8ftvl6FadGyaxT6G7LWr8S3CFlhzvuvbxYvP2GfIrYxvqINB1RAbELIAsWfcM4YrJjT9xqT93bS92Zoohw9NDQl4hm
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:09.8308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006e72c5-ea54-4116-5139-08d547cee6ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.79
Subject: [Qemu-trivial] [PATCH v6 00/29]  Remove some of the fprintf(stderr,
 "*
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
X-List-Received-Date: Wed, 20 Dec 2017 17:27:18 -0000


This is a smaller version of my original series, to hopefully get
something merged (although it's getting late for 2.11 now).

Continue on improving QEMUs logging/error messages by removing more
fprintf()'s.

Unfortunatley my Coccinelle skills aren't that great so it's all done in
some nasty regex and a little bit of manual work.

V6:
 - Indentation fixes
V5:
 - Small fixes
 - Remove a lot of patches
V4:
 - Reorder patch 3 (the audio func patch)
 - Add all tags
 - Small fixes
V3:
 - Rebase
 - All sorts of style fixes
 - Remove "qemu: " prefixes from print messages
V2:
 - Fix build issues
 - Drop block patches
 - Split the hw patches into subdirectories
 - Remove AUDIO_FUNC macro as well
 - Add some __FUNCTION__ rename fixes in a seperate patch
 - Create a qemu_log() conversion patch for target/



Alistair Francis (29):
  audio: Replace AUDIO_FUNC with __func__
  Replace all occurances of __FUNCTION__ with __func__
  Fixes after renaming __FUNCTION__ to __func__
  hw/arm: Replace fprintf(stderr, "*\n" with error_report()
  hw/dma: Replace fprintf(stderr, "*\n" with error_report()
  hw/gpio: Replace fprintf(stderr, "*\n" with error_report()
  hw/i2c: Replace fprintf(stderr, "*\n" with error_report()
  hw/i386: Replace fprintf(stderr, "*\n" with error_report()
  hw/ide: Replace fprintf(stderr, "*\n" with error_report()
  hw/intc: Replace fprintf(stderr, "*\n" with error_report()
  hw/ipmi: Replace fprintf(stderr, "*\n" with error_report()
  hw/isa: Replace fprintf(stderr, "*\n" with error_report()
  hw/lm32: Replace fprintf(stderr, "*\n" with error_report()
  hw/mips: Replace fprintf(stderr, "*\n" with error_report()
  hw/moxie: Replace fprintf(stderr, "*\n" with error_report()
  hw/nios2: Replace fprintf(stderr, "*\n" with error_report()
  hw/nvram: Replace fprintf(stderr, "*\n" with error_report()
  hw/openrisc: Replace fprintf(stderr, "*\n" with error_report()
  hw/pci*: Replace fprintf(stderr, "*\n" with error_report()
  hw/ppc: Replace fprintf(stderr, "*\n" with error_report()
  hw/s390x: Replace fprintf(stderr, "*\n" with error_report()
  hw/scsi: Replace fprintf(stderr, "*\n" with error_report()
  hw/sd: Replace fprintf(stderr, "*\n" with error_report()
  hw/sparc*: Replace fprintf(stderr, "*\n" with error_report()
  hw/ssi: Replace fprintf(stderr, "*\n" with error_report()
  hw/timer: Replace fprintf(stderr, "*\n" with error_report()
  hw/xen*: Replace fprintf(stderr, "*\n" with error_report()
  tcg: Replace fprintf(stderr, "*\n" with error_report()
  target: Use qemu_log() instead of fprintf(stderr, ...)

 audio/alsaaudio.c               |  4 +--
 audio/audio.c                   | 40 +++++++++++++--------------
 audio/audio_int.h               |  6 ----
 audio/audio_pt_int.c            | 28 +++++++++----------
 audio/audio_template.h          | 26 +++++++++---------
 audio/dsoundaudio.c             |  2 +-
 audio/mixeng.c                  |  2 +-
 audio/ossaudio.c                | 10 +++----
 audio/paaudio.c                 | 56 ++++++++++++++++++-------------------
 audio/sdlaudio.c                |  2 +-
 audio/wavaudio.c                |  2 +-
 cpus.c                          | 10 +++----
 exec.c                          | 20 +++++++-------
 hw/arm/armv7m.c                 |  2 +-
 hw/arm/boot.c                   | 37 ++++++++++++-------------
 hw/arm/gumstix.c                | 13 +++++----
 hw/arm/mainstone.c              |  7 +++--
 hw/arm/musicpal.c               |  2 +-
 hw/arm/nseries.c                |  2 +-
 hw/arm/omap1.c                  | 49 ++++++++++++++++-----------------
 hw/arm/omap2.c                  | 23 ++++++++--------
 hw/arm/omap_sx1.c               |  8 ++----
 hw/arm/palm.c                   | 20 +++++++-------
 hw/arm/pxa2xx.c                 | 53 +++++++++++++++++------------------
 hw/arm/pxa2xx_gpio.c            |  6 ++--
 hw/arm/pxa2xx_pic.c             |  4 +--
 hw/arm/stellaris.c              |  3 +-
 hw/arm/tosa.c                   | 26 +++++++++---------
 hw/arm/versatilepb.c            |  2 +-
 hw/arm/vexpress.c               |  8 +++---
 hw/arm/z2.c                     |  6 ++--
 hw/audio/hda-codec.c            | 10 +++----
 hw/audio/intel-hda.c            | 28 +++++++++----------
 hw/audio/wm8750.c               |  4 +--
 hw/block/nand.c                 |  4 +--
 hw/block/onenand.c              |  8 +++---
 hw/bt/core.c                    | 10 +++----
 hw/bt/hci-csr.c                 | 14 +++++-----
 hw/bt/hci.c                     | 26 +++++++++---------
 hw/bt/hid.c                     |  2 +-
 hw/bt/l2cap.c                   | 22 +++++++--------
 hw/bt/sdp.c                     |  6 ++--
 hw/display/blizzard.c           | 18 ++++++------
 hw/display/omap_dss.c           |  6 ++--
 hw/display/pxa2xx_lcd.c         | 14 +++++-----
 hw/display/qxl-render.c         |  6 ++--
 hw/display/qxl.h                |  2 +-
 hw/display/tc6393xb.c           |  2 +-
 hw/display/xenfb.c              |  2 +-
 hw/dma/omap_dma.c               | 38 +++++++++++++------------
 hw/dma/pxa2xx_dma.c             | 14 +++++-----
 hw/dma/soc_dma.c                | 36 ++++++++++++------------
 hw/gpio/max7310.c               |  8 +++---
 hw/gpio/omap_gpio.c             |  2 +-
 hw/i2c/omap_i2c.c               | 10 +++----
 hw/i386/kvm/apic.c              | 15 +++++-----
 hw/i386/kvm/clock.c             |  7 +++--
 hw/i386/kvm/i8254.c             | 11 ++++----
 hw/i386/kvm/i8259.c             |  5 ++--
 hw/i386/kvm/ioapic.c            |  5 ++--
 hw/i386/multiboot.c             | 21 +++++++-------
 hw/i386/pc.c                    | 24 ++++++++--------
 hw/i386/pc_piix.c               |  2 +-
 hw/i386/pc_sysfw.c              |  4 +--
 hw/i386/xen/xen-hvm.c           | 34 ++++++++++++-----------
 hw/i386/xen/xen-mapcache.c      | 12 ++++----
 hw/i386/xen/xen_apic.c          |  3 +-
 hw/ide/ahci.c                   |  6 ++--
 hw/ide/core.c                   |  3 +-
 hw/ide/microdrive.c             |  4 +--
 hw/input/lm832x.c               |  6 ++--
 hw/input/pxa2xx_keypad.c        |  6 ++--
 hw/input/tsc2005.c              |  8 +++---
 hw/input/tsc210x.c              |  4 +--
 hw/intc/arm_gic_kvm.c           | 12 ++++----
 hw/intc/omap_intc.c             |  4 +--
 hw/intc/openpic.c               |  1 +
 hw/intc/openpic_kvm.c           |  8 +++---
 hw/intc/s390_flic_kvm.c         |  4 +--
 hw/ipmi/ipmi_bmc_extern.c       |  5 ++--
 hw/isa/isa-bus.c                |  7 +++--
 hw/isa/vt82c686.c               |  2 +-
 hw/lm32/lm32_boards.c           |  7 ++---
 hw/lm32/milkymist.c             |  7 ++---
 hw/mips/boston.c                |  4 +--
 hw/mips/gt64xxx_pci.c           |  2 +-
 hw/mips/mips_fulong2e.c         | 13 ++++-----
 hw/mips/mips_jazz.c             |  4 +--
 hw/mips/mips_malta.c            | 16 +++++------
 hw/mips/mips_mipssim.c          | 11 ++++----
 hw/mips/mips_r4k.c              | 18 ++++++------
 hw/misc/cbus.c                  | 12 ++++----
 hw/misc/omap_clk.c              |  4 +--
 hw/misc/omap_gpmc.c             |  6 ++--
 hw/misc/omap_l4.c               |  4 +--
 hw/misc/omap_sdrc.c             |  2 +-
 hw/misc/omap_tap.c              |  6 ++--
 hw/misc/tmp105.c                |  2 +-
 hw/moxie/moxiesim.c             | 14 +++++-----
 hw/nios2/boot.c                 |  2 +-
 hw/nvram/eeprom93xx.c           |  7 +++--
 hw/nvram/fw_cfg.c               |  4 +--
 hw/openrisc/openrisc_sim.c      |  4 +--
 hw/pci-host/bonito.c            |  8 +++---
 hw/pci/pci.c                    | 12 ++++----
 hw/ppc/e500.c                   | 28 +++++++++----------
 hw/ppc/mac_newworld.c           |  2 +-
 hw/ppc/mac_oldworld.c           |  2 +-
 hw/ppc/mpc8544_guts.c           |  7 +++--
 hw/ppc/ppc405_boards.c          | 15 ++++------
 hw/ppc/ppc440_bamboo.c          | 27 +++++++++---------
 hw/ppc/ppc4xx_pci.c             |  3 +-
 hw/ppc/prep.c                   |  4 +--
 hw/ppc/virtex_ml507.c           |  9 +++---
 hw/s390x/virtio-ccw.c           |  5 ++--
 hw/scsi/lsi53c895a.c            |  4 +--
 hw/scsi/spapr_vscsi.c           | 61 +++++++++++++++++++++----------------=
----
 hw/scsi/virtio-scsi-dataplane.c |  7 ++---
 hw/sd/pl181.c                   |  5 ++--
 hw/sd/pxa2xx_mmci.c             |  6 ++--
 hw/sd/sd.c                      | 15 +++++-----
 hw/sparc/leon3.c                | 16 +++++------
 hw/sparc/sun4m.c                | 16 +++++------
 hw/sparc64/niagara.c            |  4 +--
 hw/sparc64/sun4u.c              | 10 +++----
 hw/ssi/omap_spi.c               |  9 +++---
 hw/timer/omap_gptimer.c         | 12 ++++----
 hw/timer/twl92230.c             |  7 ++---
 hw/timer/xilinx_timer.c         | 10 +++----
 hw/usb/desc.c                   |  2 +-
 hw/usb/dev-bluetooth.c          |  4 +--
 hw/usb/hcd-musb.c               |  4 +--
 hw/usb/tusb6010.c               | 14 +++++-----
 hw/xen/xen-common.c             | 11 ++++----
 hw/xenpv/xen_domainbuild.c      | 32 ++++++++++-----------
 hw/xenpv/xen_machine_pv.c       |  9 +++---
 include/hw/arm/omap.h           | 10 +++----
 include/hw/arm/sharpsl.h        |  2 +-
 memory_mapping.c                |  2 +-
 migration/block.c               |  4 +--
 target/cris/translate.c         |  2 +-
 target/ppc/translate.c          | 36 +++++++-----------------
 target/sh4/translate.c          |  7 ++---
 target/unicore32/translate.c    |  2 +-
 tcg/optimize.c                  |  8 +++---
 tcg/tcg.c                       |  2 +-
 tcg/tcg.h                       |  3 +-
 tcg/tci.c                       |  3 +-
 tcg/tci/tcg-target.inc.c        |  7 ++---
 ui/cursor.c                     |  6 ++--
 ui/spice-display.c              |  4 +--
 vl.c                            |  2 +-
 152 files changed, 802 insertions(+), 821 deletions(-)

--=20
2.14.1


