Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENO7-0002eW-T7
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENO5-0002cq-Tt
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENO2-00077V-Qx
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:29 -0500
Received: from mail-cys01nam02on0089.outbound.protection.outlook.com
	([104.47.37.89]:23148
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENO2-00076i-I5; Mon, 13 Nov 2017 17:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OrynN4WZoZoHYgqML/BL2R502hXxxrywlbwEAlffRvw=;
	b=gAw47eoH/Oeoqd+iQFCO55Die/58G8fP9bQKhNsaGacxmN29b9q8iH/2nxj3Y4kiCsi0l38hR+GTW65fJFi2PmdodEwuZ5NPXCjHCzeYu2xc9980jCR7HJDMm0ipDtqUFXxZfWjEs7nbxI6IF9IoxLmWaZSTwYn9ENiA7MPfzk0=
Received: from MWHPR02CA0010.namprd02.prod.outlook.com (10.168.209.148) by
	BY2PR02MB1330.namprd02.prod.outlook.com (10.162.79.25) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:22 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by MWHPR02CA0010.outlook.office365.com
	(2603:10b6:300:4b::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45582
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNw-0004Vf-UI; Mon, 13 Nov 2017 14:39:20 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNw-0000SP-RE; Mon, 13 Nov 2017 14:39:20 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdASq002777; Mon, 13 Nov 2017 14:39:10 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNm-0000RF-4O; Mon, 13 Nov 2017 14:39:10 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:35:10 -0800
Message-ID: <018c3824777fcbcf0db013862272b9fc0e84e147.1510612380.git.alistair.francis@xilinx.com>
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
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT028;
	1:RDMJ92UYj7aVtxhACzuDsKPAUDkg3NdF98Qs/ecZaq3AcLJLeJ9lRc51s1y60QEOwGZ5ll8nGXCdGuL9C4zNKErhx4I56r8MZEA3++qzzYlHftxhMl3cltuoZ/f6V9nT
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c27d11de-4bb3-40a9-39e9-08d52ae7628d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:BY2PR02MB1330; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	3:IHviENTuoxdzCatUFM4lz5zcu5dsC5Z30oK6szgj8MTlw6EcOvwCZtb2IvrXRHfaFzx/0vir2JIcGOD1e/mtW3qMDM6az2La1EAD39GUMS3HiHTpQjeeh0Ld74mpwF+JUUIX21Br9/a2xYHLEHPC+PLlX16dbU6uWk7QhP04HZo1g9cow3frxo3V7VbJYmAi9kCOqAxDS55ZbvT0rN2AOa0+3a064l6uxzUh4zUI/E0+8snCLQiKUnLY1D9NZYZh5EyHVQia3vNhRO8gMrcV4e+SniH+s7MlgQXhzg1FTbC1wRn04Dx9xc76TIlRDaK4griuS8kZkjXrZsuvoh3UDaYXaJNVOoB6OqP3Ui3NyWc=;
	25:mN2t6jK0KqgKOgtTzUohVD5YPSMSsOJG11K9FvN4aVSQZMO23jAfKp49uKPt/mq9XHnGuV0WM1iH5rh23N7Q3E8+fbDoc89caB6jBN/qyoNdquehIAfr4DPYEeXV4cStMGcJbwR+E25oFO5dmpVPPYhumCPfvAbzgMr5+Z+vBHm6cWxOMnL9ZoSifb549F3pCW7WC1gzF/o4UeWbnu7tHpwXDNLU01tJfjOkpXl2RdWsOsXNHor4k8vNry9pdbqa7lMv3BSzmhFBKr1a8NgGDcXCIYookGHQEKlHziN9lg2WxIR7JYfCa1DIymLf9jejXLdcdi4GJmQe+GjkqG/d9yTO06Tk9ufpKfz2BMT8Ggc=
X-MS-TrafficTypeDiagnostic: BY2PR02MB1330:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	31:ZPtjXjTx1Ona43Vq56W2YLL3JGEmn4ftLL6wz1JD/bTRteFEiKJiiEWX9DkFtXsZAreiSGs1zJn2pVwN5eCkZSEPVZf+GXIRHIH6FjFFCym2DW2b/QPYGTUSzrMeit/snFFe2/ESuiHVHRt8Uxtkt7LMDIZoN9GwGIchCFX6pojgbivGM9U3voHdbU1gYuaByewSoy6NEsLfDE3p0ic7uNJcrmbMPROytPsGdu9D76w=;
	20:UwhmjSl25XsZN11ywt0BjQObNc/1Pzp4ioJagEpdKMAxr807NzN8C4/SBzNiUVHMutPrauDWr9OLyAWzIgVQZ5OR6CpSy8m0/fPGPrdOfeLczZX6jduPrWp4/2/KjfE7CRFzuvoh1iAKsj7CtxmHr4jPBxGTO5gNUI1qzyAWg7mvXI7dIdoD/axHIIRgngVYZpYbF/HOLGHThCRWpgsB4gUGr4fvGILbZavnh5Jq61Z8O9b97ezkWNs5XwyPArkpTBkcmQQsyyaUXC+9odyDbEnXBc+FLEng0gmA5nPH/2mCNZxcBBGqoKm5tUuXVL1P6Z/mBabyxlE8e1QL/cXbo2II1JUOQgyqNT0jOfPHzaqu1Jf5YnfQbmfgVD6bqH3dxWe1vpqh17StJJSHkcsqIDQLs/ywBIPXydRz/TA42A8zswrxLNxQI8UhZu8nqxU4VXg38vS8wgYFgfdSWz+lADM8uI9I/yjKDsAda3PLr8Lzr24eT8g0d+8idFwq8cGD
X-Microsoft-Antispam-PRVS: <BY2PR02MB13308368020C9AE4E918C819DC2B0@BY2PR02MB1330.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(3231022)(93006095)(93004095)(6055026)(6041248)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR02MB1330; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR02MB1330; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	4:P8lMMJOPdC7qY49YpS3JZqBv5q0cydoyvA4oriw6dsFPAzDyDCJQn5jdNEQrYJU7zMsG8RCstCE/ygaeEG4jm6ypy9s66jYsUc35lf9/3ZtheAGZPyVjwmlvGa2tRg1UXGhQK8QarJjAQ/F9SjYTeMJpRv6VXdUlgt2Mo1PBgcpepBume9pG2A9EPGCyhhTNDW2bsIgZFCxllwAz4X6w/nzdQ9++ditkJE+tpF/Vsyr3sxTXbgXlIbNJsYWxFbpTby9LkqyEIR5qDUBpFt5H53lYxXrn6XxWxZrhzg1Y7Ffxfcda+QEYXGaBuA86oRKd77rRKZS1U59wXcVwoIXvCg==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1330;
	23:JOK/180T53FSLMNZHUVcjQyA5z2+qi2Z8UJ2UBrFv?=
	=?us-ascii?Q?UdqcwzRs9Riyjk9eh4t1g/Fs3Jas/+n8Q5ASx5XoDdpUSoTH3HczQOyippW6?=
	=?us-ascii?Q?iQh/uTBXg1VZLjLm9aKjw0oiezIk3WbzQa2WAipT8GwcLz/KFdNNmID80cGW?=
	=?us-ascii?Q?WnuOc9S8E1z1kNbiLv9IcU9T6mubCUzckwu6OXQHwfzwgF3P0Oy0GZLSWo33?=
	=?us-ascii?Q?WL9u1vlcL07I1sz5XgVmqoxfnzHSO1BJZfaw0b4FAMMX5Q9+4sNaJkZJzgfh?=
	=?us-ascii?Q?n6VrJcPqI/NqHhyZd5dkCMQskbjP73m4Wb0u4oY/L7vtnAfSKI0MIoLAnWWI?=
	=?us-ascii?Q?lCosIyEaVaf35R14tfyKBBZbGSNsBjjUADPTMh9RKV3gKdCDNi+4hUVZoawv?=
	=?us-ascii?Q?PfWbCUtu8wl+v3+xoQN4lPasqZ/+VbUjBhg7rTHHrWtzSlj9fbsrLPQ7Yb51?=
	=?us-ascii?Q?Kh0qSF3PMNj1cl0OfDcEdH3WHQ/UuyNESH0+QlKmZWsg8YTOyyUt54mspwvE?=
	=?us-ascii?Q?iORd7QFwP0ygEOCZsFZNZ+Guu4tC6cTf5uM45EmAWNKqNFGV85cepeCJVRcO?=
	=?us-ascii?Q?7oE15XMVqinKqinl9fPxARMhBJX724BIzu9wrJtxIEg4xmD+6n+I3S5/HTG6?=
	=?us-ascii?Q?k3eOpgBJSmGnvKk/dlbU8dNnB63ztdvK5yCx+J/9p0ti1VhRNTJAR+h+3qkJ?=
	=?us-ascii?Q?YQXx90OPIlvonLVv6V/7JwAqiDK7kuVIr50WDTwEurFtYgfFxm557xf5l8yT?=
	=?us-ascii?Q?pbIjWh4q+DxYkJNE4PJ9D32qCKj53IIzUW5DnnI8SFcVJpIFnxk9VyJwf8IX?=
	=?us-ascii?Q?smcPC4qv2LMFdQgfP29W8H/3HBr+VXmgSMsJr8BdPUNgff4wfW8p9NFmt/zv?=
	=?us-ascii?Q?o/gqgfDVTVdMe5q5Q3vnIAAMVS2mcFJ89f6bUo8ku0LiY6VqRj6LNwUe9t0V?=
	=?us-ascii?Q?jDWozO9sM+bVW1b8NWozZNIGEgHChSe2TZmImHalN46bkyVeWGTZI8jbjeVO?=
	=?us-ascii?Q?18KPMyig5JIWcd856oFL4QkZlWrUoVPCjb2mN5U3d+SLKkWQCHj4rux9NB1Z?=
	=?us-ascii?Q?cQekbE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1330;
	6:i6eLgw2oBkKlCiNTYMZps+yEK0Y298pQq/+4N58aE7cauMBbmvrz2TeqF3UtIBFSReeaKCVXUUe5kR13PuZBJ8jnya6Mi/NUgesg7AbyukiLIAdQawiLI/fFaRO/x0MLUow4UBqbinLVngW+yE9jrre9Y3xu7ASUbEoOdjostnYASVrNknhqGJ/ywKELC9+KiQEbzrJouyDIvjnpXmY/SJOboc2UZEq5RoxPF2FlHx4lsJzxvefGPIrnCcpRoenuXSe/5mbSdZBI25v/R+x/FAs/jKNMWqQaGloXfEO9dKkYZ+H8alCORTAzw9YYKjg7ZTvfYML9pUIoLmwdDjXADjX6wpzQuXKYvD/6p5B7yXI=;
	5:hB6614O9Xzu1/rzqGRxvilUMDC8UUWT+BqFgbp8GShkgn5nVXFGYHvQX/6ssqLqrHyCcILNFy88bG82rOhUKpL0UdoWJd5C+dWBDZJXID81UcyuinN5dRAW1UM63kj1eVNZsbE3jtXy/YxD7H7jO3bajIin3g/P7pkzhPja8rzw=;
	24:L3jo7HgqfGBDqYnIjmDEynZKk4b+YNw20rE7z5TgOekDmAhYSrIPvGNi/0EdB6v5NHVufOFEjdQxEEgGnOmNnRWSk4OvrfwPR/2KqQNEyKw=;
	7:PwGN59oaAL32WOk0ECFCrah5jSB8KTNvhDrt73wx/vP8CpQ06Yfh/9MapFL8KOEr4g0OPzAjla3Ras0/GggZhHgofe87Cdtk79C4on9mY7+XR0gfj93bxaVmfQ1gs8iLzVt5EbNH1P0y8t49hde0dHH0+KxAdIdLjzroDgVtHnPr8xKZrCuVvbKHW5IatQwXZLQlDVwjZ/0HvjKm8xJpH7/4xKc7CPxz8B+G9T4d1oZdRn1lyH11y+Fr2g9rvWZ4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:21.8277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c27d11de-4bb3-40a9-39e9-08d52ae7628d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1330
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.89
Subject: [Qemu-trivial] [PATCH v5 11/29] hw/ipmi: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:31 -0000

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
V3:
 - Remove left over include
V2:
 - Split hw patch into individual directories

 hw/ipmi/ipmi_bmc_extern.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index abab3bba4f..8c0535d3dd 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -28,6 +28,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "chardev/char-fe.h"
@@ -194,8 +195,8 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
=20
     if (ibe->outlen) {
         /* We already have a command queued.  Shouldn't ever happen. */
-        fprintf(stderr, "IPMI KCS: Got command when not finished with the"
-                " previous command\n");
+        error_report("IPMI KCS: Got command when not finished with the"
+                     " previous command");
         abort();
     }
=20
--=20
2.14.1


