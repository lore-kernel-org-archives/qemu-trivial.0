Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOH-0002lE-Eo
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOF-0002in-03
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOC-0007Cv-FN
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:39 -0500
Received: from mail-by2nam01on0053.outbound.protection.outlook.com
	([104.47.34.53]:55072
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOC-0007BW-4V; Mon, 13 Nov 2017 17:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RqY/2IgXpI75rDzHX5gN/MrHmuHW4Ex2nAeSXbK9zFE=;
	b=ufCGo/pqCzso21q0mWBt0Fq0h1OQK6Et4EKoj1POVH5VPKvLBTEBSZrjitr1jQ/2gts7/WopHxLYB88cj+OlKaa9dGmRDDyu26boOeYzCaUKW79695KylP9Isy/N51NQVIfmUKxaIPiDXbEC/peaWrn4POSmNwxMf95ciX+K+kQ=
Received: from CY4PR02CA0047.namprd02.prod.outlook.com (10.175.57.161) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:33 +0000
Received: from SN1NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by CY4PR02CA0047.outlook.office365.com
	(2603:10b6:903:117::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; denx.de; dkim=none (message not signed)
	header.d=none;denx.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT027.mail.protection.outlook.com (10.152.72.99) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO7-00049J-EG; Mon, 13 Nov 2017 14:39:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO7-0000TQ-BM; Mon, 13 Nov 2017 14:39:31 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdQ0K002812; Mon, 13 Nov 2017 14:39:26 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO2-0000Sv-14; Mon, 13 Nov 2017 14:39:26 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
	<marex@denx.de>
Date: Mon, 13 Nov 2017 14:35:25 -0800
Message-ID: <dcbe94054fb7bbebde4cf1bfaa02ca40966ea6a6.1510612380.git.alistair.francis@xilinx.com>
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
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(189002)(199003)(4326008)(81166006)(2950100002)(50986999)(63266004)(106466001)(50226002)(5660300001)(39060400002)(76176999)(23676003)(2870700001)(36756003)(118296001)(2906002)(9786002)(305945005)(77096006)(81156014)(356003)(33646002)(8676002)(478600001)(110136005)(50466002)(8936002)(316002)(47776003)(36386004)(106002)(54906003)(189998001)(5820100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT027;
	1:LwFGzyDKpVTBySj+UFi54gxaDktpO4NsTuUtIxjJn6ic7nx3GRRpDO9QE9S2f6tpob5d/oceA3bfu9suIogaLezm3KHNhY8iEHpz2IJkRaUpNPiA3f2Ku8Xm0TGWLWBp
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c278c6b4-a679-4b87-7cda-08d52ae768b1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:ifsh+K8s/QoS38eYQfeVglTO5W1D/fWDUPxg4TDozxnSH89klyGyCKvkcySXHUoGKsevxZeIoRODhINAlHmNi7bEaBVAtIakvYdKdObhTq9ocyaL2eRdXlUiel9A1rTQ5v9ATghM1eFsTE0Ac04ePYgDb8xt+rYb94CePd2Q5K0pdAB39p8j4fvBu7J77BiIyd4NzngaPIBWK1njfM3oy0WMrKTGRDcmy2kE788smUCRf8KtacO1aGNoiFwlCYYDnC15KNMXNpPk8ZBrjNaOY2Cd7mz433gBT3wT2BX6/v5zI9/xRkOjqk7nabbdEdJ7wvE8GMMKKZa4sSlzVJERALh//aD1hU2HXC21Pz3SOzE=;
	25:Z8rIQqWYSS9ndwfzyn3nvGHSI26c7IFmSJz4BjGSmWI+nyKYqSNr8r44Y623yTT0y9Vyt+hhOJu7EoHbmEAyYlbnKBb6TDktAjC4JmjfWzuih+tN+mpvPo+X0lsUMmITzn9X5F2P28UEsuL044NyYKTZJVTNgAkNRMXldbOQcrMG1ug/eTx2htjT8S3sVBwzdkWUNoJbCczu5bdmQQB8y/JOXDrMH6fdw7QQFa6oi8m476McG8umroyeKuZJ3g9qAHeYMGpAVH4uAmcTrBWNeAio6fsaeMVwXI6oxl1ZFjW4QZqvrO5+V10A16OVuZHq7sLntGe5mt7VTpxvjd6R00fJlA4GFL2Lrhc2Gqjx9wk=
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:VuEeB0ufCDDXul1dtfBlxNnVLZvTmEBFIG7W/VijVnH6sRn1V+lsGqHckxUVPJRL8mPBsfa/vt6VFLVukG87Yj+fC8eRtnGEo2YXCN4SXWhj+K8SDVsvfjITUdIslwGY5LWXWcgi9qA9vxcD0ou5BjSxlMI6C1Af9k0TI1sXha6amgTcqnEnmpQWjTraVWWAZwL06K2DTnQMfhPwawQDTcrFTYwt6bn9Qn2iPcHVfXk=;
	20:7ONS/7+s/+k8thpB85tDKDNqS6SP/AtRC3ynaKS3V5PbO8jtZPVHjfWa9SLrqu0SY/LjnKd/AeOqjDvKAVRNghgWdi4Yur4VcEDTeUeqyvfTwfa+rrpU1EYDab7B58srnq8iSZuBzXHx1g4JS/osxryxjUBE7mivMlm0H1lB5O/qxqzhQgQlDuzu4xFmt4+PwOfAUPBJm5VS4ywuIPOx03wjObbzcbHE0pgCRRtJidUvr6g40QOhBBtQvgYoRRVAW2vRa5oAPJ5JDQ4e4akP4/SxFzaH9I3xQOtnRdwiA7mqPmF4iYyKWjwoHx/+lqGHjTiowxxRrnYJY1mhtkj22i91G5LxZxZ7pfyR8iM0DDU1GJJ2X4mtNB0gQlN1Cucigbo8gQABBNWa40G2y8UCRBbWn2V/YfawxX0ETrpwmC/J6kC+IhxNsr1vBkeZfxjjmLSdRkK+U2opmNdCSMGqUDeVVWDrKO+u/Q8QodR7teuctnmt0//YU4Earit2UOBP
X-Microsoft-Antispam-PRVS: <BN6PR02MB337722DDECD930FDF6ADD4BEDC2B0@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(93006095)(93004095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:I/5DFLgvG2XPOnFWyBhr49STkTPWvcWvF/B86G6yEcg7NwAl6iNmHxDUGpa2NqixSr14Xvv6fPyzm7tPfFJotRLEUbXvm1tC94m0/G0/Tkjf+t46ls6O+hlzK3mX2hIfKu8qeYJ9ymFpdbKf97ujTqTk0VqCpa/J8Sw4pjBVGG8Kqo7qhRhRJUw1k9il9q8smPHtkX6+wz1zpOtzrdux4vM0ZT7HJ3Qazf6pNWxuxbUEwY4+sDLgyYA0lMO30VSUk8AGuI7n0S05ijsCsJSWMfFaIE8Q8MfnJoYVjV6fo2zWNqjmfXy6VXOt8ZVSJvoWFqKtF59wo0DLbAODYvQ5Qg==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3377;
	23:86+X4PilCsZMPUQal/+AT2X7Yh5Kpje7HMMbuG5a7?=
	=?us-ascii?Q?oyjlgCmydNjG1rIqsZLBljo8hwwgfvnw9siuD4E4464obRc0k9u7knkc01dK?=
	=?us-ascii?Q?JSFQayd8NpxFw3i4pDwHAnOrb1XG9Bg7b4EMC9W9bjtWf09lnfYNedpPCtZG?=
	=?us-ascii?Q?FdEa21eGLb2T/BGihC6IFtvoiK4RmGT3GncnWJJFM42DGX7o249ou3Oz1+Il?=
	=?us-ascii?Q?3jSrCxG++izJqCHJUHfmK+/SUoG7p0EQ6boxj9QYpc4lXSPPpl6PrcZaDtOf?=
	=?us-ascii?Q?vFwWKFxYxRN96JHf875iewJp0gX6zrgsMnS6LA32mu5SD+jQPDfCTpKCB5iQ?=
	=?us-ascii?Q?Om9Ovm/julKUkwVSfTWd0fDZZxPZXZsC/W9fytlCUaZ6iktBXPLFFU8bD7VI?=
	=?us-ascii?Q?WdKGdzShzXMmbV9wblikalq7zxCHQpyK3qKFxzn61WeU58Cw07sVMBYyhq1C?=
	=?us-ascii?Q?yUHZLB6CFsCimA7O1du7Fb+isjh6J7LJzcQOXfcEhjXuGT/MNKfXBbubCzBB?=
	=?us-ascii?Q?S13vDprHY+IUfBy0cAyWdtFnyvJr/zX3rqJ77OHo2D7ZRkBzbQ27q2kaba+Y?=
	=?us-ascii?Q?A2qVBYF32f4CL5VJJD31Kx5ai3sO8uFkdD24LxlJAxHswnWj2SYlHC5e5P6Z?=
	=?us-ascii?Q?dIiJVJOG5RQXmVrg9V7SFWQ5TSbq9ZHxJQ67raggFCxAIwmLiHvAD/Sxcfxu?=
	=?us-ascii?Q?oEJIkEZcPJee8mQlToUlfLSktDM/gA0UH05E6LK8Ybf1JXt0n/SDBqnY0/Hc?=
	=?us-ascii?Q?QJ35/R0k3j2tvTTlGef8pHWYKdF2aB3TGGjdd2DtofQQgRamH2QhyqePsnVf?=
	=?us-ascii?Q?JnDVj9m0tXYiFokJKUAc1c12VRSgbw/tnkaOk04f9q+YbtyYdWZjDqQ48A2x?=
	=?us-ascii?Q?3B8GvIucqrLhZY4CDzYj7Cn4pB5rn6bQ+i5/myMp6RU1Ah3jwGVpAqPfuZPj?=
	=?us-ascii?Q?JnJ7AcmZwSYbaHZhw6ZzlYXLHdC/Ilozys4qoqYMe0cL3PRIak/fmm5pvDQP?=
	=?us-ascii?Q?QPvW1DbLs2hedzokkDEVwq4?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:ijl8XXQTeC3bT3ANZ/WK+Ia1C65Bb4aKQc5lVfje8MbDQFWFHZXqUZYmCRGV9iBE/gjtk9CtbLuewzc07TqJA37VHTl9b2c/X+RgkxJ6MlOZNGYAMQ7i7Scror0rjQ/Egea19+bZmKEZhTKEem7+KRkFLCgG4D1T7FlY3BQfiT/1eDNltOebwbaA3KsuGnuP8KcgB+GGALZJJjr1b6Hr7fM9TJsMwq1ofBa5Au5NSLU5zrvZyZQ0Tt1XoQONiZ1JQR2Q2K2DvlM2OQG+9Cp7+wtcbf/29reWsUW1b/GIPv+m1FkcaKDL2H57uLE6ZNp+Q/YZKr7aNCICCKKPLNLCTJNI2UZpcGoLPO0h0ysbA5Y=;
	5:c//43ck9y1ms4SfnvWbEGKfCNwgNUutEGgZ1HLfs1sc/OBW8zgeH+elYtV2FcUm9dkXSFGmCZN99b1rHdF2FMPzvVvy+Od0PKcDW7/py+mU5jT9M+dIXMYk8ysX9xp2Gs71k+ykFGQdKdvgx6GYmoyUGEhmQKnyPQQlzEzblQLM=;
	24:TQlabSeOoHUs43TZw3ErTwiQrfIbLxCMCATMqhE65IWwv5Whb1tUr7Gv13KyMO7wuNKTdMTfFtO62i8931LeXXhfKu0MM1bEee4a75ry56Q=;
	7:qRoHApgrLWH1V0GWpoRCAom++yCJ7DPj4g9+hAt+VcngPvQZiVFIRVL9fJs5GwasBCPSBcoJ/LnDNv2eqJKB6KV6ec8l/9oGbAvVabOk9RgJVTvjZJr4pPOo7FV+Up+X42CBzHubwCOgV1C4gjn8vdknfclbge1IrKx9qO1TN1SJKIU1tyJYYDB3NBtJBBoGnavmNp1+tWamaHpM2l5QTYwXfmEiZ5t8RyYlMv2hAfB8iSJXx0JL1dyebaFcbj+q
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:32.1942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c278c6b4-a679-4b87-7cda-08d52ae768b1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.53
Subject: [Qemu-trivial] [PATCH v5 16/29] hw/nios2: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:40 -0000

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
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/nios2/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 2b31f5b844..c896e8007b 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -96,7 +96,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, cons=
t uint32_t ramsize,
         r =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
         if (r < 0) {
-            fprintf(stderr, "couldn't set /chosen/bootargs\n");
+            error_report("couldn't set /chosen/bootargs");
         }
     }
=20
--=20
2.14.1


