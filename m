Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAo-0007bl-7U
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAi-0007Wf-SZ
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAf-0006kh-RF
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:48 -0500
Received: from mail-dm3nam03on0083.outbound.protection.outlook.com
	([104.47.41.83]:44736
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAf-0006gW-JC; Wed, 20 Dec 2017 12:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OIwbCItGvdkT2vp6PwPlMywC8EgCKqPk3q474EdKUZU=;
	b=5MchBQcyXf/CVxib0+luJQYFLqFFmBPhBQg77y89pMcCLRZ11+HL8R7XKt8il7DImmK4o3vELL8X3Jcu4k0RtE4qDgo5C2JmSYpZO3nXkHli7zdMXQnHTEGsD5DL1gKTFe0Kz5KUZa/bS09EnlUJQjtrLtV8wnYcU1dLO5EGuag=
Received: from SN4PR0201CA0072.namprd02.prod.outlook.com (10.171.31.162) by
	BN6PR02MB3380.namprd02.prod.outlook.com (10.161.153.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:43 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by SN4PR0201CA0072.outlook.office365.com
	(2603:10b6:803:20::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; denx.de; dkim=none (message not signed)
	header.d=none;denx.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49829
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAb-0003sM-SN; Wed, 20 Dec 2017 09:28:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAb-0003kx-Nk; Wed, 20 Dec 2017 09:28:41 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSYZw019835; Wed, 20 Dec 2017 09:28:34 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAU-0003jA-8e; Wed, 20 Dec 2017 09:28:34 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
	<marex@denx.de>
Date: Wed, 20 Dec 2017 09:24:18 -0800
Message-ID: <eed1a176525257ef210557136fc5eb40881bcca1.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(346002)(396003)(39380400002)(39860400002)(376002)(2980300002)(438002)(189003)(199004)(2906002)(63266004)(2870700001)(118296001)(478600001)(356003)(8676002)(76176011)(7696005)(305945005)(23676004)(81156014)(47776003)(59450400001)(36386004)(36756003)(106466001)(2950100002)(6666003)(77096006)(5660300001)(5820100001)(110136005)(4326008)(8936002)(54906003)(39060400002)(81166006)(50226002)(106002)(50466002)(9786002)(316002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3380; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT029;
	1:ML7xDXpRpxSqBhwJW+9P5QfhxaKugsc9kEnuwLUS2hcWSC9Lb6piMXVKyyJc2qL2aaUZaB4slwDRkDdibz6fh5YBzOFVwXvDxvzsw3T3emcguRcRi9nXEanhRL4zGTaY
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6bfe5ec-4ba1-4ada-b2f4-08d547cf1db9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3380; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	3:NX7H/ro9xI3+IYd59EL3YKkDrjJURvtUzlzcxsuFc9QaYIvMpBD5uflShqJuzmi7fkuFNOLRagCKH+Sb5aG35d8CNXuJpS+NRm7OdzUToDJg0w+YaBGxwTxC+RIFRCnAK0hPgmJQPHPxSxTfSvI/FCod6YDMja4k5hCZhSbfwBIJpuMiViLE7PbV2Y7AL/1Yqpno4B9VSRZNOzSvmWqKEK0JRKGBVcTucq+E2vW0RwLdI9m46u9K5RfqE8ubBRPsQCzrqbYjR4bchhrXIBGAGI1i3lDNtAXvxDpqL8x4SftUHcrg2fmtbBgHGlqNHrRl76Iw/e+PqLbZzSxHBzAvzE1I+pIP+ZtImbFyRFx40aE=;
	25:ufNoT69oxq6TZqPaKRu3t8EiUYjaN3BbFBlG8/o7YAk0HfnxY1pIcEP5KASv3PIQypuztQrNcCUpV+bO3yLwNfqAIr4MT8R5gBYYQVZC85nU2+zNwciv3MoAh9YW3x0rIiA1RByHDRiZUVVdCK7NgL+67XPPPUSq+WPoRMea20f5i6Pg6ggLoMnc80QPXzIhrjDFjL/nvBQRdKFTjtwtYcjPc9ei9UL/U8qQPiLV4fZ0Ocw/GrEqzfYbtr99f6/CkRAqQg7Rd23Tx1XLKw9ID9hI5ITYLqvPZHBOUXtjkYP8lW7oEcxkek/Xk22/SbzMVHap51l13mFbU6bGkg0wtg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3380:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	31:sGb3rSH++6S6YDmQGEyLaRKSBA8rBkMUgdLobwxAMx9S2erfSo400hpdrCwODp94Hc83URCcI5oEJ+aKWlmIrNB/EII4z3aXvGJXZTTqqYY6EYaWbvDIHmaBgHHsdCFujOzx4VOwctVMb9/TgKp/qn2WU8w8EXotZS9nIyA1CIdF4Y4M5XTzfkquiqyDVaZDHue3vUfqfo4murmdm5OG8OL8f+8mgqCLZoGqyiGGdC0=;
	20:EXcNIXTwl0octgROXFoTUrjtxBL6DuJkR5n97K2iGn9EsyiYVKELnvwl8XJFAUDVCSgFSjHjJhjUQJoqcT1BELspJ/KrqmFAfXWz01hAb9HdoGehBzSK/jKpyWyYYCuQ+GH5BWu8njUH0XuBdw378psU/tN5k1lsalU9tUUAewWbWFK8DrjeU6T49e0oyeKjWJxBca1nYqfBAJcQN/NKBBjhG4jFJx7+F/+ynaZTMnGi525n9BlRGaHq2AbDs3/P6cbZEGO7u8wKwN9k9Lbe38GF7xaB+/UQyQcGgYLH5T7CtSP9xuOjdQwF46EEJkuo17RluedtlT/LtFx1OfulBQguY6EPhc0cFEKzqHKbxi1pSzPxJA1agIIiB9EBM8bW6kvtuFJuhO/7NkoxLEmv+qLMuA/ELS3zjuzEL0kQUFnkcvnqm1bMYLkplnzy5Bgw2ilc4AfFFckEDzRJh2py+3RoQ0K9wmHhxUssVmt8HHG76q51PNyTzhZdCtmPGd38
X-Microsoft-Antispam-PRVS: <BN6PR02MB338014D88DC0C9CD0B2D1DD8DC0C0@BN6PR02MB3380.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3380; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3380; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	4:YG004/poyt/4gIs5aLjjO556C4y1G4nwM0a+06vVv5V1bD7fCUqGJVBDYU9TLHuvE78eZzHiiNeOqlGsvX2aoU5nAxJPdTLnbdGTofpHsDuXIddGhOSZfGHzdVdx1BoKs5QkZqtf3n6qenZqSuxDymjQgkhg+aeCDUQ08myxmGTHMXxiM3B1F8XItpUs2UWXwZe4D7QRUEKrDqSaDaHr2BwLyCc6GhtOSkwHQZTlhHr6bsI4ayligBb76ftK4c1Y4udSfnX0SmRmO14j7CLF2bsO1dasumiL/U9SOSJ9QFSZs1Jm+MU4wjNgSDydVmNCB3i9L2hIoM4tti1nvYQ8XQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3380;
	23:ilAXSAEeSjLAvPrP1TPcOVUYWr+FxHKVPk4xZ4dCP?=
	=?us-ascii?Q?UyZjMP9BUPLdzHNcO84KdFEb37m5vaz8DdDlrf8Lzh4oRvT5wjTK8mRLVfK+?=
	=?us-ascii?Q?aRW0sJ2TT58i5CCMSkt/m5nxoM6XblBhegJPGyytb6sxhml20O9S7JtU9XDr?=
	=?us-ascii?Q?jN/ZCBSKorq5llVKehPHuPaZdCIuWdV0w7tNGLHr5XzjILMd6RhsaXTvveJB?=
	=?us-ascii?Q?0HFyKC30gL/8lBKrO4zwvCIvIyqPk1rU+5nkVoMMYJn9Mr/6LI+m8y//SOag?=
	=?us-ascii?Q?5I/KWpDoqE/S8bACgmtn5YcXdv4FSAYOHihlQ5jG2z+58Fsu0LyX8UkFmUYW?=
	=?us-ascii?Q?o8bYnaHyUrPZhnGPQIHxJa67J6FCBDmcxSR+e3liI0wW6Tb5B2+vHrG3DbMN?=
	=?us-ascii?Q?HUhNm+9Mt+gttboFHx9wDNJ/ja1hxzhkIXUqTfasbCpCfTMv5FnITqYyBoqv?=
	=?us-ascii?Q?5cLc8a7j3MPNwJ46q1kjLqqajBLripICHf0nM6dfVawgEulcDtFPk8Rsr9IA?=
	=?us-ascii?Q?3fRpe6k7eZCLKh8d6MOdLfCtmVa95K2QDlmlFXrxoeOvl5i3M8Abnxo9pcNA?=
	=?us-ascii?Q?bbJosxDKk+mOVc/REqvZtP6pphw7PmtMN7wZlh6N4RTCu8CaUHczU7a3XtWC?=
	=?us-ascii?Q?nuJI4pzCu/BOz67mm4fSr+Qg/DIjvb9wXQ0+Tbs5mJUCvIBBBRLX8XXG5LQe?=
	=?us-ascii?Q?eeqTF6huLm5Xjn05bL4vWXay/qEPPfT/THMPkhgP4GVN0XmXm8sgLB7y53Q0?=
	=?us-ascii?Q?CD3mlg1ZbmC6ynQM6jRwNjPBuHmekG5TXY3dbM0eBid+JsunNN7V6KRQlIUS?=
	=?us-ascii?Q?bgZTMqe4fB+4OphcZapYmJsVyjG5SzaqyXi9sAorCsJq/xW/6PWrPItBdk2E?=
	=?us-ascii?Q?dFRUleszjbHVH3eshD7k5FXA72t1CRdfqrBgsbD8vJ2ibnPvPDs96FoEjaNN?=
	=?us-ascii?Q?i56q6+Bim0LJBQcF0qdzIFWxL6uJ7egOdfE+/YvX2piI8CrX2qDsyPg7L4xd?=
	=?us-ascii?Q?+j1mYJNC8P3OzbFHV1kD8xJUaVxnJCzKzXK/qwcYM6qsK6IRpnrLBauhMfPn?=
	=?us-ascii?Q?qUqdrxTcC2alWBfigScty4rXGfM?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	6:KSgZ5dUh5fwbqs2C2h9Re/mmolzhoPFe0GutwRESlAwBAiKp3+WInBQSVKsQV2wXLVko59hS/wZFqycqsANEJEXPhwJ2Yjclt+beISZaD6fZU1uuPekTyTJHTpuGZSct3xaAGu3r4Y7cT+DosPo5lfE3VU0nL3vcPyRhoDLDOajQ7ILyzb3p+IvNyGJLYayMrPNVW+3DfMizpWskuwLz4gHoHxz/RWSPdchVp9R4H9XNiCSGehGSxk77xpHBP3sj0M4vSOMsL3JLnhvwhEaGWTZFPSwe+avr9oHAePyf8KsT9aRHMgjxsfdKmPGatpziaiymn+WpYMjKuSs3sab2KMcafN5KNOW/DFLVeYMN4tA=;
	5:GWdcI2T1qTsjxIQJ1cKOc/GG1RV2aJ2wZ37XSlliM7Mj8/cJdXFUvgo3uv21aHHI54wYmUddzrozcJXVKOkDMgdciOIQndEIw4eYTihq88f9VRCQKa5HowamcvbV2DrwIqvRTreNRRniYeQQ9jVIL/TsYX6dPjE4ddzwnfMg2TE=;
	24:h2qqT0+pAVEqcR++RVBWMq4x+vE3GUYoJ6Y4PF53S11p4DrhNlP/ukDi5MeBoHpUjJyvh+VcIJv30+Ltm79MIOZ0cVlhQ5Uvmw5pZbIyu8E=;
	7:CNaBnwAJp43hn2eaCeiTdI7+SdkddJvG9PgZ4WIeJpC+p5G6NkQLhoAC6e1lnJmAoJvd/6EswvlrcrRcu8xcouc18T4Tr0eA18OdE8cyEvKuDdH2nA9CYQqv4cJclWcW880Qw1CqF0OhjM7wSPZfLHZQigM9rLGzwL4DALdaRjEvZ1OLz6VKlgk3muPPMyS7U6IcSUoc2GxBqq2Wy+lr8CKTgRaikXUYuKo9ZWnmbtnWFdAhGRq4BQtuLL00pZgn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:42.3429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bfe5ec-4ba1-4ada-b2f4-08d547cf1db9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3380
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.83
Subject: [Qemu-trivial] [PATCH v6 16/29] hw/nios2: Replace fprintf(stderr,
 "*\n" with error_report()
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:52 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_re=
port("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/nios2/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 94f436e7fb..2de9c06695 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -95,7 +95,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, cons=
t uint32_t ramsize,
         r =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
         if (r < 0) {
-            fprintf(stderr, "couldn't set /chosen/bootargs\n");
+            error_report("couldn't set /chosen/bootargs");
         }
     }
=20
--=20
2.14.1


