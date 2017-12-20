Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRi9m-0006c6-4q
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:27:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9j-0006Xt-Rr
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9g-0005Ie-Rn
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:47 -0500
Received: from mail-cys01nam02on0085.outbound.protection.outlook.com
	([104.47.37.85]:10304
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9g-0005Go-Iw; Wed, 20 Dec 2017 12:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=t4fS0+LHJ8Pb/j055VBrmvG3jhqDUnLP1BI0pIIgpC8=;
	b=JYwBDprS6P30be2YnRwXFCRQLzVkFzNc/+VNEjpgkqx8tT03bh+Boo2/r1WXEiU5ZhsSbE9r61DAIyGGL2Y2dKfGwviZ/Kr2H3t8KIGIrQD9yiULNlfV0sHOXXz/BfWfdppX7UiJJXdAuv5a1+wYh5su2FPdriTtMAwIiqNoJHk=
Received: from MWHPR0201CA0024.namprd02.prod.outlook.com (10.167.160.165) by
	BY2PR02MB1331.namprd02.prod.outlook.com (10.162.79.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 20 Dec 2017 17:27:41 +0000
Received: from CY1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by MWHPR0201CA0024.outlook.office365.com
	(2603:10b6:301:74::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT013.mail.protection.outlook.com (10.152.75.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9b-0004s4-MD; Wed, 20 Dec 2017 09:27:39 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9b-0003ZJ-Jz; Wed, 20 Dec 2017 09:27:39 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHRTGX019590; Wed, 20 Dec 2017 09:27:29 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9R-0003Xp-0l; Wed, 20 Dec 2017 09:27:29 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:23:13 -0800
Message-ID: <1c3c719391c2439fc4094d2fa81022c20c45d948.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(346002)(376002)(39860400002)(2980300002)(438002)(199004)(189003)(106466001)(356003)(9786002)(2906002)(77096006)(316002)(50226002)(106002)(59450400001)(36386004)(8936002)(81166006)(81156014)(8676002)(54906003)(110136005)(478600001)(23676004)(76176011)(7696005)(63266004)(5660300001)(305945005)(118296001)(39060400002)(6666003)(2950100002)(4326008)(5820100001)(2870700001)(47776003)(36756003)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1331; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT013;
	1:Ygt7Pr6Skt8orYUuApaWQ9saEEyEcsUkKgq5j1cJ7ncKP9Cjd2X+JlOksvKH1VpP4nmWZsSZRtfDUy8BSrSX8NQKbhPsgPQHse1keMMpc0vDdSCsdWz6jg2j9MGfhWKw
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01d65420-591d-411c-e9ab-08d547cef8ea
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	3:OcL3mQxXSnwZldlP5rdH+ObDnzubzD8W/6wBmSU0GZfVpAcQ4d7hiEh+YEWvIlVVJUltRoWECXFkmb2O/4cmMUw8iQj55j5wX8l+ziThB7p5w1MUeTBq91r6kK+Iqq5Yx4f0CkGs71hIISVbRUZOMwx6o+7iKXl0zO2sZLZuO8ZvIsbG9YqbBYVk8ueFTiv+vMbffmfrw5RoFSsg6nKACNCEICC+2jep+rGs1LmZiA8T0/wKbsRz18ISSQCgMAFe1iSnKlAUC4ibRrcIOS8qC6C7zlXqhDmjfOKrWG1tUwOHndSyeSneCJOJayHJAXRpKRbaSf2GTh0zdw1KqDSAHQMyBJbbXYEpbT+OqVlpLc4=;
	25:4Psor6/IZ0nelQrb/7P0Ao34FJA89b8SDkWFEuDLfHP3gAFuxcp0Iy8JFbXtsOTC+KKAYyTtM/9Z2YSWJ+tukiWcDpqiwMPnu5ZQ0SfnBjIvrsOqsw5ax/6ho3ud3IvaLz+mcAI0cHEhC4+tUKrLo9wW4mifHwFDzA4x3lkr+7PunqN62fiWCG4uFYBNfji2AzXnEQwPoDuW20OM2rjFQmP1XVxXAYAgHvnjkfoXw/985lsI/N/A/ZeJy4MY6PfYh4aw9EqoS++LkqE0fjsbfhde20c2shNmYlj228mDb9O9SFxu5Ji9oYeho/qgOzZQwJhsTjZRm3HBucTxYxyivw==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1331:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	31:FvkL9rlPTlDZcafjrpesRq66mSERDvf6Ltw8+tketlSCutc0eQtpzo4lusiGs+XQ2/F+UdmO17ZIM68h8IUMxeL28t5v2+XMAdZpIeoPz4zgGaj+0xeFwNfuQ+tfWPy91/IAJsbYWfdCvWqyqVeSAiZErPp56GhyG2qN45T6b9QICJOsYq3UOJsm50ERmknYStu//bfL3Rg20P5ibSqBF00znpUkMJaomXEGg7A7IAE=;
	20:bVPMFI4rqteLmQ39kQw3VhEwwiYglstEmTvEICBI1qxX2TdkQZXt7U78oFYBp0HMgJWMtuthoph8KMDQswbV5XsWMUE59lasnKDtI481TCWAAbE99TGr3YnbLe8D2JF/A2QcFvU3cE8m8FlOeAKYWfU7qP/UQAmBJ24NrYgbZUSgw9+ndWXDdchpMrBqDv9l6CiIEHNUfYn4lUabx1J0zxLF9UQIWmP8r7VBUqZEwj1hIAW0g3ZVGQNK+Zx9Ha6jCTqoMTEoUTvDg1X5x1pfY2w+Sn7FJ7bzEB5ggXEuZS3RUditeg/ywMsBSFkMWeG7oOHY/3TcFaYxO2B2ADB3YrbF8nHS0ynRVWml8P1vSgz6E4ifK5FtnI/SaSaKdRrT8bJPm7lY227Gj6PNm8wB7/lPwHRtdK20Lv9A97et8tQ1olrK8bQ1D9i1DfOGCB9Y5SAo+dXzpxqd4Kfrp0O42MSlxyaPidU9wi8kUsl2Tn7lsf6Zo0mfsG+mTpBYDDP4
X-Microsoft-Antispam-PRVS: <BY2PR02MB1331F1DEDBC6704DC279DB9DDC0C0@BY2PR02MB1331.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(10201501046)(3231023)(93006095)(93004095)(3002001)(6055026)(6041268)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BY2PR02MB1331; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	4:zhSGY6eyPx9qyYhGXv9E8YBOdNwEAWEZj71bLMo0oHsPOU/IhEFL8Wd7lK/AW+zESLJFxWimAiWF2PJFI8U/WosaZaNH8e677486nXPxLOErtrnN8zhDlHreyBMMsMqVyG8CBPp0tRC7Kj+7oHh2Tl7ZD2U8BR8S2QfP8NL1ebQ4lee+ReNBdZM3cXhBbGj/TKOnpikKvbj9zYjgvo0IvU/IQARYwHr4tfvoI3kS4wS0iIayrkXHVmrrfOM1l917u7uT0fNBfRvY/OFTc6MwWH2Avawo4kph7Es9hw8RdAmSPTjVCB+ZbbiK1YrlYilGGgksHfw6xrij5qVoz+XZsw==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1331;
	23:o7BZW8o83wTaOfp2rYgMJ9HMG+xR27WM+peRExlOb?=
	=?us-ascii?Q?94rpMkIrI3n6rFEjStV7hRjSqstVE+d3jnTkETHzmTbN1LymfBpUYjHteDu4?=
	=?us-ascii?Q?iVBu18BLKWO0BAwJ7GeqZLuLXn2zKHJ38mDEa6feU7C0glGLt50SoQ9j9K+j?=
	=?us-ascii?Q?rfo61+WLGCYiwjxSHHkPKxe8+yxpDjRsVW2UpHsg/zA8riClcZ/Qh5B4ZfEc?=
	=?us-ascii?Q?ucydH/fETqWIE662ubAMn4CNnkBE8Oaz5EPEt8xWWAIuQl8f7FLNZ/JzSU6X?=
	=?us-ascii?Q?6m+CLk/MBVzO7AzrMx2lIbiTHqVTzkRYNpvB30VOYuKAlk2WKUM8cdHdriKI?=
	=?us-ascii?Q?JJ4lgsyDLkYSAg3UF57qJ1diRXxej8JcUMgXjteMrsNEvMMYZ0bJXS8ZxZ/g?=
	=?us-ascii?Q?vcJBOkELM04wsahmPDzA6GqYIaM73WbKKoQ4XGnySE1unLBawWGYVq78Kjwj?=
	=?us-ascii?Q?3hrr7ROFt09xr8ltRV3yzW5w4uvOh3QxqkoyElbExBzKmK4dDoUtDfj2fcJU?=
	=?us-ascii?Q?AsXFxV9TjTYLHDxOMYOXe5nuCihMfGSSAIaHlsHqhjolrbcWCkKLB+7AP9xt?=
	=?us-ascii?Q?JRQIgtLtsqAkRNv2R9ybZIMb36yzSw6E3zsefItcUa/ZyZsZ/GXvrLCkDcBs?=
	=?us-ascii?Q?sca4mXEfKgVNuzsbiQpzw7fjZ1tzfQYQO0qDPo3IOH8aL27bxLUXfBs0/x6R?=
	=?us-ascii?Q?4BqZb47XxxczI4gp4lRFC8BJzRQornL4I8BXgmWSfl+Y0PLbKSiysRN86uWi?=
	=?us-ascii?Q?zU8W0bJEyP6DqciqWnCxeR3g6gxWUxxxMIrhIZlUAQ6k4m8z5x7vZDYLtI3j?=
	=?us-ascii?Q?tw1pyvhEwP1brTVHlmIQFe95x8EpLFIAxWXuERs7VYdcQhS10vzNEf8uyFwT?=
	=?us-ascii?Q?0AR3+ngcRS0PB00DMTjB2m3x9BYdP88yyx3+Wgt+XkxDnD2mDcdGhz97FKa2?=
	=?us-ascii?Q?1AiYamr02pKDHkaKOK89Yxz08pjVBEt5EiT7fw9uEatste6lCy01adu/WupM?=
	=?us-ascii?Q?HQZvpdfdyoLwFTOmDwd0XVR4CGTd5AWsIhF+7HVs67O/A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	6:eMWEYpNanwMe1EORk06WU0hI0LayRXnWUF2zzoZT5PCGT5ahoJqkDUwnCFXDkfP8jck/dDLShxNC5j79a99S6YUEa6q71z4nUDXJcT/o8RK6yiV70xudvQ6cAsi08svo6PREFPz5QJpTogC1MzWU25xlPpXXR6gx7xWgzMq3GSu0CeEga1QWR83zADgPUnkeyDQ8pgqzqcJ4kPQq4bWkCJNaF62nAFT9jzZ+McWu0ugelSfb2CNyfrA/TLaw6eleCiEDnzWo9RwShlaWgl3bLTfVJ2dJFS8YLa1ZIsb1yacgTh/SI4E/sxT+eeceFi3y9POJn+gBiexHKt5W1vBirzIm8YOEH7TxfvXPuA++Ddo=;
	5:bLfImDTvHakCAgqgjvef0NPM1J6a+g/BdFsgyjDFADX3wF+RPmgHpw5q2JwIuBVCKIWprsIWUGVu4gdPGwsdPX+VWixiTGSLoyBUND684fXmKHCi014duTZcqWa4IUGXHRLVD4ThG4zjfDfun8mxm6DxMw50RiAiqAlAtGaH5I0=;
	24:wa714FtQeAfNt3IzydlkVYaYoyLlbsDFnsvFAW6LRw5WCBrw8BfJKZcpU2FEXGsHBuHzA99Lo0n1a9mtMdGsSH39YNm4OGEDKb5CUg+aak8=;
	7:UUwCvg9ezHzacS0yLqF9DnvFJlAvWsVw1vfofQlg7CNv8rI3hfNjSohm2Kv9NNg7bb5j62PI1MzGa2V4yQ5UFH9o/3xydd9br4SQneCQ/66qHgyVbP/H0QJnNWCtoJi7WVwM6zESQh/x9A7xDMq3AO9PLEWEyO7UPj5A0oc2jI87WCwZu7G9YX/AQVok9IAsB/vELTSae4txu6YPQJVzv4IseRQFf5JS/JkYZFJjGPASTjsLLyMrEY2GWYs2zLAv
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:40.4491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d65420-591d-411c-e9ab-08d547cef8ea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1331
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.85
Subject: [Qemu-trivial] [PATCH v6 07/29] hw/i2c: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:27:49 -0000

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


