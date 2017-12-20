Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAe-0007Qp-Nl
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAa-0007ND-Ps
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAX-0006TP-OB
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:40 -0500
Received: from mail-bl2nam02on0048.outbound.protection.outlook.com
	([104.47.38.48]:25344
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAX-0006SG-HT; Wed, 20 Dec 2017 12:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Inq9zOESWtUHM7KUnEtrBPE31nZnmUgjx6rdrbJ05jg=;
	b=hEy0WCiHtrYHtBWXUpApbZ3EMM40qJdpmwh+yqZsCWTCHbBOqRIHQLeLHvPziUeDGSQaTimwULsvhPxNnQm+egn5ZG9DPw8p+MeiewPTV4OPXQygjA3d9TKMFzULmVlNnLrx+fwIAIaulDXr1l8CcX7nT60byvTroaGtzd1RwMQ=
Received: from MWHPR0201CA0050.namprd02.prod.outlook.com (10.167.160.27) by
	SN1PR02MB1342.namprd02.prod.outlook.com (10.162.0.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:33 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by MWHPR0201CA0050.outlook.office365.com
	(2603:10b6:301:73::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; reactos.org; dkim=none (message not signed)
	header.d=none;reactos.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49647
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAR-0003rm-Jy; Wed, 20 Dec 2017 09:28:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAR-0003iu-HI; Wed, 20 Dec 2017 09:28:31 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSPES019823; Wed, 20 Dec 2017 09:28:25 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAL-0003iY-DP; Wed, 20 Dec 2017 09:28:25 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Paul Burton <paul.burton@imgtec.com>, Aurelien Jarno
	<aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Date: Wed, 20 Dec 2017 09:24:07 -0800
Message-ID: <3bdb3868489a26cef25bccf2cd19f065141a1060.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(346002)(39380400002)(39860400002)(396003)(376002)(2980300002)(438002)(189003)(199004)(5660300001)(81156014)(575784001)(77096006)(106466001)(5820100001)(36756003)(8936002)(81166006)(118296001)(39060400002)(9786002)(8676002)(50466002)(478600001)(106002)(47776003)(50226002)(2906002)(63266004)(4326008)(76176011)(316002)(305945005)(2870700001)(2950100002)(6666003)(23676004)(36386004)(356003)(54906003)(110136005)(7696005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1342; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT019;
	1:RovStn1W3WM3wH4vgEajM3KeAyQHBdPt27vQUZnYpDXz9Jf3ksknPpuTYRdt0aDLx45PHr9wJOODRfEXPUGpelu2PvVGjsqirOeVbPYPfk1T0jmt7ZLinbDrytKgoQrq
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a06ac8-97bf-4b79-3a8a-08d547cf181b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:SN1PR02MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	3:Ouvtc+V/ic6a/3c8eP9k72ACFXdGhBl9i6lHEPEmQLFRiUTtBE45x/obNSyx/g7FAVWJrhW0CSwCYy1ycSWndH2ZLidwxKVo//oRkf0ysQW+bMMdULeh3WIE7NHZR7QCjOne8Mw0V8t8vEooWURGdvxYyGKR1LBSTIArSLJuRG+Pl8J1wc7GkkLtc5vjPnP+PyW5TW+aJ4qdAXKoX4ccrsfAxwgGyQgyBEVSO7TfUeQGgZA00Z1Pf3G963j6XlOuD7WOVD1ioci1qZOrCswuda9HcDmD8EmIK12pOL5DV8CuupujreTat76U5P0hfFQmYBlucz5w+kPQCQKRDnJzouKyXOJ2xMla5xrk5pND8I8=;
	25:us+krrV+E7620xMGvnfZukXzwkcRysSDQ/HDbgyqcqiXAa0hr/mCU6vaDNLqGIvBeyC/ASoFFluICFKDce2UjzoF9bQ42oGiMlRQ9cRTKsSvspexhs0CejML6S/i8RaJ/rUcXbRQX7apWvHjOnmB+Zb+tkL+rEyVci1LvZhWfaB89aZ+XySm7a1vurQ4IEQOWmkGTAoEJDTSLYY6fAnsFfXdG6pVI7Q/w7atihw7tNe5MIuItUT3BnmTLrkkavCL+D2JPmf3IZ2NClj5lk+u0r18fky+ZoVLYbik/YncD+Y2Xl1911BXXf5N7+RHuZ1ziJxuEIlzl4ByhYUtB4EdISuPrN/GobhYiTEmMFZik/I=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1342:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	31:End4LPNQEIQZ204dihIcY4Fvx9499IumoMv9+nioNyyLp2MuryqJcEfCnWzxsSd/RucA+fwVpUDpQJCTAbqjUEA3OEFboyugg7/iN9jkrVpo+2AVTmQXJuZsTzJocZBHMtK/EQDgIOSnyzgxrqYnF/lKoiDrBYZvcD3mCqYajsXroTXMYU3oji41WgQxeIqHFDY24kLFZwmeDsH7KU1EBuvwbBXcK4JElic5NEPAjv0=;
	20:7M7J4ZqGj9YzorLxs6WOVlpw97DEZoWmTvS/bD/eKiE8OpQXzZq3ocigAK8av0Pbm8QbqedR5PdDP1nQYGZpinHKdDgNv8r6WBO7EAa0EG3DJhh+Xaj0pr/vq40mEIdm+LAwbnaRjk4lCmmst6M/HpcXqP3JTSJ1gG368AUIibaDRNAn2s3oRxBuPWsuhxFWOgKnaiMmyNJG+HN97+9rs/Uc6OfKrf26NyRsDBivb/PjHU24EVd826xNY0x0Zp0Ns6FW4GvmZ5nC1QyL0n2wU9xildj6G3Pi/gWUdhy0fGNmgjok7SueeVU5JwvlEeizvadcmyDTIku9LIb4dEzDIBGrXBCkaWhHhJTKOrk0LlJ7WWCxIvY3zzHUPEfGY0r5PKhodF/l/Dyl5AvjfuzJw+B6ISOoKdRBM1zwWmQHajnrF4X+7OxJ+nE5DODQLq2p+AcIbTuyp9qv/MifScccRYfANWPINbv6CqeORKDljY4FT7kd0HwGVmlLulTmpNhy
X-Microsoft-Antispam-PRVS: <SN1PR02MB1342706AA9E7AEB7F9D11056DC0C0@SN1PR02MB1342.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN1PR02MB1342; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:SN1PR02MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	4:0/rUYMVNeOwhvUmgKEotF7ZIvHgpJWH/JaOXZQBK9k22ir/GVWBbKnf3TlQsA8bf7DQk5EesZnyyK8kJlJUSUSe+6QuVB3W4q7Am+8rmQateEtjwS8li9RDVm9zxheiuGj4aUzEu5xRAdG2RxoUX0rNYlDaLi7iNN/QV70JLHNOBhVNBjeu97zqqNafEOH1WGemIA6WzlSVtVDnqNisss8Ho/It1uGHgzwmipXSYCDOYhKhdfvTw0wQ4ubBBUepdKnVacWF3XK2oFBCDsVlTO3/WE/7bEIFq+g4V4SDiwbTdSUq88s1KHol6IABnU7VpXPd4R6l4UuoVGKOEvv6pmA==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1342;
	23:2Ebi0pJQ4S9ZrajBASJRQamE5Y9zhtIcyK2Ap0Urc?=
	=?us-ascii?Q?awpiCmLyqF5M7UlvkabVAjaTFNI0rRcWoEDHi46M0GrO0NldEPFGzkpanzk6?=
	=?us-ascii?Q?8gr2PekZ8F/CQXbPV5kqq4dZyK1I88cd1z4Niqouzu/Eyn4bWDQcVDatuil7?=
	=?us-ascii?Q?wcPakPAD0LC0kSdCDcU9yzLi+MIEN5jVdPLsQZI76CcUJLT4fQGCoM6obG/E?=
	=?us-ascii?Q?EI/EOoj7UM7718nBLd6LwWJle8K9zTntqwo+2odWLyD2MXlkPjNz07HZDYvn?=
	=?us-ascii?Q?2De1TNVSf4fnUs2+41Nv6jZKvOrsPOwaEQ/pXak5ZbLVI4eqN/HaayxWHepo?=
	=?us-ascii?Q?CHLOqAcMWDOVteV8ylOL65ckEhTBNEd+4f+xWh4QO7qtHAyN9+EK4YXX1ckv?=
	=?us-ascii?Q?5s+YAtRlSEP03Len1MxEI4gTpn2gKCOwHEz0JBse8DNTTlC9FQlRaSPLtpT/?=
	=?us-ascii?Q?pr5OVUEWdxE3n7/fJyx50sut4Nfkr8m87x16WBNKxNrGqELg/Msrwqo/q3+Q?=
	=?us-ascii?Q?x/4uI7fthM4komGxWXWMhSkrWrjBafcXeB24dMiPFMVnxYWdAXmzMpvNwETh?=
	=?us-ascii?Q?0uSHcxGv6YSEHGZfpEXNo0rqyNrgIgvyb/C67mrzGxq1QxlHHlG1kqBjcFad?=
	=?us-ascii?Q?4S41EZov3Zqj7ytk+vuPIsZvqCI5zIDQNF5sGpTbl1qaFAun3vwEMq2Fl+b4?=
	=?us-ascii?Q?tOwK9anbRdFQA8W5PFriBL9VHgDWREQrOhmBmrkdRoPvBqww073MPc1lDMlv?=
	=?us-ascii?Q?fM7j+c5peCHTTodMW3oZh6p+L6Be9YRCJDtf0KrgaUHUBw8lpb385AZb0HVf?=
	=?us-ascii?Q?MLk6C7DD3aGax8R6tEMGWtYpSa7mVVn6aewgwMV58VC1MAlXlQD+KTvG8/lc?=
	=?us-ascii?Q?ODQaP32cFqLcVv+WMUIP9PBxHPZx72A6GRBocjp5a1U/q/mNl+fSWG70zFBV?=
	=?us-ascii?Q?ukJ1O3XTYXqUODqae/SNSapy8VTFAFQRSs5rbHbVi/dfW148Ong6qM/7RJkQ?=
	=?us-ascii?Q?B3t8A9jjrq50gj6wMvmJeMC9FLqgG5ny0hEub2ecIgMf6/z0cwyRArj5Jnjq?=
	=?us-ascii?Q?MaB0WA3iiTaBiWIK88mjjVO9qpo?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	6:1WJREH/0aphE0hiWYKvRjAcombkMoH6Y2DsD37Bu/0nmzvhHCOaWX8Tb3O+PCi6emiFlOA9hE3iHZEgLnWZeErwLHik31ytUxiA0K/4tFgww6Qy7ZZJTb+XHiwE5fCLGew/rEgl3LOpHMAmJi7PagQ6QTJQc2JeX6llRkUKv8m3A9htfjthuoGam1DyUE+K1sF6ern03JBl/Xo5AdEKtWDAaUBG/Y87RbCgNr/GH6vQq7I9sJ/iDkIJME1SdEcWK++bacrCGu+DtqL3mPMMF4yNiDcRknX/XhyLQ28bf5KkajnMQud1wd9Os1HiyIvMqLaPiX02+BPY8X85YGqr6b/PDt7fGCoSK39OTWFGCgA0=;
	5:vGWDWZBV1oYGMHs5RvkEHrx0pShh4d/gzF4L+hsJYvI7USMH2tmuP6dED6zXXe+CoA0HLhdo6Gpb2hJynsVn5tPpqlk41i0WRVpAY8BGr0YNMlYVX9y13FIoA0WXB3dFPiYNB74raG4WWkXbpR9YK4tWqSy8b0E8m2l6U/9j3Bc=;
	24:2GI0nIwM+tSPnIAwNACC9UEf+/oR39PidUWdaD2wGn5ZiAsRIItKSXTBYDhhxxGHyQGzV/dIpw686nGoDiBSR5s9QbzHs9G2UPv/gljgNFg=;
	7:7WO0QT25BrcY1pMgPCZPEWp1XcHfp7LgWVaqbkMOFLyCEURXrgKHAsFBpZSlf3ZEgEZEhndWDPIPzYCZHUQayzdCTj7UQjDrKNOPu7mPY8relfjbi8iYJE6oC/eQukIAFcYhiJrPK/zqo2TX5Zzm/1hlo+YGI2PUUcZsWK4dDfSZMYo1Fj7vQoALJ9aacqvJZoX5QP0VxyJoG28uQ5pUfEkF8uPGzxLYkdnY2vEzanTw9UnPUojuPvLBKIwM+9LL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:32.5095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a06ac8-97bf-4b79-3a8a-08d547cf181b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1342
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.48
Subject: [Qemu-trivial] [PATCH v6 14/29] hw/mips: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:44 -0000

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
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@imgtec.com>
Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org
---
V2:
 - Split hw patch into individual directories

 hw/mips/boston.c        |  4 ++--
 hw/mips/mips_fulong2e.c | 13 ++++++-------
 hw/mips/mips_jazz.c     |  4 ++--
 hw/mips/mips_malta.c    | 16 +++++++---------
 hw/mips/mips_mipssim.c  | 11 +++++------
 hw/mips/mips_r4k.c      | 18 ++++++++----------
 6 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1cb4b6aca2..d91a477191 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -353,7 +353,7 @@ static const void *boston_fdt_filter(void *opaque, cons=
t void *fdt_orig,
=20
     err =3D fdt_open_into(fdt_orig, fdt, fdt_sz);
     if (err) {
-        fprintf(stderr, "unable to open FDT\n");
+        error_report("unable to open FDT");
         return NULL;
     }
=20
@@ -361,7 +361,7 @@ static const void *boston_fdt_filter(void *opaque, cons=
t void *fdt_orig,
             ? machine->kernel_cmdline : " ";
     err =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     if (err < 0) {
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+        error_report("couldn't set /chosen/bootargs");
         return NULL;
     }
=20
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 725e25a134..f68c625666 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -120,7 +120,7 @@ static int64_t load_kernel (CPUMIPSState *env)
                            (uint64_t *)&kernel_low, (uint64_t *)&kernel_hi=
gh,
                            0, EM_MIPS, 1, 0);
     if (kernel_size < 0) {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -134,17 +134,16 @@ static int64_t load_kernel (CPUMIPSState *env)
         if (initrd_size > 0) {
             initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) & INITRD_P=
AGE_MASK;
             if (initrd_offset + initrd_size > ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
                                      initrd_offset, ram_size - initrd_offs=
et);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
@@ -338,7 +337,7 @@ static void mips_fulong2e_init(MachineState *machine)
=20
     isa_bus =3D vt82c686b_init(pci_bus, PCI_DEVFN(FULONG2E_VIA_SLOT, 0));
     if (!isa_bus) {
-        fprintf(stderr, "vt82c686b_init error\n");
+        error_report("vt82c686b_init error");
         exit(1);
     }
=20
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 0d2c0683ba..596f3c210e 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -268,10 +268,10 @@ static void mips_jazz_init(MachineState *machine,
             sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(rc4030, 4));
             break;
         } else if (is_help_option(nd->model)) {
-            fprintf(stderr, "qemu: Supported NICs: dp83932\n");
+            error_report("Supported NICs: dp83932");
             exit(1);
         } else {
-            fprintf(stderr, "qemu: Unsupported NIC: %s\n", nd->model);
+            error_report("Unsupported NIC: %s", nd->model);
             exit(1);
         }
     }
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 37f19428d6..7ca8ba2086 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -812,7 +812,7 @@ static int64_t load_kernel (void)
                            NULL, (uint64_t *)&kernel_entry, NULL,
                            (uint64_t *)&kernel_high, big_endian, EM_MIPS, =
1, 0);
     if (kernel_size < 0) {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -846,9 +846,8 @@ static int64_t load_kernel (void)
             initrd_offset =3D (loaderparams.ram_low_size - initrd_size - 1=
31072
                              - ~INITRD_PAGE_MASK) & INITRD_PAGE_MASK;
             if (kernel_high >=3D initrd_offset) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
@@ -856,8 +855,8 @@ static int64_t load_kernel (void)
                                               ram_size - initrd_offset);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
@@ -1034,9 +1033,8 @@ void mips_malta_init(MachineState *machine)
=20
     /* allocate RAM */
     if (ram_size > (2048u << 20)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d MB, maximum 20=
48 MB\n",
-                ((unsigned int)ram_size / (1 << 20)));
+        error_report("Too much memory for this machine: %dMB, maximum 2048=
MB",
+                     ((unsigned int)ram_size / (1 << 20)));
         exit(1);
     }
=20
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index e5d3654586..e0ba5efc84 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -78,7 +78,7 @@ static int64_t load_kernel(void)
         if ((entry & ~0x7fffffffULL) =3D=3D 0x80000000)
             entry =3D (int32_t)entry;
     } else {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -92,17 +92,16 @@ static int64_t load_kernel(void)
         if (initrd_size > 0) {
             initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) & INITRD_P=
AGE_MASK;
             if (initrd_offset + initrd_size > loaderparams.ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
                 initrd_offset, loaderparams.ram_size - initrd_offset);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 244bd41813..4c17e32559 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -98,7 +98,7 @@ static int64_t load_kernel(void)
         if ((entry & ~0x7fffffffULL) =3D=3D 0x80000000)
             entry =3D (int32_t)entry;
     } else {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -112,9 +112,8 @@ static int64_t load_kernel(void)
         if (initrd_size > 0) {
             initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) & INITRD_P=
AGE_MASK;
             if (initrd_offset + initrd_size > ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
@@ -122,8 +121,8 @@ static int64_t load_kernel(void)
                                               ram_size - initrd_offset);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
@@ -196,9 +195,8 @@ void mips_r4k_init(MachineState *machine)
=20
     /* allocate RAM */
     if (ram_size > (256 << 20)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d MB, maximum 25=
6 MB\n",
-                ((unsigned int)ram_size / (1 << 20)));
+        error_report("Too much memory for this machine: %dMB, maximum 256M=
B",
+                     ((unsigned int)ram_size / (1 << 20)));
         exit(1);
     }
     memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_si=
ze);
@@ -239,7 +237,7 @@ void mips_r4k_init(MachineState *machine)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, mips_rom / sector_len,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("Error registering flash memory.");
 	}
     } else if (!qtest_enabled()) {
         /* not fatal */
--=20
2.14.1


