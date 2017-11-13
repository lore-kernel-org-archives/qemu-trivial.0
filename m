Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOx-0003gm-8i
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOn-0003OJ-Or
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOk-0007YQ-II
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:13 -0500
Received: from mail-by2nam01on0042.outbound.protection.outlook.com
	([104.47.34.42]:55486
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOk-0007WW-4y; Mon, 13 Nov 2017 17:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3D9f0Ji5BrzqsPCESXSQjjaH1NICRmQLtYa30yJWLOc=;
	b=iM1aBnUtSFkdMktOak4MR1aHdEwp2brPUKBqZIDTGksE1vRqsObD93uCPYIxBH8SOExLsDYx29+7nlcLx7j58YXrnhCJJRkK93xHyykoy+0tvLr8pEoY3ve7cZKKmbnjzfT/AIbpIO8LNXPvXi3B4fxckp3QW1DbmPwEdToPwO4=
Received: from MWHPR02CA0033.namprd02.prod.outlook.com (10.164.133.22) by
	SN1PR02MB1343.namprd02.prod.outlook.com (10.162.0.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:06 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by MWHPR02CA0033.outlook.office365.com
	(2603:10b6:301:60::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
	header.d=none;suse.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46318
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOd-0004WK-1y; Mon, 13 Nov 2017 14:40:03 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOc-0000dB-V3; Mon, 13 Nov 2017 14:40:03 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdpbl012670; Mon, 13 Nov 2017 14:39:51 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOR-0000W7-8B; Mon, 13 Nov 2017 14:39:51 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Date: Mon, 13 Nov 2017 14:35:51 -0800
Message-ID: <eaa633797a5d0e92fd13bdac6d0cc8b76e36791a.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(9786002)(110136005)(54906003)(316002)(39060400002)(16586007)(8936002)(50466002)(5003940100001)(47776003)(48376002)(4326008)(5660300001)(36756003)(305945005)(50986999)(63266004)(77096006)(81156014)(81166006)(76176999)(106466001)(189998001)(2906002)(50226002)(356003)(106002)(33646002)(8676002)(118296001)(478600001)(36386004)(2950100002)(107986001)(21314002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1343; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT035;
	1:jdr7VteKzgpolSQn0tgm2VCRosFKTVybXpQLpIWmtpgf2VbLhGwPLSijQxyyy5w/U5dKnJxXtmgjsafch6vau/7XeSiIXEdEzFXVFy1StsDxkEiWlV6nYYqfsExwwOBc
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f51ca6a6-f6e2-44fd-bf1f-08d52ae77b97
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:SN1PR02MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	3:vxrp71TQfL/iKj72gLLqA0EuftSTG4vwlzXJb7XVCPPEBw3a8J8ArN3eSt4fMVXqCdCO0bXYb0ioLY1iSEbPBPtu5x4c4WjswxE6E36lT2uE/gflaNbK/sNm4ncC9or6tkWCHsBhCiRDMHdEeqXuk5oc70P1d1xYrBTerNQXUBdgVrFBStimJhN92RR9yhu3+TC3ekrgimf0owLDvDEjAX85kFQxn4vWVna+8MqGgc4hDx9/fruTuMBdWuDphik/C1dVPMkt+AK9v8mHMgVqnCh6F7SfYWVR+jwdQd+1mMxgiGZeVafgZ2e0WGvvhm2NX45yu69zFCSYtGE9Vh7Ak6Dl4Nlq9IRcnQHwh9L257o=;
	25:BgowZ0djnJ4AwJTJwricXK8eL389yzPNHxDqEEBaoqXLb57+9qKwOyUwZLCk9NpEf9kveSuLDVbuYirp092uS45yliIMRfvmLdZoZe+eZEON8fZ7uRh4Mama78ORyydsPEKQcNrJkepiohwErzrqEbkLAG8uZZgccTkZcM+e8iT/3euJICT5GaLU7TaGrCPXi7YMx/NmuRSE4DTyP9L57uOiJOPtJ6EdvzXI/mo7L9tiLoG79cdTQQzYiD3jdxyj9rrzJTmsxYZiAgc20t/z69Xgu/8H1R/ybtI+YpXL1cg094ZFaTTcztbwiSQ8Ydy6TGR7rZNm/Y3RpxNZoFORVCU6qzopwliiEV7VkbEv7OQ=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1343:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	31:Caz9to2S0kwFUfzBM8405mVRkixiJPjCIKcAksaShUy9J2XPGWQ4tmY9eBmcX6h3qMeUT+GZ3CMNApBGmTlflt8RSA1GJPOL5n176Il67O0SO+GuRsjSePAhUxvb1gBlwwv+oCaEFO0B+UbskDYxY5ivcoq9Y43YjzZCTTgeHwTZm0E4+NhraGLwxctYZ1h15LMeCVC4YxAQIYFwjC9CyuMW6rG6P8qmd3dVR+3I4Jw=;
	20:MtyyKv4iizxjLIIkd/nvBPZzyn8vtB4xs0UtOPaMUokMH2DBCJicHuyZvkeIHNKglF762/afMR1443wnm3T804Ic43eG04JXvVzTTmNf3waE6jcgmTo4grkPk2hJqQ8SqXxYEVPXYqoZAmoH7NsGz6bCPiZyp4hDaAHgV3r1D7Lot+WGH1iEeTnLPpC+rIHAPxQ5L+re1CNQc0KgdSgUvmUoqBFn7UbhINSnM2+T0SrpVyPOYE3pzUqGFDVfyGsQaZ6sZgsZsdJ1L9iMJqdSrVRecqa1kn/i1KCkEU7Qts9Dfs9k5fwz1qIiYuRjYjnrHK4BrLDcdP4SP12iiU78KWix/QKFzplIeq6vZTEhbpg+LEWH7YIVu+fIpi7NOvs+8NiWrnPpGCI+8oqwg1pb0pJpfh1hbf0MRYFN+tzQUrDyBX8b2gXEoGwqlqLSjAP2wCeBBJ+VqTqdjSEu8FTLeDfFB+lpnO71MLx0OZ31I1XFpKhFdyTYb+FWxfzqmB/J
X-Microsoft-Antispam-PRVS: <SN1PR02MB13439AA1F143FC42060729FCDC2B0@SN1PR02MB1343.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231022)(3002001)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR02MB1343; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR02MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	4:TQHqDZH1NNGZ+iVae8XvhcyM4fO8/vim3zUx8xERddgKWCmJEU2/TUAbzXETWFCDTmEcCP7384ZDPiNhSOxw8tBC482C4B7kjISU2vGStvAiwhm9x1KZ0oTl2u5i9p95+ScEnWvQl/wxQgKU9zjQy6dhR6/5RmInLkUMPchhJGYhsB0FwChtqBBcZvXGwWtz4AiqsFLRGhMI5GZeT+syvVGR3BKvfq4Gui3Vnui2Bw0StNCEOmcv5x28zCxqOXYn9coo3lldb3LTrNatMT+XbKqCq7WOG9GCOJFd53ae5RXtcFNJ19xKhv9mPg+pA98su4GtwrMl2VcHQGkMxFa+hw==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1343;
	23:MK4A4j/ccxIIrVKYgNiBuOpquy9rEEBaxZggmwXl9?=
	=?us-ascii?Q?vJkQY27yLy/U6014dViUnDbJqBpFLitJerjMHOfjX5uLJwlofn6ra2OWeIpf?=
	=?us-ascii?Q?OTyzf+IT59+nJFVyvpeDXa+Wa232PaVuWRBVE9Eh4F1LrIYl9VlYMhBoLYHm?=
	=?us-ascii?Q?nMLq20wD3uKtZ85JBJzyjElGckdUu/ThKsB9yBDtG+EVQ2wN7BHkdbY++zJZ?=
	=?us-ascii?Q?PuapqP05hgTUHZtwZ7SxThWC6R92MypTSZ9l2Zw/DNVNhn/05NL4mPQoM7oP?=
	=?us-ascii?Q?7WSMq9jU3XGGjRWCu7IowRjRRdHnsyd/E2q+UfFeMLu5WCbejTCnIb2TtQoT?=
	=?us-ascii?Q?28yR23D07ZJEU0uJXsI0tzDe/WtRwMrruXUHTqVenHkDZhqMlK+lTjVF9wDU?=
	=?us-ascii?Q?LFwG5RCFSFWX8AQiLn4Yk37QIv7+39SrMHOcqAt0bj5jvURpJlKCMP98t7yb?=
	=?us-ascii?Q?4iau1C4khlYiENnfDlWbHCt3GXDbqA5xI45lOQtFvvdg8uF4B5/lPwlSg6Yx?=
	=?us-ascii?Q?PqnMuDlLPcEP0S8d2VwECIg+vZLmH+/gyDHtMxefCXYjaEXKiEa9T8wUwq8l?=
	=?us-ascii?Q?omcqhURxMV9sY0CLiOCYxWlXPto/3itLIUQRBEEk+AOfDYpmCpnWQtzhEbYd?=
	=?us-ascii?Q?8aiTySk8Sv91XhG794S2qEleMJQXB5C3BNQqAcKO5wbu4cGsHWxaqN4tBxIZ?=
	=?us-ascii?Q?2Wp6H5Cp9B6CeR3BP3zp7LxWjHncMhCTiTB+OW2ui9O5AmQ3Dp9X0JHg8/nd?=
	=?us-ascii?Q?LFVrz9Sz/tSlF299c0jDPpADCujcEbtX+ww6bldwljD8GmbBB3OPb9eU1uKI?=
	=?us-ascii?Q?gLHctxn37svsjbuL8aQpziCWDLmz6GenZ+nU122mMdE+AO1QzL7MQP0VeX4s?=
	=?us-ascii?Q?xChjS5RhJ9XZ0NjtLHenxET+pQvL4oFyz7ZzLOmCqmBy4cc+g22EFxiJGgT1?=
	=?us-ascii?Q?2sPq2RC+0N6e71zix2yvnvf8CLkwi0yLpbOHSagSgwyEx41F6a/PTzg4fFHK?=
	=?us-ascii?Q?I2IJP7K8JXA9n6GSE2PDIr6SmeM1EY7P7l6tIGEZxk2Habg0VPG3ggftMWGa?=
	=?us-ascii?Q?3hU/eNIEqEmqFZjRO1SNUxbdykJ?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	6:HYZB99KPTEE+TmNl3MewK75v6Z4JIHITcr34Aj3d91+vgcYtsTT9WPV2IS4U3psp/Ir9AVXJzrVMIZOLEKmv1a761AjmuEY5Ix6MNg3wYV4bAb3+xA5FDzKeZegrS0ePSwfkwK4pRoVB/fzP1sDHrWrW5oaM9iXQ3zdWiahho/KM+pphqzG93CIf47V00GmuyHbyuzQqXHzfnMipiPRrqRtA280hB5r3ZsiP9UVYul8DZzdwMBwBNoXCj7mAMD2DT+l/wUGCoGLG6LG0bWvcbbK7r+w0XJ+vwyXFitMXafclub1ToL6tCAPFoSsHOu/33gWP+SBfvr4EYK/arSfvnnUhIyXDxLUhLDpNFk8YWT0=;
	5:nJ5HmepNDUWaS+8TQSTgKteV4bzgzUVUaPU5lVm6qWTHmcSnv3qOKUW37hYnhoR25GwiQtmUTqkmh7uVhy5GwfTi6P847nEIYc6I5zoJwRgrSvke2pL055WC5k+yaBlD+edXhnR74m8jJoZpceNQqmqHNciwDUeYbK8eAbIhZ20=;
	24:zeDvA7L/6VL5txnDixuod/b7T1zx2v6Q2inYDE8+WB0knWay6aQXW76Q9KA0LR+51GH7w/2iBAsmBZPfKFEVi0b+72a0tryTGmrvDIJOU5s=;
	7:tUdJroEhHtGlqF75XH8V1nf6aY2WWm5RuRWXZXtMafGQgCDG7OqbJeq40nALS/uxBbsxtwZ4PMD+OXJikyPX6sFOEqwjrOg4WeZDrJzpWDxrhuuMwclYSX97/4vPZkb9SVKwIWlTItnjRVtVtddNsQXPKDbFIJZl/Bxg/cG5NE138b6UQAzCR04JiIPJky/O8Jc42rDJUgkt8u+Qza01PVG8EmG2IR+2nzYFolLBqrtwf2WwK9Jt6wtuseJN6HVY
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:03.7616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51ca6a6-f6e2-44fd-bf1f-08d52ae77b97
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1343
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.42
Subject: [Qemu-trivial] [PATCH v5 22/29] hw/scsi: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:15 -0000

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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alexander Graf <agraf@suse.de>
Acked-by: David Gibson <david@gibson.dropbear.id.au> (virtio_scsi part)
---
V2:
 - Split hw patch into individual directories

 hw/scsi/lsi53c895a.c            |  4 ++--
 hw/scsi/spapr_vscsi.c           | 49 +++++++++++++++++++++--------------------
 hw/scsi/virtio-scsi-dataplane.c |  6 ++---
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 191505df5b..7c9a930e2f 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -14,7 +14,7 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "hw/scsi/scsi.h"
@@ -1501,7 +1501,7 @@ again:
            This is apparently sufficient to beat the drivers into submission.
          */
         if (!(s->sien0 & LSI_SIST0_UDC))
-            fprintf(stderr, "inf. loop with UDC masked\n");
+            error_report("inf. loop with UDC masked");
         lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
         lsi_disconnect(s);
     } else if (s->istat1 & LSI_ISTAT1_SRUN && !s->waiting) {
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 360db53ac8..8c4eabcf3d 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -32,6 +32,7 @@
  *  - Maybe do autosense (PAPR seems to mandate it, linux doesn't care)
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -179,7 +180,7 @@ static int vscsi_send_iu(VSCSIState *s, vscsi_req *req,
     rc = spapr_vio_dma_write(&s->vdev, req->crq.s.IU_data_ptr,
                              &req->iu, length);
     if (rc) {
-        fprintf(stderr, "vscsi_send_iu: DMA write failure !\n");
+        error_report("vscsi_send_iu: DMA write failure !");
     }
 
     req->crq.s.valid = 0x80;
@@ -197,7 +198,7 @@ static int vscsi_send_iu(VSCSIState *s, vscsi_req *req,
 
     rc1 = spapr_vio_send_crq(&s->vdev, req->crq.raw);
     if (rc1) {
-        fprintf(stderr, "vscsi_send_iu: Error sending response\n");
+        error_report("vscsi_send_iu: Error sending response");
         return rc1;
     }
 
@@ -330,7 +331,7 @@ static int vscsi_fetch_desc(VSCSIState *s, struct vscsi_req *req,
         break;
     }
     default:
-        fprintf(stderr, "VSCSI:   Unknown format %x\n", req->dma_fmt);
+        error_report("VSCSI:   Unknown format %x", req->dma_fmt);
         return -1;
     }
 
@@ -518,7 +519,7 @@ static void vscsi_transfer_data(SCSIRequest *sreq, uint32_t len)
 
     trace_spapr_vscsi_transfer_data(sreq->tag, len, req);
     if (req == NULL) {
-        fprintf(stderr, "VSCSI: Can't find request for tag 0x%x\n", sreq->tag);
+        error_report("VSCSI: Can't find request for tag 0x%x", sreq->tag);
         return;
     }
 
@@ -527,7 +528,7 @@ static void vscsi_transfer_data(SCSIRequest *sreq, uint32_t len)
         rc = vscsi_srp_transfer_data(s, req, req->writing, buf, len);
     }
     if (rc < 0) {
-        fprintf(stderr, "VSCSI: RDMA error rc=%d!\n", rc);
+        error_report("VSCSI: RDMA error rc=%d!", rc);
         req->dma_error = true;
         scsi_req_cancel(req->sreq);
         return;
@@ -547,7 +548,7 @@ static void vscsi_command_complete(SCSIRequest *sreq, uint32_t status, size_t re
 
     trace_spapr_vscsi_command_complete(sreq->tag, status, req);
     if (req == NULL) {
-        fprintf(stderr, "VSCSI: Can't find request for tag 0x%x\n", sreq->tag);
+        error_report("VSCSI: Can't find request for tag 0x%x", sreq->tag);
         return;
     }
 
@@ -639,7 +640,7 @@ static void *vscsi_load_request(QEMUFile *f, SCSIRequest *sreq)
     memset(req, 0, sizeof(*req));
     rc = vmstate_load_state(f, &vmstate_spapr_vscsi_req, req, 1);
     if (rc) {
-        fprintf(stderr, "VSCSI: failed loading request tag#%u\n", sreq->tag);
+        error_report("VSCSI: failed loading request tag#%u", sreq->tag);
         return NULL;
     }
     assert(req->active);
@@ -827,7 +828,7 @@ static int vscsi_process_tsk_mgmt(VSCSIState *s, vscsi_req *req)
     uint64_t tag = iu->srp.rsp.tag;
     uint8_t sol_not = iu->srp.cmd.sol_not;
 
-    fprintf(stderr, "vscsi_process_tsk_mgmt %02x\n",
+    error_report("vscsi_process_tsk_mgmt %02x",
             iu->srp.tsk_mgmt.tsk_mgmt_func);
 
     d = vscsi_device_find(&s->bus, be64_to_cpu(req->iu.srp.tsk_mgmt.lun), &lun);
@@ -932,10 +933,10 @@ static int vscsi_handle_srp_req(VSCSIState *s, vscsi_req *req)
     case SRP_CRED_RSP:
     case SRP_AER_REQ:
     case SRP_AER_RSP:
-        fprintf(stderr, "VSCSI: Unsupported opcode %02x\n", opcode);
+        error_report("VSCSI: Unsupported opcode %02x", opcode);
         break;
     default:
-        fprintf(stderr, "VSCSI: Unknown type %02x\n", opcode);
+        error_report("VSCSI: Unknown type %02x", opcode);
     }
 
     return done;
@@ -953,7 +954,7 @@ static int vscsi_send_adapter_info(VSCSIState *s, vscsi_req *req)
     rc = spapr_vio_dma_read(&s->vdev, be64_to_cpu(sinfo->buffer),
                             &info, be16_to_cpu(sinfo->common.length));
     if (rc) {
-        fprintf(stderr, "vscsi_send_adapter_info: DMA read failure !\n");
+        error_report("vscsi_send_adapter_info: DMA read failure !");
     }
 #endif
     memset(&info, 0, sizeof(info));
@@ -967,7 +968,7 @@ static int vscsi_send_adapter_info(VSCSIState *s, vscsi_req *req)
     rc = spapr_vio_dma_write(&s->vdev, be64_to_cpu(sinfo->buffer),
                              &info, be16_to_cpu(sinfo->common.length));
     if (rc)  {
-        fprintf(stderr, "vscsi_send_adapter_info: DMA write failure !\n");
+        error_report("vscsi_send_adapter_info: DMA write failure !");
     }
 
     sinfo->common.status = rc ? cpu_to_be32(1) : 0;
@@ -987,7 +988,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
     req_len = len = be16_to_cpu(vcap->common.length);
     buffer = be64_to_cpu(vcap->buffer);
     if (len > sizeof(cap)) {
-        fprintf(stderr, "vscsi_send_capabilities: capabilities size mismatch !\n");
+        error_report("vscsi_send_capabilities: capabilities size mismatch !");
 
         /*
          * Just read and populate the structure that is known.
@@ -997,7 +998,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
     }
     rc = spapr_vio_dma_read(&s->vdev, buffer, &cap, len);
     if (rc)  {
-        fprintf(stderr, "vscsi_send_capabilities: DMA read failure !\n");
+        error_report("vscsi_send_capabilities: DMA read failure !");
     }
 
     /*
@@ -1013,7 +1014,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
 
     rc = spapr_vio_dma_write(&s->vdev, buffer, &cap, len);
     if (rc)  {
-        fprintf(stderr, "vscsi_send_capabilities: DMA write failure !\n");
+        error_report("vscsi_send_capabilities: DMA write failure !");
     }
     if (req_len > len) {
         /*
@@ -1034,11 +1035,11 @@ static int vscsi_handle_mad_req(VSCSIState *s, vscsi_req *req)
 
     switch (be32_to_cpu(mad->empty_iu.common.type)) {
     case VIOSRP_EMPTY_IU_TYPE:
-        fprintf(stderr, "Unsupported EMPTY MAD IU\n");
+        error_report("Unsupported EMPTY MAD IU");
         retlen = sizeof(mad->empty_iu);
         break;
     case VIOSRP_ERROR_LOG_TYPE:
-        fprintf(stderr, "Unsupported ERROR LOG MAD IU\n");
+        error_report("Unsupported ERROR LOG MAD IU");
         retlen = sizeof(mad->error_log);
         break;
     case VIOSRP_ADAPTER_INFO_TYPE:
@@ -1053,7 +1054,7 @@ static int vscsi_handle_mad_req(VSCSIState *s, vscsi_req *req)
         request_handled = true;
         break;
     default:
-        fprintf(stderr, "VSCSI: Unknown MAD type %02x\n",
+        error_report("VSCSI: Unknown MAD type %02x",
                 be32_to_cpu(mad->empty_iu.common.type));
         /*
          * PAPR+ says that "The length field is set to the length
@@ -1078,7 +1079,7 @@ static void vscsi_got_payload(VSCSIState *s, vscsi_crq *crq)
 
     req = vscsi_get_req(s);
     if (req == NULL) {
-        fprintf(stderr, "VSCSI: Failed to get a request !\n");
+        error_report("VSCSI: Failed to get a request !");
         return;
     }
 
@@ -1088,7 +1089,7 @@ static void vscsi_got_payload(VSCSIState *s, vscsi_crq *crq)
      * of the structure.
      */
     if (crq->s.IU_length > sizeof(union viosrp_iu)) {
-        fprintf(stderr, "VSCSI: SRP IU too long (%d bytes) !\n",
+        error_report("VSCSI: SRP IU too long (%d bytes) !",
                 crq->s.IU_length);
         vscsi_put_req(req);
         return;
@@ -1097,7 +1098,7 @@ static void vscsi_got_payload(VSCSIState *s, vscsi_crq *crq)
     /* XXX Handle failure differently ? */
     if (spapr_vio_dma_read(&s->vdev, crq->s.IU_data_ptr, &req->iu,
                            crq->s.IU_length)) {
-        fprintf(stderr, "vscsi_got_payload: DMA read failure !\n");
+        error_report("vscsi_got_payload: DMA read failure !");
         vscsi_put_req(req);
         return;
     }
@@ -1158,16 +1159,16 @@ static int vscsi_do_crq(struct VIOsPAPRDevice *dev, uint8_t *crq_data)
         case VIOSRP_AIX_FORMAT:
         case VIOSRP_LINUX_FORMAT:
         case VIOSRP_INLINE_FORMAT:
-            fprintf(stderr, "vscsi_do_srq: Unsupported payload format %02x\n",
+            error_report("vscsi_do_srq: Unsupported payload format %02x",
                     crq.s.format);
             break;
         default:
-            fprintf(stderr, "vscsi_do_srq: Unknown payload format %02x\n",
+            error_report("vscsi_do_srq: Unknown payload format %02x",
                     crq.s.format);
         }
         break;
     default:
-        fprintf(stderr, "vscsi_do_crq: unknown CRQ %02x %02x ...\n",
+        error_report("vscsi_do_crq: unknown CRQ %02x %02x ...",
                 crq.raw[0], crq.raw[1]);
     };
 
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index add4b3f4a4..e047361310 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -97,7 +97,7 @@ static int virtio_scsi_vring_init(VirtIOSCSI *s, VirtQueue *vq, int n,
     /* Set up virtqueue notify */
     rc = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), n, true);
     if (rc != 0) {
-        fprintf(stderr, "virtio-scsi: Failed to set host notifier (%d)\n",
+        error_report("virtio-scsi: Failed to set host notifier (%d)",
                 rc);
         s->dataplane_fenced = true;
         return rc;
@@ -141,8 +141,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     /* Set up guest notifier (irq) */
     rc = k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, true);
     if (rc != 0) {
-        fprintf(stderr, "virtio-scsi: Failed to set guest notifiers (%d), "
-                "ensure -enable-kvm is set\n", rc);
+        error_report("virtio-scsi: Failed to set guest notifiers (%d), "
+                "ensure -enable-kvm is set", rc);
         goto fail_guest_notifiers;
     }
 
-- 
2.14.1


