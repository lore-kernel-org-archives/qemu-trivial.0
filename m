Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENP2-0003ve-CP
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOy-0003lL-P5
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOv-0007fv-DL
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:24 -0500
Received: from mail-bn3nam01on0088.outbound.protection.outlook.com
	([104.47.33.88]:19280
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOu-0007fL-R9; Mon, 13 Nov 2017 17:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2MDvpXGkNYb6BdhcNWoPiBhQz/C/5yWOMQrFiXnUiHw=;
	b=b8fHMaq/feIs22WLp+1Vji7s9gh75+RJexmdeiqWcZ+H1V2Z9Sn3zECdNmPXJaTStY/5Df/VsmqXACZ1oAT23ZCg0o+xPk7Xnwp6m73RDppBR8dHZvn9CzfCQGs7lRy/1VPLt1lV1nfD72kZf+Lko18I3qPzZu5F1veWTjCfKPc=
Received: from SN4PR0201CA0048.namprd02.prod.outlook.com (10.162.76.34) by
	SN1PR02MB1343.namprd02.prod.outlook.com (10.162.0.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:18 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by SN4PR0201CA0048.outlook.office365.com
	(2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; weilnetz.de; dkim=none (message not signed)
	header.d=none;weilnetz.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0004AS-IZ; Mon, 13 Nov 2017 14:40:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0000sx-Ds; Mon, 13 Nov 2017 14:40:15 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMeAY3003189; Mon, 13 Nov 2017 14:40:10 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOk-0000pZ-9o; Mon, 13 Nov 2017 14:40:10 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Stefan
	Weil <sw@weilnetz.de>
Date: Mon, 13 Nov 2017 14:36:10 -0800
Message-ID: <55c70157d3650022c60f73da5a4ab238aeddb467.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(9786002)(110136005)(54906003)(316002)(39060400002)(16586007)(8936002)(575784001)(50466002)(5003940100001)(47776003)(48376002)(4326008)(5660300001)(36756003)(305945005)(50986999)(63266004)(77096006)(81156014)(81166006)(76176999)(106466001)(189998001)(2906002)(50226002)(356003)(106002)(33646002)(8676002)(118296001)(478600001)(36386004)(2950100002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1343; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT021;
	1:c0dLTOeE7gPe5dJknn8e8nRavYFif+RTY4VVqiX0x883HPkml3WpwXNHUlgUzTXU4/wvWa+041GLY8Az0qBgJkMxT6/y9EK5R1z5p1uT8rc5NFj+qMh6NvWE8Uf/bQj5
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa49ce60-f2c5-4ac3-17b3-08d52ae7833d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:SN1PR02MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	3:r74ZtQiYokkwQ+ztHv/p7NkpnI3QWHna/LsxQzJJVGjRLyf5bql9idz4O+UjZcmS8hkHO6Z1r5qjzmcv3ezgeg3gUtn4yxo1CIePXSZ2vyudbfzyZVRPWSvMaQytGk1XHrbqZGQgJXmEXZFDsa5zaxSqZiRRsFUHBPBD01/bCXpV7xmodBtn7S1N/BrDQjbZJYfWZedNhUcOAgmpZ5PBipapCMzZq1ovr87mLLA3w2GQEpA4yyaqAvTIdp3RzD+dcsX8D/AuNTaqwEqMjJv41m9aDIQrN4HcI3o8CZsbyR7eoH/pvvUGWm8fWEnAIPdl6b1YBLpwVyooJvHGfXUBTOYQaI73aH2hArzr1Bm6Lm8=;
	25:gtYPqEdJBwAVRqKZ93MRIyBT3/WSfRlrxfZWdIvpnRaYuNHunvgniucDKj8IzmpVRwLLpSnP6pWj24OAnVFxKKB0DVe+yjYzi+xoHQbl63NFVt3aznAnLkkjk2skv05aNLpErt2wNvf7Go1FyGzgUrYsIodHmM4gNM717bmk8UDiVb61hGviB25w6QvSPcqPUut6J13HQ75EOgCQnjrFvdRWyqUogZZJ0kQXjR4iWZz+v8Lv0P4v3V0JfNjJNHc0j777KdxeJWgcx36qqsdEViXIigxovGHE3XxEmSwY1N5ScePM9ynL3jLM/U9lrAn3SikfOWFZXPAIGvRJgfIxo/IgVZvKbQJq+vubwjvPir8=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1343:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	31:wg3AC4yQn75ocm0311W57gDjdeEpV3Xm2QheGb9C94q3oxo0RlDztFeQ1YCz4IBxBRpHjHF5nHIjPDgtFZa/S/FFjO+e9nPk6XXZuinmJsMnrCM5hmtE97Iv1AGLIsY2qVdGGurgKjy36TR+IgiUIJMbRzO5vfXUCxanQJ2c7oWLoArhC0nbjxa6hvjATJ74Hhuryz8JS93H+IafMCdam+t6yHNhLLcatuLOVHfnu18=;
	20:KatPZflVXQ2+9Zkipvn84WSqe6FbXU9dw+xhu9tESfjD+dxEbByTnSKUKLOc01JD9znbcLK+jXk5KSDtPaToYDx3ZUwC8wo2M3nIIT1i9kLY+c59iz+ZlP1Y2G8j4uNFU305e8gzJgtb0DirR19tJOOxCYrLK36X/5J4+DkzIUaMhewtfER1ZhQFydDL8cyy4IfnmdMNvlIXtWyGbEPoi7KyeR9ugnqPkbzzp7uWnkmdZMjeQB++q2HyEZ54Nzd9lezN4mvK1pvtUWdOfxi0reVauiGhfrrrB/YPuzEwBfiYanNkkAr1M7IqbkMnBDVvWw1x0aLlHvGgzOFHkYJtF+R4Jr/GYc9qk3pQohIjFQORwFhEoSau5xlkQjNiIvKcsCiz2Sghqz6PEwvb0T0j32k2oXcGC7ZxCPmz1CBnRBMII4TT703zFFttdMxqNW1yzUspj91SIL6c0l+XJlBSYCJWqi5SzEdGnt8qERnjvjuBoLyatr/zIVSvZt/gfSjo
X-Microsoft-Antispam-PRVS: <SN1PR02MB134382FE0C71A71515F9383DDC2B0@SN1PR02MB1343.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231022)(3002001)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR02MB1343; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR02MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	4:G4iNuRqi4y0rVp/bAzkGGRtx0qj/+JRe33wkFJ/5ka6LVWbVoQrKyFpXPrLe+xx+NZVVkWUalFiMRlFGAxbiJgDiZDRiJgklk0cNFm15lUh6NFyC1BR8/s3TYzsANkU5P/ZubUUMYNY35Mi4AUp5btb3jQc2FEw/HYG90rZB2kIrY/otdkdNxXwcPcs+1MuLF8UV3r/VPvM43HyNjoCR7DFqlXksmOXhc2vvaI+ScMI/ZhbPjXQjQ0dKmGK8H8IAZZLjvds3JWrMxjxpShxG3Mox2re24FiBF6MiiPjQnpB70MsYW6Rg9udbHi24bkcWgR2r6rko1+J6Xx3Tc3FFQw==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1343;
	23:20pgmFoR+tkSqTlSZgOeY65SfQBP4glork7qAIBoA?=
	=?us-ascii?Q?DBIClKciLrMK6yGT+PiCHwHbUPBjexpdX3dj1+k3RBQ8kbk7T6859azxcbZH?=
	=?us-ascii?Q?PQwr2CxhdYHP7J24QIx1kmjfP7oVWPfRh221LXUMDwTEGxonWbdfummgJboy?=
	=?us-ascii?Q?vuWCYx/ALZMYSR7p9ZLAnt4k0p1BBQiTVqMgdFPPdp4rrs9qdYp2MGpRPFBu?=
	=?us-ascii?Q?paxuDCVS6gORQLiPK55W/t/bReQbenu+SZ0itNNED4N1UsIoHV4wH97811RZ?=
	=?us-ascii?Q?MfBRmz6En+Qh0ljKYTfzhhKkh7xFzDGDmsiK+iIzyAI/6b1oaDoOetRFA8sb?=
	=?us-ascii?Q?lZ+Brl+1HFP8FBkvAK0Su03WUhRcDFjndZuGvqH0HGyL+nw5YQ4y/qVcjz3y?=
	=?us-ascii?Q?nGdG9iRtJOR7EJWswPrewquAidqC6hTpFpPHiRi/su+r6lD63JdZo5Jvbd8O?=
	=?us-ascii?Q?bUBT//rDTVpkzuB6Ce84YrNkjSQ2vs1V0SdI23Tsh5v0saAZ5UdfaT8PfUbV?=
	=?us-ascii?Q?vOt5o53Rl1JzApuIpAvqh9o/3hQRPjEb/1ZsIMtje8R3mjFzK33kjFKZh3E/?=
	=?us-ascii?Q?wi9PSHsGPn+WegSMSyC25aR052rPQyRfRhVmUCIUidHRQpqdvZqezlhTckBP?=
	=?us-ascii?Q?F0Dt850MJ9Ypm0zBzYwCumFm8ysTM774D65JjPPlZxVgpJUYMl98MYPglFSs?=
	=?us-ascii?Q?OxPKAcI6qj4dHJPMr0Vryzj5iUHxG6dau9KjHiR1s4FY0+WbQs2TRm/im4hj?=
	=?us-ascii?Q?hSniZb4wyCJqsn25/52l51tKosUSH4q/oZk17A+rI3BNs4rEj+rUTGYKnYCF?=
	=?us-ascii?Q?tFA0droz3gw+WDBJm/UKIbNMaIs7x7e/xGC3UuOMKMxArMrg2i+9eGZXu/b8?=
	=?us-ascii?Q?qwbvoZr8dEtc2sUUlJn2UCEXntjD3PiPDdBwcMyrTPQlBq0RxZ7IbScZxumD?=
	=?us-ascii?Q?PsQPbFf4qAtV/tJ1WYEEuwtzXJNw2SyiKClbprc/wUQmop9PaUB5xTq0ToJk?=
	=?us-ascii?Q?64nqM+JIqhZaMVAGo/X+rU/vHTyafw8+NezD2kqBL3NyA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	6:+eFyAk4zg9kHeqz9cPrY1+I65BOkPCw9O/aro7mcI/HAg9womdl5Dlnn2c/pRyHbWUrk0pW9B7oYyLFVsIgfH6LkAxGzZBf7KESUr7VmAjwha/k7chjQ6+ZHfoGVcZP73a43NeKSTTycYyHH0H5dtRargLzJDq5zLb6jKxI/Ijl3xB1zWc0jNqGk3e8hTB3CmVOF4uJfn0sav1JegPV8DrtXzMHTbKwkvSLyMW9TQNL27fSV7M2/0tdOELrZMeXdnEPFLxgl8x0qx5AHudURN4v6yZt1FSSH9tD/YeKbWbgaLZemzLwe2IWugFfYHtW1aDj6CRk5usKhV10VVChIsRMuO1DcAniqhnGdV63KU1g=;
	5:Ex5pmLBxqPKQGY1Vo8NBEUIHrTL+ZVZIlsiPi7VEDdRLEEFrfEfZFq+EhWeTWFpgWx1levHOTiEeeNf233OSzTQx/jc8Jji6MqPO5JJGI7KpHrj2RX959V8Cbn9+56VhJhscJYjxPJhpptGHgyOpJwZCYSPjbbLEnwZCRZTp/vU=;
	24:VsMhMx7m5Nq7T7YxnBJC7c00gRtSr/fu5+9BvnDfH+2M8EE7W44B5oLwi5KIQmBQFF7NRRdq0debOQ8sAVLbQb2v0UYf35sYOhwqd9a4R4o=;
	7:d4roSnas9FInlbbPN5GHNUKg1NdvWr9g8FiUf6DROg1jOU+snhfgFh6VwVU6d5i7SIRUgWkFDqWctD78HbT1ZJsiSCPVTCJidFReYB99YDAZJy1k7wXVKikm4bdChXfKcv0xnlVCJxvrOkw3w1KPb/X7hQpRdM358YTiYejfd4OKUL2bZ0YVH7BiBFN3mZKUoJXxzD2w1rs07xa+UOEtCRlQ0vc/z6wv2zxBmZePg4sOwmFHGr/N6jfi1DXDmPJf
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:16.1674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa49ce60-f2c5-4ac3-17b3-08d52ae7833d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1343
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.88
Subject: [Qemu-trivial] [PATCH v5 28/29] tcg: Replace fprintf(stderr,
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

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Stefan Weil <sw@weilnetz.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---

 cpus.c                   |  8 ++++----
 exec.c                   | 14 +++++++-------
 tcg/optimize.c           |  8 ++++----
 tcg/tcg.c                |  2 +-
 tcg/tcg.h                |  3 ++-
 tcg/tci.c                |  2 +-
 tcg/tci/tcg-target.inc.c |  4 ++--
 vl.c                     |  2 +-
 8 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/cpus.c b/cpus.c
index 114c29b6a0..d73df01659 100644
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
@@ -1527,7 +1527,7 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
 #else /* _WIN32 */
     if (!qemu_cpu_is_self(cpu)) {
         if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
-            fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
+            error_report("%s: QueueUserAPC failed with error %lu",
                     __func__, GetLastError());
             exit(1);
         }
diff --git a/exec.c b/exec.c
index 97a24a875e..59e0411d0e 100644
--- a/exec.c
+++ b/exec.c
@@ -1076,7 +1076,7 @@ static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
         }
     }
 
-    fprintf(stderr, "Bad ram offset %" PRIx64 "\n", (uint64_t)addr);
+    error_report("Bad ram offset %" PRIx64 "", (uint64_t)addr);
     abort();
 
 found:
@@ -1689,7 +1689,7 @@ static ram_addr_t find_ram_offset(ram_addr_t size)
     }
 
     if (offset == RAM_ADDR_MAX) {
-        fprintf(stderr, "Failed to find gap of requested size: %" PRIu64 "\n",
+        error_report("Failed to find gap of requested size: %" PRIu64 "",
                 (uint64_t)size);
         abort();
     }
@@ -1719,8 +1719,8 @@ static void qemu_ram_setup_dump(void *addr, ram_addr_t size)
         ret = qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
         if (ret) {
             perror("qemu_madvise");
-            fprintf(stderr, "madvise doesn't support MADV_DONTDUMP, "
-                            "but dump_guest_core=off specified\n");
+            error_report("madvise doesn't support MADV_DONTDUMP, "
+                            "but dump_guest_core=off specified");
         }
     }
 }
@@ -1756,7 +1756,7 @@ void qemu_ram_set_idstr(RAMBlock *new_block, const char *name, DeviceState *dev)
     RAMBLOCK_FOREACH(block) {
         if (block != new_block &&
             !strcmp(block->idstr, new_block->idstr)) {
-            fprintf(stderr, "RAMBlock \"%s\" already registered, abort!\n",
+            error_report("RAMBlock \"%s\" already registered, abort!",
                     new_block->idstr);
             abort();
         }
@@ -2184,8 +2184,8 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                                 flags, -1, 0);
                 }
                 if (area != vaddr) {
-                    fprintf(stderr, "Could not remap addr: "
-                            RAM_ADDR_FMT "@" RAM_ADDR_FMT "\n",
+                    error_report("Could not remap addr: "
+                            RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
                             length, addr);
                     exit(1);
                 }
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 438321c6cc..93bfaad556 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -122,8 +122,8 @@ static TCGOpcode op_to_mov(TCGOpcode op)
     case 64:
         return INDEX_op_mov_i64;
     default:
-        fprintf(stderr, "op_to_mov: unexpected return value of "
-                "function op_bits.\n");
+        error_report("op_to_mov: unexpected return value of "
+                "function op_bits.");
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
+                "function op_bits.");
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
index 63f2cd54ab..6c851d3450 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -35,7 +35,7 @@
 /* Marker for missing code. */
 #define TODO() \
     do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
+        error_report("TODO %s:%u: %s()", \
                 __FILE__, __LINE__, __func__); \
         tcg_abort(); \
     } while (0)
diff --git a/tcg/tci/tcg-target.inc.c b/tcg/tci/tcg-target.inc.c
index 913c3802a3..2f4b56d3ba 100644
--- a/tcg/tci/tcg-target.inc.c
+++ b/tcg/tci/tcg-target.inc.c
@@ -29,7 +29,7 @@
 /* Marker for missing code. */
 #define TODO() \
     do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
+        error_report("TODO %s:%u: %s()", \
                 __FILE__, __LINE__, __func__); \
         tcg_abort(); \
     } while (0)
@@ -403,7 +403,7 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 void tci_disas(uint8_t opc)
 {
     const TCGOpDef *def = &tcg_op_defs[opc];
-    fprintf(stderr, "TCG %s %u, %u, %u\n",
+    error_report("TCG %s %u, %u, %u",
             def->name, def->nb_oargs, def->nb_iargs, def->nb_cargs);
 }
 #endif
diff --git a/vl.c b/vl.c
index ec299099ff..985760b76b 100644
--- a/vl.c
+++ b/vl.c
@@ -2232,7 +2232,7 @@ static DisplayType select_display(const char *p)
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


