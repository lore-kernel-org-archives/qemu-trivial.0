Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBQ-0008EU-TB
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBO-0008Bw-CN
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBL-0007UM-CY
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:30 -0500
Received: from mail-bl2nam02on0078.outbound.protection.outlook.com
	([104.47.38.78]:3274
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBL-0007Tn-57; Wed, 20 Dec 2017 12:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z2U4po5LNZUJvZ5LT45duS3gINJFEXVTxuAqqNneCfU=;
	b=Zq4VoR+pzttujxKLBc2PwKyxgwGeHT9JE6FMz2IifCrAPCb1OxshoQYcaS3PjFOw8JVc69xLC85ZujO7l+3D6T9GiWy7Zg9D/WevjGdHgypo+Qpul55IPiXYNPdFYhUQo6oEdqVL6PE9POIp9OONMDzr7tK+az0lQ5MlQJ9GnKQ=
Received: from MWHPR0201CA0101.namprd02.prod.outlook.com (10.167.161.42) by
	CY1PR02MB1333.namprd02.prod.outlook.com (10.161.170.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:29:24 +0000
Received: from SN1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by MWHPR0201CA0101.outlook.office365.com
	(2603:10b6:301:75::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:24 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT006.mail.protection.outlook.com (10.152.72.68) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0004tg-C0; Wed, 20 Dec 2017 09:29:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0003wk-9k; Wed, 20 Dec 2017 09:29:23 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHTEht020050; Wed, 20 Dec 2017 09:29:14 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB8-0003vk-2K; Wed, 20 Dec 2017 09:29:14 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:24:58 -0800
Message-ID: <9b753b5f5ebb48982b1cbe98881c3e7073aceb46.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(39380400002)(396003)(346002)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(50466002)(110136005)(6666003)(81156014)(81166006)(54906003)(478600001)(47776003)(2950100002)(2906002)(7696005)(36756003)(23676004)(2870700001)(76176011)(118296001)(356003)(77096006)(8936002)(106466001)(50226002)(5820100001)(316002)(6306002)(305945005)(5660300001)(36386004)(4326008)(59450400001)(9786002)(63266004)(39060400002)(106002)(8676002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1333; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT006;
	1:LymBn7DgX61bmHh8iHwRxRVTpDbR3ZBOH/we+YStDSC4opyYM8A+U/lA+zF2Agx0h8TsC3rsQdaV6zvzGr25e909LQfilKAH2O1intajpUlCRKEV1iiynFOkyyOtp9Lx
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0646013-05e2-4d4e-0e92-08d547cf367b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:CY1PR02MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	3:XIhaGoyWzL+YTc4VbEhlFgGr/fCbHL9Cox/MoGGjkzMaHIqiStvgxhoFg6B9Qz6r6420iyn4fJ9sGJdMG2gFk8U9j5WIQVuLBDnFX4BCmF+2b3PAYBBQ3nd1ppvFT6bSwjSANCNWAfk75q/R9NVAHYcv/FcMTUoBAWvCQXVRDWjuJeuptOqRKGOds6DOTiyplqAyWRWdlh+kNw4pSlV89DHBn+sDHHNtOTKnJzzo+FwRJOTGsgtbOPlP0maH7vVAf6TCWxg5JuJ/ZxxVB/xpV7JkPOaJPVgqAVxZRptDywFiWL2XUKYHcxOg2pylwjA8KRzYh3nln6q9Py+9noHISvG7zTrrk583NnMirntmAKs=;
	25:lz9yCg9ZxoCTr7Kx5leRexyS/s+X/idP8F5F8dnQ9MnPGK57/aLyb8hyAVEfXJz7BWxjVOa3jxdtLMTN0BDnTuGgkgO3Tt4j1ILjIDkMxEePgUD5pYLlpE49l4GQkP54Vc9jao7QS+raGhT1JFxVrBATaQ4RexndAVBmrFYdPHh/U4ji/1qX9CjDI5/kVcVaIwW+vxPqI+/VW67f/f19k5TOurbM8Zvi0+hs7BOIaT8UnqN8eE5VLSx5kchK5ndgnzf/Qkt6yLFFxNh5zMg0gTAbHGNB94CNO21YWWvwZi7DCJSTiA2K1VJbi9s4x+q9E7qsjW45bpEV3Xfky6uFhA==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1333:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	31:5/uVWVMFbJ6MRplgM1XrUevPFKRDEKL4npXkHpjA+IHJ3FNNoN6a9AUAaxywIPT71xQaAWY2sciDcqHDeQmSQTFwUrkC53Fu/P0T+/3Lv+QWkgr5IavpDApyK9DT27SPYi9VHwc5rmq9h6mQwqYmcwEJABZ0Gi5nPPfALlg3MrrodnRclYGaNqKgSUFYLVQjVtk67+swsO09pjvEOzFXUjY0vnII3CnOHwBk3RlZjr4=;
	20:R+i/a0uKDhm+Bn2Bhw5KAk8Gxe6qwErrfledMGQQUaC0bAZVfCy5QikpPsMUKEs/wd/+zduVD0jPO0z1KfW7Cw4Nih4zdO0LM67QKmCdtFGPUFBomuIfpoRYxIewMkYbys+SGsxWkym2O0o9IGtCU0J8lQoV4t8uKcgCu3fcpFPUPoi4CfKqgPfHfXvy0NMmwr8MdIvrPwR677OQJnfZVFgSk1RzZWc7LEO7jyHkxy+kc9FN8XlykOAu40C6bXLVqFWxoo2FROFqKqKlQ/w4aPpbbF9l8n8sUUDrSpElQ+ucknCIXUXfcGhl0Uxv2jnYwlzcOwwfPuGz7Dv1EkDhi4s5rTvPqlqn42Dn3nQI8EAAD49tqKJfr90QzKE/HoVWVH1Aje1FibZP8lrHDyFMdN9sS3PMr2AkVE461oESCEYV37NcpssaRcspgLH2lFsdPTB1hSXHoe954p6OhSJ2XDEkq6/xbe+Dhi94T01vKSQz1fkvZbP1+r99sguZcm4N
X-Microsoft-Antispam-PRVS: <CY1PR02MB13332EE79823684D71A8A4D5DC0C0@CY1PR02MB1333.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3231023)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041268)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1333; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY1PR02MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	4:8uERfb4V+yG+WI3RW+/cTDh8gns9Xkumt/6EFIv5+1hu9dQZSTrDNalt2tn5UsTotnqSCzp2s/7xjyFQOsaYJv53wc06heF1hKqGonpYImQmgZIttgfrKEsZ9ZDi4Zw7rMQyassqfZqAuKH12KWoFw1itUntXqiwina/OCcQgQy/eH6cx2ZFYrkyXeAe3x9EiitpeUGH7qgHbG2caHS8BXrO5CdVbsosYDugMbOv+edqYMV0UVTrvuOvPgZxIcXJcD1fQOsiZLulHh4epJEGKEwAEmTwIzq3X6hcNsPxcnAjwKi/D7wzF11reBNRfm2mkP5gfG00J80uq8QHT4DQ9BCkiJiHbcOMzGsOcg+E0hmv/APY+IPoAtfO3QoC4xJcAzSkXM1lFZzoRbjek4PlITzBHFjWQtbQI7lubI3gDgU=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1333;
	23:cWoMywMOy5JDKpl2oFVx35NMaSXH3PxCtrg58bhg6?=
	=?us-ascii?Q?k2AynYfVygXEq3p764zm3sNLwJwqEHHOrq+9DDiABws3IvLggNOxzv3HP9Cp?=
	=?us-ascii?Q?uO+FDkwYSMG9D7xO+8EFa4attmF1q4wVwRExCW5p4n5NuG1XCx1SdlxQACkj?=
	=?us-ascii?Q?my/wOeBtc3x0K+QGJbeB0EuTyyQ2QlgM3yKzL40gXblGheu7MNfLSWkUU5u5?=
	=?us-ascii?Q?eB3Mh8R2dPSSAAxJ9L6yfVnl4A9kYiMfOXrSk14II3StSNesltdJx+6HVCVy?=
	=?us-ascii?Q?7h5BfdVvZozA4FSbh+4IlOdGXvZziMhFqKflnk8zVAiEp+8/BlFuUuo32zrY?=
	=?us-ascii?Q?n3ORmmPTYVPH2SI1oLJoSfg9dKvcFoT/OL0ARo8DZ3at6lJwUcfchGAs8Sxz?=
	=?us-ascii?Q?/uI8QPMhZnUqxARai6NA/4xR2LaYKQI3ou8VukEhgsM6oIC/ZAMPfhMdbJvT?=
	=?us-ascii?Q?IfSy2l0uRyd6ESHrVoEaI38mMifRUrGuyko4MPq8rsYIq+VTTcc6Vlcb8ghp?=
	=?us-ascii?Q?eQVuBFiYBsXDWQklToOQpE5Wf2oH0FUaY5CNrPWgjfboZMGH79adZad9Tb6+?=
	=?us-ascii?Q?oENLKUhD7yYyrILpRj6Xyx09b1ULpyfmPGpJepzsE4IabrRV5JNKcKcjbP24?=
	=?us-ascii?Q?WgICAPZTaDVhvU5WJ5hsuVtyAFvbtFsWPW1OY4p0QRYTpiZvwgv+WZedUNwG?=
	=?us-ascii?Q?Io5zCXhCdPhuAPQpHlgQhc1wuyGoL+SEHoLRTn9ha5X12xK2j2djyb2P9Odm?=
	=?us-ascii?Q?1Yr51YdLJhHAT2BbtC8S0hQBUvFIFZltQWdlXsi8JVkdgKMdKAgwuLD4juaB?=
	=?us-ascii?Q?03kH//ps8+FAF7NaevxfnPeeGT+mkrp+s8I8575Uz1tgS1OaJLvjJezfpw31?=
	=?us-ascii?Q?NRligXXNmoEhmcq5MRSkzAGFSttR3LNA3vA/oUyDXUIuQHp8pHX7myS3Pu/w?=
	=?us-ascii?Q?EXC47mEXc68hWqL7LWnAvUhY1yg3VV0pzcaSVWqRN2Z0XSAV+MBokAeIfeHT?=
	=?us-ascii?Q?UwJcWk86tEXxMpJqoU40xDNL0MFqOz9s7kCgYfLUhUdGkwreNm4cZLEzhRNg?=
	=?us-ascii?Q?CDHZ5Y=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	6:BKe4382wF3T9SdkOFA0sW5s7FHjEH59e8w9ZSblElLfGnbMCboOKZYw/cAa8B+xMgN9S3IdC6b2j48LNeLh8MdEkR6dlr0JDkOI6A3TkpMOwrghwiKeWPnIAc3qSiw5IBgmhANCY+GvXMvnHn+cs9SOtQDcySV7XOaCFhOCtRRb9NJZVPHSpX5pcMQv12ADGgmYWprZaOUbj8E1mMeAU9bp+0xWsI6XpgKaFZ39AGxQW4ie/bGQzvTSX+cAu1SmM1xm/7G+SLdL2mb81qqEXSvnzscY95yoWTSox7E73vp+5KRQ2A+jlX3r/UYjeuaSGl9URuRnuUzRL7lrx9+Tsfttu3jFvUg1FM+r0od9HCXk=;
	5:IruFsn4GjN8+AWgHlnaHyzH/6g1cMu4/NBDjJZhLw0MEHsYi8eU/d4+Mf70EKGksKLQUZDfKpUsXHfUI76NEoVBsRcRAgHHiT653zjfLUtyMGQfX9vvIPYKEMMxpO4XYyle9hF61MLdee/Lxe7rQvgVpdipUxjd+dCD/xTuIOXI=;
	24:ytlO7cKYs5PiVwIrPVyEvSDunXzDwNQ8gernjtAVtV3BZwMWnJCGxjK553eUrDcaa8fxBOqIDLAMVutO3SDdprSSdIR/ySu9lAnSR1zor8I=;
	7:XwkhUoKgmdl+AmHw/h6+lcmB0JIYUZkN+2oLC6Io2/P6xkjC+FQs3RQQZnGpyhAXoDo3O1nZRglc2gwFW3oK2V06rhAx8dhLN5l/X21kA2lva3y4+GMhin/nz1P7vDXSA9FAwu5uFtrnlVWgp8BfuMieh6vxktqYgEM08BDwCG/ZmZHvAR4NygVInJjun3tCOO/9ztHSi8ysSpHowm63vmj7mJzNeUqcR+3k072UgLyCYjl3bkPIWfwlRSdZjml4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:23.8129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0646013-05e2-4d4e-0e92-08d547cf367b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1333
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.78
Subject: [Qemu-trivial] [PATCH v6 26/29] hw/timer: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:32 -0000

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
V6:
 - Fix indentation
V2:
 - Split hw patch into individual directories

 hw/timer/omap_gptimer.c | 12 ++++++------
 hw/timer/twl92230.c     |  3 +--
 hw/timer/xilinx_timer.c | 10 +++++-----
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index ae2dc99832..ddd8d9e9d0 100644
--- a/hw/timer/omap_gptimer.c
+++ b/hw/timer/omap_gptimer.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
@@ -356,8 +357,7 @@ static void omap_gp_timer_write(void *opaque, hwaddr ad=
dr,
     case 0x10:	/* TIOCP_CFG */
         s->config =3D value & 0x33d;
         if (((value >> 3) & 3) =3D=3D 3)				/* IDLEMODE */
-            fprintf(stderr, "%s: illegal IDLEMODE value in TIOCP_CFG\n",
-                            __func__);
+            error_report("%s: illegal IDLEMODE value in TIOCP_CFG", __func=
__);
         if (value & 2)						/* SOFTRESET */
             omap_gp_timer_reset(s);
         break;
@@ -394,11 +394,11 @@ static void omap_gp_timer_write(void *opaque, hwaddr =
addr,
         s->ar =3D (value >> 1) & 1;
         s->st =3D (value >> 0) & 1;
         if (s->inout && s->trigger !=3D gpt_trigger_none)
-            fprintf(stderr, "%s: GP timer pin must be an output "
-                            "for this trigger mode\n", __func__);
+            error_report("%s: GP timer pin must be an output "
+                         "for this trigger mode", __func__);
         if (!s->inout && s->capture !=3D gpt_capture_none)
-            fprintf(stderr, "%s: GP timer pin must be an input "
-                            "for this capture mode\n", __func__);
+            error_report("%s: GP timer pin must be an input "
+                         "for this capture mode", __func__);
         if (s->trigger =3D=3D gpt_trigger_none)
             omap_gp_timer_out(s, s->scpwm);
         /* TODO: make sure this doesn't overflow 32-bits */
diff --git a/hw/timer/twl92230.c b/hw/timer/twl92230.c
index ef116c636c..fb4c37b4e4 100644
--- a/hw/timer/twl92230.c
+++ b/hw/timer/twl92230.c
@@ -614,8 +614,7 @@ static void menelaus_write(void *opaque, uint8_t addr, =
uint8_t value)
             break;
         rtc_badness:
         default:
-            fprintf(stderr, "%s: bad RTC_UPDATE value %02x\n",
-                            __func__, value);
+            error_report("%s: bad RTC_UPDATE value %02x", __func__, value)=
;
             s->status |=3D 1 << 10;				/* RTCERR */
             menelaus_update(s);
         }
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 59439c05be..2d658b5791 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -127,7 +127,7 @@ timer_read(void *opaque, hwaddr addr, unsigned int size=
)
             break;
=20
     }
-    D(fprintf(stderr, "%s timer=3D%d %x=3D%x\n", __func__, timer, addr * 4=
, r));
+    D(error_report("%s timer=3D%d %x=3D%x", __func__, timer, addr * 4, r))=
;
     return r;
 }
=20
@@ -135,8 +135,8 @@ static void timer_enable(struct xlx_timer *xt)
 {
     uint64_t count;
=20
-    D(fprintf(stderr, "%s timer=3D%d down=3D%d\n", __func__,
-              xt->nr, xt->regs[R_TCSR] & TCSR_UDT));
+    D(error_report("%s timer=3D%d down=3D%d", __func__,
+                   xt->nr, xt->regs[R_TCSR] & TCSR_UDT));
=20
     ptimer_stop(xt->ptimer);
=20
@@ -160,7 +160,7 @@ timer_write(void *opaque, hwaddr addr,
     addr >>=3D 2;
     timer =3D timer_from_addr(addr);
     xt =3D &t->timers[timer];
-    D(fprintf(stderr, "%s addr=3D%x val=3D%x (timer=3D%d off=3D%d)\n",
+    D(error_report("%s addr=3D%x val=3D%x (timer=3D%d off=3D%d)",
              __func__, addr * 4, value, timer, addr & 3));
     /* Further decoding to address a specific timers reg.  */
     addr &=3D 3;
@@ -197,7 +197,7 @@ static void timer_hit(void *opaque)
 {
     struct xlx_timer *xt =3D opaque;
     struct timerblock *t =3D xt->parent;
-    D(fprintf(stderr, "%s %d\n", __func__, xt->nr));
+    D(error_report("%s %d", __func__, xt->nr));
     xt->regs[R_TCSR] |=3D TCSR_TINT;
=20
     if (xt->regs[R_TCSR] & TCSR_ARHT)
--=20
2.14.1


