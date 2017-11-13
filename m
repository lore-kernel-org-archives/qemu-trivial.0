Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOq-0003W9-Kc
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOn-0003Mc-BD
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOk-0007Xz-6B
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:13 -0500
Received: from mail-cys01nam02on0060.outbound.protection.outlook.com
	([104.47.37.60]:55840
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOj-0007WK-Sn; Mon, 13 Nov 2017 17:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=U7kKAWV+BDHAUEro3mmyB6A2LU8BTDxou+qlPwQ5wIo=;
	b=HOnkQwuRqdBiARDty4VaIzLKL++aLow1WvaTp0/mgEUi1VY0ADQRGCE3ZNyI19UCVHwdBDguGZ4WMNONSghhqz/F/OKvPj0w4t2qInv1Qi0FwWqMawx4JGGvl23KsD1mAECv2fckzGNtCiR13VtIgZGT+DPPWQl6cLDpRKjDUtc=
Received: from BLUPR0201CA0034.namprd02.prod.outlook.com (10.163.116.44) by
	MWHPR02MB3280.namprd02.prod.outlook.com (10.164.187.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:06 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BLUPR0201CA0034.outlook.office365.com
	(2a01:111:e400:52e7::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:06 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOf-0004AG-2J; Mon, 13 Nov 2017 14:40:05 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOe-0000dB-FB; Mon, 13 Nov 2017 14:40:04 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdv5h002886; Mon, 13 Nov 2017 14:39:57 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOX-0000Wq-DS; Mon, 13 Nov 2017 14:39:57 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
	Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>
Date: Mon, 13 Nov 2017 14:35:57 -0800
Message-ID: <a78b2c8879bded4abe59b71d7e9fb172e784a35d.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(189002)(199003)(33646002)(8676002)(5660300001)(106466001)(316002)(63266004)(189998001)(575784001)(54906003)(50226002)(81166006)(305945005)(2950100002)(81156014)(9786002)(118296001)(47776003)(4326008)(8936002)(356003)(2870700001)(23676003)(36386004)(5820100001)(2906002)(50986999)(76176999)(106002)(50466002)(110136005)(478600001)(39060400002)(36756003)(77096006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3280; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT031;
	1:DjG28QSVqblI4UetcsWEGAAEYF15qos7zpgYOEvWn3mmdyN/EAwq6SUXwfo5/indpT0PshlLM9BiTBOJjtDQgTSA1Cr09T4AaSAgH3jXRZ5SieXYZYt6Kk7+EyRtfU4t
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d6a89c-d606-4406-594b-08d52ae77cd8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:MWHPR02MB3280; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	3:sYI6OcJkwiG9XNBV7c+MahI0RFthPPitRtcL46vt8NiFw7pSVWeKURjd/uy5ASDZi1jZO23qZ4oCbIdwEstLWgtFtmGOUsgrbg/eP+zbuBgtXDhGNVCUc6L0AuXQsb1GQ866y1/mNEtmByzbOHlhdO30uyFugV7k/sYeA3tTISW6FtDHY7RKZJKi0zlb1bQV6O3+eNKas1m/TJq9PpGGYZkVCmzFeQbrG7zNUNSDuywBbmHdjF+QlP7x+iZ4n0gPDPEVPAQK+Vo1cNgkQ6qV10euOS3wvytjin2i9SFzRfzR+9cE7usLaGdbjxW7eR7Xfl13hGT36mxsbFra9Tp3mXHPNzkq93vg0cxIazpARLY=;
	25:ajrQw08jVV1kjEXikP5FS1XfE98I0E2yO0ta5pdX4bftj40xGU6wRQHQJqol+wn24pb2P4EMdFyW1M28ULvN9P8KFyWvgwUlwDdIuaL5PFMWgEVA7mrvCfIKQwF2/ESCxANoIKUEjGz8xDSkChYEy3BjxDmfscJxEJonA9ZN4MjNbsU+88q5knfN6fqlVPzCP65kvwJb5vDqYwW8OOmBJD69/4m+ldbnWGsOb2vKXjworI+L2tEocaxNRWHJaDbtithcXDY8vQBkFx8cAXEmCDbP+ZfnSh8VSyglZt67NiBmK9mBSh652k26WcHd0nOYjY4VCXxWnd4ZrnS1D6GHmZBTRMRYcg/2fIJ37TtwGeI=
X-MS-TrafficTypeDiagnostic: MWHPR02MB3280:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	31:SA/12ZufGQwxCbjrx2fCR3wCOCclnDfugpy9uLF517QC1hbwnc7rcAFtnqG4UB13f0iDRuHW2lNv7c1Ej65lJF72EK/xQEiR+ygUeQSJGgtTG3/FXX7NvIi4VhcWw5Oz07lWJPz++fUMsOTFBRlYrrBm3gc1nz7L1LExQnhP0yjByJ3p4Dqtos2iUuHhWPaixI1/BEIw5oMG+N93OzYjDQ+qrrIMLZZlEMIwRAXoakk=;
	20:s0IhG48/W/qeP87CR8yfOy/uhAzoB3GdUgZHHnL9DGixYxI8NNFM1rH+ivaDlRj2TKHFKHEYda1TUjDVogPY+RdzF99jBOz5BYKZgpb4NsBPALbdamuaWLWp/LVSRgmWwp3gVE8PrqhpW8DvW2Sd5+Ziy1OudovsfqD9rQlwsY1nIPkqzi68kyNcpPVbEgp+SAVM+8cmaMBh1xCp80jDOHq2JbQVClVa8WBwWCljV6EFrgzp9z4SivOvWjl/hhWo2v4+/N6nqld3o0SE7kgEzS/bM/ZUj/e2Ql+yDT6DyDLOuPh7P/7LJvMyDTHsm8ERT7tVeuILwdHpQw2hQuffqKMWXfqXeIEcfKhoZpX2zqZ0zBZzjo8nLCj/1lvecd/ckZPigEZmZ09+PujhFw3J2DGhMuUY6VtOllLuYUnThK7zOm0X1ohc0IBmFkuj6u59nBsYs/nKowuFMDaF5FvHEs2HTRyjffrOcxF9pl7NAEI9HcR2EEAIzQg8C3onBbSu
X-Microsoft-Antispam-PRVS: <MWHPR02MB3280F49FC028F0DEA23860D7DC2B0@MWHPR02MB3280.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(3002001)(10201501046)(3231022)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(20161123558100)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3280; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3280; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	4:GUM70DKTDtRHsIcbUn6ks/xTiT6ay7iWRUVuDCg5jHcQkwoVjxVrVIt88SO9EV5vbbYmCj9DvZ1cyFg8rVhGL27EyR9NH4ZhQVcHnRZoFs8VTp0iaCh2M3kice21HqZyzanwqmNp4LmFYgPeXBxfLJdlK63AjeTrab3IeFTZUv7tgWe+SS1tAbAeo6phIClsyf7tfuzAZkvx/IZi1NrfnqIjIe2PjDWDrMPfVRWq07HUjO0QgfAV84SJwC1T6QMmXBpZLBAmML8JX+nEIBMbjGIFLJJAkn9SHvM/dnpqvodYZbGVcZfyHLaSZWJvdrCg1oY2XMCCFdBpBKTfFbuybQ==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3280;
	23:M4yXLvrrk7hQD3GgwDEXQdYa8BIUYro1NVxmVhrIF?=
	=?us-ascii?Q?BHe4L5iwWB48op+UlWxSqeUwpGbFU08yYOyfCtqYMrwwHRM3HjB0XS1VoshR?=
	=?us-ascii?Q?wz66HKBlPQvlMAt5GW/8J9f+SiTzXfVUXt0d612v61bMNZFgaVwHAopF04US?=
	=?us-ascii?Q?o/dfrkJc9XiLLs9vIKuR0E4D00ZnDw2hi3U8Dg5eLpSs3ywqofX7zjv6UOiy?=
	=?us-ascii?Q?Hx1tuhR5NCwFO28dcO01CoBY8yMFtUBx+A5HibZYPOOQ3H+x/8iU8cRoCsmC?=
	=?us-ascii?Q?ERNkmDgcW8eOqEkE3SneBPzsyV4MlkDmv/1ZTc/TdCe3dVUCVNJitxSH5BOb?=
	=?us-ascii?Q?mLTwvcOvgA0ZACFDRMpDVz8U6j8N2wVsF4/CLb0xgUB1smUrxtD0OMBCy3FO?=
	=?us-ascii?Q?aj6QkBjxGknU9B1R4keNVYF/7MePPgae+fTy59PnYJun5op0Cpfzyao6Mk8N?=
	=?us-ascii?Q?1X1f4QMy/03rv19qEltT1uaiUA/5P0L9zuY1B2dSDrl8yN4tg+c8w+Rrsygg?=
	=?us-ascii?Q?mqtAOK8QoCV5lCDSH7MDkJ0eT+vvDn3b0fqGIjUxPxpxU1+6fEoQFin81S+x?=
	=?us-ascii?Q?Lj2TkGqlcUBTNDntiXCKy63OdS30K49veQWfxLDuYgNjHbDyYqy5DsWiHK4e?=
	=?us-ascii?Q?KSmlG41KfPRK594/zJtiJr1VESJWGWbK7HvhvBTQnWylU3qZHXNTzQPvUbVE?=
	=?us-ascii?Q?RvuRwkWxiOkY9g3Sw3zfoH3dHF0vxa4ZxaGZtcWaYF9kvj+y5PD6/jDp7W4u?=
	=?us-ascii?Q?Kma8VnaCRjt2NyYY5SP/xxjwhXh0ejPs9XGA4Kcm5MWrj6HP0nWuOGgpcxwe?=
	=?us-ascii?Q?Ax4T+lvEth66LtDy4yrhfuoIUHkcWbWb4l7+51G153ZdFI8pZp5QMsPN1LqV?=
	=?us-ascii?Q?C/Oq5jWpKf4y4UkJDVRu+UbChraElR3SmXpMHUPfvpHRLE+4AMwoANONqeH1?=
	=?us-ascii?Q?nz0/A2Kb7v6mo0ESaqCEV0kWjHeNH5LogU5oedK8laLIgKT3T4KenbkNupCd?=
	=?us-ascii?Q?lP5yREIBxBPfj65fMeVpzOjhB1wzngEHyAqtvFtiFV+Ag=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3280;
	6:S5wNM6tFkRebInrsDyoxsjanWS1RwoiyCST0j9zhXT7cCltYLI7FM7QClCBdzPxTDtDI9p3mgBgMOJ8orTL2gNjoiAx57Y4pFgUUjMea1AmRxS6UkivUim8p1jJhWVPlvyj2W/kLVB+Ml0jUf2dhnZZh9rQNhAyVKTjNRGm7POrSflitAYzQMbGE2/5N2xe/NgMoSvSZpyFXGu4uONTftSSnvaWKypuc9mlkpRUoCctXZPlvgx+Jd822HPIqNVc35lYnw1V/IltJFtYTlfjNZtlpW2N0N8/aoIHLeQvp7WuQ+rw6UnwAnj0tGkaUrNAL0EDMsgoUbwb2iU6Vc2RiYa2xJE88UYL7SNdTKwoa4U0=;
	5:RhXg3qqzRT8xxapAIHwNxCG2ZbDAQ/CBmRzF7rUP4eKISh9rWxXmNchEf8KwfbWguK/BrJEnobTSvnQdENaG9wfwKfHx89F7pSQHjmne3m2CzLPQtEIlzqRAekE8ejRVrQVQaPrdPZq0iHmGydttYdQ9Kgs76ukREPXGCYdCFF0=;
	24:OkNcSpia1U2PX36jMoFrkANrwARHfpY4RbXwDEWUUzVOD1GvhS1r/0z+mSQVAdw9xnbNO9GCSg+42KaTUs+Jwcs8JeucDXkH/ikDg3uvXiU=;
	7:yEUnEKwmtZvOiAFpPNWFVuLxdHaQJSkFYZx0rSZeP/KUGAZp9tORv8jJPA6wzgTpEUBN8LpN2ofTylcZ/sBP73l2HYIyrDjLxeroRhFVZknsV94WmPYK7Lfp9c0sl6NmxA4AA6Z8DKfOALhFvTmLT3fBCBM274tMs58q7u0Q+W9ESBrDJ3YbGHODdRhlvmKS/3z3BlYsQeoHrC/3jPtIZ4cHEZLWP1Yo10cEkj9Ev2CPe8930TL3DY1aSD8Is7P/
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:05.8627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d6a89c-d606-4406-594b-08d52ae77cd8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3280
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.60
Subject: [Qemu-trivial] [PATCH v5 24/29] hw/sparc*: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:15 -0000

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
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/sparc/leon3.c     | 16 +++++++---------
 hw/sparc/sun4m.c     | 16 +++++++---------
 hw/sparc64/niagara.c |  4 ++--
 hw/sparc64/sun4u.c   | 10 +++++-----
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 8c66d5af24..bba3aa3dee 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -139,9 +140,8 @@ static void leon3_generic_hw_init(MachineState *machine=
)
=20
     /* Allocate RAM */
     if ((uint64_t)ram_size > (1UL << 30)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d, maximum 1G\n"=
,
-                (unsigned int)(ram_size / (1024 * 1024)));
+        error_report("Too much memory for this machine: %d, maximum 1G",
+                     (unsigned int)(ram_size / (1024 * 1024)));
         exit(1);
     }
=20
@@ -167,19 +167,18 @@ static void leon3_generic_hw_init(MachineState *machi=
ne)
     }
=20
     if (bios_size > prom_size) {
-        fprintf(stderr, "qemu: could not load prom '%s': file too big\n",
-                filename);
+        error_report("could not load prom '%s': file too big", filename);
         exit(1);
     }
=20
     if (bios_size > 0) {
         ret =3D load_image_targphys(filename, 0x00000000, bios_size);
         if (ret < 0 || ret > prom_size) {
-            fprintf(stderr, "qemu: could not load prom '%s'\n", filename);
+            error_report("could not load prom '%s'", filename);
             exit(1);
         }
     } else if (kernel_filename =3D=3D NULL && !qtest_enabled()) {
-        fprintf(stderr, "Can't read bios image %s\n", filename);
+        error_report("Can't read bios image %s", filename);
         exit(1);
     }
     g_free(filename);
@@ -192,8 +191,7 @@ static void leon3_generic_hw_init(MachineState *machine=
)
         kernel_size =3D load_elf(kernel_filename, NULL, NULL, &entry, NULL=
, NULL,
                                1 /* big endian */, EM_SPARC, 0, 0);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         if (bios_size <=3D 0) {
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 24c2b8a555..e9e0ef0630 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -260,8 +260,7 @@ static unsigned long sun4m_load_kernel(const char *kern=
el_filename,
                                               KERNEL_LOAD_ADDR,
                                               RAM_size - KERNEL_LOAD_ADDR)=
;
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
=20
@@ -272,8 +271,8 @@ static unsigned long sun4m_load_kernel(const char *kern=
el_filename,
                                               INITRD_LOAD_ADDR,
                                               RAM_size - INITRD_LOAD_ADDR)=
;
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initial ram disk '%s=
'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         }
@@ -681,7 +680,7 @@ static void prom_init(hwaddr addr, const char *bios_nam=
e)
         ret =3D -1;
     }
     if (ret < 0 || ret > PROM_SIZE_MAX) {
-        fprintf(stderr, "qemu: could not load prom '%s'\n", bios_name);
+        error_report("could not load prom '%s'", bios_name);
         exit(1);
     }
 }
@@ -747,10 +746,9 @@ static void ram_init(hwaddr addr, ram_addr_t RAM_size,
=20
     /* allocate RAM */
     if ((uint64_t)RAM_size > max_mem) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d, maximum %d\n"=
,
-                (unsigned int)(RAM_size / (1024 * 1024)),
-                (unsigned int)(max_mem / (1024 * 1024)));
+        error_report("Too much memory for this machine: %d, maximum %d",
+                     (unsigned int)(RAM_size / (1024 * 1024)),
+                     (unsigned int)(max_mem / (1024 * 1024)));
         exit(1);
     }
     dev =3D qdev_create(NULL, "memory");
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 7a723326c5..996ce2ada0 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -152,8 +152,8 @@ static void niagara_init(MachineState *machine)
             dinfo->is_default =3D 1;
             rom_add_file_fixed(blk_bs(blk)->filename, NIAGARA_VDISK_BASE, =
-1);
         } else {
-            fprintf(stderr, "qemu: could not load ram disk '%s'\n",
-                    blk_bs(blk)->filename);
+            error_report("could not load ram disk '%s'",
+                         blk_bs(blk)->filename);
             exit(1);
         }
     }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 1672f256e7..1fd1c3c861 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -166,8 +167,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_fi=
lename,
                                               RAM_size - KERNEL_LOAD_ADDR)=
;
         }
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd above kernel */
@@ -179,8 +179,8 @@ static uint64_t sun4u_load_kernel(const char *kernel_fi=
lename,
                                                *initrd_addr,
                                                RAM_size - *initrd_addr);
             if ((int)*initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initial ram disk '%s=
'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         }
@@ -327,7 +327,7 @@ static void prom_init(hwaddr addr, const char *bios_nam=
e)
         ret =3D -1;
     }
     if (ret < 0 || ret > PROM_SIZE_MAX) {
-        fprintf(stderr, "qemu: could not load prom '%s'\n", bios_name);
+        error_report("could not load prom '%s'", bios_name);
         exit(1);
     }
 }
--=20
2.14.1


