Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNp-0002Bm-Pp
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNj-00026J-Ut
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNg-0006sp-Oy
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:07 -0500
Received: from mail-sn1nam01on0074.outbound.protection.outlook.com
	([104.47.32.74]:37917
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNg-0006s5-GB; Mon, 13 Nov 2017 17:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=45ezQMHwBHjjVfB6b6cpo7AwGrA4tmtr56e025FLqH8=;
	b=jpI5TJY+WnjRI8DMGrDE3ysxDW9PZDRU0lyg8EvoGGmaETNjjeOwCFA6BxAT/vRQdE7w5AXzA0BAjGRD1JwXUqz027LWsnQy/h9IAnq/6omWTaq9I3yF9ejRGnsug6qrm1tzWJSC6IWi7lPFDJ7aBoAhOixeuSDg/5zD8TYW9Lw=
Received: from MWHPR0201CA0101.namprd02.prod.outlook.com (10.167.161.42) by
	DM5PR02MB3273.namprd02.prod.outlook.com (10.164.148.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Mon, 13 Nov 2017 22:39:01 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by MWHPR0201CA0101.outlook.office365.com
	(2603:10b6:301:75::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45074
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNc-0004VT-56; Mon, 13 Nov 2017 14:39:00 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNb-0000Md-RF; Mon, 13 Nov 2017 14:38:59 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcpof012477; Mon, 13 Nov 2017 14:38:52 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNT-0000LQ-Ph; Mon, 13 Nov 2017 14:38:51 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:34:51 -0800
Message-ID: <55d08bd4870237b4853fc13d7bd71d4d2eb7aa20.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(189002)(199003)(189998001)(2906002)(54906003)(6306002)(2950100002)(118296001)(81166006)(106002)(4326008)(39060400002)(478600001)(106466001)(8936002)(110136005)(316002)(77096006)(36386004)(23676003)(47776003)(50986999)(63266004)(76176999)(2870700001)(9786002)(8676002)(36756003)(356003)(81156014)(5820100001)(33646002)(305945005)(50226002)(5660300001)(50466002)(107986001)(21314002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3273; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT053;
	1:U0CNn0KKpopscaiIots6zi866chYzODcnkFfNswt89t2GV9xZWT5ZxmWmiAMilp7ByulU13sqQ5SeNXE43SfXnMSJbi8d06nCVCh4REClS6JNP2tTuwGDwNw0pwLsyj8
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56192ea1-90fa-4a16-9bd2-08d52ae755e7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM5PR02MB3273; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	3:kyFe8vGcv8aa1mIy8vgKhEgQMhoOPGW/JGYCbsnonGCfv/F4tvLHpuQNcOFlP9GCynlQ0pRw1nOed/pocEFaF6Txab8yHBknONqS5+5bYaWKX1n+NDmunX3LL2EB7UWjBQm97hm7G638kI4Mt0H8gRFWL5iFKMnNfQP9zlSYoXZfFbYOXPmMV/m38LPHih2oe399hoap4bDHQrJpITXhhEIjrU34qIzeml8+JM+lGJfdocdNWfmrdSvq3tzjSACj5Htw31Gmy9vt72nPXfK6/ZzvIP98XJVQ8CsfBoO0A0d1FWE18L8tj7E6ajhf7cZgrhgKKvDukt3gzwyHTUzFYkvbGILKVOLf7Vv6ivr9w6A=;
	25:M6hIfFkKsU90cK9i7ioFuemcdujnJeHfyWJLDmqiKxnUfQ7vma4Chsl8fM38PAlrGQMySMpV9GT5Xhsz3KkeIMyIKAH+GvJENGt1JN5Su45iULkzDqT48sMjxTFt7OHHg/0x61yYVNcpyl+4TDaw84IwxXaU7/BIH9vysv96/qRjDuouEVJCeJ03kD4GcnquMJqbZnu0d7BmWBJ2mQ8qAGofvG2pmPDpzsNkn5lzjYKYK+ooxONxcFWGTBbbQosVvhdVh/8qd6pjCmuTDBSLVrKWmQmzO99MqSLt1E+IAyWHDE/9JsvJ/WHFIGPnYTVzaIGeoqwKaBdJvbMiY1Omvm+4xnGaZA9Un9YSRcphm/o=
X-MS-TrafficTypeDiagnostic: DM5PR02MB3273:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	31:DKKB2jwExHH0Gt8eNEV0yBKmMSaGAezMayNomWzz0/caoPhzc9lYtPm478vQ4l33+TD5fbGf9wVngvJqEh0VWeE5bJBDC09bRiJy+WZ07MzrSoPTzyNIDmxC7Dd0c7ze+fOxPqK3+oNm3liSWmx0b7cVDWEXwrAATDphU6zH7Q/iNxK7VXIa18uikfkeg4/vYdSEMdmpkL6+BXBqasV3898Rb0Bu3MPwB/ArEa+Ayb4=;
	20:g6ViWNsFUB+XESDiXSZfM70Py55Rym7TNXShNcwB1JE9sjESqxZJKaARaSLrHZO+XgFd2/k1oPwhApMnaX7Ph0qiJkw9P23iosjWSWDjIi4/nSZRK7v0Vnzhzivg1Om1R2/W4TxFctOgvnM6zap57Ak+if4ruylEpzOs+jekqpZ+ns7LUH9r60mV50xd0Zan4UbTZki2t1T3+TzjWSBEwlQ9aBfTkgAljJpglORtM27r2cn/MPCUsa3YyAN9LlmRSJu1udvD7+EBEjNDG2i+l1YGMcXzIiv7kMeppy7bTxJ2IgV9MPtoYHsDapNldUKBLGhyWYwvqnoaO+jxMr3m8CUxqyOAksPvgoouelfraS7MBCYpEq+Rt5dyDx81omTHmcDgLUfUrGHGvTu976sKijl+ZQawg62pPbjVJPllPzRM1b9undt90q/lQqQRNAndLQC5JfD/xQL24xdDgsteoVPa+jkeEkfofAg45L3Y4rmWUeSMhyj2FeUp0PbHOOPA
X-Microsoft-Antispam-PRVS: <DM5PR02MB3273F927A493BCEA8C25000DDC2B0@DM5PR02MB3273.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(100000703101)(100105400095)(3231022)(10201501046)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB3273; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB3273; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	4:ZIN2v03oE9P/9H2x0kTmEvZiQO1NgcdHqZsV6DWq3zoRi74rDDfFxvhyXvDpus+eLv1devgmDwcnv8qXF5jR/TJfdeapfbNP3KrzcZsyLENd4fmHQckteTn+bsFHN3lE+mRcp81qq68uESG9p57xoQnSV19Kg8z/6pTGzroXs24C1vE0qK5b681v2Ot6nbd5CdrX7BRc8I3XObZzMPxDJ3Yw58Zo0i5YyiaU0ak+cwGEyXQeA2Dr/UwRsRA9SehpMmrG4T9/cIUy+MuFWtm5shDVq0aUi7/T/KOBcRBPm0bQqKRgRPjY/8qbJcnsVAhYk8X65qAbfMzz/riEwZCTrRoPTPhoQz6FPg2DUFoPlAqJgpTzvNpdaJg92ZSVbW3O/DqkRBtHUf+GOWAevjRQgfEFbfAC0VTLXiWFJjPhmgE=
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3273;
	23:nucr59/9BnR0Mr5nZybLjTGFzFlX1QobGTkoqua6S?=
	=?us-ascii?Q?JUi8qfG85NPK62qvsRAoBFZhQnfXhljTrHp44QSIQ6vCHGDxey0sPSwF5BWr?=
	=?us-ascii?Q?e5wdau3dYK5K+VNJLKEybpdB3Czv4k02aiTPzrILlPQPVt3ZED047pwDbXyI?=
	=?us-ascii?Q?M4soZv/Vtnn7md8XUlGQ86VyvR1QznoNrp+SoY46mo7elkwCewk6hqPrwxcc?=
	=?us-ascii?Q?oFbheXeIu0Idi9hoEsJF8I3fu9RTkBSGIMu3rrYvQHA6/lvfKXQdUfj06Zlq?=
	=?us-ascii?Q?51U5fUaPDbEPO+rImXvRkHt1wiFczzriT3oM9YIgSdH2PRMnXCCwuhtj8aTO?=
	=?us-ascii?Q?hUoc3cJubvXrLc6fuDD8LbYYN4eh96x9C9yT+eoHu7HiCCa71ZB0fIexKrHc?=
	=?us-ascii?Q?d3IvTRpkQRnMqTmuDl4Rg0Zs82QJS74n12qPEwsgg4Q6Ay4KfQLqyMsNM9bb?=
	=?us-ascii?Q?sHoW6pnkxn83gNC8UmOx06XHyQUlgON7CcIQlDwJCpsskv8+9/2o6FVG7yR1?=
	=?us-ascii?Q?1FMP7k67Ttp5McmMG6rM4IN3s3J7tD3evCjuTMfACU9i5oIeOuvizg/IgZpf?=
	=?us-ascii?Q?DVl+lZ3wJJaJI3yt3CWY3WMMphnTQqkjE6hkXz8gSGJBzTEhdl+bSEvPXDpt?=
	=?us-ascii?Q?pJq50HtC3itXy13yHwUk6fZZO0hJfhGB99+oDE3ixhaaSHYxc6Nt50fZGL8W?=
	=?us-ascii?Q?RMu1hnDz/zJvFfCbXUE7CANEhTo6V34b2dcq80GGng/y2lWCQRzb3/QCDNos?=
	=?us-ascii?Q?WWktUzOMJOUNXWVLX3P0QAyBZBTq7tmYos4tj9UZa6Laj7r0e9sSw3Aq3XkZ?=
	=?us-ascii?Q?/bzwBYaiUWCcl6y64O55THiaS9s/BrGSFQyoxMXuN5PetCcROZKZhqKQAcvu?=
	=?us-ascii?Q?Q8mFJD/Wwi/26v5yD3qFWlswINt9U/Q5mS1j8Jo0BwWRm8I9Zwc979YvhDqF?=
	=?us-ascii?Q?KKkqW19oad0+4n/Dk+v0KbWnDxEAfuR0J7T/rzIZW3NanYFx7zp+EUCssvI2?=
	=?us-ascii?Q?c9GdFFXuTFa8BMDThZXvspHninZgNBx2xvVKhKrM9XnIlpxRwEO8JLUpGR6S?=
	=?us-ascii?Q?Dyku7BkjAataj41jo1hDV8LHqp9VMZA4OitX/lpv2/kZxBqOA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	6:EFV02fCx+AEj95svIVipJj5MsIWkG69P+8AV0necFw9y1OvLZ5Lp+DfrdDATBAG6yBT4IbsyAwA4UXzpHE0LXRL5ZPA/mZhLIMcZQKsjEdEozlMwM/ylmOY7YIq8+mwwkQObHhXJbjB0gYaOkdXUR5v2D4seEFjG07wxUhhIyTGKV/eHXNql1IzR7hSTHJZfBuMm9rRwhGNiLtXQ2IkbviEgoHEMo8X4bb//5+Zk6KcugIgK6NnzSS4ArIe7AslkKZL2q0WovopVs6f0U+ylHxYPm3Lq0gTRQ5XWbkFwFx83US7VTz29ym0fizj152XTT+iiIW37Hb5nlQH++TSh+hezSGK9qzm7Nb9Snv/GAY0=;
	5:ATyjdjjh2ojPggQyhCkuhbAIdxAkB889HpvhRiCTFTMs3eVgcc6RsJArOgGO0i/Ybh34xeMgTvbgH5qNk1qjxUxLXDCTY2ImzQ4Th3oU5OChb+WspGKU7QHsV3P4KaZAzFx42ORBN4fUAkrIG+jXcOD2Wb9UEWzmOVAMyCkMjEw=;
	24:WzFVz13EWSRU5RoinoBmDqZFXOpxVsykX3wGCLeCEQ/6K5vBq9C2T6NL6DNgekiYU3QhBcgGHluIxUml6zbkDKTlTyYsTW81yTCEGv5/rb8=;
	7:rzNLk5S/gE6h4l/pQ+XBC6X+pYqa/ME8Y3YbjG1ZQ3czgrAGDA5Gw0Fgd6fHG341OXer7OwiqQnZmymLRP4+ycJeLTCOsQbGQcuxxrV7pqJpHcVIVW15aGU5b9ZdD/JDX9fj3vEMDcFasY0+VcIEJvTbSO8pevUa44xuSCRqgt5q44mnNQNwN4iER9czRjEjpEmtgiP+HZ79Cbyn3LS5X9BqXjeGtZUsUZh2Gx48xOk7EMg+xraAtTq1SlHiQY4M
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:00.6722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56192ea1-90fa-4a16-9bd2-08d52ae755e7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3273
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.74
Subject: [Qemu-trivial] [PATCH v5 05/29] hw/dma: Replace fprintf(stderr,
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

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V3:
 - Remove ""s
V2:
 - Split hw patch into individual directories

 hw/dma/omap_dma.c | 26 ++++++++++++++------------
 hw/dma/soc_dma.c  | 36 ++++++++++++++++++------------------
 2 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index abd18c67ea..5d7fe06d98 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
@@ -1898,13 +1899,13 @@ static void omap_dma4_write(void *opaque, hwaddr ad=
dr,
             omap_dma_reset(s->dma);
         s->ocp =3D value & 0x3321;
         if (((s->ocp >> 12) & 3) =3D=3D 3)				/* MIDLEMODE */
-            fprintf(stderr, "%s: invalid DMA power mode\n", __func__);
+            error_report("%s: invalid DMA power mode", __func__);
         return;
=20
     case 0x78:	/* DMA4_GCR */
         s->gcr =3D value & 0x00ff00ff;
 	if ((value & 0xff) =3D=3D 0x00)		/* MAX_CHANNEL_FIFO_DEPTH */
-            fprintf(stderr, "%s: wrong FIFO depth in GCR\n", __func__);
+            error_report("%s: wrong FIFO depth in GCR", __func__);
         return;
=20
     case 0x80 ... 0xfff:
@@ -1934,8 +1935,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
         ch->buf_disable =3D (value >> 25) & 1;
         ch->src_sync =3D (value >> 24) & 1;	/* XXX For CamDMA must be 1 */
         if (ch->buf_disable && !ch->src_sync)
-            fprintf(stderr, "%s: Buffering disable is not allowed in "
-                            "destination synchronised mode\n", __func__);
+            error_report("%s: Buffering disable is not allowed in "
+                         "destination synchronised mode", __func__);
         ch->prefetch =3D (value >> 23) & 1;
         ch->bs =3D (value >> 18) & 1;
         ch->transparent_copy =3D (value >> 17) & 1;
@@ -1946,8 +1947,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
         ch->priority =3D (value & 0x0040) >> 6;
         ch->fs =3D (value & 0x0020) >> 5;
         if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1])
-            fprintf(stderr, "%s: For a packet transfer at least one port "
-                            "must be constant-addressed\n", __func__);
+            error_report("%s: For a packet transfer at least one port "
+                         "must be constant-addressed", __func__);
         ch->sync =3D (value & 0x001f) | ((value >> 14) & 0x0060);
         /* XXX must be 0x01 for CamDMA */
=20
@@ -1977,8 +1978,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
         ch->endian[1] =3D(value >> 19) & 1;
         ch->endian_lock[1] =3D(value >> 18) & 1;
         if (ch->endian[0] !=3D ch->endian[1])
-            fprintf(stderr, "%s: DMA endianness conversion enable attempt\=
n",
-                            __func__);
+            error_report("%s: DMA endianness conversion enable attempt",
+                          __func__);
         ch->write_mode =3D (value >> 16) & 3;
         ch->burst[1] =3D (value & 0xc000) >> 14;
         ch->pack[1] =3D (value & 0x2000) >> 13;
@@ -1986,12 +1987,13 @@ static void omap_dma4_write(void *opaque, hwaddr ad=
dr,
         ch->burst[0] =3D (value & 0x0180) >> 7;
         ch->pack[0] =3D (value & 0x0040) >> 6;
         ch->translate[0] =3D (value & 0x003c) >> 2;
-        if (ch->translate[0] | ch->translate[1])
-            fprintf(stderr, "%s: bad MReqAddressTranslate sideband signal\=
n",
-                            __func__);
+        if (ch->translate[0] | ch->translate[1]) {
+            error_report("%s: bad MReqAddressTranslate sideband signal",
+                         __func__);
+        }
         ch->data_type =3D 1 << (value & 3);
         if ((value & 3) =3D=3D 3) {
-            printf("%s: bad data_type for DMA channel\n", __func__);
+            error_report("%s: bad data_type for DMA channel", __func__);
             ch->data_type >>=3D 1;
         }
         break;
diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 9bb499bf9c..45516241c6 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
@@ -270,11 +271,11 @@ void soc_dma_port_add_fifo(struct soc_dma_s *soc, hwa=
ddr virt_base,
         if (entry->type =3D=3D soc_dma_port_mem) {
             if (entry->addr <=3D virt_base &&
                             entry->addr + entry->u.mem.size > virt_base) {
-                fprintf(stderr, "%s: FIFO at %"PRIx64
-                                " collides with RAM region at %"PRIx64
-                                "-%"PRIx64 "\n", __func__,
-                                virt_base, entry->addr,
-                                (entry->addr + entry->u.mem.size));
+                error_report("%s: FIFO at %"PRIx64
+                             " collides with RAM region at %"PRIx64
+                             "-%"PRIx64, __func__,
+                             virt_base, entry->addr,
+                             (entry->addr + entry->u.mem.size));
                 exit(-1);
             }
=20
@@ -284,9 +285,9 @@ void soc_dma_port_add_fifo(struct soc_dma_s *soc, hwadd=
r virt_base,
             while (entry < dma->memmap + dma->memmap_size &&
                             entry->addr <=3D virt_base) {
                 if (entry->addr =3D=3D virt_base && entry->u.fifo.out =3D=
=3D out) {
-                    fprintf(stderr, "%s: FIFO at %"PRIx64
-                                    " collides FIFO at %"PRIx64 "\n",
-                                    __func__, virt_base, entry->addr);
+                    error_report("%s: FIFO at %"PRIx64
+                                 " collides FIFO at %"PRIx64,
+                                 __func__, virt_base, entry->addr);
                     exit(-1);
                 }
=20
@@ -321,11 +322,11 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, uint=
8_t *phys_base,
             if ((entry->addr >=3D virt_base && entry->addr < virt_base + s=
ize) ||
                             (entry->addr <=3D virt_base &&
                              entry->addr + entry->u.mem.size > virt_base))=
 {
-                fprintf(stderr, "%s: RAM at %"PRIx64 "-%"PRIx64
-                                " collides with RAM region at %"PRIx64
-                                "-%"PRIx64 "\n", __func__,
-                                virt_base, virt_base + size,
-                                entry->addr, entry->addr + entry->u.mem.si=
ze);
+                error_report("%s: RAM at %"PRIx64 "-%"PRIx64
+                             " collides with RAM region at %"PRIx64
+                             "-%"PRIx64, __func__,
+                             virt_base, virt_base + size,
+                             entry->addr, entry->addr + entry->u.mem.size)=
;
                 exit(-1);
             }
=20
@@ -334,11 +335,10 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, uint=
8_t *phys_base,
         } else {
             if (entry->addr >=3D virt_base &&
                             entry->addr < virt_base + size) {
-                fprintf(stderr, "%s: RAM at %"PRIx64 "-%"PRIx64
-                                " collides with FIFO at %"PRIx64
-                                "\n", __func__,
-                                virt_base, virt_base + size,
-                                entry->addr);
+                error_report("%s: RAM at %"PRIx64 "-%"PRIx64
+                             " collides with FIFO at %"PRIx64,
+                             __func__, virt_base, virt_base + size,
+                             entry->addr);
                 exit(-1);
             }
=20
--=20
2.14.1


