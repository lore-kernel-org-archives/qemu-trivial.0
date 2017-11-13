Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNS-0001w2-LH
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:38:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNP-0001vu-Ir
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:38:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNM-0006fz-Do
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:38:47 -0500
Received: from mail-co1nam03on0074.outbound.protection.outlook.com
	([104.47.40.74]:58550
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNL-0006fW-Vw; Mon, 13 Nov 2017 17:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bzrjjvq+HAhR9pTpYBa0eCnKsS/F3czvu8D+0l9+yaQ=;
	b=EcTOpuswRML7x61SkW12vWygGyNOUsl5vlahsI+aY34xnPSbxjGAZqBlM0QpQ/M+opZN2wLYOCMsq2sBl4pa2EBdx+xavRlNT+KPtfBYjYP68ITT8Jtyemav63B6i8Q799K9VC9GdDNwSusZ0UlncsesLkM+LwlHspqUvtP6Kh4=
Received: from BLUPR0201CA0015.namprd02.prod.outlook.com (10.163.116.25) by
	CY4PR02MB3384.namprd02.prod.outlook.com (10.165.89.155) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:38:40 +0000
Received: from BL2NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BLUPR0201CA0015.outlook.office365.com
	(2a01:111:e400:52e7::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:38:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT028.mail.protection.outlook.com (10.152.77.165) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:38:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNH-00048R-F1; Mon, 13 Nov 2017 14:38:39 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNH-0000JZ-CC; Mon, 13 Nov 2017 14:38:39 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcak9002650; Mon, 13 Nov 2017 14:38:36 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNE-0000JQ-LO; Mon, 13 Nov 2017 14:38:36 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:34:35 -0800
Message-ID: <cover.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(199003)(189002)(2906002)(2870700001)(9786002)(110136005)(54906003)(50226002)(23676003)(106002)(5820100001)(47776003)(8936002)(81166006)(8676002)(81156014)(50986999)(4326008)(478600001)(5660300001)(305945005)(50466002)(106466001)(33646002)(356003)(36386004)(189998001)(39060400002)(316002)(36756003)(63266004)(77096006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3384; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT028;
	1:jeialHVhnkGnphHvpiAkeaSQpQU1iH5HMqBbvIPvL/CzA8vuBC6qKuUD8Y6kC5LpEGW9GfdyXxxM4afQ7+AF2TXC3h1R9lDHZB1H8/cvDTbPgqf/sEzyVGfgO70DfFi5
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cf98325-fe79-4a7e-d271-08d52ae74994
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	3:imwDkizRXUs7pPvqE+UHkIg/r1PWgiXtHB7vLW8Q2tAvlfeT9b32fmgaGFCdc/swCRLlgKxOMt4dRdXG4JFAr8QyMd1XpyfNJMCQCEK/OeE3i6Ii6dJH42/KtHo2F5897vMMK3Xclg8fV9V3HjKk+B3DUem9+CmXZI5Ha0MXzbvR/e+++Pc5jTs26YLbdcqU52AoD46Rmp/Wp/rzyrbJWIAsZMI674wbT/6vgtQ//ZRViyBJHurfnK7xjtmX3C0IKcMMRZBz1sjeGzVidXDW2pHo72W4rPPXJafwO7D9yGjMpeI/yx6sn7gYnK/U4yDVbuZ30yiW7kH+brAwbrJjhBs8O6r8jIVNuJNUfUBfqA8=;
	25:9d2FFPCiN9v4nUZiwIVW4ffcz3/N7xrT9TeI46KWRbV/2koOM+THhstKxnXgbnCYpai/mBND4d7lnDgLpsUWy22z5QEPFUaSn5FiU/PmH9IbHpPCF/gCGyJFr66VJGi3OtQnbjDtS/6GdSzKFXJI54mJ2wjsknkQVcA8+FjtrvehoB0bsrqmHVhkBIZydddxwXZnJ8Wk0qzohcmIGDUbk7Nh0oBrvdWQ2P5vjYclRML0w9S6TTwTorzJ6oOVyfe/bt4G5Km3XgUqwXfYfoZLm+zDGqpYWWKnUM2s64oSaGrfYVfizSReEyvRUMbsWdU1k9XRRnuIqhwVJLw5xTc+eqDnE2bRcoV94vppObgSbWo=
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	31:yB8TiIpIrUb11ZgLuihdI+nKAriftDnxgaenNSIEzbHTIuvHCWytJexmA7qCdptwMy00U691WKAyUu+Y63u0Xl9K7dt2AO3Aee5yn1TyXM3nhnbOyAdPL2iOLNtLXKs2OuWxvyn2l9UZv3azJIqXmnLC/keFFWc7dCl0uJBy2JjMnZKbuSDtMYfHvwdykVNq8/1ane1QYHgI6liSmQJW2KGDbFH6K9Dksarew/QJv2w=;
	20:3crrtBWPFNP24H5lp4X4DsDAyoXi57ZXP2ALCsfmMuDWE6GBR2iiCIs8xr+K86+XiUZRJGUYjp+9glmM0it2fPlCmL1uU9qMXSZwnypUxEJJY2h5rYLjk/2jYgbxFLTGQ5p0cQ8IYYySxdjZTfcViTw3rRTEZXCPiGwJ82h8TpkxHYaqHsLgCTfOr31do4d5nvKzoljSuS0iFTbClFDaseAotJzprIJt31/gJZ0RGV6EPW++4mu4pBW5E0n5kIOPZxYGI60rauuH846YlEptf0ok0JjqkVkRyL0yYVEynDigHN4hynEHk85lCVMokzf5CYZaRZPcrNAwIphlCdHv5NQ7rkZ2vwiqPKiJ5YNTvImEgPD3j25hJsFt9aY1SoTaCe5WTWOECKgy0bgHAXNUVrM1B1DOdAlxvXJ7V5hrUqBBcL8uKBWfPg6O7qXpdCKqdZ7mtLvo7O5LP1ZcnfBKsvaMUUZS/5CAASpZTzxwcaVkUsAQo/mh8mX7PbJhRh6s
X-Microsoft-Antispam-PRVS: <CY4PR02MB33846A02996AC4531BE3A5D8DC2B0@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(3231022)(6055026)(6041248)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3384; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	4:M0VwUL2R97eYexNpTgrCq2ZHhH3seqLZQQUiRDcMExxAyKwdxVO217S7/8JFOBLj6pRLWDfG6rl0tnALuUIv7vqlFVGeJ3Ie029rvcx9l6A3iAyfMhOo914IsdABrRk0S6FLspw0MnvZYaEYejirV7pnF7pGv0nDSY+0dklnWb62MrDcOaedWA8DueBMyKQp+6qNaMKiNZPrJgTb0kWqJ4cR4DDTS303uKIvEsYIhWtehKvYYsK4bBjKrAzht6xcElC6P8J0Sjpb5K/AbqzUIATG2+Thp0K9V26DxeX/MtnOdYgW2/e4jNPIQxsMT0C1
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	23:Ug/swAu4smo8aZ2eUaVhnB3ijW2amZB5IgHkycgKBFVrgk2qd+ME66L2HlmkrATlMqGtRIFpHd9/y8Eh9p8YZ+eCAR9+2jTwrL6x0IeaflF/h7m5pkyZ2ogHkjbiQ9PVmH2ZVhzP1edZOJ19I0WgcMDUsO5fEgUsYA0hsZohnOtURagsAUJpIs2AaeP/Hf4kHp7czQvwalXsf1kTse9Nh98DV3zUoktrqpG1Wz1oUW6HuDHtPTsEl3PGQ5EbqLY3HOIoTO5+D3YFOm8aw1aB69xLaDkmzokIDNUYi5zEkfpytLasqWeBvp/0bWVSZCH0SLVamW35pCwW9mtiXDKTZETH3gZqLvLiH78H2CbCSFofu0DiIpLOxeqy+0AEnrebZHdW+A3acsXbGmYlj5LgHtIVCWlG4SeInuEwBkNshULS9k9Rr/M8Ge/ldPAr2vNMXxpZcdaBlfwMhwz/sObUbvCV+Fn1NNDBJFyIl0idvYZa3oZn1U96eb0DA/fPKNqxnXpltovHhHcu5Oqp9B1oe5oH99Ztd5OpFZerCCXcKGaqxF5+pVPruZbkaSYRDOByZ7KL2LIvqpdYCokhCrk5Vxkw68wY1PcRvcZ2WpGHxcC9TRTwl8rpE8/cZa0HOqdTEtSQfASY8AA03F3G5B3jo+MHe2bfi6zvvkmPwFNAy5QHKM0k7z0PPxVQ9Avb4VB6MnGknNMf3O8YjIvOMw7AYTIQNMDJ3mvknoVQLphzu5YlaaEvz5b3M+jgwrE+AZz4wdqMm3HmhnEwgs/LvbsZrvmKxbxtfm9cGVJRhCnbQsbtTELCHMpptf8tq5qXNQMPLVM50nGvfWJXVIpmACk7i4vW1926SEKpHmXuqG1HSugyoZiDJbHEGD6l5TJTYPHdqKVrkFZgBOCmDXd43E0B5lf3UFZmmExhJcoH0TjiT7TULR7jU0BhMDf+X+9Db06j
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	6:xDf30akBdpIMjRpzKT8RusGwuGSEybl3Ed7XWIrJTKYfygf2YU+f2H05/mIw6QAo7MfGb4g8XDP7UyPlaQn4+SVOoh7jEjip+7WCJqVqt5hRRgidP800QRuXwWItOXcOL7Dmo+/Mnc1YtvZTdIJgDKBwhf1HxpPnSnkR/JV6VGuGsS4ykTEcyhHa7a8y7VgG7W6LT6EmW42CniHdwTgklGkI440+G9AguSv0uvyK9wX4znHPyvSyxRVtLO+zRIelZKeJgFC0EvukOt/ZL7HdNcsMGPgVjIFsbvbQEMt8QBlNZ69dbskFZy8s1sNPOMPYGf7SVmvzbqUxanpMufRn+uF9Fmcr0+DaWEEo6nKVhLs=;
	5:cC0oKJrjlZrjFQeCDwSIAbuYQO1TiZPBwlsingLBBFjmpNwhapeCSYcDBvrk2c0PNvigh+i4/Db6wz01ZLJRk6VSKTB2Uv7ozQwBmzAyjgqW6+wGE6ODlp94ZQY7VdQ63cqPRd24kB3ZhyP6AXQnvKDVnDwyI+LRfkv/ENO6CSA=;
	24:mubiwbpkwrVQBBX+junWepfqsR2P2GIsyAZqjNMi4Hgc7E8qOArP7IeXYTlWAFCJckPCsm7jokH0yNdshsz4C1KBHyrI4faeBtmMJtJEzcA=;
	7:2XjWahOF2vqEMMThSNnp84kD4I5d/6+P2W4Rzlo52ZhusLXlRL0xC+pgY1qrl/LBt/4mttHRsxX+gojRE53q7Wg4+8f66IJOf0ukFSL+NOlvkAo1SGoER7XB7AgaNqNKqwOC9YoVJ3+efU64OWvy+nJu0HJXMdKpv3sukmMcO/uhqz9RgaQP3QTdXdqAEhuaRnsTkC42qi+rJ4KEAtmWkRxYSW+nvyqeGQKkehbWN4iUeF36MkbxYoWjaLHN3PD6
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:38:40.0282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf98325-fe79-4a7e-d271-08d52ae74994
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.74
Subject: [Qemu-trivial] [PATCH v5 00/29]  Remove some of the fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:38:49 -0000

This is a smaller version of my original series, to hopefully get
something merged (although it's getting late for 2.11 now).

Continue on improving QEMUs logging/error messages by removing more
fprintf()'s.

Unfortunatley my Coccinelle skills aren't that great so it's all done in
some nasty regex and a little bit of manual work.

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
 audio/audio.c                   | 40 ++++++++++++++---------------
 audio/audio_int.h               |  6 -----
 audio/audio_pt_int.c            | 28 ++++++++++-----------
 audio/audio_template.h          | 26 +++++++++----------
 audio/dsoundaudio.c             |  2 +-
 audio/mixeng.c                  |  2 +-
 audio/ossaudio.c                | 10 +++-----
 audio/paaudio.c                 | 56 ++++++++++++++++++++-----------------=
----
 audio/sdlaudio.c                |  2 +-
 audio/wavaudio.c                |  2 +-
 cpus.c                          |  8 +++---
 exec.c                          | 14 +++++------
 hw/arm/armv7m.c                 |  2 +-
 hw/arm/boot.c                   | 37 +++++++++++++--------------
 hw/arm/gumstix.c                | 13 +++++-----
 hw/arm/mainstone.c              |  7 +++---
 hw/arm/musicpal.c               |  2 +-
 hw/arm/nseries.c                |  2 +-
 hw/arm/omap1.c                  | 49 ++++++++++++++++++------------------
 hw/arm/omap2.c                  | 23 +++++++++--------
 hw/arm/omap_sx1.c               |  6 ++---
 hw/arm/palm.c                   | 20 +++++++--------
 hw/arm/pxa2xx.c                 | 53 +++++++++++++++++++------------------=
-
 hw/arm/pxa2xx_gpio.c            |  6 ++---
 hw/arm/pxa2xx_pic.c             |  4 +--
 hw/arm/stellaris.c              |  3 ++-
 hw/arm/tosa.c                   | 25 +++++++++---------
 hw/arm/versatilepb.c            |  2 +-
 hw/arm/vexpress.c               |  8 +++---
 hw/arm/z2.c                     |  6 ++---
 hw/audio/hda-codec.c            | 10 ++++----
 hw/audio/intel-hda.c            | 28 ++++++++++-----------
 hw/audio/wm8750.c               |  4 +--
 hw/block/nand.c                 |  4 +--
 hw/block/onenand.c              |  8 +++---
 hw/bt/core.c                    | 10 ++++----
 hw/bt/hci-csr.c                 | 14 +++++------
 hw/bt/hci.c                     | 26 +++++++++----------
 hw/bt/hid.c                     |  2 +-
 hw/bt/l2cap.c                   | 22 ++++++++--------
 hw/bt/sdp.c                     |  6 ++---
 hw/display/blizzard.c           | 18 ++++++-------
 hw/display/omap_dss.c           |  6 ++---
 hw/display/pxa2xx_lcd.c         | 14 +++++------
 hw/display/qxl-render.c         |  6 ++---
 hw/display/qxl.h                |  2 +-
 hw/display/tc6393xb.c           |  2 +-
 hw/display/xenfb.c              |  2 +-
 hw/dma/omap_dma.c               | 38 +++++++++++++++-------------
 hw/dma/pxa2xx_dma.c             | 14 +++++------
 hw/dma/soc_dma.c                | 36 +++++++++++++-------------
 hw/gpio/max7310.c               |  8 +++---
 hw/gpio/omap_gpio.c             |  2 +-
 hw/i2c/omap_i2c.c               | 10 ++++----
 hw/i386/kvm/apic.c              |  9 ++++---
 hw/i386/kvm/clock.c             |  7 +++---
 hw/i386/kvm/i8254.c             |  7 +++---
 hw/i386/kvm/i8259.c             |  5 ++--
 hw/i386/kvm/ioapic.c            |  5 ++--
 hw/i386/multiboot.c             | 21 ++++++++--------
 hw/i386/pc.c                    | 24 +++++++++---------
 hw/i386/pc_piix.c               |  2 +-
 hw/i386/pc_sysfw.c              |  4 +--
 hw/i386/xen/xen-hvm.c           | 30 +++++++++++-----------
 hw/i386/xen/xen-mapcache.c      | 12 ++++-----
 hw/i386/xen/xen_apic.c          |  3 ++-
 hw/ide/ahci.c                   |  6 ++---
 hw/ide/core.c                   |  3 +--
 hw/ide/microdrive.c             |  4 +--
 hw/input/lm832x.c               |  6 ++---
 hw/input/pxa2xx_keypad.c        |  6 ++---
 hw/input/tsc2005.c              |  8 +++---
 hw/input/tsc210x.c              |  4 +--
 hw/intc/arm_gic_kvm.c           | 12 ++++-----
 hw/intc/omap_intc.c             |  4 +--
 hw/intc/openpic.c               |  7 +++---
 hw/intc/openpic_kvm.c           |  8 +++---
 hw/intc/s390_flic_kvm.c         |  4 +--
 hw/ipmi/ipmi_bmc_extern.c       |  5 ++--
 hw/isa/isa-bus.c                |  7 +++---
 hw/isa/vt82c686.c               |  2 +-
 hw/lm32/lm32_boards.c           |  7 +++---
 hw/lm32/milkymist.c             |  7 +++---
 hw/mips/boston.c                |  4 +--
 hw/mips/gt64xxx_pci.c           |  2 +-
 hw/mips/mips_fulong2e.c         | 13 +++++-----
 hw/mips/mips_jazz.c             |  4 +--
 hw/mips/mips_malta.c            | 16 ++++++------
 hw/mips/mips_mipssim.c          | 11 ++++----
 hw/mips/mips_r4k.c              | 18 ++++++-------
 hw/misc/cbus.c                  | 12 ++++-----
 hw/misc/omap_clk.c              |  4 +--
 hw/misc/omap_gpmc.c             |  6 ++---
 hw/misc/omap_l4.c               |  4 +--
 hw/misc/omap_sdrc.c             |  2 +-
 hw/misc/omap_tap.c              |  6 ++---
 hw/misc/tmp105.c                |  2 +-
 hw/moxie/moxiesim.c             | 14 +++++------
 hw/nios2/boot.c                 |  2 +-
 hw/nvram/eeprom93xx.c           |  7 +++---
 hw/nvram/fw_cfg.c               |  5 ++--
 hw/openrisc/openrisc_sim.c      |  4 +--
 hw/pci-host/bonito.c            |  8 +++---
 hw/pci/pci.c                    | 12 ++++-----
 hw/ppc/e500.c                   | 22 ++++++++--------
 hw/ppc/mac_newworld.c           |  2 +-
 hw/ppc/mac_oldworld.c           |  2 +-
 hw/ppc/mpc8544_guts.c           |  5 ++--
 hw/ppc/ppc405_boards.c          | 15 +++++------
 hw/ppc/ppc440_bamboo.c          | 22 ++++++++--------
 hw/ppc/ppc4xx_pci.c             |  3 ++-
 hw/ppc/prep.c                   |  4 +--
 hw/ppc/virtex_ml507.c           |  4 +--
 hw/s390x/virtio-ccw.c           |  5 ++--
 hw/scsi/lsi53c895a.c            |  4 +--
 hw/scsi/spapr_vscsi.c           | 49 ++++++++++++++++++------------------
 hw/scsi/virtio-scsi-dataplane.c |  6 ++---
 hw/sd/pl181.c                   |  5 ++--
 hw/sd/pxa2xx_mmci.c             |  6 ++---
 hw/sd/sd.c                      | 15 +++++------
 hw/sparc/leon3.c                | 16 ++++++------
 hw/sparc/sun4m.c                | 16 ++++++------
 hw/sparc64/niagara.c            |  4 +--
 hw/sparc64/sun4u.c              | 10 ++++----
 hw/ssi/omap_spi.c               |  9 ++++---
 hw/timer/omap_gptimer.c         | 13 +++++-----
 hw/timer/twl92230.c             |  8 +++---
 hw/timer/xilinx_timer.c         |  8 +++---
 hw/usb/desc.c                   |  2 +-
 hw/usb/dev-bluetooth.c          |  4 +--
 hw/usb/hcd-musb.c               |  4 +--
 hw/usb/tusb6010.c               | 14 +++++------
 hw/xen/xen-common.c             | 11 ++++----
 hw/xenpv/xen_domainbuild.c      | 32 +++++++++++------------
 hw/xenpv/xen_machine_pv.c       |  9 ++++---
 include/hw/arm/omap.h           | 10 ++++----
 include/hw/arm/sharpsl.h        |  2 +-
 memory_mapping.c                |  2 +-
 migration/block.c               |  4 +--
 target/cris/translate.c         |  2 +-
 target/ppc/translate.c          | 22 ++++++++--------
 target/sh4/translate.c          |  4 +--
 target/unicore32/translate.c    |  2 +-
 tcg/optimize.c                  |  8 +++---
 tcg/tcg.c                       |  2 +-
 tcg/tcg.h                       |  3 ++-
 tcg/tci.c                       |  2 +-
 tcg/tci/tcg-target.inc.c        |  4 +--
 ui/cursor.c                     |  6 ++---
 ui/spice-display.c              |  4 +--
 vl.c                            |  2 +-
 152 files changed, 780 insertions(+), 773 deletions(-)

--=20
2.14.1


