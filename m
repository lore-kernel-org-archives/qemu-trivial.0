Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOA-0002gd-Qp
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENO6-0002dZ-NO
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENO3-00078A-LM
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:30 -0500
Received: from mail-by2nam03on0075.outbound.protection.outlook.com
	([104.47.42.75]:65048
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENO3-00077B-BZ; Mon, 13 Nov 2017 17:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NiF/S2xGh6wKn3a0JKKboX32Wjj+Xb7a+4Tr6TJnzUE=;
	b=P3J+SiTBNZvnKinHJCVK7eWBX6Gmag2uS+JC1qCCbOsmBnPOeVf6bXFFvqg9x+5z/K64b6XBcmI3rGTIbF5z6U262fL7lqqC7zHqSWZ+RMPBTZJgLrKe7YAOsm+l6EoPPSvi4aLt1+fUJ/o/aq3+AFbrtSovVLw2Do8ieece2ds=
Received: from SN4PR0201CA0012.namprd02.prod.outlook.com
	(2603:10b6:803:2b::22) by DM2PR02MB1340.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.197.13;
	Mon, 13 Nov 2017 22:39:22 +0000
Received: from CY1NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by SN4PR0201CA0012.outlook.office365.com
	(2603:10b6:803:2b::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; walle.cc; dkim=none (message not signed)
	header.d=none;walle.cc; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT054.mail.protection.outlook.com (10.152.74.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45599
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNx-0004Vl-69; Mon, 13 Nov 2017 14:39:21 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNx-0000SP-3G; Mon, 13 Nov 2017 14:39:21 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdGWp012597; Mon, 13 Nov 2017 14:39:16 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNs-0000S5-BO; Mon, 13 Nov 2017 14:39:16 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Michael Walle <michael@walle.cc>
Date: Mon, 13 Nov 2017 14:35:16 -0800
Message-ID: <b2db7d8be31c3c4b5fc3d77ffae5eedcd4c70dde.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(23676003)(110136005)(81166006)(77096006)(76176999)(5820100001)(36756003)(50986999)(81156014)(316002)(356003)(106002)(305945005)(4326008)(9786002)(50466002)(8676002)(54906003)(189998001)(2906002)(63266004)(39060400002)(106466001)(2950100002)(478600001)(50226002)(47776003)(118296001)(2870700001)(5660300001)(36386004)(33646002)(8936002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1340; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT054;
	1:VYUqGWyoF+ZzZ7l1O8uQl4RVg7d0xKS/RoYcdsH47YzIgXf9cVeUqI5SAWyeZMndtUzMBr60A8vPfDMsF2Z8cz1q8LzSbhgo/csSMtwSnfrSloGtRqCCDZjkg3KQY0TI
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f30aff-eb8b-4ed8-0500-08d52ae7628f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM2PR02MB1340; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	3:mqEnJtLTfqiKuzuPoFxVdwG8IY0/BqWvbGAIDmP2e9aU8R+tC58RNwp2WDQmFeuBDiMNoErED/9WV4FepUXCZF/I5GNWIzbyqGQpbyAJVBzm2qFjrYUZp4O03sC60fXidTpTRd7mzSJkjEwwiHItelGx4bfLyvhHXmwGCqjrjCwwojYIvozwTYvpCVMqfFSHywa2IC7mOdpZtAon98pidU9+bQhqqRCS69DnoTmlpAVgm0VRBYIXRJVia53PmZ3J5KO4IEy7EGjgEiiEbyi4fib50mfoofpEokvkHm4mV8IZ2vYxDRgWDAOU09Ak1wiG2JV88ZAInMbPAvzHhm7NxzOmbZI1waCmCS9rrhIh9NI=;
	25:4l3LwDifl0CDNaZH4VVPwzuFDXJSRqwiMIz9nJTtkpDClYWOqqbuSnj2HIRw1k/fHM8l3qLmr2LoEHh/184g3P/k2GvZbNq4sL8RoKlNf9CqRYyUAXWwkdbpaYLoR9PaadnvCO1JgJLFBs+OS88+91yPkgLAoR1qmtUWSEMKoa9aCIVnyf61btIJaLko5hFelHU7Yp2J3JIw2Zz0obLNnBi4ckXn1c77017mlpif+w6ILLcaPahF9kO7Ib/iUiqCeo3AH8vL++7cEzExP5Dku85bdeHCRWFHyJQAjdyHTmIK5r314kDaT2BsSk75IW9l7VEBzMN6IJVV04DvqipDR1UZD1k7Hm9YCLroQ3why+Y=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1340:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	31:MaFci/FDWfpsv5nSQKRjzR7dJ7p6y4lnpKvdU0AF+RmpHJaCTGch6G0f7VZgsU9g9NGO8dn2ZGEZsEDTcoFJ1HL4m+fD0AqWgoVuzeWYQ4BEqX7z0OReBWLdOq6SBDQwoT777ht17pgodkG/7X/bfPOP2BwznxCqHhJBKVwRDn2Kd+ULbTbxA5Ou/au07ZyVPz8T8jqFgYsZqTj3qeuVcT/fEKU/rB52JxAQPwU/M4c=;
	20:n+ezo0X+9BIeRGm4vTZJ7Rgryt0I7b6uw7h/m1j8CXOgF38c8Gdf72eBiW2BqDl0hyF6mDlsXsHzYLRzbSmoNVha1DFUwsvRzgez+M5jlZb2GBhklgFcIB3bOKOaqVb6y24kSvkJTVJrVdyDeIqQspXwmvz65YTtApfaw/pGcZmhWN79b8ENznS6SUjPHGu4GGRxqWddXueo2ZgcBEh1S0MAuXDqeU2gJOcqXpFNETfwlV9Qc2z7ovBNzygQqkILvw5Fzb0XACG5bno4HKhEttaX9+GV5NCw4MUpVp7BbkUphD9VwUzeyNhwxMYY6aZ3C6gjLjWVNhBcbUJuDLGAxg3zvireIJzN2SB061MjoCCLjUkgoAPz1rKx40rY4hJYdIstjXKqZFs05JOda025/zUmMaN5x5n4gWyKq8Hrowz6KZpUDAi6vkjB/wCgMTMtSgeSKImMWaOyuic+/iUN4jEWMakBq3ERpCYVjvX3gMhOAtlAAIVQ39xpxh6/4v2f
X-Microsoft-Antispam-PRVS: <DM2PR02MB1340FD8C52EEF3923F0E6C95DC2B0@DM2PR02MB1340.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(3002001)(93006095)(93004095)(10201501046)(3231022)(6055026)(6041248)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR02MB1340; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR02MB1340; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	4:YKwcngudPYeeDLwpNFuycXvlNadfT6uYcPOwmSifHr5n14M6LKcI/JBjS4ffIwOY1B1/mN7wY9P/pwwjL1MdtQJh2VtIQuo6e9sjCezOQiweXSFdoZffO7EPGUB+jki0GWuGgsUlB/sOJ4qpTssgPaPulkRTvyq6zzrZ0isA7QylEt53NKcFZ3XzH8Uc7+SoAJ2rqpUgR8Qj2fX53I2G/LWDKIjSQkME7NfYuznh6dwLLnYr5N/SAxYCmMSydiTfIN+pt1nFIXwOEDQdsyfLrb3xgRxYZW6lRt+qm9prruq8FfQQob99qxc8kwqHaQY4vQt5Qas36EjFEVY+swRggw==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1340;
	23:nWWlkLzsUNTPZDWl3+lhubgnlmIrGTko7xPXUth77?=
	=?us-ascii?Q?dirMzeTvxoliXx2ei3pW0SZhjQlv5jZriXeYfmWv2AFAznRFo0nL4GlYVq0Q?=
	=?us-ascii?Q?HcIVtikk/Jgowiv6muApF+AYOlmqthdsiboINlFiHbGOHrrktdCMESyZtbsI?=
	=?us-ascii?Q?RSmpDtL8X0yCSuovqY4Tsuox1Qs4WSkj7PxJJx98Q1Y5Tlb5EikYfluVhcRT?=
	=?us-ascii?Q?UMvNH7i6o9XRrCUZxVI+QQuKBHvd7rC6zPAQMk6yvWYC2dkvHByEFV3yPKIb?=
	=?us-ascii?Q?DZD4pi4VRpDP3wM0RF0BCJGzRVixVKC8sCtyHtnZuP5k9EwgzyOCKmr12oVX?=
	=?us-ascii?Q?JddjZ8qQNxBOF9mS/w13dkpazdOkq4Ah29E/JNuvvrhwJdxLNvxwbmommeVx?=
	=?us-ascii?Q?3J8isumA7XeEN6JqvmP5FyEUc8VL7Ik3HVCsNlKIZMp88z4T8r0/IqA20YC7?=
	=?us-ascii?Q?zSzdbuk+cvpUVxAccwDXAeAKvAEWwbx5Hgww5a/iCHC3Z1iIISdpwKFd02mG?=
	=?us-ascii?Q?1CLBazRLgNGV3yIWhhwL60IEWyt93Ah82uwoRvutEvNeb2ZQykRr9Vkppcau?=
	=?us-ascii?Q?yuuZRIhNjd18Vp6rEc67xXiiFqCuRXS0doUHc42vzWVxnE8kwY8PDefe8xAm?=
	=?us-ascii?Q?K/qxg2bS+r0hZGvq1tkTKxOutHZbT6S4b2Zw9cxgHn+o0LU5oP6FmCHPLv5O?=
	=?us-ascii?Q?WCRJGzX6ae3Qp9M7wiGXxeW+fuvOwP9n1JyszRZ5AKgUDhgL34lrh3yiuTkn?=
	=?us-ascii?Q?Dh9GuSjcpk26hWCBPukwCWQ5xeS4VFolfyA7WpiTUBFv+jfoclIrWbf2ywsJ?=
	=?us-ascii?Q?Yyoq/E84jhMjjsHJqpPBzuRtdS4EUXTFGZcVImH4jW8HjihIRsPOOlog/Unw?=
	=?us-ascii?Q?JMjCocK7nWqAXd11kx7wwiw6+KYsyGn2OaoPd3mGwTvM2NCfEjDj9GlEyruf?=
	=?us-ascii?Q?D0TyVWc7RCtF4tGqMUZYDzfE8ZAwPfuq9hJvG7AYuHgRxBozYfOZpRlCgpWv?=
	=?us-ascii?Q?Qcp9cP+dU/kQLfhHiu4y4sOxrFD7A21hfrHLmXNmwLf6dBZkw8NiWAkfDDwT?=
	=?us-ascii?Q?resIk0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	6:fwrK0qo+i0SHo9ydgAu73uuaPOfXyScAdlFRnyb5HZj1VOvvgaz605+dq3YwBm+sLYt4QWaVqz7kemJ9+hvQEx4vO/96oU8XYPId4iQ1RaWrSY7/agneiAEyU4Rrp+NYDcWcsXH3FT0gl9nLyz5msuD0G0+2Cn0q2qBX0xDN9zrcGWeLYvRWTHNbvQJIK/hdLq7x07LRprLOzbk7fMv3tL545sNF699oIWsLbaysnIpKC7OJmQFHFyWiRTvn8C+etfLH84SAZiYexhyZ0eAPPWEbr85wSh+lqOkRRQ2tnpHlwNFb3yTBcKFmhzsvFZ9JsZCy2s4QdSS9R/GZoq4bFOvbVa8LoFOl4v1BlZ1swis=;
	5:5gCl2IQRL7NWgg1wQaEywMY5a5dg0A892spSePNoVBCyUI1hWTCFlk7IG9aW7fYhchASpyB8x4X5zSeCC/i88f4ycXr3ovt3GDUQpWmU1lyDqxZXfBXJOCcflqOG9mb4/SfKXgSVFxqvky4LP/M1vUUcb2/hYbzcvB+Xd7ZB5Xc=;
	24:aumLKHKGQ2K3jmNcyEianYRfNlllmQiKJKyBOX5cRGc8BqDYn+oFJEUxtwM5jJkoViqd0GZFmUt5zcx0LIuxOVwO40/lNYEyU1agVKp7B10=;
	7:OoHv53mErsigvF8US/9emhgD40V8VPZvj4dQzLZCDVf7GwQOlNyCots2MJRxE75D0rbjtNEa3GGWTifP0I/N+rqHIV3NsAtpxg72moe+cir5g0Hxr4GXZL2T88zEnRdySUiwoRBabPHSgQ584sqdGJiXL2Vqo220cbxTExvm0yqpRYQPGcgHb+E63PYG2JJZynzZr/zVstMng3V5ETYVIyoAl/D3co0AGZCrBnXUnYyakUsnSfsOcVbFpNldNhlm
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:21.7613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f30aff-eb8b-4ed8-0500-08d52ae7628f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1340
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.75
Subject: [Qemu-trivial] [PATCH v5 13/29] hw/lm32: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:33 -0000

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
Cc: Michael Walle <michael@walle.cc>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/lm32/lm32_boards.c | 7 +++----
 hw/lm32/milkymist.c   | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 002d638edd..527bcc229c 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -148,8 +149,7 @@ static void lm32_evr_init(MachineState *machine)
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
@@ -242,8 +242,7 @@ static void lm32_uclinux_init(MachineState *machine)
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index d4e765f2eb..85d64fe58d 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -145,8 +146,7 @@ milkymist_init(MachineState *machine)
=20
     /* if no kernel is given no valid bios rom is a fatal error */
     if (!kernel_filename && !dinfo && !bios_filename && !qtest_enabled()) =
{
-        fprintf(stderr, "qemu: could not load Milkymist One bios '%s'\n",
-                bios_name);
+        error_report("could not load Milkymist One bios '%s'", bios_name);
         exit(1);
     }
     g_free(bios_filename);
@@ -184,8 +184,7 @@ milkymist_init(MachineState *machine)
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
--=20
2.14.1


