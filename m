Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOo-0003Qb-NF
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOl-0003GN-9e
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOi-0007Ud-5f
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:11 -0500
Received: from mail-sn1nam01on0058.outbound.protection.outlook.com
	([104.47.32.58]:64048
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOh-0007Te-UZ; Mon, 13 Nov 2017 17:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ffeJIWsqd2ZCCY0V+CMTHt700F/DxtyN/FUVlJuAC7A=;
	b=1dpGkWEOinaeZeXAZ5aecd9/JAuMuhii20lUpv0Tt5saKrBNtLvRVUl0MJRfWrg9KmqBt3gvsi3kU2WetPJVQum0KdjCHgYM4y8C8hwd/tdXAmd+oQ7RpHKG29Ufn7fqBGwsLGXcloj5crmL4sZLVvpWHrbNNHOUxXf5IErClQE=
Received: from MWHPR02CA0020.namprd02.prod.outlook.com (10.168.209.158) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:06 +0000
Received: from CY1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by MWHPR02CA0020.outlook.office365.com
	(2603:10b6:300:4b::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT035.mail.protection.outlook.com (10.152.75.186) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46440
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOe-0004WX-FC; Mon, 13 Nov 2017 14:40:04 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOd-0000dB-0T; Mon, 13 Nov 2017 14:40:04 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMds0X002882; Mon, 13 Nov 2017 14:39:54 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOU-0000We-7p; Mon, 13 Nov 2017 14:39:54 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:35:54 -0800
Message-ID: <0526ef6a38766e6b8c80c331c07af4bdd0bd6384.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(189002)(199003)(5660300001)(5003940100001)(8936002)(478600001)(33646002)(77096006)(76176999)(47776003)(50986999)(189998001)(9786002)(575784001)(50226002)(16586007)(36756003)(110136005)(54906003)(39060400002)(63266004)(4326008)(2950100002)(356003)(81166006)(81156014)(106466001)(118296001)(106002)(8676002)(305945005)(36386004)(2906002)(48376002)(50466002)(316002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT035;
	1:aW5KX3csvk9tpT+oUYfDACHPMsdUnro1zfnb7/zbe/fk8Y1cXbmBGcP0Rhfm6ms60EnJ5pP0VMy9Q9k9Cm8c362Tc+o4LZ8/9X+oP9Oe3NeMKrflOpUrZN4UxWvOgm47
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a09c3527-837b-44b7-c8b9-08d52ae77c60
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:lsDwfYFzy/4z+aAfLIthC7gPXspIL2ecuYNvJhpS05wPz9rJsumfE1COl8ZKXI7riUM0yJweoP6MltsWRxj/5KcL1YhYI2e18GG9iVRIdOy/VjtFM9sw9LeR4dAvuISNgWLyeQz/dcubxRwC7ybelVh9BVTl54MEGb2vU/ek7pvNuuphCpnuau4L7notBdeJtrZ0F/oRndFcl/T2SisuGN3fwtqNOpUJ8NucwAIJWXPGfMazk128vCFGjRrkyRzgiW/XBoJ7QKkCX4mw+z9QTkoa9NuZ1xxgO6ZUhvUZuyRiualIFOmD4xS5V0wgHROAeCleDMiEBCqsdtPPunHtNf9qSLkQNdPcgVtuIt8K3mg=;
	25:lmgz1+FASCl8HdbT1Ta3tPJg7yXg+4NWJ1XENuJlb88nJzj6pEhW22Ykyz0jzYptylIV0Ltq+n8r12AVdOLklzwKk3hzgu4rF568t/8pQnwefUilWKKMMCnJhEZbwdDwkDvLEObTdn2p0U5nlMnfe8+30TBmy/NlVKlXA/eHZycMMNqhcsXYcnlDmptrBMNAzlaKIhCuhLUwf08Cjf2zXKPuJPMSAQt4MT0PI3HL6n50WoSwZcYHTn5lRQm/u1ItegXxkrv5/iIs5Z4/X6zQmnsQgCAVRlIJi1b6U5ShKaOttF1swoXuXCWwLvGLiD+rlrVXYMP4y2In2mDD3YMXYUGhqGfPx9Syv+gtTLWHCy8=
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:IyvtIrBW9AmlVQTYhJADhBZdmJlQlBwlf8k9nvwr8RJ1JUdQKYAq2n2dQ/VoiA2u0QE3j7aWwIYOp4A4g3bG3PWPponu15xZlsTVTcXs6W1a17xwrgSZo+WbglaCmPIV6rKuuPc30udi2SIvEObTACGp7yh5I8hioy2pen2lfPMCul/hhGfB9qPMiu1z8ey+slzCDxxlB301Z4Ljs6HQoaW4Q3Xx7OzT45OKtoFpY28=;
	20:Hih4Pq1jsedBfLAxBr/ULUEOLVjfmtt/b4NYWdlbLY+ZW2yJib1BtjUZC6yOCgA+C52bzm/d2Thy6MAi8O4H10ya4h5YTxXomG0jZHRsV698LHiLPpXqSeSYj7kMCbIMMx7zxXXwW6RX+bJRBxmdqlYpkZqcCvhe0We1pFafdOsoAFkucYjVeQ8CF8jI0JTpUZpk126MnwqT41O/caMZH071/DmYA2jzU1jcktzQiLoKkXrJ/5V9TIE3wWc7x6c+xQcb/N569w3OqaNMZz7ZmC6rS001Sr2HnTOc2jbdd+R3pM0F3oAZdMXu8YcL4XYXfSOiH59I27+xciO6QMaZCMeV0qqHWmAwtjXf3F1F9pR+n/Av470nkGItOHbYXxLdnVdOLjAvkt5eS9NFtyHJcu1e5P2FRirHnYb+6sIlFWX5FlomMpzE9f58RHyJBl3ZSEvinWg6fOenbgePmttnoN3+S7PNaBOD/wFvt0XaOhiiCKXHmGZ4NpBFjsCD/oTS
X-Microsoft-Antispam-PRVS: <BN6PR02MB3379057F69515FF8E657E450DC2B0@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231022)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:a3T9ENDUVs0/qY94TTnB7W3fYR+do0M2FsSsy1WICx0mkr259IZfym+SSP3t96/B/2lAnGzX4s8A9woc5ZVz1oOkhGDLUIGi8mmrtongFed8sHxgcSlDk+TiJzQZyl5WNPIlM9uhFTlGbRGjFwr1bphAE+/Zao1n7Ai/VkZm7LC5ZSYzhpYY3NAl6/QhFq4P1XXi7UrkLs10WaGskRsH6TokEyxPt29IgUvgVlk17n93g4cPjMh7TB+NuSeDB6mknOBK23Ly0NwfAq3O8UnuXq0ztlLMhJXmpCz8/6Pnp98v1SDjvOaI0jHX2t9wJJIGZTlH2K06WMWC4x3NhGqRaA==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3379;
	23:uy0o+L/i09CFoP6TgKEdRkOiaZDWgIR+v7z+Rak7v?=
	=?us-ascii?Q?EDPqsLw8Gll0FwbiFO0vx5L0PyDmwuK6dBwUTgXMb1Pi0DHS+Zp1Ga6qq2qk?=
	=?us-ascii?Q?f7BsjPzIOPZyGCjWUmSyKonjiYGUAQOfuMVvAG8CnsSkOHNE9tJrlHrMAED3?=
	=?us-ascii?Q?jPYIvhv5K/ccFc74IVbZkKug9VCE196sVb31N1pn+fhAz2xb3iF9v94elvKs?=
	=?us-ascii?Q?pt0LjqZ9YjK2roteIBYPIQ/VFrhF7cWZ2WbIfkbnxbdspGNro9DRzyQqg/yk?=
	=?us-ascii?Q?+0dLATHS0wxD441J1Vozo4PxKfLgs4tOI84KF17ehI0xvBHso/02218YreJU?=
	=?us-ascii?Q?lYqzCbetkYj7qanBTu2tzqR87cNQcsd+eiGXVfDPslEumj/KyGI0pcdjiLjB?=
	=?us-ascii?Q?8nudatTBnyl3EQN27DXoHhg8+lzFXwV1AFmQbxUszk8a15u5Qgc1dy9X6HC6?=
	=?us-ascii?Q?3VFOdUAaO6ScPlFHtTfe9HiCGIpdhBUStq7WHsRMEQeGlgiLvvKYVvAgNZXr?=
	=?us-ascii?Q?oByPdlgYZF0NOgvc0/0CUuZJP9IIIztvbxxDlMfmeiK8i61tg56QS8ZdWYGd?=
	=?us-ascii?Q?IZO9LTjhP8nbJn3PXZP0PvHZjOSwlB9iPkPHBtuVEtsYEZPCakBwUAHQmocY?=
	=?us-ascii?Q?M4Kxs4n11pLj+0PEu34nIX1Jq7IxPhqUGQdm2kif1GO9Z0/wFPdHFW45Dpx/?=
	=?us-ascii?Q?P1DVpTOb/o06o0cjdSHXirxWZFcXbqyFMRie/2+OmMGQbmvhfmN9wYaukvjr?=
	=?us-ascii?Q?istCU1GUxpm3trvsz9Pu4+ukNIuH5q+/DizO573p7sEpcEu2NwAWM+qqIKdH?=
	=?us-ascii?Q?IMAThPl+WyILGOr4l4IufRcRvcGUUT5+6R3DylqKn7UYtNs9aRcLss2yF7E4?=
	=?us-ascii?Q?O8okQ0RvyB6aLwtIxP2EfU4O7o+Iwpc7K0twSpdAUV2ScnDUG2DI+ZowzU4B?=
	=?us-ascii?Q?RHfW0sdXMEyg0sCqvnAGDjCE1N22DExhEqXtfHElwQvzbiVhFBUJitH2Sc5+?=
	=?us-ascii?Q?xBh1sd89J3FPS58UJ3xj9tW0ahuLGRHEzlT3Rwg22MfP79matdsbo9/6cekg?=
	=?us-ascii?Q?RUjXo/FLCGHegQKleIgGtIJQcOM?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:+MYMKlL7OV3XnMZsmMpbkTcf7XAei6c+27SBC0O98qu915s3OP/08+unKGmYtkFBx/rf9C2OaVgJ8yR7RI4mF0MoVCPh0Rhl5XM9rOOVnD/uP1wgQQrcn1xCTdBqvuY0eVrt7Ys49d6agsgXf7+qwX/dsuF9E+angcRw3uOglgukcCi7ofFhlyVP6cY8VSZEBsfWYpiwaKLZhRJ7wQfg1IS3sFeTx6zrgOHDDKNriM9wpgA62HJeCOayCSx8rvf/d5e+qhaC481JCwmciyBrklR5YSvk2w4ovLQcqEuKeKHakJDq0LBJRmDMxGljwlu+SOPw0p+VazyuLrmeGd/etmjHZ2Gu/Oe2aTN1eLf3X3w=;
	5:xZgg7U9scvitEAkv5DVLMJcok3+v0+jVwT/LA7bPNvZAKsCEz+V42pQ/BqdDsRv/UwDqDwJsOgjR/J3GR+fG/6H1fHUBpk5cVmFOwkvNANcYhgs+jBkLae4zvSK+RaPiwGWDk4gwRyuqbRnmWUUtb6tEVZXEK8QHGGZ7lnhg6DA=;
	24:BInmgVOpmtJmZCaixsYbKbxsG/432wj33RAds3YSrizrguu7IafYZsQ405bDfksdc8qCTVd64ICb1Z6hDZZRJl6/4nKrPllU77QUtTV+CFQ=;
	7:4u17BmKtwZ7y7OCJWPdEoGqUYv5OBGevj5USeSD1++X0Fd2cDVqEOHFAmDc9PmrMPnJiFFp/QCtxNzzWDkEMXBfhtuRezWuLmvaClJEczkH721DNIN71En2flL8KejuoBJniRY0wG50h4CEVHIOXAfMDJdbxQOqgbxDHE1nf7x5QViBQIwE40fTa49eMqnyEDXnrpdG0Ct415U9Fy2GkkZywywmUpB1zcfuub/q+My4GOF8hESAXKPZD3T6oDrBR
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:05.1885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09c3527-837b-44b7-c8b9-08d52ae77c60
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.58
Subject: [Qemu-trivial] [PATCH v5 23/29] hw/sd: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:13 -0000

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

Some of the prints in hw/sd/sd.c were manually converted to using
DPRINTF() instead.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud <f4bug@amsat.org>
---
V3:
 - Fixup some DPRINTF() prints being wrong
V2:
 - Split hw patch into individual directories

 hw/sd/pl181.c |  5 +++--
 hw/sd/sd.c    | 15 ++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 55c8098ecd..2b878a0c5e 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/sysbus.h"
@@ -146,7 +147,7 @@ static void pl181_fifo_push(PL181State *s, uint32_t value)
     int n;
 
     if (s->fifo_len == PL181_FIFO_LEN) {
-        fprintf(stderr, "pl181: FIFO overflow\n");
+        error_report("pl181: FIFO overflow");
         return;
     }
     n = (s->fifo_pos + s->fifo_len) & (PL181_FIFO_LEN - 1);
@@ -160,7 +161,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     uint32_t value;
 
     if (s->fifo_len == 0) {
-        fprintf(stderr, "pl181: FIFO underflow\n");
+        error_report("pl181: FIFO underflow");
         return 0;
     }
     value = s->fifo[s->fifo_pos];
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 35347a5bbc..5d7fa3e418 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -700,7 +700,7 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
         sd->pwd_len = 0;
         /* Erasing the entire card here! */
-        fprintf(stderr, "SD: Card force-erased by CMD42\n");
+        error_report("SD: Card force-erased by CMD42");
         return;
     }
 
@@ -1282,7 +1282,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,
         return sd_r1;
 
     case 56:	/* CMD56:  GEN_CMD */
-        fprintf(stderr, "SD: GEN_CMD 0x%08x\n", req.arg);
+        error_report("SD: GEN_CMD 0x%08x", req.arg);
 
         switch (sd->state) {
         case sd_transfer_state:
@@ -1564,9 +1564,10 @@ send_response:
     if (rsplen) {
         int i;
         DPRINTF("Response:");
-        for (i = 0; i < rsplen; i++)
-            fprintf(stderr, " %02x", response[i]);
-        fprintf(stderr, " state %d\n", sd->state);
+        for (i = 0; i < rsplen; i++) {
+            DPRINTF(" %02x", response[i]);
+        }
+        DPRINTF(" state %d\n", sd->state);
     } else {
         DPRINTF("No response %d\n", sd->state);
     }
@@ -1580,14 +1581,14 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
     DPRINTF("sd_blk_read: addr = 0x%08llx, len = %d\n",
             (unsigned long long) addr, len);
     if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
-        fprintf(stderr, "sd_blk_read: read error on host side\n");
+        error_report("sd_blk_read: read error on host side");
     }
 }
 
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
-        fprintf(stderr, "sd_blk_write: write error on host side\n");
+        error_report("sd_blk_write: write error on host side");
     }
 }
 
-- 
2.14.1


