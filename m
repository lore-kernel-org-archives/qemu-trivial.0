Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOe-00037A-Ms
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOa-00033D-K5
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOX-0007Oy-Ga
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:00 -0500
Received: from mail-bn3nam01on0056.outbound.protection.outlook.com
	([104.47.33.56]:19088
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOX-0007OQ-AE; Mon, 13 Nov 2017 17:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rKaXFOS4KAo8UWMN294RGwqKKlOyuq2byj8SBO5gqDw=;
	b=fKgtcuyhI4MUew/+HFG4opSTlnjs0X6a1PBvJ4lG31o/1N7sRiypsPdgqXTauDfNHBYHcBkF7BN772MscwIhXNxjtRLvyoUw0+Sw3IKOpqipm3GIUSqNDSqikqLP1uEirnFNYV2VuYeJQp4XnulqQH1skRKGscyViCBeorIVU1I=
Received: from CY4PR02CA0043.namprd02.prod.outlook.com (10.175.57.157) by
	DM5PR02MB3275.namprd02.prod.outlook.com (10.164.148.29) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Mon, 13 Nov 2017 22:39:54 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by CY4PR02CA0043.outlook.office365.com
	(2603:10b6:903:117::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOS-00049v-Jw; Mon, 13 Nov 2017 14:39:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOS-0000WC-HC; Mon, 13 Nov 2017 14:39:52 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdgvw002847; Mon, 13 Nov 2017 14:39:42 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOH-0000V3-U1; Mon, 13 Nov 2017 14:39:42 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Mon, 13 Nov 2017 14:35:41 -0800
Message-ID: <2153fb50fa4599a802cea8abb71b6dd967090cc2.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(346002)(376002)(39860400002)(2980300002)(438002)(189002)(199003)(106002)(5660300001)(305945005)(189998001)(4326008)(81156014)(33646002)(81166006)(2870700001)(36756003)(2950100002)(478600001)(316002)(8936002)(23676003)(2906002)(110136005)(54906003)(76176999)(39060400002)(118296001)(77096006)(9786002)(50226002)(63266004)(8676002)(5820100001)(47776003)(106466001)(36386004)(50986999)(356003)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3275; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT019;
	1:aqg5PvptfPrgvFBx3Oo5qEgAxUoJquJ2loqTgVZRT13Ew4rMvkM53OUouzQXRPTHv32V32UZy+Gzuv8jts8v+KETQaoQshcNeQddce/2DUtB2dEhtc6FAIDNVj9gGGcg
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff916a34-e203-4639-a4e3-08d52ae77582
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM5PR02MB3275; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3275;
	3:lZPUFK3tK0k8MRWQOGw5yYSRngOmJgDloOyGOWmKk4i7PHJ59eefS515rObSf7zrJjazxsOKETKwl4OIsFm1vPIY90P4NegUuVkYvPGHwHC1+KQ5yO8U99wOWqQ5uiSwNnFLcjN3xCY59d7cvJ6MsXdzsKE2g/+QLkem/nOFVybmCWR7q+korBOcxtTaGoeWguPO8X83gnPwo9m0/qpji+34w2R4m2L/z3NVSqqkCBld8At2IzIbOHeGCYKByOxs2+NleG2eWIylEImciuvDroK/PqH8MR8XSAGYPB4oFYMw1czAcG8vzjcESXJIbkChuMtt5272jphjF9k1Hq+WD7RuMeyROGn/IyZP4Q0g+Kk=;
	25:LXyfVDRGePEl5ZLBzquMTi14v6ZkrNAlQyuUFjhlAoxD07Dk3LP/WSVZYHXN+egmr/nO+7ww8UgCnHaNx0XT7FBS73/1AYHE5kVfJWAIm1sfO0v8N8mjLlajuENm+nlgE6H966+LBF6vaStyhwclwE+Y+F3Hd80TMTLYpUzIVYA6dY+ZImRKqH20rHWsUn1BHGaLFJRQJ7QdHQBaZ4hGud4kiXETvTNOz2KC9Or8HN5jxLeOP0O0eiiK7Chow4xhdgTFOC1g/qNu0zqYVNVfODCTe3kJWBrAQbKBa3Uz9vCRcQM3aRIcqs8xmJ07qbZFcyNMk/YS+1dlxpcyPpGsIg==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3275:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3275;
	31:uuRfU8TnSwbGOF1kveFzYGu5JomvDtdLMDEO4ZSnclLS0/R8t2ZK+e1tjKYTY9qSaxwe/HN4LcjySskL1li4c7AiT0NoHUUwS1dQPHAASe0cPrt0CSQfyv3vVRAUCmrdZEbau3IIfXzmpnMBNuvy5S/VSunCfhN5sBKuZWHRPjMl1w9tATDAIq72NK7OBLnPFi3DDnQjMq+YZc3ziymlir6SjokKvH7FQukqHYzGRFg=;
	20:MkZRrWw7Zh1GAK02JOx6uBJ8Pu5fSXvCYltcEgVY2UrTmnnkPEmtHJD0ioXZ/Sl5QGa2bvoVQTI2w72S9PmufOSN1CEhQpxslYFelfwj65vBEunrztZuGm+4a5Yf5FIkQxmPs/pyV3H91AA8Dmja3E9LjmBTlinK85cXkPawggsWLaS6MAXP2jetqCDClX7i9MAvxrKpn0USQ5FNQeWKCNnRMV8ajVyVq+u+Vk2s7LOHLPSlSjCvFSEKYhq+8CGVUufnX0cKt5776SydG9e5xqlnWudA0W8P7YOTnikaepdfYlG56wZonl38W2Pbu7L/JKDeOL73bbOxiXWvNIfPYIz6ASqYcw9FMmJ3Zdf/2TWNJfPksZS4xmT1/rRoYiMK5l3upI+GcJ1+y9GHooRCPOq0EjdJd2l9bWwVVq4UvLwR/p6gSBAF6sMtIgCq2uakkHVlmMMjMazkJ/t2RVHUX3yz7X6tz5Odgj16vICVOLEMo+4rppt8jw+d+sHBBOVR
X-Microsoft-Antispam-PRVS: <DM5PR02MB32755ABBA49B70FA5521C94DDC2B0@DM5PR02MB3275.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93004095)(3231022)(6055026)(6041248)(20161123555025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB3275; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB3275; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3275;
	4:66pJJxg8EaHB4hD8Rb8O1WaMp3fBOegww4fPgFBA6r9D6dC86hXHoWNsiBQITBSxYkK3XMFz0IylAMWAgXNdiSo/gdvpyct3ylYG1Ee6ifxWTh3OF6OXPzYqEjgFFejLNfej4TZ1z1zmnLSOZoThgXZo0bEGYBu3X1jLbCgeCjPpT+DtPApOyCGep/xzwAPWprn9UHl3l+zEUTsR3t6s/jLT+ldWGt0ZAlr6x97DFrdOFYCStuN7dfv1UFor+aAD9CqvAEyKPD65Z4RD9tNTHkT4XllggaAvN9kmLrNN/bqlXtRFARWBD7LseCBb/DzCtgtsJOA4b6stKtNbbHrvbA==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3275;
	23:iy3W10JeULc3nVaZ4wqtGYpo/IRe82c+Av6i1WzDH?=
	=?us-ascii?Q?5DXWw7JF2FFz6CXjpTK+Jxz775cGV2HXWxbLvsJoXJTflv9QPRB4147KzBZB?=
	=?us-ascii?Q?WyQa7pq0+GJODIXcJhsg9ApAXwRlX5zdSMmVto//bwX+LguDoDcXMthV+MdB?=
	=?us-ascii?Q?41w4bX7mLk4kati3CDB7ktZtPrZrdbR+EzM75kNiaUMsu2G9lBaiIuwaYH99?=
	=?us-ascii?Q?6P2eyPA/pRp8HAQJbfpcMv6SurYKfmDsapKlU/o2gRcKCWvfoM5QIpdCJs4d?=
	=?us-ascii?Q?gQaG9qsxQ4saNUp+ASV/fVGkamVx0wwYFmC8HIVal7fUdYemTUqn560xyrHZ?=
	=?us-ascii?Q?flxoG0pSfbU6FPVbTydipCPj/DvVnM3LxPHOBhg1fyyPDu82Qtrq+w35RXwY?=
	=?us-ascii?Q?2OWOXSbHsJ7ME6K8jdScjZGT0lRyPNENlmJpDK5Q4KjTQQg9ax65fQLY+PJu?=
	=?us-ascii?Q?rDx707MfAadAC+9hcrkGwOs5n0CMF2bpJE9k29DgU2Knkpf8DnOv+YVvNEl5?=
	=?us-ascii?Q?gw76iiG65vqr3KGaISs0iH1H1Dw1UR8ncCJRHXCI4NMlqPmf+p/KmcMftxo8?=
	=?us-ascii?Q?J5RtZSOXZr0y3dy7sAPyJD3EJCtVyAyRG18k9zPiD5zEiQlJ+yotb4EKkCya?=
	=?us-ascii?Q?d0agKTMYMvaOVwWd68x6q62bwlOecPN0EyBBlsBKELHRBucbaR1Mp5VbBgs9?=
	=?us-ascii?Q?GmX0Tw+FVREh73j4RuGUiNHGNid0bdNLgFHRXzqqyculqBknnbBvgrSXsbq5?=
	=?us-ascii?Q?neWDdA0x7Ri0Kkzt91chWNgCO9QmE8LgKJU6B3Q1yFOFuox+mdLyCUM7+op6?=
	=?us-ascii?Q?TlIZ8USl77wIAsOIL+TIhxSEISEOQN0zGvI6ZcUy6AXkvuq5jch+tLg4LKa8?=
	=?us-ascii?Q?pEU3qte4NBmhMGkSLAgqVoud9koC2DU7snEEU0Ug5QvRYgXIUp8VgomnO0QD?=
	=?us-ascii?Q?6oPlbuoJzOuELyZNyEz0Xtyss/1cG3xJTH1rwFN44o5bQo+WaxSi8dBPcSDT?=
	=?us-ascii?Q?2hZ7cbWVa0g6N+oNrn67aCs?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3275;
	6:H8fbsmkgyLNkjOrhHamv+0Y8qntFRdyL5H7X2dhUsM0iNAOJL73K8P+1e0MSZg5La1LQbDINddUsI980jEfPO+xoTNUOAlqJFEng2Oob7YaLDW/Y4fMC/WPp5zV0zcbiyslsnAPik6ml5UUrHeB2MbTNshLzwYF20UU7au0G0+rhJxxOLVzFshVCV4ElWyVRg+RuPjWphSDIbp4WLJ+8TzXDH4b4RRglsOye5fcZ58P8kTvUc3usXYhW0KP8rXrbPa9xKK+fSKgXg8XY6ADEMy79v18DhGlgDiocgBUuqLIhSqMORsINKoO+ld3ObFQHAbzd+pF8KnSz5GstR2jq/69GRn8hdq4E5TKFJVXWhsY=;
	5:B3qJ0Qy+XIHhSS0EIuvjbHH+PAhzqrScEDWcAx/BHt7LFUZJuEWkoE83pxHkHhWlwzJVLWIU/HEhrB8LODII0LtsYi5jb2JEJJzOxpay+OeWrzQ4whiVtu0a2EUpQ2fzzXWzgsFqCzvFSf/TD5yGXfFx+7BYtHl6Weiu2B1KttE=;
	24:F6vNPh6SHtFbsnTferq3VeFYBEtCcmQ2qYpokzkTAL+gIaNnxuRm2KpLHnd7cLG24y3Rpmh94ZMYm3YtyoMnM6sE9qqZkuOOowc1STJY+qQ=;
	7:GqARCMF+/eiwK/fomLvqsiwCFm8dZEeEN8kBY4pTUbqtH2fsY/Ofxc8O07Cny4VKfw/u4Uw39OvSM6umOS9BqGYFx5Im6DM7qRoeSO1Fx+MncFSzBxMeP871IqN9JqFKOtTxbLF4xLz6Lp15uj1nI+GQ7WZn1BlS8VR/IVGI9vOxHsM2BJxHxa5ywJ1EIJa+8FirvbV9JTKvaIHNfSHS1oNwbKlliwnaF07qNdBH35rHhEOps+Do5DyAe9aHWDKG
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:53.6195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff916a34-e203-4639-a4e3-08d52ae77582
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3275
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.56
Subject: [Qemu-trivial] [PATCH v5 19/29] hw/pci*: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:03 -0000

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

A trailing '.' was removed in hw/pci/pci.c

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
---
V2:
 - Split hw patch into individual directories

 hw/pci-host/bonito.c |  6 +++---
 hw/pci/pci.c         | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 2ebeab5d90..6f2e589bee 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -38,7 +38,7 @@
  */
=20
 #include "qemu/osdep.h"
-
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "hw/i386/pc.h"
@@ -449,8 +449,8 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hw=
addr addr)
     regno =3D (cfgaddr & BONITO_PCICONF_REG_MASK) >> BONITO_PCICONF_REG_OF=
FSET;
=20
     if (idsel =3D=3D 0) {
-        fprintf(stderr, "error in bonito pci config address " TARGET_FMT_p=
lx
-            ",pcimap_cfg=3D%x\n", addr, s->regs[BONITO_PCIMAP_CFG]);
+        error_report("error in bonito pci config address " TARGET_FMT_plx
+            ",pcimap_cfg=3D%x", addr, s->regs[BONITO_PCIMAP_CFG]);
         exit(1);
     }
     pciaddr =3D PCI_ADDR(pci_bus_num(phb->bus), devno, funno, regno);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5ed3c8dca4..948d4e04ee 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -525,8 +525,8 @@ static int get_pci_irq_state(QEMUFile *f, void *pv, siz=
e_t size,
     for (i =3D 0; i < PCI_NUM_PINS; ++i) {
         irq_state[i] =3D qemu_get_be32(f);
         if (irq_state[i] !=3D 0x1 && irq_state[i] !=3D 0) {
-            fprintf(stderr, "irq state %d: must be 0 or 1.\n",
-                    irq_state[i]);
+            error_report("irq state %d: must be 0 or 1",
+                         irq_state[i]);
             return -EINVAL;
         }
     }
@@ -688,7 +688,7 @@ static PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *r=
oot,
     unsigned slot;
=20
     if (!root) {
-        fprintf(stderr, "No primary PCI bus\n");
+        error_report("No primary PCI bus");
         return NULL;
     }
=20
@@ -704,7 +704,7 @@ static PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *r=
oot,
     }
=20
     if (dom !=3D 0) {
-        fprintf(stderr, "No support for non-zero PCI domains\n");
+        error_report("No support for non-zero PCI domains");
         return NULL;
     }
=20
@@ -1128,8 +1128,8 @@ void pci_register_bar(PCIDevice *pci_dev, int region_=
num,
     assert(region_num >=3D 0);
     assert(region_num < PCI_NUM_REGIONS);
     if (size & (size-1)) {
-        fprintf(stderr, "ERROR: PCI region size must be pow2 "
-                    "type=3D0x%x, size=3D0x%"FMT_PCIBUS"\n", type, size);
+        error_report("ERROR: PCI region size must be pow2 "
+                    "type=3D0x%x, size=3D0x%"FMT_PCIBUS"", type, size);
         exit(1);
     }
=20
--=20
2.14.1


