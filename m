Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOq-0003VM-Cr
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOl-0003I8-TE
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOi-0007VI-Nt
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:11 -0500
Received: from mail-by2nam03on0061.outbound.protection.outlook.com
	([104.47.42.61]:46625
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOW-0007Nw-TL; Mon, 13 Nov 2017 17:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ioUUt0Glyka/OqpF4Rzcsc7Nr861Dg059qUhIotLBrQ=;
	b=yxZKVfZ4uDCooZKiH1eIlEDkWaafOYRxEVFGczhOE0rDR0xsiHb/5ZmHDjzbmo9lFC/g+YPqcz9DZ6YVReM3k3266MQd+tDHJJtctiCkQzdtgbfNiEMRdKLgjiMUXhp4uS4vSmgF83I4knsoG1gZURqXfnVnNwKWAKgbZSZ1I+k=
Received: from BN6PR02CA0032.namprd02.prod.outlook.com (10.173.146.146) by
	BN6PR02MB3380.namprd02.prod.outlook.com (10.161.153.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:53 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BN6PR02CA0032.outlook.office365.com
	(2603:10b6:404:5f::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOS-00049p-9D; Mon, 13 Nov 2017 14:39:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOS-0000WC-6E; Mon, 13 Nov 2017 14:39:52 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdj4l002851; Mon, 13 Nov 2017 14:39:45 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOL-0000VF-3t; Mon, 13 Nov 2017 14:39:45 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, <qemu-ppc@nongnu.org>
Date: Mon, 13 Nov 2017 14:35:45 -0800
Message-ID: <6cb7a17813bdc7df94d3efbe5d0b54d90e14ed98.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(47776003)(575784001)(16586007)(106002)(63266004)(76176999)(50986999)(189998001)(54906003)(110136005)(33646002)(106466001)(36756003)(5660300001)(8936002)(316002)(77096006)(9786002)(2950100002)(36386004)(4326008)(48376002)(5003940100001)(50466002)(478600001)(81156014)(118296001)(2906002)(356003)(8676002)(39060400002)(305945005)(81166006)(50226002)(107986001)(21314002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3380; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT047;
	1:Nz1BfrmXxAIJd4atOR21cwQ/dKcwQncLluOh/xTaDPX+wvY371U5yAdVS/3crE+jZTwZY2w1PKVcKjry4ZQy2tk4jCdz2X6qj07DX3hFqXmQwsoc8qztxqyTzX8rbNvD
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45fa191e-b1e9-4873-543d-08d52ae77531
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3380; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	3:35D7e1ZdwaFVXUE8dnwoVMob2ERU0ZmqodyHjkNSOaz+rfu9QmjmzMg2NNCEPkgKjfMHdWaOHfF4y2wkEsnKjge8KvKI24TEp8roRVKxLMX5c4PRZFBCdE4mxKU9FxGsiIfUbfrjQ5Qu2GqQCdmvK+2G7ouVOicTmcEMMn+B1BA5SzBPPENF9BoHyquthGVYQhakE+lM4vJT6QL99Zc47lIcAYxC50pl62B6lSZzbhZ6ErkAnMuS3r7hclua7/2/jvt7mY+SYnBIT11xaM+SlTrU16x5TD5J3OG9i7f4Oar3Z/xZoIPQwCApkMUiYx9ctb4c2LRf5MPAVYslBWFAZRZTBkHMnHZEsuQq8SAp3jA=;
	25:nMGf2CNIHhqBFHYLnsqty06gzjOwrgpG60zhthCdgdivsFzbYZRND0CKAaLHpRIEkSF3EjHTyrBsY8SS3V6Tgx300F9iUdQUiVQZluOJtEF7HyxKD6rkwzAmvzS7KSBdWisx/TDce7U7aDr6q/+KeTuzOcbyKZ1Bpd+rpIkslIFjRBbn58eESvXiOCRLTgr8R6F5yj9LbKTT5emtYe2eoqA2W6vgGAa1c8GNMU68v+bqQGfLtAQ5WdKVxt0H0t0IxEbFleye5MaHaCYR5FpSSY8AokAq2Svjencf5nrv53qtIoBkTXd71EUVNPKpmnlI908w1hFnpqT6C2T2hBVHZw==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3380:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	31:JKrHkx7smBeg/rnnVzStl+xHkV1e7uX7sx+ZHANukhKFvcFONRTb2I18UZMzclDf5u2NgztzSsRRIJtRCdjsdJSu8ssWC1imt+K8Y0SC9aHYCiCGhOVskE0x7NJg733ShhHzUgoacO866ZPMJ2m+z1yM4ezr7l+5NA/goXdyogeUOf/lQ4kjeY6KUiKeoFwiaJWdTnofmT48cBeab5KoWaBpVDCzZOTbna2hz2+F4q8=;
	20:7TOV1bYrkvFAuoNo4+DQ5cJ1PeXmPNI1q4oKGvXnB3VMM7lAWIzq3mOlUtUtazDcjeUCN0N7q7eQ2IPmMprfmo0XCKY62WqwfpUGQ1im9W9BGmFTzLXEy3EcVKBZRoD30mGVUMhq7Ac3unY/j3FU1kR97eXMrXhZESrzOnfPkZhpCSq/9lzRc4PbY2GRHn94da9VOom9RECqnE43Y6wrTo4J+QMRZhHcb+CI/pjsf+i03X8nAb1xV6d7BPRCMBaIbj0ljBOBct6fr+KaE2gKppd+p8uRlPb8DvOjGE4mdhVeW3WEocd2ZlbvXP69xVi96phRAxsz1AAeDaxpNumpWQ2WmNA3fAfRptnGJYg+ChryyfMqJHnW+aVtiS/sJwUgpthmuKmNp9s42NvJ3hgBFC5Etu18VBcADESxTbT978fc+EAv1BntoLq6Wft8/p0HtKtasYJptbQSN+F3xWKsDU0Ljw6mepXQXszc1W9NZ5YPh6F4uuR0LQFqVvDMpQwy
X-Microsoft-Antispam-PRVS: <BN6PR02MB338057E65E6F307BF87285D8DC2B0@BN6PR02MB3380.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(142945433499172)(788757137089)(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231022)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3380; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3380; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	4:3URWjnNy4f8J0cRm+1+Vqd8aHWW+1WoHMMyfMn7vOykmsrrO1GBKy1wTp2lHBdfsxAEi4hF2ZDS/5/pfMPDBkDyNaL/V7ldlhi127v2me01NUzdya+6gsMnSedeec0nYyqzRBVBCVqQVAm5KJT8Z8PSTDnwcmo9TPTi/mtZCz+/TprJ95BkyIeWYCHtoChojlhor+wNtnwJGsVYcZrkei+5rZtfgaFpxhhCMUeQEC5eNFMGS1OXWWZspPqwnWkfAkHK/RsWGXN59Cg1fnXBTuSaBe6GbumBwvRSnx6UjA5kKPwZERYkR890RsFuYzhNVDh3+9eHVTCoTaxnpR2I/xjQejXXeA5N5vqK1XgeNb3G+GiBo9U5ZvdxLtVhlE6bazH2e7/2MYLBXbqKm71KhCA==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3380;
	23:bvOMk4H09VqMpGz4fDC2ZdMTor+OnNLiGKD2fsdbH?=
	=?us-ascii?Q?mIg4jyBXvUgVrTT7+mXfFQD2n3q0pjAlyamcC2aJAfRNlCnCCVxTt23xpxdb?=
	=?us-ascii?Q?aJlzD8+KAjek8ETYinkolQCw6ojhyDv7pL/U9iw8bNfQ4R6L3YgX620umiz7?=
	=?us-ascii?Q?XHSz2r3KwlnHmbbrRtMIowMJrlPCZX2KCsvbRiu1EePyVKzG+QKBNVEWIZSM?=
	=?us-ascii?Q?Elfuu1vJnIRBNwMoP43apJXXYemU9vl6A2/RqUCK5ucnQLed9A0qYopWHaPB?=
	=?us-ascii?Q?4u2x8UPryZ35DgWEHNCxr2Bp9tq0qmeILnbcjNNgIaj8pYPeOpE9debaV1wy?=
	=?us-ascii?Q?3Jyf4spByH/0vytuOgWzp4NzZU7TbHbT7UkuCcF6J+4E4mGdTm1+HM1Zc92b?=
	=?us-ascii?Q?wev+Eg4M+QD2mCTuvlUA02zOzaC4R8wfOdczqC9aJ67nD0WTxG3QPCdeuZYs?=
	=?us-ascii?Q?Eso72hTE4ifeZIMcT68T+qe6B7CVPGZYUbpZqmfie3YOH67FUXa4GBjbAw2V?=
	=?us-ascii?Q?6IjhGYtFDvl91eR4J1HvrpeoxMqJEt7l+RIqRzfPXG9TsNz3lzdH64ngS0TR?=
	=?us-ascii?Q?cpwJNcLizheQnDTyIls/RnBAYpvO1XV5/KpYHxsXuuYhH+5tRWjpotPfYY8Z?=
	=?us-ascii?Q?QJomAgdheIZdJK2A1+zn9o2ePsY+oRIUWQb/kUDJwHqKixibYk+0c7Gj4Ce+?=
	=?us-ascii?Q?5aVoso/LAS9z+CNvUI8BI1+NDGZkIkgYenYNhIi8UvProaOJIZg4JQ3kBjHF?=
	=?us-ascii?Q?wCoHnAczoRSXXnlNhQNLEPeUbAThLobOsIPTktqa2po9Yb52fHu8uxDhAOT6?=
	=?us-ascii?Q?tWpfHx99PFpjns3fkih0XPvriKyXkNv0M8eGv6riTx/GsMxq7oXLZIkinqSf?=
	=?us-ascii?Q?7pDb4MSP8SNb9QIuI77N0g3ty2dKRi42kh1m5haSMYRF0gig9ccW9vreAAvC?=
	=?us-ascii?Q?Xzyp+Nn8YKVZ7QjIPkKJA3gPzJITcdKSCO6LO568Qya38rBNbdUn/ze5Mu1G?=
	=?us-ascii?Q?2jQFUahdceUOMqCRhWbuIMcDiy7+71SATGI5Noynv1bOoIpeU0l/8jeEGBFY?=
	=?us-ascii?Q?qKNTrk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3380;
	6:m/SaJtd+nkhjXnCnkhsdHPKniRxZTqV+oTrw855xfa/+npKBTIA4esJN5qVWu2SuMLF+F5wxlIPzg4wGHNDjFex0IT7IDYyP/O0D/rFS+8beqhyOOFz7XcADrGsLtmLEypiImHdH8N/fBeFowxkQ4DowRXjzouMQ2Kl/b+OVBX4rcgFlsKz9KVyx/fzTo1tVlFf8ZTp41261MMgT/m/99+V6SuOUbB/FQ2yaaULu9iaP+MhfHPo/kjPbe7aQlrwqPV0i1x2BxR3aQ51ENTY0tWVKDvp8aXqx1Ri/dmwjsehzAcO2fbkpnTru50dkiU1IhFfk6N8WYqY9GiJq6FbvHbqL/aihIO59oYi9qSzMHLY=;
	5:86oziGPAXRSb3t5+wlqfGDq0nr4tzUno7aHZIbKVp3ueWoGatZSyUwDv63ZMNNQ2TTzpmGvRYdYc4ffZNavbZW2kdYh5ucEBO+73iEB7zHgLL+pSd1+pr0wswMpovWzWbAcZVW4qV+ILWEbs5QQdAeRSMuoldewFwtGBGbW4dlE=;
	24:w7YN3OyLgklCCCLoCMyNPaQNxPGK2wU+P9Ps59Bxwt7jtK6wqV925uUVSF89Q6DuX3FJ7o62GC2mE624V37s1B+C0lqwb9b1g9Iic9Z39sM=;
	7:WH0hxqEsxKkkdiV+BkyON8RbsXFIwxz3G1RqQlRNp2PMMh8BpvxaAZSSXo6uj747Sm4hrO56NSP3K8JD6pzUNxZnxyWvXIvHzDTDqiCDlwE0QeEUSXnQ/LfvvEGR176dIe8qWEDlMt0zv0lgvQbiqEnilFMcUqotRw088R0Gam8eE0MvsO10eXeF/biHikIKyka0ShbVWa00vzZzCVYi3UnNUfITJB+DwtATADYiBDGTWX1g9gS6T0ab2eE+btsw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:53.1022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fa191e-b1e9-4873-543d-08d52ae77531
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3380
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.61
Subject: [Qemu-trivial] [PATCH v5 20/29] hw/ppc: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:14 -0000

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
Cc: qemu-ppc@nongnu.org
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
V2:
 - Split hw patch into individual directories

 hw/ppc/e500.c          | 22 +++++++++++-----------
 hw/ppc/mac_newworld.c  |  2 +-
 hw/ppc/mac_oldworld.c  |  2 +-
 hw/ppc/mpc8544_guts.c  |  5 +++--
 hw/ppc/ppc405_boards.c | 15 ++++++---------
 hw/ppc/ppc440_bamboo.c | 22 +++++++++++-----------
 hw/ppc/ppc4xx_pci.c    |  3 ++-
 hw/ppc/prep.c          |  4 ++--
 hw/ppc/virtex_ml507.c  |  4 ++--
 9 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 5cf0dabef3..5de6413c90 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -333,13 +333,13 @@ static int ppce500_load_device_tree(MachineState *machine,
         ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                     initrd_base);
         if (ret < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+            error_report("couldn't set /chosen/linux,initrd-start");
         }
 
         ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                     (initrd_base + initrd_size));
         if (ret < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+            error_report("couldn't set /chosen/linux,initrd-end");
         }
 
     }
@@ -353,7 +353,7 @@ static int ppce500_load_device_tree(MachineState *machine,
     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                       machine->kernel_cmdline);
     if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+        error_report("couldn't set /chosen/bootargs");
 
     if (kvm_enabled()) {
         /* Read out host's frequencies */
@@ -720,7 +720,7 @@ static DeviceState *ppce500_init_mpic_kvm(PPCE500Params *params,
 
     CPU_FOREACH(cs) {
         if (kvm_openpic_connect_vcpu(dev, cs)) {
-            fprintf(stderr, "%s: failed to connect vcpu to irqchip\n",
+            error_report("%s: failed to connect vcpu to irqchip",
                     __func__);
             abort();
         }
@@ -809,7 +809,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         cs = CPU(cpu);
 
         if (env->mmu_model != POWERPC_MMU_BOOKE206) {
-            fprintf(stderr, "MMU model %i not supported by this machine.\n",
+            error_report("MMU model %i not supported by this machine.",
                 env->mmu_model);
             exit(1);
         }
@@ -955,8 +955,8 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                           cur_base,
                                           ram_size - cur_base);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    machine->kernel_filename);
+            error_report("could not load kernel '%s'",
+                         machine->kernel_filename);
             exit(1);
         }
 
@@ -970,8 +970,8 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                           ram_size - initrd_base);
 
         if (initrd_size < 0) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
-                    machine->initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         machine->initrd_filename);
             exit(1);
         }
 
@@ -1012,7 +1012,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         kernel_size = load_uimage(filename, &bios_entry, &loadaddr, NULL,
                                   NULL, NULL);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load firmware '%s'\n", filename);
+            error_report("could not load firmware '%s'", filename);
             exit(1);
         }
     }
@@ -1025,7 +1025,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                        initrd_base, initrd_size,
                                        kernel_base, kernel_size);
     if (dt_size < 0) {
-        fprintf(stderr, "couldn't load device tree\n");
+        error_report("couldn't load device tree");
         exit(1);
     }
     assert(dt_size < DTB_MAX_SIZE);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 3fa7c429d5..b832417a56 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -270,7 +270,7 @@ static void ppc_core99_init(MachineState *machine)
             }
         }
         if (ppc_boot_device == '\0') {
-            fprintf(stderr, "No valid boot device for Mac99 machine\n");
+            error_report("No valid boot device for Mac99 machine");
             exit(1);
         }
     }
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 010ea36bf2..d1f4546613 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -218,7 +218,7 @@ static void ppc_heathrow_init(MachineState *machine)
 #endif
         }
         if (ppc_boot_device == '\0') {
-            fprintf(stderr, "No valid boot device for G3 Beige machine\n");
+            error_report("No valid boot device for G3 Beige machine");
             exit(1);
         }
     }
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index ce1254b5d4..3a2c49e3fd 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -83,7 +84,7 @@ static uint64_t mpc8544_guts_read(void *opaque, hwaddr addr,
         value = env->spr[SPR_E500_SVR];
         break;
     default:
-        fprintf(stderr, "guts: Unknown register read: %x\n", (int)addr);
+        error_report("guts: Unknown register read: %x", (int)addr);
         break;
     }
 
@@ -102,7 +103,7 @@ static void mpc8544_guts_write(void *opaque, hwaddr addr,
         }
         break;
     default:
-        fprintf(stderr, "guts: Unknown register write: %x = %x\n",
+        error_report("guts: Unknown register write: %x = %x",
                 (int)addr, (unsigned)value);
         break;
     }
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index e92db2c66a..fae9c76174 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -324,8 +324,7 @@ static void ref405ep_init(MachineState *machine)
         kernel_size = load_image_targphys(kernel_filename, kernel_base,
                                           ram_size - kernel_base);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         printf("Load kernel size %ld at " TARGET_FMT_lx,
@@ -336,8 +335,8 @@ static void ref405ep_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         } else {
@@ -607,8 +606,7 @@ static void taihu_405ep_init(MachineState *machine)
         kernel_size = load_image_targphys(kernel_filename, kernel_base,
                                           ram_size - kernel_base);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd */
@@ -617,9 +615,8 @@ static void taihu_405ep_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                fprintf(stderr,
-                        "qemu: could not load initial ram disk '%s'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         } else {
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 693c215108..12f92b9f2c 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "net/net.h"
 #include "hw/hw.h"
@@ -80,22 +81,22 @@ static int bamboo_load_device_tree(hwaddr addr,
     ret = qemu_fdt_setprop(fdt, "/memory", "reg", mem_reg_property,
                            sizeof(mem_reg_property));
     if (ret < 0)
-        fprintf(stderr, "couldn't set /memory/reg\n");
+        error_report("couldn't set /memory/reg");
 
     ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                 initrd_base);
     if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+        error_report("couldn't set /chosen/linux,initrd-start");
 
     ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                 (initrd_base + initrd_size));
     if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+        error_report("couldn't set /chosen/linux,initrd-end");
 
     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                   kernel_cmdline);
     if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+        error_report("couldn't set /chosen/bootargs");
 
     /* Copy data from the host device tree into the guest. Since the guest can
      * directly access the timebase without host involvement, we must expose
@@ -186,7 +187,7 @@ static void bamboo_init(MachineState *machine)
     env = &cpu->env;
 
     if (env->mmu_model != POWERPC_MMU_BOOKE) {
-        fprintf(stderr, "MMU model %i not supported by this machine.\n",
+        error_report("MMU model %i not supported by this machine.",
             env->mmu_model);
         exit(1);
     }
@@ -220,7 +221,7 @@ static void bamboo_init(MachineState *machine)
                                 NULL);
     pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pcibus) {
-        fprintf(stderr, "couldn't create PCI controller!\n");
+        error_report("couldn't create PCI controller!");
         exit(1);
     }
 
@@ -261,8 +262,7 @@ static void bamboo_init(MachineState *machine)
         }
         /* XXX try again as binary */
         if (success < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
@@ -273,8 +273,8 @@ static void bamboo_init(MachineState *machine)
                                           ram_size - RAMDISK_ADDR);
 
         if (initrd_size < 0) {
-            fprintf(stderr, "qemu: could not load ram disk '%s' at %x\n",
-                    initrd_filename, RAMDISK_ADDR);
+            error_report("could not load ram disk '%s' at %x",
+                         initrd_filename, RAMDISK_ADDR);
             exit(1);
         }
     }
@@ -283,7 +283,7 @@ static void bamboo_init(MachineState *machine)
     if (kernel_filename) {
         if (bamboo_load_device_tree(FDT_ADDR, ram_size, RAMDISK_ADDR,
                                     initrd_size, kernel_cmdline) < 0) {
-            fprintf(stderr, "couldn't load device tree\n");
+            error_report("couldn't load device tree");
             exit(1);
         }
     }
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 4765dcecca..807e91b8fa 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -20,6 +20,7 @@
  * 4xx SoCs, such as the 440EP. */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
@@ -254,7 +255,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
 
     trace_ppc4xx_pci_set_irq(irq_num);
     if (irq_num < 0) {
-        fprintf(stderr, "%s: PCI irq %d\n", __func__, irq_num);
+        error_report("%s: PCI irq %d", __func__, irq_num);
         return;
     }
     qemu_set_irq(pci_irqs[irq_num], level);
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 6f8accc397..17d6d1960b 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -573,7 +573,7 @@ static void ppc_prep_init(MachineState *machine)
             }
         }
         if (ppc_boot_device == '\0') {
-            fprintf(stderr, "No valid boot device for Mac99 machine\n");
+            error_report("No valid boot device for Mac99 machine");
             exit(1);
         }
     }
@@ -594,7 +594,7 @@ static void ppc_prep_init(MachineState *machine)
     qdev_init_nofail(dev);
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (pci_bus == NULL) {
-        fprintf(stderr, "Couldn't create PCI host controller.\n");
+        error_report("Couldn't create PCI host controller.");
         exit(1);
     }
     sysctrl->contiguous_map_irq = qdev_get_gpio_in(dev, 0);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 5ac4f76613..c1cac864c6 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -187,7 +187,7 @@ static int xilinx_load_device_tree(hwaddr addr,
 
     r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
     if (r < 0)
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+        error_report("couldn't set /chosen/bootargs");
     cpu_physical_memory_write(addr, fdt, fdt_size);
     return fdt_size;
 }
@@ -215,7 +215,7 @@ static void virtex_init(MachineState *machine)
     env = &cpu->env;
 
     if (env->mmu_model != POWERPC_MMU_BOOKE) {
-        fprintf(stderr, "MMU model %i not supported by this machine.\n",
+        error_report("MMU model %i not supported by this machine.",
             env->mmu_model);
         exit(1);
     }
-- 
2.14.1


