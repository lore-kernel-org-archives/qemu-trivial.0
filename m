Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBC-0007ze-Fy
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiB8-0007vY-9Q
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiB5-0007Jj-At
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:14 -0500
Received: from mail-co1nam03on0064.outbound.protection.outlook.com
	([104.47.40.64]:4992
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiB4-0007J5-Vr; Wed, 20 Dec 2017 12:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uDIsQbgK3Q2zS1QSKm196jFh3OYE9UjgmKL+pmPGWR4=;
	b=VaQWr1B53Fi/bBHcslD2f0uO0d7YArdnNnDUW2d+73HACKngzDXpI8KAG+CByn52EhVjn4mNEi3M7vIsxwYLl0NzA2dPXu/81nVu9Exa5Ff2AXNie1sj4jBfgW53vBOzC5Dag0nfeu9QeDHzSxHf8IjDcl88qBFKltJL+AUNPv0=
Received: from MWHPR0201CA0006.namprd02.prod.outlook.com (10.167.160.147) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:29:07 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by MWHPR0201CA0006.outlook.office365.com
	(2603:10b6:301:74::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAw-0004tH-LF; Wed, 20 Dec 2017 09:29:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAw-0003rN-Ir; Wed, 20 Dec 2017 09:29:02 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSuWP008479; Wed, 20 Dec 2017 09:28:56 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAq-0003nD-K0; Wed, 20 Dec 2017 09:28:56 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:24:41 -0800
Message-ID: <3f49c0ff601f27534d4536c87c00d01c233e067f.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(356003)(48376002)(36756003)(39060400002)(50466002)(118296001)(76176011)(4326008)(478600001)(47776003)(36386004)(63266004)(8936002)(77096006)(6666003)(2950100002)(81156014)(305945005)(51416003)(106466001)(7696005)(8676002)(106002)(81166006)(316002)(16586007)(2906002)(110136005)(50226002)(54906003)(5660300001)(9786002)(107986001)(21314002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT041;
	1:5pUo+pY8l0ayRAhQL0b0I1DU1AO1F/oo5ryZkdQv1PM5wKA2xKLZ+NAUsgKr5L/rBhNnQUAx+sTsCqV9armyZT55exLxV0+W6Tk5mSv6DCYGb/8gDO6003CLNvTl3BKB
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c38e4305-0675-4f2a-59f5-08d547cf2c9f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:LeH5BxnTStsjb3iw8Cry2oYu75fvytnao+VyHxT+aNf7NMPhuQqm0wo9HRbkcBuI3nRWrjW403yl0L+WETuGSCxKQpHynnD/m4PUcfWDTanKEFlJUoHk0rNTPG9bnIaAcy74WwDQv3qPW6gGyAuQxBcEgvK5xZ4o8W8JuG7yaC7FabrgfLKdJ0z3ntm2voedsO0wWYEQsActJbmL1M6DuTK/XoA14MRwzcUMyqunT2xiFR3g56Kc2QTkGfeWQmP7E1Sdo5TwQtB3xb/NiaBj6uCTh7UXb2Nq428+HU69lDRKn0ptluJyLQOvzkkNVqYiaZCtZDMomuJ3jlLgbplGIR8wo75MEYLoHn0SPXNsL2k=;
	25:1O9vOOPATLtkRXCUQGSvzJXRMT9FR29O8K7RWw7E0bGkTpev3pcmclzGI7ju88xo514IhbCpNWH2z0c7iLqiIfuK/V/4WoCIx4jbCdiH8L4ouz6TwtJ7knmA8S+6u6FHBvyXOvXLqSmHNUTUf6UceT43qmeEji3sqfubjDmFv3uVzFJOhibkRStbDWJgZMUHoSeMMICS4FgywESnQIntQSwSk8axPVhKCYpaFkJ2fCRjwHvQo2I6/hzhY45NFShvm/THgBb3A5qWV3hDVRVTe2moHSVBJOQBISgkXn1C4t6GiXyVCrsdDdF+H3skt3ONJdD4RMq2xErLWFJKO5Jblg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:PH6mos4cT5nFwpEvO4GVAVL1dBv9rC90byIynLjINwiAzuVBdlG8Kw/XitbZczpKw2YP4GjFm77wfcQc14TW6DP7dWAJt4a9AoTAt6lQ1txBYeGO5OEVSdLnXFeaQPB20m2MVTSwcyysWc4QCosyGmHaC4DDLIPNp739GG5fUz8covWmNr9StmNG++eEgTGEF3P3eK8Tx+HKuMEcjywB8Vtk114P+h8MWpqKErPAKew=;
	20:mtU0BfdUIjvzzPxEngwZ7eLAnzuH4/ZWoRfNsT0I/aUOHdAEbeDqq4QtoMH6/U9LGpiSKzTMDkdxzqwQ09SpGQ6LKANzUFNjqcC/aqHpmyl7vNC+4RxTpaOmU26gF7Oa4pVzlgPb0eBC5Z4UqPlMEaVe//shrQF/pg80rnKmOlA2VxdaBjsF65bX6FI81pkuIO0i6GMUo5mcofFLeardaOC1z3wauOgGFzBQv37FtiU+ZuKD0w1VqooMaJnWYUQwAuQa2nVp71NAfqwxcWAI/4PjnGMKYU8FJmXgiH1IraxBCyeRt2O6oMShwKX8CyuwhjC8e1RLjXuvQNU53KnwESHhEExOyNSNV+vxz0bH+S7jdHWxxViui3fwNL6yc6JgtK/AeTJcq9JsJAGjTcuy5krWSxckSwXjoOhm3eWry210j1R8JLbEHezfRn5qNA9J9P18bDa5V42EEqTtJ6mBayro81fzod6XsQaaQ7SG/wZawk5gr3NmpS+SZlTyqAe7
X-Microsoft-Antispam-PRVS: <BN6PR02MB33793D8DAE16DB0AE2531E06DC0C0@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231023)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:N/0XtyfYWkimUYIeLUKlYp++9Kr4jrQj0fLDBAmQ8qYFZwGbJ4V/I/aNCwQm9jlVT2XrxuN/wxCHerJFsO58XAs3d8yRVz1XZSPX8sEiZwNXfCg7VmjtNQKSr0wqFk2cR3wHAqCUxRlGg3X418dWCAnS7V/VuWsWR9QvArnHgqeqX203mB7IwH1bCsVUdqFuJsDWSCipVqVMG6L4rC2So0y//WtV5MSpvN6SMD/bUyCCSG1aIEEd3Cb9L+zkyq710PqHfopadQpc5faM2rJ62BDRRkhJSj2iShgv0WCYFo/GkkTCFrk4DZNF4abmBo7MgPx5qSex0g55J6WjBRSk3g==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3379;
	23:WnVaOip/KBTvysZjsTAIkwk5Mk71k+rDPAEu0XTp/?=
	=?us-ascii?Q?1iqYKWfTCPdYdL3fhOKDCkfg4uz6IwP0/UZDUsSDWBmAB7nFThmR/JG27gT5?=
	=?us-ascii?Q?nWZqa+wTURmJ1a0QTjDm0aa5dRi/wyEM6M+qtlKUioiDQuyjicrDwDlontFm?=
	=?us-ascii?Q?El2FoQgIDi/tEXcAINKiu361gMov//RSeE7FE2tY73zQwZVZSw5SojVrfex8?=
	=?us-ascii?Q?D1NPxmXOl6ZH50mgxUsLrnTlsMDFiFzoqmjF/NFq0rEwervlH2LyJj7QVmnx?=
	=?us-ascii?Q?R8XxdeoYIGNr7rFW0RRV1tv/3j+f7aHjjgeHIMRINjUlTE5t1T0YBy5EE+vA?=
	=?us-ascii?Q?NXdXC6IM1ntr3w19hMua023x5U9cOu2Y3m7kttEhWxoBVpNxit3r+SKSEply?=
	=?us-ascii?Q?uwi9r+7F06ZRqOMRKYLCcMjk7w7lEGUPOWIODziSjsIzLFrLOLdKXeiw5lKV?=
	=?us-ascii?Q?IxI9NT7kvJBMZ3Mqjm6lmUrQVl0Szsv17S2FBGNb3izApqb23osFQvkr/54Q?=
	=?us-ascii?Q?n185TT+JA6mXEkg7Ffkb9wKdoNiGI/XKgF2bZKfW1iv6qROrtXkIW4UTH/QQ?=
	=?us-ascii?Q?syr5jUdsf9JXGCfG5sax8bT76UqspuXZK0l3KVsM57HrMdAqb6Ii9JWutuet?=
	=?us-ascii?Q?2qenFTJZ4asJxVuL6QKWFlUbtZbwjb7JUJRM0LmwGjJoj/btYzxji1vmCpN8?=
	=?us-ascii?Q?xO6r2/TWaXkYgT+4G76f14jCUoifZTHhIYNnvRqEYOm8ZPuJFqeTRSOhmvQp?=
	=?us-ascii?Q?tnW9ZQCLa8XitLKJ5hlfv8bpY7aLlbMertlHeyygkBuqRhchKRbSWX0sBDPF?=
	=?us-ascii?Q?k2+eOolXMhIlrDvJGf9eJIFLOQFPeYFlOlnPutvcWECPPCz0B0hhDC7j3thH?=
	=?us-ascii?Q?CgKeHVjw3+bMUe/mTinxyKdqZV5YP9xU/pNMEa7z1Q/DKRn/xYuRO4N79q/d?=
	=?us-ascii?Q?xBWVolLNCP8Wepke/zinxY8RIdISWe5kSYtDDjH7hqoilvmUP31ECs+466rb?=
	=?us-ascii?Q?36mL7D5OtX/4RRD8obi7GQP7SczLlqe3NFZPuV1H9uMOw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:CaigjHUbt1dRzyJtXZ65R4e+Z81QbL0K8xjX9PnP7a9pkcmvZwMp9TQHxL1La+fvg/uXpnkxk0AYnlxBLR8cAkoqmL/lq1o8pUUY3lJuRCBSb/6QcX8VEsMw+h9k4WF1oV7VWa2X3fe7YV6jNhrfuHV8tcya7DehW0XrQUkZQlNGisrSqCy2ij97l48vOCQVz8tFj7zQJGFRcyAp17EWdx7e311mSA9i34w9fLtaomaPsa/mTwjdBSsJzAGPIR17Qxzt/bda8L8CYStow44Jeqw6RvxLSGCJHvhylowMvL1YVqHdKoW/3AxtiZ4IEWSXZVtZmFBlS8O2iUxHkQ8DYxEtH49y5nSCBBcD/kiPPpU=;
	5:ym74Ts7GbWPA2aZ3DkBsuzpBRYJA4Ry9b1WFzSUnJtFcJ7g0NQM/mqKOI93ZEwyaEepDo3OBd9/lm3uE1xhNVclhZveaCt9kXqEMk0EUc2lnQuEtRhHMpolYO52pokP0N3TkzwaudA8pctobpf/AxawBBsqtoKp5S2q98hD7a+A=;
	24:4dleDm/f6ZsFOWTO7MOJSOKQPmVwM9Y2tL3jBzYaQyoCv69dJlZx6SDmZhb+yPWac2peC7/2mkQ+0ghldYnpJnfV4sK38PnyjmqFbp4gW0w=;
	7:goWxwc/tQa99Opmt1+GFPc0AwEx00VFANWvW0Wh5mS5VQoXB8PR5cJzJU19hVvseBeeCaMlXkKlUht9q64b2ahX06io4q/LfvsHFcxxh19rb8itu0b+zJJp8zsmQcZfX++g7Hz2v2+f1zU9ZTk/91f+LHWQgCFZNb2AJYa0RjHfusJqDI2rTAfexYV+WosEm8hVfPnM2v2t170sAJFzesBSehcqjZcnXRq/k9gprVY28cPbouRbyGqXQB8g94zZl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:07.1955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c38e4305-0675-4f2a-59f5-08d547cf2c9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.64
Subject: [Qemu-trivial] [PATCH v6 21/29] hw/s390x: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:17 -0000

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

One fprintf(stderr, was manually converted to a
qemu_log_mask(LOG_GUEST_ERROR,

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
V3:
 - Use a qemu_log_mask(LOG_GUEST_ERROR,
V2:
 - Split hw patch into individual directories

 hw/s390x/virtio-ccw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 38f6a8afc9..3d8f26949b 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -426,8 +426,9 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
                  * passes us zeroes for those we don't support.
                  */
                 if (features.features) {
-                    fprintf(stderr, "Guest bug: features[%i]=%x (expected 0)\n",
-                            features.index, features.features);
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "Guest bug: features[%i]=%x (expected 0)",
+                                  features.index, features.features);
                     /* XXX: do a unit check here? */
                 }
             }
-- 
2.14.1


