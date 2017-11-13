Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENP2-0003ux-6V
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOy-0003lF-ON
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOv-0007fp-CP
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:24 -0500
Received: from mail-by2nam03on0050.outbound.protection.outlook.com
	([104.47.42.50]:23147
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOu-0007eY-IQ; Mon, 13 Nov 2017 17:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Yddjkp1sNuRQmKA9/80oGuS4nDQtluQSBfLJkWFNgmk=;
	b=eE7FYFNZzDpn+nuVVmM3nlW8CtcT9fRpnrIokZ9G6onqDpgB1OYHY7T4rtbKTXN0hA5TsDExnps5qykM6brV7GwMYHqBMcDwxYNqfgZfAMbMsZzOYdGtGBy7QWKd0B2gFp2U+SnWANMnQeVPTVPMdcVm38QP3RptDglAE38d0Wc=
Received: from SN4PR0201CA0071.namprd02.prod.outlook.com
	(2603:10b6:803:20::33) by DM2PR02MB1340.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.197.13;
	Mon, 13 Nov 2017 22:40:17 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by SN4PR0201CA0071.outlook.office365.com
	(2603:10b6:803:20::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; citrix.com; dkim=none (message not signed)
	header.d=none;citrix.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0004AM-FQ; Mon, 13 Nov 2017 14:40:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0000sx-CA; Mon, 13 Nov 2017 14:40:15 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMe7Ld013133; Mon, 13 Nov 2017 14:40:07 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOh-0000mw-6c; Mon, 13 Nov 2017 14:40:07 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
	Perard <anthony.perard@citrix.com>
Date: Mon, 13 Nov 2017 14:36:07 -0800
Message-ID: <df19adc81d183a5030fc07c2cfc0cab65616562b.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(110136005)(81166006)(77096006)(76176999)(36756003)(50986999)(81156014)(5003940100001)(316002)(16586007)(356003)(106002)(305945005)(4326008)(9786002)(50466002)(8676002)(54906003)(8666007)(48376002)(189998001)(2906002)(63266004)(39060400002)(106466001)(2950100002)(478600001)(50226002)(47776003)(118296001)(5660300001)(36386004)(33646002)(8936002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1340; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT034;
	1:V5dyZjdLH+4qg5Avb99s5ZL2jq5mQjSTYBxUGMnVr/1Qa+goQ7pgeLjEZXbFZdVccNWMAy2eTyMY5MR0kL26EL9C/ep6DmTyIlgG3GcC3gmehj8OhRsG8+CuadcaDlqy
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7788a9d2-1e7f-465a-2a88-08d52ae78317
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM2PR02MB1340; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	3:GXWduaulSl4NKsjM4/czEGf5rbDBlinfNVL4HZvqGka8vOW5E1WEG7kPffVQgkQR6ul/NaipeiyrmJvsLohpm4ZKAn+egmVmz0l2eS5Eb7IKF6VaofVqEme+Hb2O2hf8+6o8eRg4m3IMldnbAy486Brrnwp6O0A1iYXowXXDwrx0Vn8tIiFkgJt1lcELfZwghAc8vOV4k6LHop7opA59aX0i2/368dUDCL5gNe9dN8yL1Z+PZrx0Bt80MxluN2CYMWaVrS4lMZCbAckJMjZN/5GznhihNB6msLh6sQ66Is6EtHJbVslVzRafJjSpnJuoQyip/uBMTzFVQKg5PyXbCDcdAyThhMle4vrXaTGytk4=;
	25:F0PvFLGaumuEM7Fvyi3LO2uSCB6p0+OndRxZkZ3sKa/kActXzUYdKpSx+oQ1yolw3faPwC3RrLVwONpYAQdoDzQiJ7gkzjXwC+uwlm0iCwHX9N5RxQT6fA9oVxh63CBCeRvjQUBYo81lJQEpAui7+YRvsfbR+srdF5REinPPYCNV/Bu5OKLmKjWvoMPKPoBMhnyLGjEgFZQIpgOs8RB/MMSjfQMVqalPt+yWjat45zcCAj6pnrhVRE+cMcfX8AibcK/vVqRSytNUEWUGWx11HV/61YNLGiYqco4rEB30p7vbnduZYklPoPYdqoGmCsPKU1tO8JmtQR5tQ9jdTPkrg2o7Hf+AbRHn8fhTwrmnVJM=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1340:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	31:HDMQbRKas00+QkxH3Tv2cGF4bwb++SwMNoSVmt/y52NXWtKJtfepR1BoeEiQX6O93pbxf31zPmaXGhQCpEt1p/xLqDSpxA7W02y/hJ3ciHoQUy3ZN5s5H93t/kF1ST7T7wouzE7WFpx+U8xIFRIn3mAAxeaTAeJ9jy6+oUN4b4vjFqSfi8qMf5Nuc1lX9kP+3ZHVdTFgR1lvp5lUFnb+FaMHKMBJkuzggwekevKfuPw=;
	20:Z6fcX/Ii37gkSEi6jblPGMl6m85y3+k7Cx9S3L5x1VLqSnMwn0w6FDHrl5XcaD/aW8j4QdAQSXlGVhnKEIs57UU/x+3s6oDL5ZR3Mu9ASPRuprPNpBdj+FRCqvhzYfVO2JdJdWBiduvJrpB5sC0qx3JWxVZwBgvYH96Hmcl5jFmKzfLhJqmREb5aLOU/klpFRxgUc/zed5+FbZn4fEBZgmMDW9R5nn/NQgtOUfp7rhdHCaZ1g5om6yA35g3y5O6GE+i+0inynwLU7ZCB7RQWTDfN2My3RwWkgEme/Rgp/0CUs0HItLWkYUU2ipQn/tI6vVyIDmN3Jsn5C20kLZRMPrRQjHCzjOSrTcwaQj+HgtRtJP0SpQZ0O1YQcbOCZxiOtDuf6Jv5GNX8XcraCMSW2L5f6SIwCjd6Gg0T2ITcttqOX3fPZGe9mNK85m74qEc875XK6nUBgn9417KOlPKoe7Yh1JQNuPhbPV+5wgb4iFod5Z4Y+oolBnW3IIg8Il/l
X-Microsoft-Antispam-PRVS: <DM2PR02MB1340D06D1C9D68420A16F3BEDC2B0@DM2PR02MB1340.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592)(70601490899591); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(3002001)(93006095)(93004095)(10201501046)(3231022)(6055026)(6041248)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR02MB1340; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR02MB1340; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	4:k/n/u0jh34bij3JMSlZGxFW6BUrbJns6d9+k3aKzNCOoxec0gTeDhNBxtpKjqdZI4o7aQmvZ+RQrBMg5R5FR9Ry0cY7Thidd5M1RdN7f/ZYjMs4p9Ab5JRYaiYMGTzztnUfR0SZ6vwg7RRVdlbmw4EU+OWznPFv6XUtbcr73ynQTm/OVN2A/LAGmksTsD41I7gPsYTHvDmAr43RHgo4J9k8OnSlYsFjEKKsVSbZy1HX0scCZL8anxw9rkJHShhyVLw4I+w+EYwifvZVaYV68GIGHfBwJbsxD2TZPXhNGqo6Tcn7MvYJ7j8HgE6AoQtmWRcWDEm4S66EWjE8gnL9hqvfXnfMqnpqLoWaHsi9Rh1kZ7+ZahsBt1zcxnIMWGugg
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1340;
	23:Lo1AIAF3YtkSYBf+YIdnal8GriA5cknUKGU3IY+O2?=
	=?us-ascii?Q?ykPF6ylfZrpErF5GRSrSwisKHk9MjmdBwuErOvaMYWhvc7/QD7dAW1/pDElx?=
	=?us-ascii?Q?QdbL9V2PTnqdx69PhZ3ZvPcjE6oAcx+0/GC2QzoUGl+DBcGAGNN9IxpmIvDv?=
	=?us-ascii?Q?g4gt/ZeTW7aQsHW3+oaQwx/yDnI65KxMLtqXg0k+8Kc4XecE2XO27sW2gv7R?=
	=?us-ascii?Q?XLZ7CU9Q1F6aEIIB007APHnn9pGsYspBcuEMngcjO0ZIhWhf5XWbl698cJlQ?=
	=?us-ascii?Q?5j1Ftitrc5aIyYpXVg9fu0yXcS36TdgXm4ncsbNxdScVWltHCYA45Ox+nz6I?=
	=?us-ascii?Q?/Uf71iO4BF1DqVDaL6nONGskQdnawLrHHCgfxo4j0UCD/RMH40UUv6BDk7ex?=
	=?us-ascii?Q?xj6qpcopFL+wDrJIg4OnasX3WLbud+ZrAiPSN57xoiMr1+3C/OeBNTPau74O?=
	=?us-ascii?Q?kXeSxCEmT1XoiSQpJLeKziTfnsK2luIAs2R8nhMvpSOwDG/ebaH5EpdAk/Li?=
	=?us-ascii?Q?yHFp30lUzYY5s/OlbrD+IJr29M8WSejjb9rHcwtiXNCMeodQJDnAmMicJIre?=
	=?us-ascii?Q?Xxg/dePBSSzsal0IM/RLSLPTTUfH1wmA77/y8czdLrzEogfozauTYwxIwyk8?=
	=?us-ascii?Q?6cWWOQW49s9o8jNxD0J/GohWTJiJu72VpgsKtEUF9nBMr5EJO0JAzXaO7yTB?=
	=?us-ascii?Q?D9IqZbNVqjKIItcW1iw/ZuuxutDztlRq7H9rZlWGqVlslcnz0s8K0JxDgtRV?=
	=?us-ascii?Q?WfggztpS/QiGaVpFrwWaiyf5QfopQU+yRFpZ/8jxoO6pHa6EwDqKEPioECcl?=
	=?us-ascii?Q?NBdepg3M98ud4OhMoTmYpkTo7uhaUBfXspU3L7cmqhzZCkYABJr5qdl3nTKZ?=
	=?us-ascii?Q?NHXFMi+6OfE+pKpWCaYckRDHqm3g3tplsQmTl/mZDJ1DoDfBSKoD1wIpSJFS?=
	=?us-ascii?Q?jjKUJ7kNywXqj5+1bo+DJ5TNod1wRuJaO+/m1vuls4DVIljFPv8qqMMtTvzP?=
	=?us-ascii?Q?tLIWYEQacyFbtq0pbuaItiVuyN2Wi9ju3FqmJV5IAjlSg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1340;
	6:yIh4i269FEVcXlyUj9do3IFW2iul3x2rh4YJHSU44uLyA2Mqs1CYkwa3hcEcpzwTDZwD3tJGnFrOfvhPwubOxKiYpz53SypUo/pAWek7JYR3GNZ6v4fdpPVUl0ZLJmNzmswIIYMx0WFN5Cc0sFIs6F3ul9neLAAFQVEQLYcF8MQTQd69FkJjKBSFTZRS7Dqj9UOTI45vow9klBVdmsmVjV9eZa05+eZnvWUTP6SJlxXrE1KWzA6clnmV/cWepHW3vBBdK/QdPc+tzuzWhxrM74PyH6WpSHaMdnyqqnw3eFvAlpKyEsI8x9mRR5FoJ/FQjRIz0lfGIskODlRDh2pBWBQcge5+RZWs/fTE6F93Vn4=;
	5:KXvGiGetlrGCznIHFwwW4r67lrmfySb1HQLCSfeWxq3dO9a6j5QEqFVcg+VXxyrDNQzE0cyN9fQ2RJ+v0gbGqZfAMniS2aSmiIiAS7X3W1BVr/NSekttLpqifDwkQNeChUxKFpQkh9J77lM2TjqcegJTtJnN83K/l96gWI5Hffc=;
	24:Dhkf2D4kNYvbyAwC9kOI63fuwcDJOdMAGUXjoEHJI2soMP1msYut8IfBtuIMqJA74xe2zmVaws0y/eVUhChL1WrddYUDNe09b7wR8gVJA4U=;
	7:Ne8xBaF6Vu/464MZ1b99URxh1ZdyuTAqGi/kEoc/eiVSlbW71zkQJEWtl/G8dVKoDCoCLyckhK2+2JQAl62o6k4uMu45au5VF+gizI5f8+ezBzsejgc6wgNwiE4BQPOHlJEG7RzXoLXPOseKmpou7w6SCcUstIAFqGkSnhoqkYwfSfo6EZkKJWvTB/icu3IXMNLFC2GnGf107+sX255eRhWGUtEczGIf52AbdLZRkf12IMV/pXKlJgf3dW5lzxIj
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:16.4501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7788a9d2-1e7f-465a-2a88-08d52ae78317
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1340
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.50
Subject: [Qemu-trivial] [PATCH v5 27/29] hw/xen*: Replace fprintf(stderr,
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


