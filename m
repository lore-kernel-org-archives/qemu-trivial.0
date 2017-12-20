Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAy-0007mD-U7
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAs-0007fx-Il
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAp-0006wa-Hg
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:58 -0500
Received: from mail-cys01nam02on0056.outbound.protection.outlook.com
	([104.47.37.56]:26993
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAp-0006vo-76; Wed, 20 Dec 2017 12:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rpl2mMZTR7srl96jfSlHAMKQXbJDJe8RpKhDUoN5SfQ=;
	b=thqFhn9lgV7fgvffPdm8T6kuFIvX/vL3sW+nKN0JuaOl03o04ZQS3IJ71cJHq4rNWSddTn68JiIr83vS4JFPWyMkx/oW6STuvHbzcZ/lMtz5n2Th/pPt/UNX5WeAr4eBAWa3DLH5ZZPSlNk+pZw4/mQW7MzhE0vv4L5Q2S7aPv8=
Received: from BN6PR02CA0033.namprd02.prod.outlook.com (10.173.146.147) by
	BN6PR02MB3378.namprd02.prod.outlook.com (10.161.152.166) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:53 +0000
Received: from SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by BN6PR02CA0033.outlook.office365.com
	(2603:10b6:404:5f::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT064.mail.protection.outlook.com (10.152.72.143) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49913
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAm-0003sg-4v; Wed, 20 Dec 2017 09:28:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAm-0003lo-2U; Wed, 20 Dec 2017 09:28:52 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSfi3008424; Wed, 20 Dec 2017 09:28:42 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAb-0003l3-SE; Wed, 20 Dec 2017 09:28:41 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:24:26 -0800
Message-ID: <9a855de62a1da7499c589c4984b4673a9312aa7f.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(376002)(346002)(396003)(39860400002)(39380400002)(2980300002)(438002)(189003)(199004)(81156014)(47776003)(118296001)(50466002)(50226002)(8936002)(5820100001)(23676004)(7696005)(478600001)(8676002)(36756003)(356003)(2906002)(305945005)(2950100002)(6666003)(575784001)(76176011)(63266004)(36386004)(5660300001)(2870700001)(4326008)(77096006)(39060400002)(81166006)(106466001)(316002)(106002)(54906003)(9786002)(110136005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3378; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT064;
	1:EMLRcxOozlur9psDdFOezm+jw/RcjDxYW9a57O2dP7FpL8UakNLDyenPLTUT51e6Eas8q73oTcyU9PieinsY3H0SM7egP0zDU0V8GTiArynEKNXYxrBSoIApPJd7w5uA
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ece6b101-683d-4758-6bec-08d547cf23c4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	3:okp62GxT2X/fGYwil18WDCwfzKW7bUTIEsba95XSsqsmYYK0Nr2cnWcCLHUYDg8GUp2DkTucMRTntux40noS3/gXbHJk8zY1Fw5fmdodGKKhbcVb4QD76bYEtP9Tjf3Q7yXEB+a4t2JmmzzxE/1C7xSedwkSpA8IQJbQflQ7HFHwltQZ6xHjf2nwBuMdPbEWk8sfZiWTBzC4WOlEtSIdBuEwpoeCs4eLOebM/sK99gt8CbVO4T6JHMWoxOjzZ+kOOfwMXSlZfL/smELtWJBYfLRaBtTIOP+IwUtK0ZNV9i5yLCIKO0/nfA6eAtMgFq+jFOhQplXRXMBTUIqkIX2vYlYrp/64Vd4P8D1MN1kkXOk=;
	25:g4jM5SseWVzEPMuJhr2grPanyKg113c/eocabU7MmvxA2FeeSL1DadSBVkLGSb1slAoFSm1WBYu25LJT4/DiJeFtFU4UYL7TlcmjK9brZ3fCJFVMmuvETA1PpQcV2JXwIxtnwnFJt6lju/E9zLJbzEgYFl9apkaabHuAvcNjLEczPrBsPcS2BcWkaFpSvckHMjCGm9AzZWcwxdGpdMQywF6vieDzwK4ssTWBQX5+8+qmX1f1MF1EdQwa75R34kZTEBanMJi+seRt4ATAGEDkhziafMyIwRJJ3PSuWZAPHkjQ6ZSCfjBJmxe6l1krHle2AibSxoOaKcA/9qEJxf8OAQ==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3378:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	31:5HiZa+Xf/nOybiXCoaekgwqAd0ih1EBu7L12Qo/Dmj6w8TKCHKNwqPV5EJNj5lDcOoEtLKQXVd0qVAhDfbBTXCnkcR0Xmfwi0F3nIXF25bHdJdzuDDBCa+/ANjmSHfkpnxgaR9IMeOBOF7RWaiq/pl8QNrFDBXklCvDwjMTNO6xuHB+JloCAHh4BtxYR1044GgAtJkE9+YELB/tKOfgXv1I69tSYhkX6Lz97Zc23UDw=;
	20:xo/GhAb2SCF7yCmN7j7u/tJFQ/4I5EqtsET3GJ/eNUenQez4MsnXiUbCkBWVeTs0JcpyIECLFd2SE10FuI32bmjmyW5OPblFrcPFw52cRNM41U/wsRA8OdE4SC7htVKjm1ylRiBFufzCSySBvp7/v2a2C9klzeVmVLkogiC6xmP0lsdvglBx9e8cRO/9gbRwUDQ7Ls4urhEVdQxYfvfkKSQ93lCWlFY+RrYUzzV5hFrMazSOEstdgNTFpCTBRPVVtz1iGty8/FWDBbT0JpkyBOAYZt+SwlsL4Iu8ZgPRPFCakt6GbGa0UBMIxtKM4IgNVVsY1mI/Sh6CC7A88v0b7/ffZ1v1DsGDgZt02bqBicm+LKPIOOEhQ7FtWe9JLBOTTWwtmTkPBYfZksD3ToGSx6NrkHaSzg4KJ/Mqc1HOSRZB7WQ1sMH5vBLUvO/pUYQzpez97f5cyfkODtRwtLL2egExlGRLV+q/dhnENN0SunjWyJarO/ymeXwidZNiFljc
X-Microsoft-Antispam-PRVS: <BN6PR02MB3378A84668132DB1E4A4F3EFDC0C0@BN6PR02MB3378.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3378; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	4:6fmJQF3bBTJ0KiViOHth/5iGgyr9iokG5Zy4D8c4OKdgqlZRW3R0zzeEkh2Z3buoY7VVVh9JLgC+yXc+hIQK6sKlK+Jw1TeT1/2ERiHqLta12bvXjt2ThCutK9kOQgD3rBWcLrTJPS3hqjJPmDsbRtv3LKyFqkej0U6Bhdw3ZBqxlELMXJrhSZ/TujIJUb54JuqAkrapbD/R/6tM8XMbQEtJKTWE9jGg3D4gogQ13KIp6Cjvf/pkKDqHN/nYvnkgfJxG1gGkWtnU20DTbqUNiqp7PUNaOfIpaI2DHVWt0fvD2tiS7autUHXy43597rpHgn2hNnyuNIXWWW9ynd7GVQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3378;
	23:nGpkuAQsgF4EjpdsrtUInw71NSNrcE8LqTLyl24M6?=
	=?us-ascii?Q?HNNAavoY2arugqY5gG8iHoJYr9C6mWXggE2/GZ9EhizXTMSXGuglAd4DDLjx?=
	=?us-ascii?Q?Q2z4FsR964cUGQYsj6g/Xt5o5FEvGziCJR5ssnJ7nNQBNoeIQ/XXjhDw1AZt?=
	=?us-ascii?Q?qjziIGDwZiWnj6aIAIP2P4Lv5BRKQWpOZs8IBPX/aQTSSQkARU67VqMuWywC?=
	=?us-ascii?Q?jHQKjPcDBHG3WBcy5KPmIDniyFQn5sYM+xMY5IjqualS3uIjlIPFt4nRWaNw?=
	=?us-ascii?Q?BVoR1gaRJsR0ViNSQg9nc7YG9+73JO1PNhg5LGiLxYGi2ypyL4ZGWH1N1hpg?=
	=?us-ascii?Q?exQjJV8qCnwfgcKIoab+Y3RsLsozww1WLJVNk5BdwYMGsHOecEbnc9I9T0w0?=
	=?us-ascii?Q?SwReVboYk8Y/u1KJLKS1NkcQaKlyfLLtt5XN1BskR4xCKxoF4ErvpiErzP1F?=
	=?us-ascii?Q?9WJ6bWDhznaK/3KpAwQYsiNzOrupiS1y9/02wFmWWbCK2NVPhFBPvQsv1ouv?=
	=?us-ascii?Q?LA5vzxJUS49tbLFC0775180vQI0Bd8qZ18K4rLzqA8eMuibRqKulF4Wt+etR?=
	=?us-ascii?Q?Adctg4Ks1lvRm8oXHf70Za4Qg8QNCK/BcUfTl1tZOSX/ujq40darGlyM3Lc1?=
	=?us-ascii?Q?hi5rCgZmhLyWx9XtZXxPLCxdY8glLDK9U+B6hwHkw6i8chXj7MF4KoagPLnR?=
	=?us-ascii?Q?riBRu4fL7zY4XfjAsS7t5jA9ayPhcUrinLTUts959GyQkupCrTcWtBH+IraR?=
	=?us-ascii?Q?haXiwOLFtTKva1wlMpiGCJ6SFkjWr4xKBzk+dZANBNQhZTWxRNOqLpQfkKwC?=
	=?us-ascii?Q?QVk/rCHMr2qCG01+aRBk76PdEmLdvCPm6KNkuIGHohcSGoGWGDIIHaE/oVum?=
	=?us-ascii?Q?bb/vNfBIbJIrFumUxVS17b1dBZ3N7Yj9+qbxfm/VwoBbiSCL4UGUxG15u78O?=
	=?us-ascii?Q?e4aBZ/k9g8I1qSvhfQY4V1w8mlGFhp1rqd/kwhafUfyol0Ig1tJ5TJn3s2Y5?=
	=?us-ascii?Q?+wxP/IBYxruiaiXWd4Sm7CVOGJ6zM50HgRg6z8jcq9vB8wQhawSSftxfJsPA?=
	=?us-ascii?Q?IjPSMvjMN/SEKJnIYuXkJEQD2Yf?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	6:2SloTtjGivt6iCeNHqsCJAINqOj8wmLMH8Gv9feABLwYYr7UVlodGzhRe6cu/DWc1MbNI7XrfPS7f6K4uJRw8M+N31G0a5JoEgH++HS5iYgl7H5Jw8kWSN+taFbt3/lRnCg89bmjnFP44T7cPcn/9jhh/TxIuVHnRRQsuK6mqFYYxgT0jlBcijFqc+cRAMh/byx/nEQGocJ1tzpjrX/njjkEIiL8HL0kvYiLjCHNLoDCFqHsfqBmLV021Y7kg//fJsKk2ewe4ejeRNPcpn1cc4ZAk1fjUVSciLxzTuJxJ8RQBV6yIw7iWJ5KkiOkPE7z56/O1a75+aCz+LI7zLqA9UyrybS8so049q+X6gFW9U8=;
	5:7B+Rk0eYFByiTa4x3RU1ypfYVqnltHW5VCPslBZnoi/kGork593eR/xBpUS9ox+bfWUjCveZ2Fmc7POMB7xfPojA/7eK6zCgWXWg4/nVkgD5Nm/Qi4wzx0mw1JCY5ZyB183CzgfketOBauFsz5nlgk6Y8AoieiRtAx61rrUDDc0=;
	24:7UXB78NIQzcaXI2gIGkTXhKeqBQCRKxNijob03SmaEhDvNT9n9Mod4NUSKs45uZMQ8DRPdEydaL3e67hFgPMmQXdArpx6OhR5ld+YMXx0XQ=;
	7:0vttdtbBUymwuG3BvX/nvIj/LHj2G4tSWHON4iznr2tjluwdSqSH+IBB9GfGa4W3I0J1gSUjDFLHky+x29eClGsPAeH2R3LtBvf4oZWXHYY9F9scW4hQ6DTUBy61gsK4UVKhESxyqX7V52lX9L75RwTUaZxz7VaRbkfI5dmlev8lZIBisT4TBgZal0NgPQXjk0Juw01G6EXr8fKfYB0S5H0Ld9+Z0mBuQJ0LO2XLP75nON86MtzZ62zNyB6VcZb4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:52.4170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ece6b101-683d-4758-6bec-08d547cf23c4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3378
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.56
Subject: [Qemu-trivial] [PATCH v6 17/29] hw/nvram: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:01 -0000

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

Some of the message in put_unused() was removed and replaced with
g_assert_not_reached() and some of the messages were updated.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V3:
 - Add g_assert_not_reached() in unused function
V2:
 - Split hw patch into individual directories

 hw/nvram/eeprom93xx.c | 7 ++++---
 hw/nvram/fw_cfg.c     | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index 2fd0e3c29f..6ffce745ae 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -36,6 +36,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/nvram/eeprom93xx.h"
=20
@@ -105,9 +106,9 @@ static int get_uint16_from_uint8(QEMUFile *f, void *pv,=
 size_t size,
 static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField *fi=
eld,
                       QJSON *vmdesc)
 {
-    fprintf(stderr, "uint16_from_uint8 is used only for backwards compatib=
ility.\n");
-    fprintf(stderr, "Never should be used to write a new state.\n");
-    exit(0);
+    error_report("uint16_from_uint8 is used only for backwards compatibili=
ty.");
+    error_report("It should never be used to write a new state.");
+    g_assert_not_reached();
=20
     return 0;
 }
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 753ac0e4ea..49375485ef 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -518,8 +518,8 @@ static int get_uint32_as_uint16(QEMUFile *f, void *pv, =
size_t size,
 static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField *fi=
eld,
                       QJSON *vmdesc)
 {
-    fprintf(stderr, "uint32_as_uint16 is only used for backward compatibil=
ity.\n");
-    fprintf(stderr, "This functions shouldn't be called.\n");
+    error_report("uint32_as_uint16 is only used for backward compatibility=
.");
+    g_assert_not_reached();
=20
     return 0;
 }
--=20
2.14.1


