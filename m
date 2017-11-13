Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENP2-0003uR-13
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOy-0003lM-PO
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOv-0007g3-Fv
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:24 -0500
Received: from mail-cys01nam02on0059.outbound.protection.outlook.com
	([104.47.37.59]:4312
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOv-0007fB-58; Mon, 13 Nov 2017 17:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rl5KAzJZqZewgJ+HsEVNsvuWhgCBUIgxENXfZNIcuks=;
	b=jGTBwK5v3PcECFK0omPthO8hpuyQDZvQ1aO4KgWXBzQXti6+dgBUBfWoJC03UeBOuWfHf8CYKOCDpJzYZDR8+b+skYoy+9z3S5abAjBogAfvtFBi9GmCJeuhZhJvvltyL36WSXyUkEyPvWkgrOtaFHJdSYNahULQ2Gg1tJxo2QQ=
Received: from BLUPR0201CA0030.namprd02.prod.outlook.com (10.163.116.40) by
	BY2PR02MB1330.namprd02.prod.outlook.com (10.162.79.25) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:17 +0000
Received: from BL2NAM02FT062.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by BLUPR0201CA0030.outlook.office365.com
	(2a01:111:e400:52e7::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT062.mail.protection.outlook.com (10.152.77.57) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47806
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0004Wf-3e; Mon, 13 Nov 2017 14:40:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOo-0000sx-Uj; Mon, 13 Nov 2017 14:40:14 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMe11p012829; Mon, 13 Nov 2017 14:40:01 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOb-0000ZN-1v; Mon, 13 Nov 2017 14:40:01 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:36:00 -0800
Message-ID: <cd7b11970c6f11f58c940541c86b8162f0c990e8.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(50226002)(5820100001)(8936002)(316002)(110136005)(36386004)(47776003)(189998001)(39060400002)(4326008)(106002)(54906003)(50466002)(2950100002)(9786002)(305945005)(63266004)(478600001)(50986999)(118296001)(76176999)(2906002)(33646002)(5660300001)(356003)(2870700001)(23676003)(8676002)(36756003)(81156014)(81166006)(77096006)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1330; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT062;
	1:GG2GtfZUn8CK32NIJRSmWluUpQFDnAm45Wsg40ETHBvd1S3DXhuSxtOzDcfmEJTOF5WRnr/AK451JSZSVQAxkBOF2szb0LrO70zY3hP0RQM2RdO/hNt+dDfkx9Wiu6BB
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ceb0433-2f4e-4507-02e4-08d52ae782b9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:BY2PR02MB1330; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	3:ZgVpKNWZGZql6rGgF0wn1S5CteBzJf6VGTFLBH5R50cscgs2zk3tli8zfHF9+5Vt0h+Dis3q3790Kj3CfJrFydZGrfJewHK2tW4T2ePAHyUfAUbxCjszPajftzE7NursTKZLq6/yImSpya281IspJdvWe4o5+RE9DHsjNjmpDIgi1N76XWj0TWtlTwUCFJhtyC5VSQ7NjIEEFnuIr++PdS6Ukp8fquaJ7b7HeUBIz4p8ZwvFJ0sVCwOdR+BX/2UrTxO91yNoPR7HNTJI0k9FB+KxCE8S+az6yIlvr1e8oXJBumvaBcxYyFQ+rscFCIOrmt7wHzQfwpvYfLTczYA7OPnzRxObg2+wLzkyKZU8UQU=;
	25:qnKfcCq6S8AiWTqoWIWjD1WJrkqT92wBe9QiRoeYMLOan6GQSfv11u7c0pcwYcbf/WKLL03rkFQbI44NfQiIm70AvYxW1xrOK09toh/AaUAn8lqGpAo1/i8B5PyCBq5YTN3+/lUp9zfB3p+6D/BbjcgTrVniYkwiBItl8B2Fr8Pyc0R7Acgvmj2OTJ8YiAfvuHEL/NBoDkZUSnrl4lqY1LWhcl+ectTSropomPWeiiQNZ55aMjtVQN2FPIrN1uR12AVlZCrqzqt4fvU3MEkOYUad9/XgQFXByrj2Zuu0pYZTch+VB9Hvx4flyedp1d+pbvXBLsA3pxoW/sPl6SJl/6yQ06feBVKZLMTGO1HEGjg=
X-MS-TrafficTypeDiagnostic: BY2PR02MB1330:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	31:VpRiMXCxmWujyoGLMFQyoGEpXaVb7uWhIjCTIxup3j/V2smaDar+j2kfZk6WFhcMr25CK5wyP44erpX1XbXEG/JUCYVyCkQLHW8nE50nepK+OMrRKFWIxzuGHJowYSRVpKhbnE+eqBtDNfvaiYER+47X20qQ6Ai8qPFnK11y4nw9WH98cEFk1LNwnSyDyQObAiDbH0GZX9nNu1jigeSdVFOn/My9phHtUw7hlcP4HSM=;
	20:Ei9hQvXxQ5sV1dJde6iPdMN0/dbYur0uGbDFMzRbyhetX7YOWexTDEZa5rmXryR0uz+gj4HiKb+AeEWVeUJJoV/xZVPoejegKRxXJgOPZH/2rYqoOnexOqL1KDEy+RdWR61r+ol79l+eNg8lRRVTJB0gOxRLH0uy67ZOumrnSo0rvknsSa6nnXXTnhbJlwwPYSAxvwgsrbHSH8zlBFPrFaa6uNvntTE0uByhnggjNBxrkD36rsfT6oiYXDfuBWiHWFpN/6XK63hOKgN19PjJ5mTcuowj/MlWLJ/qAeTXeYlKol+pfty5geyOFu4B21eKvv00gy5nNl9SleH1zvSPCdFjd1JkxFvNtihyBoHwk6CVv4K5ZS11Lzf1UxIiMUQ08VUXzRHnWR/RWsfy97T8Vm6wro+O5PDWhJuRXxjOjpOy02/JH1cL6oRQ9KiHdMDJIiP8Eo8dA4/nlAJUCEbmN4zV2Eujn/y7Th0nacG8xVHnuS9Qv/y351POXVHNFrtt
X-Microsoft-Antispam-PRVS: <BY2PR02MB13306205F848C8FE6E455DF8DC2B0@BY2PR02MB1330.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(3231022)(93006095)(93004095)(6055026)(6041248)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR02MB1330; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR02MB1330; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	4:VHoxYjMBONrT2/Eeh63w69t1qaucjEqwGICTxaxseFRQvw9XTXledyixPZwcb/uh92sqPX16dR014MBbU89vk6Nj2kHDs5ueULJqFgTHjMcnVgmV8Vli7yHVH5my386Bfix/+gd34vl0rLDrx4LWMMKtZCyTV+JgBltRVLE3ZrHyUwJ3ef1jf6BrCZWjUvQG0B+LMhdX0i4Cy/+8dT1Z/rVzKTxqr5krYBtp0B/uVPbLlqkgpIvkpEO4ZOb29VuggEFwl5Lzw7KNYjOBLzvXYg+qNkI4HZLJNwEjr5kYXnxfYh3RRh2GlC38uV+O4DDDC+kIwnxr3k2BPdySsfKiFQ==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1330;
	23:8rLa0C2YgJRh1LTPQCWbetaHbkUKdrq/3q5vW56ah?=
	=?us-ascii?Q?Aid7dvzE50fuNEfy+7wonVdasUSu3MDH8CA2kaYq6VPJLzvLm1gj2LHhkFII?=
	=?us-ascii?Q?jlLThfL6/HocHVwVX884+NYNDvYEOEul6McNS5CNAxaVYZQGQfjgQjwOtVSP?=
	=?us-ascii?Q?XzCszT9od2n7hPskX9XcaAQDTEY5Riw1cRgFcQAddmL0GK+sy59dtut743v9?=
	=?us-ascii?Q?51xHD9DG+Fu7gRT57K9rTpCdMNc2r+OgBptNZFuD7lXOTa/ZbYJbmHRHFtE/?=
	=?us-ascii?Q?yblASIwlpHy0NB5/ZYHbv3/ddccELaBfiHiPvYO4JJ0dvmw1CS6m25xWg2bg?=
	=?us-ascii?Q?MwNXTXhqeGZeNUj81RzvSjTEXf0Bq/4Kh2Tx9yVOIMdnlaCtBBidrkrSIWRW?=
	=?us-ascii?Q?hBgyGT2uHye2zUyVO2ZU99gTWx8KVGuWpShgurxHR6JlcMpb6mgbAo6s9jt9?=
	=?us-ascii?Q?rgzsCnCMhtoCFOnENmlExf78YRao66upLM6oGBjUBnvfFtkHH3nHqEPedf5T?=
	=?us-ascii?Q?ppsz7hGD0YWrHtRoXqduB68tZpeRAz0imi7Da0fOd/2FwkTmz2BHp8Op2LWz?=
	=?us-ascii?Q?gIfryXgc+cyMIwVs8cUIKEpQGZCvQA8sYZ3vd0TM4Le1DgMjGhoS7FL7XcnE?=
	=?us-ascii?Q?13Vi1AqXRmIgsqOpkAmf0uUriHmT0kf9jIwmTTVLZpziqpby1MGw4RsLooqL?=
	=?us-ascii?Q?9ViCZoImpd1/ALm3LRb6KDDAcZR2W/Z5l9p4DfrWDlNZ/5RWXVkauwpWydP8?=
	=?us-ascii?Q?REa3T9zRAok4duL2+BiYo5lTl9Yu6PiXPe1Ogd5BaYYaeSEEdRiGYgvgsPi/?=
	=?us-ascii?Q?BaVR4trT9IsvBR/xddxgKNPUlwOe5UgeuGPWF1j2y4/29x3LUvKnULWWuq/N?=
	=?us-ascii?Q?vL4obuE+iNhdXsvz56xyjv8Y/sWvFKjdu0u/0ofwCoTOF2I+72N087BZ0LGw?=
	=?us-ascii?Q?jqLwBIjOsLA42K9z/h0ppSc+Qe9Grhr0aKCL0OA2b1Sv18H+hXAyBTmIChS0?=
	=?us-ascii?Q?oc6y6IayeMfCDVBn42MT43InEAHKZC93NP8BRyM6B5YIu7na5FNd2vogomDO?=
	=?us-ascii?Q?jVa9Uc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	6:xgHbeFAPv5GxSEmzmMeu3hnbB1Nk8gVjsUh9sk83RWa+qayzSiHlTsFbYHHhkzOcRwIP62tVkofcTlgyxCV7nlUa2gQSoXXVrw04GYaNgod3LKcThr6r21ZM0x8GL5bbi6e5fCYcJjcNNVDTvPvc3gBdCATaRfr+Wn9DQhqa/xgWSNM/3WT0DaHbBBt1CbGXIBrQCCJH6hJMvZvQXBcfScBlGTJ2vDfqQD0kcJOjVpO0bBp6Fljck1TWOQ1HsQCNJUdsoVw79k2q35+JDAsY3xdVdRTtNn9rF2+iNlPioCbyal1L3iY0+9zzTAVv17TNuwlUt1ku9Nrw9Q1TxMCL6RzW2iDSlBzRJ/9yOANzs8c=;
	5:abWHRaR7fSb33AJRBFFs4CR8UwCgQfVduoUGvnHNDCPbHuRnlb9JD026tg/ZkK3NT3ohdtnvmRghZHw2ypbYs9wIgl1yvuXLzi5/qlbuI1hBEYg+68pPUMuNeYeb2/+0IZYpNidFYZa3cCv0J24DsSojiaj5KmhN1PBgpWsyEAI=;
	24:mz1cKnI+CVSBLfZyh+PO9XGLXa3gK3jzphSh1EUxC7j7wtzzCdDWPBlGLPM7Js72gYUTb1T44pnPTVjNTVxoIVlhr8N1nAU+bARnofH0X+s=;
	7:mU5YAx8lbsHlKI+soQNz3o7R4ZwYqdHF4oTghLYuFqzLRv3wXL7kfJFgrAAhsS+FrvJQKw55oAIn/ULUQ3/O/C2iYS+HE5Oy/louD7vXpYAtGCO0ztaelnanRx+XP40wnJSfP1fGUyRlgpXLuOCVwW/dtVRZ0/RDyRMvyNbOI7N4buCL13IhALZQ1vwlrbVVFD3VGIetLTGCgH1WqKPwpPK1J+JRC+6b55KHbo2IJx1a01V3aHGNhVVKiwbXT1P+
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:15.9111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ceb0433-2f4e-4507-02e4-08d52ae782b9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1330
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.59
Subject: [Qemu-trivial] [PATCH v5 25/29] hw/ssi: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:26 -0000

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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/ssi/omap_spi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 34163e5646..98242d1e8b 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -20,6 +20,7 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
=20
@@ -295,9 +296,9 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
         if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
             omap_mcspi_dmarequest_update(s->ch + ch);
         if (((value >> 12) & 3) =3D=3D 3)			/* TRM */
-            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
+            error_report("%s: invalid TRM value (3)", __func__);
         if (((value >> 7) & 0x1f) < 3)			/* WL */
-            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
+            error_report("%s: invalid WL value (%" PRIx64 ")",
                             __func__, (value >> 7) & 0x1f);
         s->ch[ch].config =3D value & 0x7fffff;
         break;
--=20
2.14.1


