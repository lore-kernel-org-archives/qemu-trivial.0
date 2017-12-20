Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBI-00086Q-Rd
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBE-00081s-Gm
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBB-0007OH-Gm
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:20 -0500
Received: from mail-bn3nam01on0051.outbound.protection.outlook.com
	([104.47.33.51]:39886
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBB-0007Ni-Au; Wed, 20 Dec 2017 12:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ffeJIWsqd2ZCCY0V+CMTHt700F/DxtyN/FUVlJuAC7A=;
	b=aQ00fOZhg3Ml+M25BTFt6WhlCmQqmKB5/pGwgcP10ZOu5W+nffnP7wmzVpA/itcmPYdDpx9nW6GZVExNNZ/dr2kc/OUtr0Oagz+dj+JrCUW7a2t4vHkmkQfU3m+1TMtJQjDfukv3eLwcJ+gXtDVApKd/wk+p4vwKAfU7N2q5OFk=
Received: from BN6PR02CA0046.namprd02.prod.outlook.com (10.173.146.160) by
	CY1PR02MB1336.namprd02.prod.outlook.com (10.161.170.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 20 Dec 2017 17:29:14 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BN6PR02CA0046.outlook.office365.com
	(2603:10b6:404:5f::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50672
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB6-0003t9-V9; Wed, 20 Dec 2017 09:29:12 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB6-0003vN-SY; Wed, 20 Dec 2017 09:29:12 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHT3Zl019990; Wed, 20 Dec 2017 09:29:03 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAx-0003rz-IT; Wed, 20 Dec 2017 09:29:03 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:24:47 -0800
Message-ID: <488ba8d4c562ea44119de8ea0f385a898bd8fa1e.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(39380400002)(396003)(346002)(39860400002)(376002)(2980300002)(438002)(199004)(189003)(4326008)(39060400002)(106002)(54906003)(2906002)(77096006)(316002)(47776003)(6666003)(16586007)(110136005)(5660300001)(81166006)(8676002)(8936002)(81156014)(50226002)(2950100002)(9786002)(356003)(59450400001)(478600001)(48376002)(50466002)(36756003)(76176011)(7696005)(36386004)(575784001)(106466001)(305945005)(51416003)(63266004)(118296001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1336; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT042;
	1:ef9InP9s84JtrB89VS7dWT9rT0WmbhAFAPuJUV8PckvyVmgaJ0hSCZBqHg+z1folTSMDuOBEIXOWIFfwsUviASrasZlM12UWsOljlB+7oN3L7cCR026pHrruznlHY9X7
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b9b5ba-4116-4977-adb9-08d547cf3059
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY1PR02MB1336; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	3:RzaG63UhxrHIZEk6lfHW01TMr1tvuS7POMLT4kKNssLhIhsS6Mnhee/0ZjTGVNsrofoqyniUxmzPQ+J+jLlycQIC2ZV7wyyf+xeFRWxCF4lHax2LPFovRHWeTYk6yw5e5JBi6892NwyGWguaiRDX4BB/ec+Y3UIV2K1nJl0e7WjUcV+/vkvjeEnh2S/K8MkkWN8NTWhSAub9bIJ8CsRfnxCbB+07kpUk3bB1CS8GhCqujneCuJDzFXtbNVuZVOcqi8sBzW63K3uw4Oe7kRBrHTlMSVhE0AcNlIczeEpjNBOtPIxwktxKRLTXn3qdZ1k1wSK4A6pAZWv9tK+7T1q3XhARVS13JPSDtZHdDbZlklg=;
	25:H8ahuWQ739oM/0GgT2wZliFoIhPXcm0rZg6Gtez3AFZCE7KzMh1i3tUj4EHbWlgIAYX6He1CxHh/TlrbUmuGa3HGScM3VZcbN6N03c+w9xSdKf9SIEwbAxIw2dDxz44exDMJw63/A8ZiyJU4qcd+a2omUwM8AiO11KjREa8JoQBJmjfUQW55FAYBdAzhpj1OjfeCDzKukPTMYfDRkTRSnkQvQeVhTmkA52NqhpP1YbD5LbBFfWC18VSc1USMzJUL7ozyQazEUIUQ/ZYJx7jR9gzYmrYyQXvTqSAPmBg6qoZVrVN91QL8Tr34459IGGwLom1LAqL8P9KAeHglWrVCjg==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1336:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	31:TP/fw8ZFGu15O5fuFy0Ik9EUpVDXwyl7l/nG1vJdcr/zP1eI5gfnAO+c6YWMIGXKjL3OJkw078q509BY0j0xBO2TMv+ZL2bdNyuoC+jfF+/l4ahlVu6GMOMAaAGxSg/iRe5v4T/f+4hDA9f3NVUgHZHzntGpStLaOycg+X9xlbJgpYfcU0DX+Hd9AeBQMKel7rsmPPv2kE5xcCcgXy+h2im4aXTazypLlmL2pU3RMrY=;
	20:K0HMaxZjGyy7jRJI+mrHtlyLljsjYUCft3GAj1hgXlGhDlRMycwo7iSOijFKnaE9dq1jrE+30rnddMajlJ7WQLu7homldnDR19J4cPMGn0QYWyN6IRfKNnmCzcjbMd5UlxvaBsnZP+mGyt5fz3HFA+1hkUXYjbAJc9ErxnTrH5kfbZxg1qJI4NxQG13uehiWAQ4JxOH3JmEMRcR7NmvN++E9sqzoQyHWAa2yoLVjkLhOsh9GhF6P3ffQCBaO6ng0IcO/9vugl1FkRVrNNngHVhyALeLimV99ucs47GvXot1b4/FYE+0d06TTVCcdvqLHQZj+TZcaAiNhXjA9hG+3IWUf66IDYq5Uv+K5+vYTomuR/Zn8wBfbLi8/bPifzYyYIHVxAZPPjI+MOA7Ofm9yQohXwvVoi8DDsk6mKqx4+79MicNPmt9d6f3orIyfu6SkXwYeOj4UwBXRBk8xTX05detOIfEsycOkJmDQnY+hXPVWjOmNStFygmy0EKfHToAe
X-Microsoft-Antispam-PRVS: <CY1PR02MB1336F8ACC5C1CB19E939A5F2DC0C0@CY1PR02MB1336.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(10201501046)(3231023)(93006095)(93004095)(3002001)(6055026)(6041268)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY1PR02MB1336; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY1PR02MB1336; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	4:cgXcBdnTu/xo/GOP3DLq47PX3VstINW6xS2Civ34mOEwUwhY/9TmBV4gSDp7+6IJG2qlF6tFVVz+Lc9/HzjaGNym+IinNRzAPhf6PD44ceyQ6QM4tX4oX6kiom9qR56OSYlqPkdA05ok6bWWlstPhrCrKd4qK5/mS9I3EvAJAASW8k1E2M2Yeu58kGB+qglNZ+AvkWGROQETfX+qbEygNQb/ykgcZ6otPn4aEK47QfQ5x1TR7fkrXpPlw9q0JJbHbBddG5EhSIfgKCAfHwZaeju7GCSzExjmjNoNnslCr2XelJiwWMItWj+nXYrvBgIwlxJW1Vsg+rTsJTQ0wHypgA==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1336;
	23:LJo/YWpE78dWOYFeeJNpv7uqnifgKSR/JpzK20ZNC?=
	=?us-ascii?Q?zqGPqyP0QLCZGdZvPbpmHt/1sxVLveIQa6hjHahGz/jcWIAYLtpP6rIshUxA?=
	=?us-ascii?Q?MVQzjDswHWlacJBdSWGZn/ePgvkc/sZpEQcCQmX8lrDR1Spf/P6UYoVmGw5Q?=
	=?us-ascii?Q?ZBNGrL4u96vkDqsZ2NlYpDTC6iouRAxADNZZJhEjnbq5g48OGRX4926ITOx+?=
	=?us-ascii?Q?zDwJaskBO060G4AOkCocJTG74XQSWNAybIYpb4XSDQXi32CSNkSDpKBSvL5r?=
	=?us-ascii?Q?2VHmvtcRxAfexbiaiqDJbz+GEBTXahebAuCNm93GzDiDame7vFl0ayvM4cM8?=
	=?us-ascii?Q?TIZUU06wS3d6Yvzm2SePfgUIivDFMz0zwg2qIv+ePBSs8z0t1dJjn0aSZoFl?=
	=?us-ascii?Q?qm70wJyugzluenAafeB1ZRRs1GeXqi1fxEMgTGsrw4CSyQqieXpYbgy/ExEM?=
	=?us-ascii?Q?EBigj85sxII/tD1wmB9GOYtLbqpmfH+O411k7V+vyLkMP2m4ZmIrB/kDo3c9?=
	=?us-ascii?Q?oCF5pmW69iu/cDh8K0wWdC2Ox2fuJ+gn23abGIj9hn1IgQdkaBNEPqTS4bHW?=
	=?us-ascii?Q?HDK8SKopyNcNfpnKDxmfQBTMSBg7ydWISzML6/SCV3PUfXXV302093l9lDkB?=
	=?us-ascii?Q?pMWZ35arAmrxSLa0rUwDApN6Hpn+06s7NCEQKQozWB4P7oQLG5F3Fup4XTRJ?=
	=?us-ascii?Q?5N/1ExH4cQ3y6FNbIScP4S+dTmjEsnGvgEsEgut5T6UyAIn92HKSAU+eKT4S?=
	=?us-ascii?Q?ZWRjn0MO5sisg1ZqS7BBq5Iv5YCD8aZ4Fa157XPqJFH0fYSFkaGSqksAi3lc?=
	=?us-ascii?Q?uEUg3tA1F6w1HFUT+M3zF7WkU9JG/pqMeu7SQfYKlZKvgBNKbxrJ1U2zoATu?=
	=?us-ascii?Q?Kw1fM/SYqe5JRL+Sc7pnpZrBH6tmD/FakU7xOH6J51JMbtG2F96jc9npWy46?=
	=?us-ascii?Q?x16YTMh+3uRLNyTpqM/le4xJc/VUHsp68WlBGFuGFwZM5XqW9FWARjr55V4O?=
	=?us-ascii?Q?nVTRwc7jC3hDX1mO+OwzEKVMreuRok91mzqkbQf4P8y41dLap4LZK6fJX08w?=
	=?us-ascii?Q?Jc1cHF4fVjt2FvBlM6ZnhLHVZhU?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1336;
	6:trUCH4a2OiFGYMlhn30N7kWJBuviHNEI4iniPLmzcwdC/p1beHw5Dsg8XJTx10+Riaa3WhKrqejlmFtBMf1d4r+0p/4SInIcdDvj++JWgViOhuhwHPQmu+Q5dxxCzACUg7bFwGvCieAz3GKtyNLeevLQ6jmLfPoyPP5Nqu5BYi4tNQ214xj2Sm4GEbP0z4eHUkSJ49aa1POkqI1noGkDdg8MccgI0gY4pRWmM4VlJ4dYFicFWcM22B60kcM7NSHfj0ZIMeZnmHwcsviBBy7NaK48yvehplCfKaqlp5gMcItVaXqc6A29s1UExZJ9DGT60AiUDieHdhy0x13IoDGtoN9s/M8idn12HMH9rRCT/Fo=;
	5:wws3qDOTWkE17Pd6il0XzTeatpKrzDOKUkWPA0LydyrMZg7iccNV3RszB4LsnAcgYNfYG64s290tSYuETWMp/CB5KoEK7NQn1/K+mOspBB734vRnE1LXDFyjSF29lc0qdzyPiagb2tJuIPOc2uz0qAFgOjyiSgC2byrCFBp2IOU=;
	24:Pf7I/9klzZwnIbVehXQo+kLSnOlN2b8Y98ZZo3SMwXzvs83OCt9tFnGPTuw0E8luOpYk+kLnsmyuIS+LWIrcNGBdV8KREwNSvvtUWHBwPVQ=;
	7:jWBrXDlgdmgLlpnmMiPMiECiqhmnfPKq6cdDj7Mjd3RcsyL+AB+oRgHeTWybXBg8MEdusWmdTWRx7TC5Y6joNAH3SzlvIKTqucjspYI5b6a7emQBs6mqA/83eQuKtxG+m27KFeJwGZL7oIVyA4IMuAdkCwvwWOMRppmeo8QxM9+uYLAThe1b8eChso5VY19HLgL2nimlrnYRU1gPiLNlmU4JPCFxTte/UmiuSq+VIUaqcZcJutsfUhOmzJrB+LJ1
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:13.4341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b9b5ba-4116-4977-adb9-08d547cf3059
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1336
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.51
Subject: [Qemu-trivial] [PATCH v6 23/29] hw/sd: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:22 -0000

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

Some of the prints in hw/sd/sd.c were manually converted to using
DPRINTF() instead.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud <f4bug@amsat.org>
---
V3:
 - Fixup some DPRINTF() prints being wrong
V2:
 - Split hw patch into individual directories

 hw/sd/pl181.c |  5 +++--
 hw/sd/sd.c    | 15 ++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 55c8098ecd..2b878a0c5e 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/sysbus.h"
@@ -146,7 +147,7 @@ static void pl181_fifo_push(PL181State *s, uint32_t value)
     int n;
 
     if (s->fifo_len == PL181_FIFO_LEN) {
-        fprintf(stderr, "pl181: FIFO overflow\n");
+        error_report("pl181: FIFO overflow");
         return;
     }
     n = (s->fifo_pos + s->fifo_len) & (PL181_FIFO_LEN - 1);
@@ -160,7 +161,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     uint32_t value;
 
     if (s->fifo_len == 0) {
-        fprintf(stderr, "pl181: FIFO underflow\n");
+        error_report("pl181: FIFO underflow");
         return 0;
     }
     value = s->fifo[s->fifo_pos];
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 35347a5bbc..5d7fa3e418 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -700,7 +700,7 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
         sd->pwd_len = 0;
         /* Erasing the entire card here! */
-        fprintf(stderr, "SD: Card force-erased by CMD42\n");
+        error_report("SD: Card force-erased by CMD42");
         return;
     }
 
@@ -1282,7 +1282,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,
         return sd_r1;
 
     case 56:	/* CMD56:  GEN_CMD */
-        fprintf(stderr, "SD: GEN_CMD 0x%08x\n", req.arg);
+        error_report("SD: GEN_CMD 0x%08x", req.arg);
 
         switch (sd->state) {
         case sd_transfer_state:
@@ -1564,9 +1564,10 @@ send_response:
     if (rsplen) {
         int i;
         DPRINTF("Response:");
-        for (i = 0; i < rsplen; i++)
-            fprintf(stderr, " %02x", response[i]);
-        fprintf(stderr, " state %d\n", sd->state);
+        for (i = 0; i < rsplen; i++) {
+            DPRINTF(" %02x", response[i]);
+        }
+        DPRINTF(" state %d\n", sd->state);
     } else {
         DPRINTF("No response %d\n", sd->state);
     }
@@ -1580,14 +1581,14 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
     DPRINTF("sd_blk_read: addr = 0x%08llx, len = %d\n",
             (unsigned long long) addr, len);
     if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
-        fprintf(stderr, "sd_blk_read: read error on host side\n");
+        error_report("sd_blk_read: read error on host side");
     }
 }
 
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
-        fprintf(stderr, "sd_blk_write: write error on host side\n");
+        error_report("sd_blk_write: write error on host side");
     }
 }
 
-- 
2.14.1


