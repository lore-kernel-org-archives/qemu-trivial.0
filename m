Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAK-00077R-Ei
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAG-00073R-7j
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAC-0005oR-WC
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:20 -0500
Received: from mail-co1nam03on0075.outbound.protection.outlook.com
	([104.47.40.75]:30976
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAC-0005mP-KT; Wed, 20 Dec 2017 12:28:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AWX4c71g+kzdY+bxhaz0/0IDVev7o8AOiZms+K2qTmg=;
	b=B44v06G7OEMUpFEgH0+BM/m2VzILGT3RBO6eDXlDY91ERsZHohUEZ3b+k17PImDN/mCJgYmgguoyK5EYXY+09O7qwddCHC7/6b9uw2ClTzYjkaQ9+ext+FWU3ikD4d7Ol1Fo9RRMn5oFU9m49hC4rTNrRJOGSh/M8ze5PyV3XOE=
Received: from MWHPR02CA0036.namprd02.prod.outlook.com (10.164.133.25) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:12 +0000
Received: from SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by MWHPR02CA0036.outlook.office365.com
	(2603:10b6:301:60::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT014.mail.protection.outlook.com (10.152.72.106) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiA7-0004sN-6d; Wed, 20 Dec 2017 09:28:11 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiA6-0003fa-4B; Wed, 20 Dec 2017 09:28:11 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHS8aI008291; Wed, 20 Dec 2017 09:28:08 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiA4-0003fQ-JM; Wed, 20 Dec 2017 09:28:08 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:23:52 -0800
Message-ID: <1bd7dc68fbced4300f56a3e5efcbd4348e33ed8d.1513790495.git.alistair.francis@xilinx.com>
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
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(356003)(36756003)(39060400002)(50466002)(2870700001)(118296001)(76176011)(4326008)(478600001)(47776003)(36386004)(63266004)(6306002)(8936002)(77096006)(575784001)(6666003)(2950100002)(5820100001)(23676004)(81156014)(305945005)(106466001)(7696005)(8676002)(106002)(81166006)(316002)(2906002)(110136005)(50226002)(54906003)(5660300001)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT014;
	1:Rhk+R2txNQwzWTt/4tbffbxY230yK6IDch05ZiL0Wu6HRmwtDXO6RKBtoUo1uwiIQcIIY8SpRNBZ75vYUxWYl6JV1jfnSksr+vIT86xU/zp6ky+MMHEw57lJydUEt2Pn
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed83e183-108f-47d9-60c6-08d547cf0b7b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:I/wimS2TimyuezMFd/U+P947v/WWl5tY9FkOxqRRGiyFeQdnARqc6GeEw5dd3iqNjymiSICq3auRQG88eTvy+4mnnLIsGNqMrI3drck7SoeC2GIJhO57lYh9VHz53XXyTNscJJrGuORrxlkkyJV6NesyGDhg2nQ9qUGf9OqgClXueGx4sKrG1Zd3he6ySG7kEZz0hBsKB+jZQYRbAHKjBSyHNxa/35At5gQemM94eL4MJZAO5amZ4GeAPbwvYoMqs3+/J7p7t1+gUuz0Q4bPBcNJmLqzNivUfEoSjSC+IlL4uCWCGSQwGi95GOXYdDwas6q6d7pIaSwohiMv7L//eI/XehSaara9lBec0dOP8i0=;
	25:GnGvBJP2JeqSY4qAUMkLHqhRit3/qoTk2qymg/EzGspLLef4kWPGnqp5/MqzK2sEOCMqVZ7VX438fMndJa9QahNtw1kknznB8QzBpmIyv+UlBE3caqncIX/KYS3FfVUNSgXdaF4/rrGPlZv6XZOAZJ8YOKE9c8xqWBswPT0rtDN04k7gPY3Z35r6lTLEyz12tjACCt+nETR2zJ+PUx5BT/rZdNwxMipp6XK4ZGiMALEUSeqA6amwyueJQKR98Gtbz2ZR6t/rZXt/i77xFf4tIMTxXTV9TlpjXhZyUwwhK7JpQSN/OU6n5aTdny3cBfDCCLQZSne+m7PBFq23BxvARw==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:5HKwBXhm/MLZ31+v7vFjapR0/qv70BiMjIbEyCR8TlgQq+agSpoN0DabMxpGYy2vpLs5uEXWDP23LJylmU++SyEUJmFdaCgxh1E9oQOfvK2rb7/IU6h9xYy52LlJFjcoDyAzNvTB2MiRjSOSDuLK/iGxjRbRH0N6tCg/HuHMu6qOAQds4Epg8alTZ1Wb947ezWTx2jI04lSpWUj517oBhsArbqgxDLsQrBV6lz47M00=;
	20:cY8cWusajh3qE3jx1NkJJEhkNdoxLx/IUErEmi6mhSoD4OeIrk3I9QWmjoxfZKw9gwjRmSe5P7FJdbl4mKQfhGe9GNLVSGCFqo4hBoB0ZtQ06ORF5j+9z/HeJ6j3+sxE00+odiKsoDi0Y3AqE/N4cHppW9LB6XkNEC54xhwU/OAglDVVCRVYjjJYSSpE4THoYRfHpRhA1CqXMgf9b+EfmipEEPNbYAQSAzCDXol6oLn2fzvzqsj3k+Ts7WckZFQWtIMxxa6+PJBcNh85Ox9UvPP5qx2M7dG3b0xXOfLLLxyRU/s/SCrPFaXLXkumSjkVXwAUqnbAY5cwR4DsPc24KAJ+LywDwzjZ5FN5uzOVNcnGId/XdjYcx1/JIwjsFDmdesa7+HdJHu8Gs3UFvm7/1ST+bM0WCTYO+yneo+aeOld5ZmmT51TLJQDP1AO8t2VDi1O60opme8hboyMK7ouTF0OOZK5btjR98k7jTvGSpNQ4iLnFAoXNTiuDKnS+ot0a
X-Microsoft-Antispam-PRVS: <BN6PR02MB3379086EF01FDE8632E639CEDC0C0@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231023)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:KBsFxjEliOwAvG0/42tYoVhMgT2cnQ78MOTqQStqFybNzXcjGuxXsVlfXL3AKj+5KbXvlwsLzTnG3fdi5zfne+sBjcjSUZH6MzeYVtfnlTiFDG5ftPjRHzt1dyb1MNj/iacqEt9N5ZqbZloOnz+OnB7VQzsD5ZW8AVRTwZk1KHXkz3H5oEkrmr4/HiSK96eMYH+4EHFmoYt5nwifhRvvp99oVpIyNUQpcmAxyHxUo4+/OhCBx1BnGiHaB9Y2TFYfDfb/BS3J786UxXDnqvdHL8Zw7OK+eB1+yTj296FaJsPwsUg+qIB4qiRRLrsoMiGjkr2MPhdepVhGdyetyIxa6Exy2aOLGY9hg8pA+T+SubAVpAzuQUr34zFET/l7IPa+VNyqonB/5VT5MjE3+GwGDW946CniKW2j2yUlTByL0LU=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3379;
	23:+OiOyitalgTQAdSZ9V6Lub+j09AgB7s3cSCh3bTYG?=
	=?us-ascii?Q?K8mDvecw5LBcg3pnGVkvW2jnUp7f0G/DHaDrF6Qg7X2ZyWVAtj2757dj0UI9?=
	=?us-ascii?Q?2Aazjle+bcAhy73uzC4/5T/fohCoOoX3YBayVzQPYOUv2upvPEONfH8BIsNq?=
	=?us-ascii?Q?7Wk915ZrFbQGW8HZUBFxLHkppcOc/CtOh4AT6scTzXk7KP1zr2iqEpSe6j68?=
	=?us-ascii?Q?yIEAlcJPkard8e0fdJcNzbyQsnBFf1fhETH4AUiqZWtpcCxYdAza/FJC+WEV?=
	=?us-ascii?Q?4cwjc3Z97Zvcv3wEZdcpHc3bn5/QiE/xQMcxpt/FjW/FZ9DF0daHNboH2Zua?=
	=?us-ascii?Q?FEB1KMuZAOC3dIT32FILFYGhQj+NBF4GN9k7NGgB7pdwa6G9/FODuUKIa/gY?=
	=?us-ascii?Q?R8Rheipn38wsc0jo07h0w8ILgXx4lTe0R05nBgb+MwFQinsrYLFCRCkjIy4C?=
	=?us-ascii?Q?eL+wwLc8r3AfjA1Jx3RLKD9XA+oaKqIzZO1gsD0v8iBrgXPt9IBqTN7nir25?=
	=?us-ascii?Q?Y6UksHcRyIxmo94wUqqgHQP9RblOUj//qye89aVKe/pl6FDrGk9lVglz6HQ3?=
	=?us-ascii?Q?BS6MqUDw2Q7XIL2Hk0Q97B/uGLFOaP6YYIrWKLRnO7CgvHKl7kaKRrxrbKLg?=
	=?us-ascii?Q?Oey9d5KVRKzyPMUyPUhPPIfyihs5ZmwSmu2wHucYfK++EtZrlBvq45DHhU/V?=
	=?us-ascii?Q?wCZnEtZwUZb5R/x0LFtU6yapEDbHJR/PFOSBFOZHcHBxOsvv30JeMoBBLScW?=
	=?us-ascii?Q?qtChYiV/g/KDTimKMTax2G+uSo7iZJNR1+Q8Eo70GP4fZt8qWDYv16NWKypo?=
	=?us-ascii?Q?h+dYj8t+tFDWwiSnjEj4OqOjryhReoKpdtBNHFEa+/E/6O1vQkVKuhoVMjRX?=
	=?us-ascii?Q?bX3YGNEgr5dg1gKONznJqs9e2W99YcSCMEB5o1STlB2gVv/NJ+NhUbDiDK8r?=
	=?us-ascii?Q?Von4uziOtPTOJM3MgNUUQ3wYeOo4Aba/ekxkGGRt5WaTT7Leb21ejosvCJi5?=
	=?us-ascii?Q?/WfsBTEg/frbzyz9wTnpL+hjbns3VTQ10PNJrSk8pOmpDaZu8PQ2o4FtcBwR?=
	=?us-ascii?Q?A/A6Q4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:Yb853M0YAVwEbdnUbhFKfZ0Ht4yBPOU1XE6f6dBxF6/k5J4fpfREqs3/YIAOc8ND+uJc+4GM+pKXPmd/ECy1uJmK31Ze/QSJHS2cuLAXTFI8Rv7G2ga73s84EpPHNNMRLieEoJph1Duq2MjuseUExsiBntuE9yGU+ciA8FTAiUfTyyZJfBHYYaDFp1dXvvB4oKHwj48sXYvJ8QfH9KS67XZfMbFZsMX/rK/Au/0KDWMqwHw647kxjAtyBARmJ4fpy/l9drcE9elRxhtxahELUF/Sp9xPMAvmtVzsBmIwuDoc2Y746kQswO2q4Bb5oq4W+5BSMqywFQChmBus74xj9J4pKMNoUbEd7jqBeGpCFR4=;
	5:V3b/Srr3Evv1sUQLzyjgQQZ+RoXCB9J8ZiD0PUXlxmT10LUopBCAgO8x3Uy3V9w77NARPrZ6IR2LJJa0ocM5MHRoJjLESxyV9lG0xoZsgu9MNfFVAsUB3EQSAVyP77hbB5oFOVflwqIUX64pR2F4RdxAx6GV81oRmv0Bfzixm/c=;
	24:rLJ+jY6BdSVGikVa6WNWRZnLSwkpmLXJAY3lDjqUGcLYKsOQUmLJ5OV1Cwu6oBXJkQdTryxZh/MMmVgwV+AtbuVITjhzvI1npKPYRNE53jU=;
	7:XBQHA4glGNsF7QMGpHDNnS4pSU0niHlwERo0uRrUACQ+xFaXGjQCAyX7KPImU9jPRdFPhEtOnLTFlaMitz9C4q8ErGJZFAoRmihaWbBNZULR4S9Hy8mIsRmaD8hneOIJoqfLe3UM8qGD+GKUvX+zjiQ2G4NLZ1K1iv13c7Fen1M8aHKIUX6pP2HFASssqCNnU9ZHOsrIcsr2Re1nKx0q/0pay5vyvhMbqZUSYyw5Hq2Mwvg80Kajbb9cwQM6dm0p
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:11.6730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed83e183-108f-47d9-60c6-08d547cf0b7b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.75
Subject: [Qemu-trivial] [PATCH v6 12/29] hw/isa: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:21 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/isa/isa-bus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 348e0eab9d..0f2e426d02 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licens=
es/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "monitor/monitor.h"
@@ -186,15 +187,15 @@ ISADevice *isa_vga_init(ISABus *bus)
     case VGA_CIRRUS:
         return isa_create_simple(bus, "isa-cirrus-vga");
     case VGA_QXL:
-        fprintf(stderr, "%s: qxl: no PCI bus\n", __func__);
+        error_report("%s: qxl: no PCI bus", __func__);
         return NULL;
     case VGA_STD:
         return isa_create_simple(bus, "isa-vga");
     case VGA_VMWARE:
-        fprintf(stderr, "%s: vmware_vga: no PCI bus\n", __func__);
+        error_report("%s: vmware_vga: no PCI bus", __func__);
         return NULL;
     case VGA_VIRTIO:
-        fprintf(stderr, "%s: virtio-vga: no PCI bus\n", __func__);
+        error_report("%s: virtio-vga: no PCI bus", __func__);
         return NULL;
     case VGA_NONE:
     default:
--=20
2.14.1


