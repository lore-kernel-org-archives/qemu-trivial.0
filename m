Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNz-0002SK-Qm
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNx-0002MT-Ns
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNw-00073v-Lt
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:21 -0500
Received: from mail-by2nam03on0064.outbound.protection.outlook.com
	([104.47.42.64]:17184
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNr-00070c-ML; Mon, 13 Nov 2017 17:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RX1qyba3QRDHPY0kSmogy3Vyo3fHdkUD27Yqr1WjvRg=;
	b=p7LiEt7c411Qh7hoTyOV23EHr/7GAtQq/Bvdwaf2MtKYW5rZXfr9aZfIYECZzYDw7rd26y1BAtdZUq2B26eNkgAJnOTuCTx/1d0+nNSOHqac3SlxpJgD5wV7EExpcgR/3Byo1jaGDS0xVlnXeARHJipYDTK+BnOwE74gYOlmGoQ=
Received: from MWHPR02CA0023.namprd02.prod.outlook.com (10.168.209.161) by
	CY1PR02MB1336.namprd02.prod.outlook.com (10.161.170.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Mon, 13 Nov 2017 22:39:12 +0000
Received: from BL2NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by MWHPR02CA0023.outlook.office365.com
	(2603:10b6:300:4b::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT044.mail.protection.outlook.com (10.152.77.35) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45494
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNm-0004VZ-NI; Mon, 13 Nov 2017 14:39:10 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNm-0000RI-IM; Mon, 13 Nov 2017 14:39:10 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMd4kD012561; Mon, 13 Nov 2017 14:39:04 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNg-0000QK-7M; Mon, 13 Nov 2017 14:39:04 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, <qemu-block@nongnu.org>
Date: Mon, 13 Nov 2017 14:35:04 -0800
Message-ID: <a40e9f8e1dc07234ea84b9564dc899757f51215f.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(199003)(189002)(2950100002)(118296001)(4326008)(39060400002)(50986999)(76176999)(77096006)(189998001)(5660300001)(33646002)(36386004)(36756003)(5003940100001)(9786002)(63266004)(8676002)(50226002)(106466001)(478600001)(81156014)(50466002)(356003)(305945005)(48376002)(106002)(47776003)(8936002)(2906002)(16586007)(316002)(54906003)(110136005)(575784001)(81166006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1336; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT044;
	1:UO5Jvm7QtXerQjEhxCtPy43ofJxOjnDUAQ9XgZBSGWSGQkjXbGkmXDyvTX1BeXoXG53iffaSr7a3FrWNfLA+hEO6dpMku8X5BTabb8YPQENaKPBXjiY2umGBopwUUUyi
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0cd4031-6428-4610-4897-08d52ae75c46
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY1PR02MB1336; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	3:WVu52q3fwgxZhM8qBeXKZceHos9tvSns5GFUdMrZWxWVHddROjo4xG448FrpOFyELets0yLoCYXN6L0Jtuwn1gZEVPJz0ZZuJ7qz7bnUwbi3uoJoUhioByY4JPDiGBsHf6dYH+LR1DL3Fh1a5iGyyduUi0rq5InWW/BCkH2BRJbyDk8ooiJRtUU8T8JzDuv/s4/yuyRuIMrbkEm6/h7/sg2HObRyhocxikdq7pNMeDvkxpoGHH49QreDeIRznQ/JJ4xvGPPoQAw6Cvjl18WAb0F47jkk6Ojso6Thfpb5NJwrAyccfD4TnYn4auZtdE2dM4AEIg5RZBH2nA5LFG1CgabWpJgPJ6tjxwvkew82igw=;
	25:GyBHW0WG17aJj0OeAn0aUm7FRMnv06hXOLE/FY9K7iCcdQn35Mg+9fXOTu11Cw1Gjp4gkbQ6hOr5oEU+oLtkAE7cDbTM2PZcJYX3UzNGW3DNPrbs2Yux8IoP62ffvzUc808KhmAvMWjs0WyDBKNpp5DPxndUNGJewqef0Tl8P5rsNp56aCUzxkYUwuxU7aG6UH/vNZg82S5FbocsOqU19ixyrVrSinkP1R+8R7GKJ7owIs4BC51hh/HRNIQ3JVVRg/F0myuIlvzHg9NGZNO81SafzEaup53FQHZKpRkHPydSTfCfVs+znsu5qeKpcvrDTzO2RIgVR5ahcfu4RjoOvlTrfR8d7HvRsIOfwMuhwUs=
X-MS-TrafficTypeDiagnostic: CY1PR02MB1336:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	31:VW5xgFxJT4/DZwVp7nMhs+31N6elfEFzY77BseG1Zv6Ufu5iudLqWyM27EOVP6laMGQzrS6pFnCkPGqv3MQKMYME7KlXRGaXoyC96XF9gt5NDNbAMlsm4yyAtZ5Z5mvFWTFqK6kewYT0vasdt1vne+iG0OMaq4qgCnWq9IeBvWenwcOmxV7Jm7gfcO2WRuwZBGnX2Dw4iTEKSGwd0dhPmy/8p+tW88WWDtCIb8VA500=;
	20:vrI3NLG42TFairTNTWRpReRPaPphqmT1ewlbDZDeh9IfWdQ/KHqjsmVafvEBtLtfi0koHbo0Xx35cPsElxy0xHoIAQAni19LQvYtWO0fAiB9w/ELIDP3KsKaf04yyhI21095EcNmKv3MGgFCQsWPzxX8r+oA5qQXMhwj2RIandb1AO0TlzXl8vBaCzD4FhUo0LZsOiUVxNQVklhNbeBcIC7mdnOmx359wDP/arrnqwekbjXVTtAr71GlihxGFpzvLxONxl8jLgzqez/gTesqud7N3jKtHsxLmuamrNaOA2Q/KdhDJZBlZ3uy9Mr15OaNTAhaPdaQ3979EDqNpKhNwhD6R2vPskVHongD0bXHi67hpkZ2IM4wnc6b16BXHchOYtFNKUekCaTqr6jdyw6DMQ7IXaGzYCU6VgomENI0YJyvNGkXWDRRL4JHZnaTQggz/yYaC8Z43oReFKSgSaXss0m4ihT3+fBbWochrHIfWOg0szeOVjLP00p+hi7KDSQJ
X-Microsoft-Antispam-PRVS: <CY1PR02MB1336090A45A161CB0EAF9609DC2B0@CY1PR02MB1336.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231022)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123564025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1336; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1336; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	4:WBUOSos3DU7K9EPpsRIqpPFUPBoe+tfZlX305vEULGQEA5G1zgwDSZ0QdzhDwCcqvF+DzNsMaWMFFa2y6wR0l8sZa1Vk7qVNgKSCdfkPJfun50cdeIClho2xPOBas3qWkY6OcXEWpn+Di7A/zcmpwO1TfOSenxfrVuscdfZ628fHSESyJx2/FAoBJk1jvgxSwv6Bq/D9dRWtoKuE36G3B/EMEBwK2ajDJ51I4LaSJeFLyaI5LNFhEL8SWY2LEIfhEjpkexuILjXw7wsTl1dZ8sVj3rYXZegLdxosJQm8eVZNnwVF50KYxAUYsLSRof5grz4JcSDcsokTl7jQ3Kncmw==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1336;
	23:ZFEYfkVTibawctFX34rOcVcIMFBS+5OBR40uaOqIl?=
	=?us-ascii?Q?rDMPqYF2piVwdyB1GCs9iHH0pTvQP3Q44e1YdjgP0u6TrqPkbFKi2QjgkjL7?=
	=?us-ascii?Q?yDIdGH34KrQxQnxowWFVJIdACCjIZBOsfnqwaxYD34xlCMhhfi8U1+F8yqMp?=
	=?us-ascii?Q?a0Mn1Qifkg2Uap8DuM/1ld6IBwaUumnxe1TkmnApOb5f74VsoU3vlkXN8MY2?=
	=?us-ascii?Q?5ejFSbEXkyce8BTB2uHsZYxUFtEluFzNRBjahWYPRVB212S6dwoLcLDZCH4P?=
	=?us-ascii?Q?Qaw/hJ9VQsAKJfs/LMQvDdcj5ptojEKn4iguNAKHcnZx9IHB9QTsViGfRQUP?=
	=?us-ascii?Q?WIQJJEGhszmPt/lEJ77MM0aBKR//OMkNZHeok2+/2hPGhjtVcGPd6gXvmZpr?=
	=?us-ascii?Q?wqwRVPQR7iyxNOK8UPuiozJ1CiSIs8wAOXrn5P9qphF4imeBDVK+9th41Wfl?=
	=?us-ascii?Q?zDJDQo2EpWT/gs6qqjNtcW5jQdC5masPSurZYhsCSuWS9jAzx7RngF2+/Qs4?=
	=?us-ascii?Q?EWYxX8GjwbbY7kehHSepUKA/gnoMXTk4JGnXgXTGJ3NGLVBxvpnS1ruLsJ7s?=
	=?us-ascii?Q?y1MQVF9K0qPuHGXbFQj+QrvtkTf1TLqCbWakvMCkEWSy2Wx67bIY4oL+xiqz?=
	=?us-ascii?Q?fMDi8N61GW+iD8rIpZxM2Ef/jjS35MkdMwyD5+ou9W9gl8qVf2XHDQKtn6U0?=
	=?us-ascii?Q?XU99YRI4bkfnl1CXoDVp6RQ1VXTy9jvrwRWjMXp5oR5Fyxqvfhle44gVPKLN?=
	=?us-ascii?Q?2+YaJHGvQKb1gRY1+QlrvrYS1dnsSRj2sbQkP1ugn6I2FCiL06du+yN1arCJ?=
	=?us-ascii?Q?ZFhOIBfB+6WTRxq1sOUO6IT5w98u3d0Bcsj5M5V7xNY3pl/n0OVp4Ps6jqXJ?=
	=?us-ascii?Q?X6Hwd3iENK2YZtYVYT2BwmbXh0/XFYXa+kzv6tQv/6Jef//+sVA+yMFiaDD/?=
	=?us-ascii?Q?avNUcsJScA6uoo55gt9FkMhBk7BOEZF/1JRODaMW8loJbD2VMHuWMnQ+J5iQ?=
	=?us-ascii?Q?9iz3wcmFSWMJerrLFJaiUbRVjif68SJ5HA9gswi7EwxkUH4qmjLUDiKfYYaK?=
	=?us-ascii?Q?9g3Shzg/y5N62Kib03kf/E2JO6Z?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	6:KX5vO6Vqqw6qQe2P7NMzHmOV/eDaniUP0S0GNhYsIMCr7NzXA8dzvGIAmiaNxABo2rr4WMIb9Gs0Qef40w0VAAcrzsPFc6cw+4cE2xxwgU9v7r0mTzCgdjf0JJOtq7hjg0gXxa+elKoqOJUblo7WS981+UyO58JM620PkzbH+VFQZ/f8+dbPv28Z9FPHnl68X6Blcm6aMXkXq9he4eKbAIkXqI3X87icbbrUMmuNPWpQ9Ft8d+NlOPzIQ073YVhqicsfXP6xM5xJ1RMyPzdEQE3Byi+rKm/7qQlk5Vi0effW0miPYts/UbFCayoIIDnijkta3ZrAgVFKmKB3Y6ba4ZVoZdHRiwQHgWLHAL3wsyc=;
	5:djiRaKAuSqrvtbav5bYxbicZ521OGkhqsDNYYjLX8f0KB1I/GGgeqnslGFOfa7GWUuQDSN+ktlMgn9gNVWixYcJC9CeNIYy6pUVZodjSDKtFfF4YN3onDYCmjEzZJTN6bfb0EMk98EP2asRsLt8YbifpNfkeN4BSt/Cjq2naFUM=;
	24:n8bfjshxZsnw/fsWtWrh7MoSRvHkHomQQ00lSa005fzlD2UQeSTQmFNad/SuR2r3c327f7CyrZDpnklrqPaingK9BpqZvnnpZy04T616T20=;
	7:1YSDtykZgMtR6diGHsdlBvHDPIzFMPiVztL8UbUuQbqsfzznTDyi9wqUuMgyZS/yu5XVl03Y4CBWKZxMnCxkN4R6sC9sl5eO3wHzk8Q/pmoRd0//h6D8wnlJUwLY9MTGQY7ACkLASKGRBALmvm6O+HqwsE5XrhVgiCusR8DHqlcyKuQfEcI/j1HPduh53vbP5MNZL9NbPpoKrpHrTszQ+jzUJhbkgVaRDjFCuHW7nL1y2DxYkPYJW8JDX42E8vLR
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:11.4058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cd4031-6428-4610-4897-08d52ae75c46
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1336
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.64
Subject: [Qemu-trivial] [PATCH v5 09/29] hw/ide: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:23 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-block@nongnu.org
Reviewed-by: Philippe Mathieu-Daud <f4bug@amsat.org>
Acked-by: John Snow <jsnow@redhat.com>
---
V2:
 - Split hw patch into individual directories

 hw/ide/ahci.c | 6 +++---
 hw/ide/core.c | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index b72dcbcc32..b87d1903c1 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -410,8 +410,8 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
 
     /* Only aligned reads are allowed on AHCI */
     if (addr & 3) {
-        fprintf(stderr, "ahci: Mis-aligned write to addr 0x"
-                TARGET_FMT_plx "\n", addr);
+        error_report("ahci: Mis-aligned write to addr 0x" TARGET_FMT_plx,
+                     addr);
         return;
     }
 
@@ -1053,7 +1053,7 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
     g_assert(is_ncq(ncq_fis->command));
     if (ncq_tfs->used) {
         /* error - already in use */
-        fprintf(stderr, "%s: tag %d already used\n", __func__, tag);
+        error_report("%s: tag %d already used", __func__, tag);
         return;
     }
 
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 471d0c928b..211d67a625 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2765,8 +2765,7 @@ static int ide_drive_pio_pre_save(void *opaque)
 
     idx = transfer_end_table_idx(s->end_transfer_func);
     if (idx == -1) {
-        fprintf(stderr, "%s: invalid end_transfer_func for DRQ_STAT\n",
-                        __func__);
+        error_report("%s: invalid end_transfer_func for DRQ_STAT", __func__);
         s->end_transfer_fn_idx = 2;
     } else {
         s->end_transfer_fn_idx = idx;
-- 
2.14.1


