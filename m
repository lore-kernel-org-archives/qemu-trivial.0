Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBU-0008I1-2i
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBP-0008Cx-BI
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBM-0007VF-8z
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:31 -0500
Received: from mail-sn1nam01on0084.outbound.protection.outlook.com
	([104.47.32.84]:9696
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBL-0007UQ-Vg; Wed, 20 Dec 2017 12:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eCZ3qSlE4X94BDBnVz0nG6/8FayYGVlbt5bL8KscFWo=;
	b=RqmZ8mSMGKrOXlQCOqnS7kP9ISYOargtc9JGJWpQt77RxQDV/KtRT6/nVIiqJN7DzFjBhYhjIaxTZK2Q8k63HV6cemu3klHJBPl2qhB4ZEJ3oUQqGlhc9QOcN6bujC+crdPO/LTu2u1r0Z41tq4j4qD+1moixwekoNHTnLidZpw=
Received: from SN4PR0201CA0021.namprd02.prod.outlook.com (10.161.238.159) by
	DM5PR02MB3388.namprd02.prod.outlook.com (10.164.153.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:29:24 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by SN4PR0201CA0021.outlook.office365.com
	(2603:10b6:803:2b::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:24 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; weilnetz.de; dkim=none (message not signed)
	header.d=none;weilnetz.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50792
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0003tG-5j; Wed, 20 Dec 2017 09:29:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0003wk-33; Wed, 20 Dec 2017 09:29:23 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHTK6s020062; Wed, 20 Dec 2017 09:29:20 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBE-0003wE-34; Wed, 20 Dec 2017 09:29:20 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Stefan
	Weil <sw@weilnetz.de>
Date: Wed, 20 Dec 2017 09:25:04 -0800
Message-ID: <72c03424e08841aa025b4be8e3b20ee02fddb1a4.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39380400002)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(50226002)(81166006)(2906002)(8936002)(7696005)(36756003)(16586007)(316002)(4326008)(6666003)(48376002)(51416003)(110136005)(36386004)(76176011)(50466002)(106002)(47776003)(5660300001)(59450400001)(9786002)(54906003)(478600001)(39060400002)(81156014)(118296001)(77096006)(2950100002)(106466001)(63266004)(356003)(305945005)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3388; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT057;
	1:i1tdO/xtpA75MTtD/8mUtm2PKZBjLDbAk+Sq1VxCJCDqaRQYPfc8cUlqU9LqTdjtDk5LlGgxkdSqgxCSYPSxg+gNkx2XLSsFTTHP0VKjDtUVYLr8kIvUVpQ8Q3B4X9ro
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e86521f-44a5-49a4-27a9-08d547cf3695
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:DM5PR02MB3388; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	3:O0ai2WxOgytUNhrEuuPpV9y5jD6Tno38UFPrfhyrmWtU9iwNYc4kEqoOQlbm7W87jobwzJDMMHRNF8XWoOMS1vM+O7nwbHS6EmcAjLV8SUUINZZivojCbgzt2+hmPmnb8EmIJUqRK/nHF9EcMSUh8nPUohWb4xNrKNbc9vD7eBZ4OM2aecOxn6ViTUlHzqFsQpXOQnqA7duZjmfoHZj4+fMxZTkWuCLZo6W1C1eAqCdz/Ooy1KB1tcW/rg4WrY1+foYZB4F2oiipq49wOwBiKautvErbxDH5YzJzgB84bUEYGFfFEc+3MFQdg7ywTpvluCYHD63goso74e9XhVQuzaiTHXYMAGBLwP3x+SfQ7a8=;
	25:Jc4vlo2RVpIVoI/2GboBYq5g1J40PZ/aMQZTVuEV2KoLC4uA8NfvvMXBmP68TKL2GJhE/6hhjfDqA3iRZx0qOTYrNP1wXeSN52OvcPxOxko/oa4M5bAh3KXS9DD9GGy08dKL8F3lcGy27zAAeAgkGiA39MhxiV9AEDy5k30Is/la6C7FQBGNjRbkxizqKxNjZFIlW6YOgW6/8gXgXpCRA05UOMPUjblckZttNOA9B3jWCoIwDRkZk6WRN8Zx9L+1ivfeIzOK/VECdLAAJu+UQj2puqD60mLPI7ZSIs907f/9c9rExGX5QUqfYP+ZywYsR5sV7gRvv5CuBwHyBzJkeg==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3388:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	31:O3lHj15lsjcwEwPb1Xmsf5nKQKHImLpAR7sQrYMlmCCBV17OA/DA6fWvoRPhqyLyxleapMLAYrsXbgPltng4nK1b++EEWy7msocsY/9hk5aLGfSdT4AwaKRnw/Yn0CLq6p67HvF6mxA+ZPuVTayK6T8H0R4RZ1RF+4YVAHqOJ96MEae6R8jEVm/wr/QOO7gUVlPP3fkfcUt7aIgmvtrfdv6mxYdDWehQBiEMlx6R6L8=;
	20:8iaDUplwWpkMTOGgk/33gSEnR459kp71hTLAAd0B2Wsdi0uef4GyGTMH2zA70ncEMVB9lmP4lLUHnMsOQIZoDi+diu0MA49A4OLSzLV5aMAAJLU2ujQtwDi0gjM8yBRhA/Ca/lihRE6gZTBHROsvr9uD/GrGOomi6VjhUdnknFdLS4ciCFaFYCtzp1LIZEC3U1LbRZgkWqicFPPYDEqr0fopKkH/4aN3QT8K3aFUoBxJnriHeXsCi+clQRLdjEyTgBGZl+lZVnEQ6TFZ2f4h9GOnBB/jNYy7AIzmNVdBLOK7+I5pLohVTcfIIG2OWE7DHtj82Y+ZGAlJ7PhWzqIYGZn/GVtjYkVEw2flIEBAKj0zjbSP2EtZk1v/y0qrTFA6rnA6fngQ+eyfAG8w10xDcRSyMnT+U2sde2rH0uNi4QJXg2GhAec2cYW2W/3DvR9ti/r1gJ28veRN04q/M8n1TBq2wPSaoF8O8WWErwFOyrG+4oPAXEg4PeUV7ZqYlLE9
X-Microsoft-Antispam-PRVS: <DM5PR02MB33884818841A04564C5AFF38DC0C0@DM5PR02MB3388.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3231023)(3002001)(93006095)(93004095)(10201501046)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM5PR02MB3388; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR02MB3388; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	4:Okz893U9A0yPixFJlF4V6FpjtPjS5cEO7a8xwepjj4SvFLhwBfClqmlG/zbOgomU8WC43TKJW79aJVgwQ2MGNsGz57+AZdJclP+FMMChJ5kTRCbysoeBzR3UCyTkPTjG4rwBP4kUmKdUK6tRE0X0jnfiAYi3U0/g9c94WW5G+y9VLOQDAGP/e1K8VLK4BpJyzPDdYqgLfiv4YWCpunTbijK/Vx2Wya0WQgahN/1K7+ou0EgSAlwpEC6YrWCP8yb/o2Zz9IcFJOcBYt3fII3mr4NMGrBz0pBz3wtmSWyB2B2W7nfLIYn0vlXx/yHF1kfPZvYM1ZI3F1WmwWT0hWzpdA==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3388;
	23:Ot4+aJkc+eMc5kSW5BPYxqvBP1Liew5Znmq9Y5jzX?=
	=?us-ascii?Q?fX9sl0LW77VGtPCrJPkYtUumc37PQFDJMJFPpvuAj5SBTRBPcQ1nT4LsdZx9?=
	=?us-ascii?Q?9iUP5e//IdUe/Ru/MfpuZ1kazaB/mQUnmfa4FP8BpNNb8rdND34WZ9e5xu43?=
	=?us-ascii?Q?mV2ZoDYcSE3u7RHyTj477o4De6UHdMrTzH8Lny62F7qyIJfosJnyI2167+bL?=
	=?us-ascii?Q?idNkxbmBHa5bnJj8WoZSs1S8+9qxkggBB//qmKMV2K6m5JTYsbsyJkiGSPNe?=
	=?us-ascii?Q?TTioDTEtz7f9YOJQ0PQ7CFs0ClAsVQYtXEPjJSekmc9vYb70B2DEN4mx1IPO?=
	=?us-ascii?Q?vq54m9PDJdc5Mwtqgza7YAR7Idak5oIKH5L6AKPrNd9Li+hVwbKCbiT2VGBt?=
	=?us-ascii?Q?qXr0Fn6S/kBsYdPlwGm93ni0b4vQkCEdQ4/SuGN6IWFo4kBUAeecsQg3gn1M?=
	=?us-ascii?Q?JRF8IaEK3yffLwT9aLzIo6RLULPe5vFN1eRvCluYt+gtPA6W6BN0Lr6HyQ7t?=
	=?us-ascii?Q?m+yMAPPU79vJp+0PJuUZAMjNLsJCcq+bcQIW1XqmnMIRxQXgYLqfMyhBKI1m?=
	=?us-ascii?Q?vHded7BNehacSjbtA2TZZZbULUlsp/Z4ar+qEoZW8ew6SGsBRvVcwR4Zo1wV?=
	=?us-ascii?Q?6UbRbPAhD9Qb8/KlN7P/RvVF9MfxWy3OwPy6vomYibcr8Z2quxuYHRsBYAWg?=
	=?us-ascii?Q?5J19ze8lLwkeaKF2YDWBTX5aJfihN16AVTr5h07f96nHfys3VmO+qfZEg6mj?=
	=?us-ascii?Q?md+Q4LWYX8enhvf2624Pp2KBqxwjrk314UrqipqdW0NjAkvc0JupUieGkOH6?=
	=?us-ascii?Q?s30335zgri/z3PiU2+atSF9hCVwW4fP2J0ONtRfRrgNJ8NbKv4V3wdr8hW4m?=
	=?us-ascii?Q?PYVxmhL/0KGCV0t1HQICy4cL3TQRKeodqW002ieN9cSY6zvNEt/bzcC7rNYC?=
	=?us-ascii?Q?q1r40OQU5kz4PEU9AL+4q0dxWC5Io5aNDp3l1VIM5UKkOmn579V5i53fDkDb?=
	=?us-ascii?Q?Sp1J+pfHEvNsaR5GjnunX1xFzzTkEJ5y2yH8+vJakZjSCDwCguG1jqYUbxdP?=
	=?us-ascii?Q?buv3/o=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3388;
	6:hjv/+5Y1gTSV/FpQcQZd06m3FZc/3sPqki1ZrYF7S1LQRrQfRg+BRIkepTvxUaUw6z3iPeIKgBBI0nsgWjH6RjjNuwZ2rlNzerlTK3XPiW65SaQWYnhhT1RMKHJx98zcPg/EQSda4GoSY91EAJoyealam+u11+vbTIFIjnwm7Z7ISZR8lIP0P2t90rIAwrYdojoR/UnjHg4gtNCVlVM8Ka1K2C+wm4M6lYuYJb+IZPP/EnYMnTBTjeuGu98fxiutlmLGdlmW1m36LcXCeDKnXXSXPxv7bFOVMKtOdLr8HuEl5bPp26u2sZrGpN69kGkuB9eifGRAWn7oIHnSU3ynSw8tCvrn/33ZAO0T5ok2DPk=;
	5:9vf6oJ1sUs8B4WiCwUVtWKVysh9tk6a2ukDR2FiSzX8YHnmOpLB/ybSmsPFZfR4pZeHkHqP5xk2V5Ubb8ieX/YdiPbJ/cofxji35Juah2j/IfilJQQacP+BiO/0ipXYy472XxW3dPdjEEff9F+9Qa/oV6ytzj898v+jA69aW0MY=;
	24:85n6BqRZuxuoTf8Ludky4EnMew8ambxtXVEHuIDqhg1RCe8uUe/qCHkWHqUDv7B5HD2IHcQTQEAtmeShGGNZYi3U+6lZlrwIWDda9OIr1nQ=;
	7:LOwXqlBSccgEEBbuEOG492JF/cudgvuzIkJDFPbxZwg/t55TkmXaOwp0fJoOnsyq9wtWo8NdCTMGA21P9nVhnz/e/4KUKIZvEXemqJKvT94L7V5nTrR2EYkQrje+sag1F6KvPtVRPRZXi3RmNSBmz8iSRmqRm2/QYqVJSuNKQ/PoeXp5R8+AlZkM+GsZ7+RUBPJlRa9eo8W/9lK3oQClRixXmlj0qvOKi18rhYa4k3SCcUYX5b6Cq53p7bAzapXV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:23.9371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e86521f-44a5-49a4-27a9-08d547cf3695
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3388
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.84
Subject: [Qemu-trivial] [PATCH v6 28/29] tcg: Replace fprintf(stderr,
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

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Stefan Weil <sw@weilnetz.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---

 cpus.c                   | 10 +++++-----
 exec.c                   | 20 ++++++++++----------
 tcg/optimize.c           |  8 ++++----
 tcg/tcg.c                |  2 +-
 tcg/tcg.h                |  3 ++-
 tcg/tci.c                |  3 +--
 tcg/tci/tcg-target.inc.c |  7 +++----
 vl.c                     |  2 +-
 8 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/cpus.c b/cpus.c
index 114c29b6a0..6f8ab24421 100644
--- a/cpus.c
+++ b/cpus.c
@@ -258,7 +258,7 @@ int64_t cpu_get_icount_raw(void)
 
     if (cpu && cpu->running) {
         if (!cpu->can_do_io) {
-            fprintf(stderr, "Bad icount read\n");
+            error_report("Bad icount read");
             exit(1);
         }
         /* Take into account what has run */
@@ -1113,7 +1113,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
 
     r = kvm_init_vcpu(cpu);
     if (r < 0) {
-        fprintf(stderr, "kvm_init_vcpu failed: %s\n", strerror(-r));
+        error_report("kvm_init_vcpu failed: %s", strerror(-r));
         exit(1);
     }
 
@@ -1143,7 +1143,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
 static void *qemu_dummy_cpu_thread_fn(void *arg)
 {
 #ifdef _WIN32
-    fprintf(stderr, "qtest is not supported under Windows\n");
+    error_report("qtest is not supported under Windows");
     exit(1);
 #else
     CPUState *cpu = arg;
@@ -1527,8 +1527,8 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
 #else /* _WIN32 */
     if (!qemu_cpu_is_self(cpu)) {
         if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
-            fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
-                    __func__, GetLastError());
+            error_report("%s: QueueUserAPC failed with error %lu", __func__,
+                         GetLastError());
             exit(1);
         }
     }
diff --git a/exec.c b/exec.c
index 3e7c57e914..365bea7ada 100644
--- a/exec.c
+++ b/exec.c
@@ -1068,7 +1068,7 @@ static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
         }
     }
 
-    fprintf(stderr, "Bad ram offset %" PRIx64 "\n", (uint64_t)addr);
+    error_report("Bad ram offset %" PRIx64 "", (uint64_t)addr);
     abort();
 
 found:
@@ -1681,8 +1681,8 @@ static ram_addr_t find_ram_offset(ram_addr_t size)
     }
 
     if (offset == RAM_ADDR_MAX) {
-        fprintf(stderr, "Failed to find gap of requested size: %" PRIu64 "\n",
-                (uint64_t)size);
+        error_report("Failed to find gap of requested size: %" PRIu64 "",
+                     (uint64_t)size);
         abort();
     }
 
@@ -1711,8 +1711,8 @@ static void qemu_ram_setup_dump(void *addr, ram_addr_t size)
         ret = qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
         if (ret) {
             perror("qemu_madvise");
-            fprintf(stderr, "madvise doesn't support MADV_DONTDUMP, "
-                            "but dump_guest_core=off specified\n");
+            error_report("madvise doesn't support MADV_DONTDUMP, "
+                         "but dump_guest_core=off specified");
         }
     }
 }
@@ -1748,8 +1748,8 @@ void qemu_ram_set_idstr(RAMBlock *new_block, const char *name, DeviceState *dev)
     RAMBLOCK_FOREACH(block) {
         if (block != new_block &&
             !strcmp(block->idstr, new_block->idstr)) {
-            fprintf(stderr, "RAMBlock \"%s\" already registered, abort!\n",
-                    new_block->idstr);
+            error_report("RAMBlock \"%s\" already registered, abort!",
+                         new_block->idstr);
             abort();
         }
     }
@@ -2176,9 +2176,9 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                                 flags, -1, 0);
                 }
                 if (area != vaddr) {
-                    fprintf(stderr, "Could not remap addr: "
-                            RAM_ADDR_FMT "@" RAM_ADDR_FMT "\n",
-                            length, addr);
+                    error_report("Could not remap addr: "
+                                 RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
+                                 length, addr);
                     exit(1);
                 }
                 memory_try_enable_merging(vaddr, length);
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 438321c6cc..3ea12cc094 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -122,8 +122,8 @@ static TCGOpcode op_to_mov(TCGOpcode op)
     case 64:
         return INDEX_op_mov_i64;
     default:
-        fprintf(stderr, "op_to_mov: unexpected return value of "
-                "function op_bits.\n");
+        error_report("op_to_mov: unexpected return value of "
+                     "function op_bits.");
         tcg_abort();
     }
 }
@@ -136,8 +136,8 @@ static TCGOpcode op_to_movi(TCGOpcode op)
     case 64:
         return INDEX_op_movi_i64;
     default:
-        fprintf(stderr, "op_to_movi: unexpected return value of "
-                "function op_bits.\n");
+        error_report("op_to_movi: unexpected return value of "
+                     "function op_bits.");
         tcg_abort();
     }
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c22f1c4441..ca5d841c23 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1035,7 +1035,7 @@ static void tcg_temp_free_internal(TCGTemp *ts)
 #if defined(CONFIG_DEBUG_TCG)
     s->temps_in_use--;
     if (s->temps_in_use < 0) {
-        fprintf(stderr, "More temporaries freed than allocated!\n");
+        error_report("More temporaries freed than allocated!");
     }
 #endif
 
diff --git a/tcg/tcg.h b/tcg/tcg.h
index cb7b329876..eadad66f7d 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -29,6 +29,7 @@
 #include "cpu.h"
 #include "exec/tb-context.h"
 #include "qemu/bitops.h"
+#include "qemu/error-report.h"
 #include "tcg-mo.h"
 #include "tcg-target.h"
 
@@ -948,7 +949,7 @@ typedef struct TCGTargetOpDef {
 
 #define tcg_abort() \
 do {\
-    fprintf(stderr, "%s:%d: tcg fatal error\n", __FILE__, __LINE__);\
+    error_report("%s:%d: tcg fatal error", __FILE__, __LINE__);\
     abort();\
 } while (0)
 
diff --git a/tcg/tci.c b/tcg/tci.c
index 63f2cd54ab..f7fd5cafab 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -35,8 +35,7 @@
 /* Marker for missing code. */
 #define TODO() \
     do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
-                __FILE__, __LINE__, __func__); \
+        error_report("TODO %s:%u: %s()", __FILE__, __LINE__, __func__); \
         tcg_abort(); \
     } while (0)
 
diff --git a/tcg/tci/tcg-target.inc.c b/tcg/tci/tcg-target.inc.c
index 913c3802a3..20346508b8 100644
--- a/tcg/tci/tcg-target.inc.c
+++ b/tcg/tci/tcg-target.inc.c
@@ -29,8 +29,7 @@
 /* Marker for missing code. */
 #define TODO() \
     do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
-                __FILE__, __LINE__, __func__); \
+        error_report("TODO %s:%u: %s()", __FILE__, __LINE__, __func__); \
         tcg_abort(); \
     } while (0)
 
@@ -403,8 +402,8 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 void tci_disas(uint8_t opc)
 {
     const TCGOpDef *def = &tcg_op_defs[opc];
-    fprintf(stderr, "TCG %s %u, %u, %u\n",
-            def->name, def->nb_oargs, def->nb_iargs, def->nb_cargs);
+    error_report("TCG %s %u, %u, %u",
+                 def->name, def->nb_oargs, def->nb_iargs, def->nb_cargs);
 }
 #endif
 
diff --git a/vl.c b/vl.c
index e9012bb009..c8171825ec 100644
--- a/vl.c
+++ b/vl.c
@@ -2187,7 +2187,7 @@ static DisplayType select_display(const char *p)
         display_opengl = 1;
         display = DT_EGL;
 #else
-        fprintf(stderr, "egl support is disabled\n");
+        error_report("egl support is disabled");
         exit(1);
 #endif
     } else if (strstart(p, "curses", &opts)) {
-- 
2.14.1


