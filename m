Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBU-0008Id-FH
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBQ-0008E3-F2
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBN-0007W0-Cw
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:32 -0500
Received: from mail-by2nam01on0081.outbound.protection.outlook.com
	([104.47.34.81]:63264
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBN-0007VA-0c; Wed, 20 Dec 2017 12:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PDCinLXX35Rum3GsICMGyEJuI9fgFvdd3vb6PP8Lvfg=;
	b=G5tzDXAp1M/VVn4UvtjGrWwhE+ijpiV8zgqfQ5sC54QkT6qxGZFpoPJmnBIqFGrNiAPPmxwPS4V86JxVMPpwmmKPaAuLTKtzNbb0oQqVFlwLAx6X+99/+Owv/G5DjVhSAKh/mkwvuGWk1qJSbNf9RVuSaFpUM4gN1jWmzJo7iEY=
Received: from MWHPR0201CA0062.namprd02.prod.outlook.com
	(2603:10b6:301:73::39) by DM2PR02MB1337.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.323.15;
	Wed, 20 Dec 2017 17:29:25 +0000
Received: from BL2NAM02FT064.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by MWHPR0201CA0062.outlook.office365.com
	(2603:10b6:301:73::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:25 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; citrix.com; dkim=none (message not signed)
	header.d=none;citrix.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT064.mail.protection.outlook.com (10.152.77.119) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0004ta-AV; Wed, 20 Dec 2017 09:29:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0003wk-86; Wed, 20 Dec 2017 09:29:23 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHTHqT020054; Wed, 20 Dec 2017 09:29:17 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBB-0003vy-2B; Wed, 20 Dec 2017 09:29:17 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
	Perard <anthony.perard@citrix.com>
Date: Wed, 20 Dec 2017 09:25:01 -0800
Message-ID: <59c2dce96ca7e14c38fd889afea1d1f0ed3fc371.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(346002)(39860400002)(376002)(39380400002)(396003)(2980300002)(438002)(189003)(199004)(9786002)(48376002)(8936002)(50226002)(5660300001)(81166006)(81156014)(8676002)(77096006)(36386004)(478600001)(50466002)(8666007)(47776003)(76176011)(305945005)(106466001)(2906002)(4326008)(110136005)(54906003)(63266004)(316002)(16586007)(36756003)(118296001)(6666003)(356003)(106002)(2950100002)(51416003)(39060400002)(7696005)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1337; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT064;
	1:UmsmSEXMYHhlkflsT8y9WN8dkpfOYU8RWeHr0SQWs/IS+GI+rC5ft/ZfbbkGBRl82wXX0umzJkGckXcwl/A1K4t8CEMInx4skUUfrARsjIBYckeEYjqTYvD3i1Pp/tKR
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0972cc90-7186-484a-9a47-08d547cf3690
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1337; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	3:qRtbKMOpEfbs+vpWKbgx3LnpnLsOfGR24i8AFODOdMXrZ/NPyNYYN40FaR/Izd+Jgx8F7bxJ5YV7ev+u0eR5ykJWmaScLhlfTxuZn4P11z+imxwRqhWK2/1xTdVZmut4fsX1wdllBOQP5UDxdvd+ZjD1Tx8CXugRn2xzo1L5NMXBZFLDIU2mDvnGSzHTYEHer/kreqUapeLydvC7fpEKA/kI7WKgcIRqxeztc+CaTI0N2RnWBJssQkN0dw9MKGFLBQaLJ3rd7PDET1B+VeqRzILJWlnLJoRc+q77VmwpitPBNG90ZXwLXorix8RRjntUHu+4f5KXPNjMnj1IAcF+jtcmCv2yaVUpsoPMthXJuCQ=;
	25:fnhfGqVnowDurhIR/T358UsqkqiAshO14ScDs4cyggI3D6+VCYdWyHnI+Fd1ncx24rvd8yFOBywwBJZrgn/tikffVfQP+/hi3hU78ncsqC7EWMYDygAMbDry7ivyfUY06Y4tdQ0GTe5FmMLpOpfL9qLFwG4+oAq7Kdh3Ce0I3d5S7PE0wUhAvSQ8gSKL9Ur5nn0o/EG+YwSg9VnOGjsrak6+SOHoQ5yavGbrLAj4LgR7ysK4zvIJBGvG3fQbjn8F7J18K6ynYfhckPVzIlys6Amzj9t7gpEgo9i2/H3adepmi6GGyqFGYYyMke3k58jFXL3QcCZKovmYuPtueO4a7dWMzYHpGke1LWcejMN8IBo=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1337:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	31:9SP1bbUKEgX8VaeUMAv5jqPLu0H1dpuRvp9RYXkqx1k+/ajlahvFn+fziXMbyKfO7IPF32WwRRdNubMbBqsCmZHJlkf/pLjpGen9O1OIzHQLHFhYzv0wnYrIModsDoLYOH0+/GoxNs4U00pvehVoEtwtP4Q5vc1jfjrGWQi1GX2NMadDVAVaQvocvfvhpmO0KH6u10xl2Bqr1vioW916RvAg7pftXfHkdMQlDjxtP2M=;
	20:QQEpSMovRLatoM4RQee44PG9+Yxf0ze7fKkkgEx7b+u/1Erw0weVLVNv6fziGSJe0acQF/s9R0tw7eHLw+v/LUkBe8Y5VJaZq77GUQO7fyB7n9zfIEH2z2C5eA2QFc/5pMln4EkIfNuXJ0sIVyopSsgqfB0tBEqVS19N1yLE9OGQOp9cklIRDQOFNiPhpEYRc2siA1WQjNVDR6tUqN0xxRtAcrtDnCyKP6yHRWPqofWLgk0jFG2XyIaUfhO+ZA5RKBADK6012vfLHKJQug0Oy2anHXlqaTXCtYVWtVziLRCUTI5uYWmplrj4oDHh41CuH4GjVkwL1GAOdoh7SgZS9gXbWDmVIsw4jVN2IgFbKmleH00dl5UfIB7L8ExMSRVy3qGfKkcNw+pXa9Wz+BRU3z6SsZ2LShEQs2vXhw0uftZhDMcuP7oNJ9351Jrhfdd6/5jpfzda/wteb3gU6dWJxc5J4mJNv5BbJiAf3LmAQrEuafPLRDJdj8mirBxPbeWE
X-Microsoft-Antispam-PRVS: <DM2PR02MB1337969B15F6001122137B2ADC0C0@DM2PR02MB1337.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592)(70601490899591); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(3231023)(10201501046)(93006095)(93004095)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1337; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1337; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	4:oX7arxSMTdZZkiGBhz0toy+bPeYCMsFSYJV+dj3KnE1NGitLr0lX5tCg+dDYIFPzZtI3aNSEKsnfNn460Nni6dBGZeABtVncCTTr1YxvsrmBP7KM8fuuNG5jQjznJ/ZEj9XvNtD7yGRPVZVnrGwE79kGlpMs3e0Ud53WPGO8TJ6rPCxwvFlSVmDo20RGfsfgt5ANhqF7IjgtN5BXbEAajixnOncdKR9P6Te4YcK/HWq0+gB5tUQcG+zGy1V/DnTTyXEKMLef73xpjbgD9lWV4pSYJV3REkgdvE1gwjbXoEvWHIwYdrXgPvWq3UZBYhZlMYFlK9rE0+O7tz+bn5EuBnJ8vk5z0BWjkaFLQ932WuRa7r1dvOsFPuJKuEQy76lF
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1337;
	23:ptnrUGW5WssXbDzrCcT8B166bPKnEffnRr+BO4oe2?=
	=?us-ascii?Q?GZQwF95zdIkENUe81l/OmNvmSscwgQmq1cK/CWfQj47Ls3ceiiEyoB9wu3Zo?=
	=?us-ascii?Q?44Qhl+qXZ7kVxECeUN3/NN8T48MBGrnSmUQWTnlyBFDFxFw+iombmIIN9Y84?=
	=?us-ascii?Q?iZ/IYtIEIzjbKH+cqOdLvYScgxmSAYbeq86EciZhGD/vU1y3xzEKSUmbLwhZ?=
	=?us-ascii?Q?1bXNFjf5R9y0JM8eJSAs2b0Vm+o29v1XOAif4j1xfg+NMbXDLc9dFJNBPu4c?=
	=?us-ascii?Q?yt+rEunk/W7AQ7B2DewW45sqy7jv4rXnr+XHNU8IwiU8pjP+azBZfYCtIFAc?=
	=?us-ascii?Q?s7GUOkldjxhFCb8OHaO4MDiCvPd1QbjAkp9YpqYj3/5TPwBcUFtLDmzv/oLL?=
	=?us-ascii?Q?k3Bp1itNaE53LLZy4Ntj6D0hD/mWZEPps64AmX2zz6DO6E3CPMkw3xT3oyE+?=
	=?us-ascii?Q?OVRFG2CudXIUuh0q/oZTjhCrviwbhAEnrZYzm6gRCxRWvCuDyncv1sFHrSzO?=
	=?us-ascii?Q?Dpwe3A1KKHnQvwqCB39OmfcrgkSWVFwH5Nm3wnrjOd0kLvk5vGL3TdbSFUXF?=
	=?us-ascii?Q?hS2xk735V9KDJxE+5OpCZK+H5WpUDUx1khOMuADk0DDoANJwcC3nicYZO6Vc?=
	=?us-ascii?Q?rhY4C4loLLiBtioxDNobSkSGrZkYUJ3glkyt+sW3vMCR20cohW6RCyH2f5dT?=
	=?us-ascii?Q?q7E+p2Urp53cmUDBHAQjhvsxuIAd5GYbxyy0a7bjUIwNpDdony/Vluq5zcI3?=
	=?us-ascii?Q?VwyDmWhv0XhcXi9tDsdQ5wVBvX6+mqBWHZHJIU/50QEmaUESqBXTL/hpv4og?=
	=?us-ascii?Q?UXo42uJl35npMTuJZFlRA5WoC0yjAlirscoy5s1TzT9LBLE4dEZ/yjLga6Cf?=
	=?us-ascii?Q?itnimfqozI/SA3DrupXsdikC/WFL6zIEJSqQMXd71n+fscQNJ/HvfZu7WFzJ?=
	=?us-ascii?Q?qc3YwIEO6LMDP+8p9QVixWXOTsn0b+iwLcSWkLAPi1xiJIGvKk2VXFzlpE49?=
	=?us-ascii?Q?tbcWIYF4ebSwhqVr0usiondacPhNAuL1uCezrLTjdeaOJYcSeNGJtaVlfrew?=
	=?us-ascii?Q?3J7GDGY2jZez52ebPBavjmukVFqJ+SFwgCPQOyuF307XkwAW4owJzlkH0u4P?=
	=?us-ascii?Q?nIuTWzWadI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1337;
	6:qZDbWwI93IK/gP05lSj79qS3qa8CKhZiTyi2xRzJAmVnlL8GdADR/TeSWwXdA8pCO2XHwLU4An9O3eOnKyPoicmV2zy86sDEg4HZf0Yq3/UfASyXh1u4+Za6Fn+MBv82uboNa+VKJP9CgGKfVtZWANVjuITg9vRLlCvUMEFEyjpLuhxZ/4J++kPgK5xDo+L6ai9huQYgKTdYIw9DOOgYDG2CiO7lv4bTBD+iIEXU5RJEl3K5kxGM3QQied1Co+CPxWso8R2CQVjr7+Wo0KZLJFICr6C+6LyMWtCNKjRCUDfHM6seerlKJKLbSrku7hpM0ZKrfhvYAhzNOfEqvrpcfXp5e8x6Q0YS0E3x2hQp9BY=;
	5:ONdeo1XYbbuQQWXyGe9jb/jHmY+9oJ+DzofETA4fRkAbl8WunU3TFw4Cg0lldS//MlVl0ZGw4F0feIrV40WRLCOWIOfol4pIFHqUFFhpFovVSxWLQEyQ2x2tr5/kdspbX52IfNnHUJ0TSBVtuxd95flYMnMlL8zZ82oRjIsly2E=;
	24:O/4URTO5qoZqIXODO+hXc0dnFapeuQH8t27dlvuSd0TKYwl7R7Jf6oRqIv/w292Mn0Z+UhfImQoSkbqIRbKcB7hFgRKnNkHbtX3U9DRdEUI=;
	7:eWKHQDrWZZFVsbUtQqasPurYCM43211mAWdK7a6YWWtvNGTVRVDRsFMkbPAzNFeX8BZMsOXs0l1xIvlLJSLGxvm7wcmszdAtKmtGvMWfrwcXxoBYDT5j8Y2vPPRPAxWtELzjGga/eA0QV3c/hAlkiShsZg+mARKgfWvi4BOGwXiyGbeMypSU9skNd90D14sazDTb97zd1NKaEwBG7BCglYiDrlmZNGnMTgQjRO3nj3/RlGfZZjY32ErgAlx1DuCE
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:23.9073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0972cc90-7186-484a-9a47-08d547cf3690
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1337
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.81
Subject: [Qemu-trivial] [PATCH v6 27/29] hw/xen*: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:34 -0000

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

xen_pt_log() was left with an fprintf(stderr,

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
V3:
 - Don't change xen_pt_log()
V2:
 - Split hw patch into individual directories

 hw/xen/xen-common.c        | 11 ++++++-----
 hw/xenpv/xen_domainbuild.c | 24 ++++++++++++------------
 hw/xenpv/xen_machine_pv.c  |  9 +++++----
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
index 632a938dcc..42ada2ac05 100644
--- a/hw/xen/xen-common.c
+++ b/hw/xen/xen-common.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/xen/xen_backend.h"
 #include "qmp-commands.h"
 #include "chardev/char.h"
@@ -47,19 +48,19 @@ static int store_dev_info(int domid, Chardev *cs, const char *string)
     /* We now have everything we need to set the xenstore entry. */
     xs = xs_open(0);
     if (xs == NULL) {
-        fprintf(stderr, "Could not contact XenStore\n");
+        error_report("Could not contact XenStore");
         goto out;
     }
 
     path = xs_get_domain_path(xs, domid);
     if (path == NULL) {
-        fprintf(stderr, "xs_get_domain_path() error\n");
+        error_report("xs_get_domain_path() error");
         goto out;
     }
     newpath = realloc(path, (strlen(path) + strlen(string) +
                 strlen("/tty") + 1));
     if (newpath == NULL) {
-        fprintf(stderr, "realloc error\n");
+        error_report("realloc error");
         goto out;
     }
     path = newpath;
@@ -96,13 +97,13 @@ static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
     char path[50];
 
     if (xs == NULL) {
-        fprintf(stderr, "xenstore connection not initialized\n");
+        error_report("xenstore connection not initialized");
         exit(1);
     }
 
     snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
     if (!xs_write(xs, XBT_NULL, path, state, strlen(state))) {
-        fprintf(stderr, "error recording dm state\n");
+        error_report("error recording dm state");
         exit(1);
     }
 }
diff --git a/hw/xenpv/xen_domainbuild.c b/hw/xenpv/xen_domainbuild.c
index 027f76fad1..f5514ffec2 100644
--- a/hw/xenpv/xen_domainbuild.c
+++ b/hw/xenpv/xen_domainbuild.c
@@ -25,22 +25,22 @@ static int xenstore_domain_mkdir(char *path)
     int i;
 
     if (!xs_mkdir(xenstore, 0, path)) {
-        fprintf(stderr, "%s: xs_mkdir %s: failed\n", __func__, path);
-	return -1;
+        error_report("%s: xs_mkdir %s: failed", __func__, path);
+        return -1;
     }
     if (!xs_set_permissions(xenstore, 0, path, perms_ro, 2)) {
-        fprintf(stderr, "%s: xs_set_permissions failed\n", __func__);
-	return -1;
+        error_report("%s: xs_set_permissions failed", __func__);
+        return -1;
     }
 
     for (i = 0; writable[i]; i++) {
         snprintf(subpath, sizeof(subpath), "%s/%s", path, writable[i]);
         if (!xs_mkdir(xenstore, 0, subpath)) {
-            fprintf(stderr, "%s: xs_mkdir %s: failed\n", __func__, subpath);
+            error_report("%s: xs_mkdir %s: failed", __func__, subpath);
             return -1;
         }
         if (!xs_set_permissions(xenstore, 0, subpath, perms_rw, 2)) {
-            fprintf(stderr, "%s: xs_set_permissions failed\n", __func__);
+            error_report("%s: xs_set_permissions failed", __func__);
             return -1;
         }
     }
@@ -235,7 +235,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     memcpy(uuid, &qemu_uuid, sizeof(uuid));
     rc = xen_domain_create(xen_xc, ssidref, uuid, flags, &xen_domid);
     if (rc < 0) {
-        fprintf(stderr, "xen: xc_domain_create() failed\n");
+        error_report("xen: xc_domain_create() failed");
         goto err;
     }
     qemu_log("xen: created domain %d\n", xen_domid);
@@ -248,21 +248,21 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
 
     rc = xc_domain_max_vcpus(xen_xc, xen_domid, smp_cpus);
     if (rc < 0) {
-        fprintf(stderr, "xen: xc_domain_max_vcpus() failed\n");
+        error_report("xen: xc_domain_max_vcpus() failed");
         goto err;
     }
 
 #if 0
     rc = xc_domain_setcpuweight(xen_xc, xen_domid, 256);
     if (rc < 0) {
-        fprintf(stderr, "xen: xc_domain_setcpuweight() failed\n");
+        error_report("xen: xc_domain_setcpuweight() failed");
         goto err;
     }
 #endif
 
     rc = xc_domain_setmaxmem(xen_xc, xen_domid, ram_size >> 10);
     if (rc < 0) {
-        fprintf(stderr, "xen: xc_domain_setmaxmem() failed\n");
+        error_report("xen: xc_domain_setmaxmem() failed");
         goto err;
     }
 
@@ -275,7 +275,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
                         xenstore_port, &xenstore_mfn,
                         console_port, &console_mfn);
     if (rc < 0) {
-        fprintf(stderr, "xen: xc_linux_build() failed\n");
+        error_report("xen: xc_linux_build() failed");
         goto err;
     }
 
@@ -285,7 +285,7 @@ int xen_domain_build_pv(const char *kernel, const char *ramdisk,
     qemu_log("xen: unpausing domain %d\n", xen_domid);
     rc = xc_domain_unpause(xen_xc, xen_domid);
     if (rc < 0) {
-        fprintf(stderr, "xen: xc_domain_unpause() failed\n");
+        error_report("xen: xc_domain_unpause() failed");
         goto err;
     }
 
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 69a52a9f93..44d67b87c4 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/xen/xen_backend.h"
@@ -36,7 +37,7 @@ static void xen_init_pv(MachineState *machine)
 
     /* Initialize backend core & drivers */
     if (xen_be_init() != 0) {
-        fprintf(stderr, "%s: xen backend core setup failed\n", __func__);
+        error_report("%s: xen backend core setup failed", __func__);
         exit(1);
     }
 
@@ -51,18 +52,18 @@ static void xen_init_pv(MachineState *machine)
         const char *initrd_filename = machine->initrd_filename;
         if (xen_domain_build_pv(kernel_filename, initrd_filename,
                                 kernel_cmdline) < 0) {
-            fprintf(stderr, "xen pv domain creation failed\n");
+            error_report("xen pv domain creation failed");
             exit(1);
         }
         break;
     }
 #endif
     case XEN_EMULATE:
-        fprintf(stderr, "xen emulation not implemented (yet)\n");
+        error_report("xen emulation not implemented (yet)");
         exit(1);
         break;
     default:
-        fprintf(stderr, "unhandled xen_mode %d\n", xen_mode);
+        error_report("unhandled xen_mode %d", xen_mode);
         exit(1);
         break;
     }
-- 
2.14.1


