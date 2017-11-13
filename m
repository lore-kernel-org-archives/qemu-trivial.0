Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNm-00028R-Gh
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNj-00026A-QE
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNg-0006sh-MP
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:07 -0500
Received: from mail-dm3nam03on0044.outbound.protection.outlook.com
	([104.47.41.44]:21408
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNg-0006s1-F5; Mon, 13 Nov 2017 17:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=t4fS0+LHJ8Pb/j055VBrmvG3jhqDUnLP1BI0pIIgpC8=;
	b=cUpND9iZHWP0Ntj0PSHCGJcNLMNsPUIlbC7cIouDHe3xqLdw/NCDlJXc9HKjWjdHELDTyMGnFTwCnSXDVQ7BP9NFp24sAp7bclAw8OoKlf7C7dY2vxECyoQX2diZ087wOAfKyP9ZBCdBNPrKwj1CMfscaN87EPTjx0RIEQFTBfc=
Received: from CY4PR02CA0016.namprd02.prod.outlook.com (10.169.188.26) by
	MWHPR02MB3279.namprd02.prod.outlook.com (10.164.187.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:01 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by CY4PR02CA0016.outlook.office365.com
	(2603:10b6:903:18::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNc-00048p-D2; Mon, 13 Nov 2017 14:39:00 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNc-0000Md-A1; Mon, 13 Nov 2017 14:39:00 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcvIZ012489; Mon, 13 Nov 2017 14:38:57 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNZ-0000MM-Mf; Mon, 13 Nov 2017 14:38:57 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:34:57 -0800
Message-ID: <674645052585a2e064588677e37046403f89fd20.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(2870700001)(77096006)(54906003)(50986999)(5820100001)(23676003)(63266004)(478600001)(76176999)(118296001)(110136005)(39060400002)(189998001)(36756003)(316002)(4326008)(2906002)(36386004)(356003)(81166006)(305945005)(5660300001)(8676002)(50466002)(47776003)(106466001)(8936002)(33646002)(106002)(81156014)(2950100002)(50226002)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3279; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT036;
	1:JU7TCjnJ3ALbsNxlTvv3av/qIKD1vrzJ7s4Jz/qevQRjJ/L4GCXJ2A97px0g5yahLoic3jvkwOmb4MyPFwww5bNJTGNnQ0n0DwaCAZJI4drvUG+LwH08UpPU6EOnOxJo
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b07a17e2-ca62-4d2b-3536-08d52ae755d9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR02MB3279; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	3:CWvrrNYCeqvp+UhuQewdQj0Mv0Z+GWLdWLVbKqEOd8z/z9Rlc/Mpc7vH9XIwuUxzCXlyQefdTnu7rxANOLR3RBmDJZVuNK493QdUApNM9HsP86yQlwf+UZ7ByBw2tieD5FExGqvaecXs3d4kXtH1A9tvzuysQ8CnQGkY9I22XtZkKk4CGO2zrAFA5KrjXKc45aB9j/0vDfJ8uTvM/b6C8Pjq4MC+w4LcMik9YDS6atEDNywUfmGTQIoQEPklZs6/yPLTu1U4oBGEUvVL/n3tBdrzJxI/NNzsEVTlafWbTUPpssS1TBPtaquODPxLBzUnseGQvdrF4jy92xxii44brPG8le+2Oi2VpOVZxSSYhqA=;
	25:VIPI+KlwuZHe/u5YIMgEorjQlf/7kLblnqFbapkQ7VCzuWzLm6pgI5CHEtTWam4Dc6RiUe/srJ5F7n8kQTT1JtuDjv335q6Sco633R9tkL3Kpokbgxpu6m5dlIBwDOR483OL2DhlFrK8iHGfCmH6vk13NmfK1pDkpi/TdlQPtmQVeiSRTdgsuR7aPNnbd17tlFkebbh04zw0wB0rBy/6Y3kHfsZRBP1/Qo5GbDjBBt+pq4AQSjkagAPOJ+jJhnYrtHdjGxW55mMp8ZsV2Ik9qruj1Bf6J1iupbTcXJhmulJ9OCa/ScR0Ph/lFNYp4rhvA+U0fdA4cxUAUVbvawW+0za9J1tUb2GntFbZwPiDlfI=
X-MS-TrafficTypeDiagnostic: MWHPR02MB3279:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	31:/xk5djGzRF4YTAerceGwyORcXzV/fF/2Zkplex1O5070YQQZmX220Pkp6mDuUq6izlHCEqXPIOrq6pTe29WNxBy4876WSkEgJXy08UNg5BS2kOQKXrhqMAnc5Xu4I9Eft6tKNWsBKE6I3gnH55TMtjvirxnmAFKVrAqzWbLIqqzFzjMuao6OK9Du4ywbvBSdIzKPNAsOafP0K1eIVJH1w9B5g++iBrYviLkGxJliIZs=;
	20:OSceYMFP8f+Qbe7KU47Cvjsc5h6LS/e0fil4KoP8CwEkadiEwAHsSFJHBGCGI9VM+PZfJ043iJnbrsjFhGF9skdJV+Y9UuYHYCheKrWIMAiXlLEqellmp+NOI1nXygrYt6FzqHGAE8fhtxunNg04fWNahS5NJMdAt2cmncXaaw9JAxHJwnKtTOKweuHtza1U1MsuSg8xJa1ITjk5ER1I2XDdoOZ01NRMQ5chteyQ9kne6LzNrxY036Hwekca+6olRvUYUTrPI8uBjuluSTWTEz+sw96Ot/kFHWng19fF7PNBjeXMVm7mdp7HCCzZBQhMzBkqQeze23lX08CxSB9EfuaUlvxLFKzOex424R7hsAdVLgEeeCnt5HIN7ea9HOS17qakwZO/gfrmyg0JBR9pwrbxz0MSkoGke0RGPqgUS/IOpBxxa9UQGaqR5rOCTVYanmwvB77ByFp+wUgBFZGoBJ37B1fhjElUVNuebs6H1QcODJd5oK4z1ScFbf44Jz2g
X-Microsoft-Antispam-PRVS: <MWHPR02MB327974C2BD0D95BE763E40DEDC2B0@MWHPR02MB3279.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(3231022)(6055026)(6041248)(20161123555025)(20161123562025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3279; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3279; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	4:M5AwbucKDVZQOB9FYPH9nGP6i7PNOUFEPX8GzapIqmgvctiPghKceDkh2ec8ctslKQS9tlu/D+ATCwDCR+SP1afWyZrmQdfGMdN+T8199Ql/ffvPP07QhQna3nolRwWy7/4oatMcLaSY5BVvY7DvwEVlncGCB0ki1JRylndeJCguVkGU5ggG9QnBlaVI1Z/zlfnMG3u2NPQTbnsNbiL+qnX3CHf8ttwZ5PK0RTx6sQIndD/I/85XAKuKtK/wQk0uNKRutJyk43BC3cYbzkaSqe9vryuCTH/fxsZjio3xVewbaxwVM5hn67mSaoX8cJH6mNs4aWO0L8lPuYLB5LbuIg==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3279;
	23:U9sUagwALc3Lw35K7G3mN+yuBexJaX1SaUlGx98/u?=
	=?us-ascii?Q?6MytCujrXIBKyPjoCYOlmCf/ijazsRcFKS2Uo00eXxREnMGNQOHe4CgDanrY?=
	=?us-ascii?Q?1Mr5HiIf4ACHyR85k9cV7xrWvnoL6QutfBDT5V5tUY62F03WNViK8/eCL8LL?=
	=?us-ascii?Q?YD66IpRCKfCXe+X8qnWWRH3czP6lBmZXQ4gyjz/4Jm1g14+aht77rgb7Gep5?=
	=?us-ascii?Q?XtltEMzwmm1/tp4Q20TyU06fmCvJNmpBWdKxjcKxvh/0xL0kwcROnl1jifoE?=
	=?us-ascii?Q?1+YRCs62dNm806NAtYbFLPnQmG0gqbH13vQDM8m4RnxNVr/gb6y++Mh+6+Cg?=
	=?us-ascii?Q?MPk/41Dxm9BTZhshpz5Pers1HU4p2AdFRmHzEOXjPZwsm8VRpgMB6lVMCTPW?=
	=?us-ascii?Q?HKF4bNTKsGvzdSFNInZJulKJl9kjKRnK6uD5CbnFwyvg84mhWyga+fnzGbp4?=
	=?us-ascii?Q?6jrYNUdHuAbOcnzm8/Ft0eA0Eyj5Im5WUOp51oCOLJ2AcjLOdMrji+Yfnslv?=
	=?us-ascii?Q?nU0v+nPOWrHX+Ay37yOY8o7DtkFMGa8cmdpk38f8ikrWIPywcih0tTedBiof?=
	=?us-ascii?Q?rnaOx5X5Xv21dy75FZ4eVSPazHPEwzqEEsjKruSu+wRHvbJcbu3+dFq4h5eE?=
	=?us-ascii?Q?1EFUz07XBmHH/ZCt7Aggk31oqZV32jo1bdKlddJIBPu4dH0JPqGX5aT6Zv8G?=
	=?us-ascii?Q?naa4wo/yu/FNlgLlsHaxBsYDloyfWs86uV/MkUvu37FhqgEkJZrK6HgNUCcb?=
	=?us-ascii?Q?Y+ck+HQ0QZ47cvGb7IRqgYLrzw+6n65aBnHy1wpE1kaVZHCWBWhebfNgMc1z?=
	=?us-ascii?Q?63yjo4pz92MfeBXjCahW9M7aERWwGCnK6Y30iX6uGZxGimRPrG9C8blnYPU+?=
	=?us-ascii?Q?QtQwkzd9pDb7i8peP53VPZIu96T3NYeqceo/qTZrnlE5ziwfGoKn1skbKhf6?=
	=?us-ascii?Q?4jfkXhl9mqi8G66UduoYkXJ9DbsJ0gZAJ/lT7STRGTlfEGw+Eok8olBmiBR4?=
	=?us-ascii?Q?PJoJWbwa858xj7mA8MAeBec?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3279;
	6:hXwtGDCOQqbtAXXNO/hVkmAQtulzXRhwiQXTThcJGhqF9j0v4sy6lGX0moqyJhA/VyD4qNZAmHPiBvRlmtxs7qZ2nu2m1Pu7LO8c1jVMyAFoQYYc6VSSKtM50VRuvTIVDCgA9UxpjhmxYckjv3pfy6agSfRsh3dcZwtjQMm7+679dvgkhAzyUTWqvTx6N3fRr1rvM3hFZVXf/mc4zXq9jSyF7uCV7NvtmTaz5jRla7VORLIMVB06tXq+UzTPRGdDQ5F5CUukqL0LnWnBumAQ2lUHpuTRycqnXkRAccpD6NFb6iR8ezyeoRAeae3ZcyyzV9GLeCWpgX4vGbynjgAWht63FKxzU4RklEV/pgKCn9o=;
	5:9UwsurWNbr4WeWsJ3vBZgNits7JlpgZRtm9uMrZxsE6DrY4JdzIz9agpQAfRlEHQ4+e+QTMv4w7LrdqokWMGB4TxZg9sn+y+VZgtNR/BxqoGAuM3zYINA+KJzFsIZrgvURG1G0d63Dft7GkhvMit8hR7nk7rZqs9JniQlK76GKg=;
	24:HZMNoMHw+35BlNsN6PoqSIWKcVKXuyHNsaNpqkhWdkU0zx95tQ7wYySbdoRe94kP+M9Y/LpzBSh4XdQaJs+VznccY6RSOVPDB6KxcPEtM1s=;
	7:+tXW2Lea2SdFFsC6eoXp4py9SY4+8ArC0czi5cJi337T28oSjBM57MvFmKwIWciHAHmDdXQpEmZtgn+KYcXISsOSJzkQG/rBlq+Q2KXCiTVSKZU6SCCZkyluizoV4/j7+srlC7HxDhX3Sb2GrwJ/2xrPt3uPVhRsifF2Q3JolozVizkzNZzqNHMHKVQx4bft+V/14OCp8XEBHMc2wdYbyucNUEqvEP++j6vG2fKTmwu1/TDgWMxgjr5agRY0t91e
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:00.6247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07a17e2-ca62-4d2b-3536-08d52ae755d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3279
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.44
Subject: [Qemu-trivial] [PATCH v5 07/29] hw/i2c: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:09 -0000

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

A "I^2C" was manually replaced with "i2c" in hw/i2c/omap_i2c.c.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V3:
 - Replace "I&2C"
V2:
 - Split hw patch into individual directories

 hw/i2c/omap_i2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 26e3e5ebf6..e9da7f9f51 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -340,13 +340,13 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
             break;
         }
         if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
-            fprintf(stderr, "%s: I^2C slave mode not supported\n",
-                            __func__);
+            error_report("%s: i2c slave mode not supported",
+                         __func__);
             break;
         }
         if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
-            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
-                            __func__);
+            error_report("%s: 10-bit addressing mode not supported",
+                         __func__);
             break;
         }
         if ((value & (1 << 15)) && value & (1 << 0)) {		/* STT */
@@ -393,7 +393,7 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
                 omap_i2c_interrupts_update(s);
             }
         if (value & (1 << 15))					/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+            error_report("%s: System Test not supported", __func__);
         break;
=20
     default:
--=20
2.14.1


