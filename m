Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAy-0007lO-32
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAv-0007jJ-PL
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAs-00072h-OX
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:01 -0500
Received: from mail-cys01nam02on0089.outbound.protection.outlook.com
	([104.47.37.89]:64800
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAs-00070d-Fu; Wed, 20 Dec 2017 12:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PZ9Lj0xtdpr2gyeQL7qp8yeenadFfMhdnTblVxoC2iw=;
	b=iwR4ZEtGgmeNzGJ0FSykS+nxuVc01lwl1bnxHiXDUyJ97ABD+X0desGMTejRuMomMoKOEN6Nx5aVEiN33LX1799JjiH+Ig8PymqUl+70dX10cXQxOtFX7AEFYoHw4HSId7NadATrhwaMMOWzy+jDqAq2tnuXtw2SKIBuEvpkSNo=
Received: from SN4PR0201CA0048.namprd02.prod.outlook.com (10.162.76.34) by
	MWHPR02MB3391.namprd02.prod.outlook.com (10.164.192.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:53 +0000
Received: from BL2NAM02FT064.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by SN4PR0201CA0048.outlook.office365.com
	(2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:53 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT064.mail.protection.outlook.com (10.152.77.119) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49902
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAm-0003sa-11; Wed, 20 Dec 2017 09:28:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAl-0003lo-Ty; Wed, 20 Dec 2017 09:28:51 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSoGq008448; Wed, 20 Dec 2017 09:28:50 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAk-0003lh-BY; Wed, 20 Dec 2017 09:28:50 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Wed, 20 Dec 2017 09:24:34 -0800
Message-ID: <ede58fc81897273febc7013f10f81a8c7229cf1a.1513790495.git.alistair.francis@xilinx.com>
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
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(346002)(376002)(39850400004)(2980300002)(438002)(199004)(189003)(316002)(110136005)(9786002)(5820100001)(8936002)(8676002)(36756003)(106466001)(356003)(305945005)(7696005)(2870700001)(2906002)(76176011)(36386004)(106002)(47776003)(50226002)(77096006)(23676004)(81156014)(478600001)(4326008)(50466002)(54906003)(39060400002)(81166006)(63266004)(118296001)(2950100002)(6666003)(5660300001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3391; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT064;
	1:rdTdyEcfv57v0ZYLugF7hJYB3GBj7xLeSFhzxJG86GA6DXBGIMo1dfxDCZr6n5atKLfEHt2T4g9cpaSMkakUN2yDit/GLcth6IFkVwrSY1B84BFaGMvUwrRl4hJDqv6b
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49b3f830-41de-4335-150b-08d547cf23e8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	3:1tiWU41528ITNvxqx2YqllZO7emGCd287pskexsJHWJ0kAdf/6ijYxfewwn9DTYJk8eCCg+w4WQsLTOnLrirsmO9CtnHouHRoZc5Ijk1nvKCD+UXvcMlO+OOGDLTJ3JwA3NqtaUjw6ImBoRpaqeZV+YPffJdHzN93OoEp9/oI3Ykr5/pAN3w6bPQCoQMeGxmNjctqmg7tCamRGi725vuJodUEEuPSihOWUXCZRqIZStpsbH6pt+QCOehZ92UPX7aD+dUkjFJeM050hmgOc9u7BnxeHLAn6dZwN58sKY4i9W2kPxFWNfw5LHJGz/UPhM25BAE6maoUMfPidWl7CHbFLwPAHJJcRsWSOGEvH8Humc=;
	25:7/kJmLFNb6X0hwrUQi5ah3Ttcelq7YbpPNtGpwQwSRNAP+J2Fy3RtYeaa4scBvposgeBOtrKd7jGsRknsBQdDWrmT9zYxBM4D2/QkNJ2X5Igi4Hd/qmgUBZRjWiUbKxyVPjhnbVTt1Lszh2OFFTe6kQvRmo27ZHComGl4gamJoDzncj6M3HLTTJBthvi7Ne1DjJ9d9xjB1xJvfgjaDR2t+IAW0AQMpCsFW+pBrsDsoQhrVMD5am8Xt2CSH5I7RLJECZy37eMfMKzkJABLhlFCSgBamLS3EODEmanezzHCEzaTqBubMgFVTAMbCTt893twVW/9qjfmjpyfZcDgX7n9A==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3391:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	31:wnwrj9Hl/B6GKmTO80f7F8THJR2S/muHoEW84VUrnae0o+MpMXTek+sZbovDXLVg2M/GlPC32NXXyK1F5awRMnHDBGYdciIagHIbTGTU27IzIttWYpeWzSF8iwNFmtbht1I31MHbv9iHRgJhoTWiqOSN6K48YYAf4sXRrIgf81ZwC6w2M6efriFLoUdJZY36PGE+oN6AuwgwdhiggzVlA9x7u0pXaSaBktf3F8xPRxA=;
	20:SXGiCm0Ur7IHGsLjyOEzPcLMuR9bCrVVrfZyHqnv069ffPDGh0U6JsuUvmr8jIK9A4gV0BzEjcotNCHdEQ+BYmFiDGNiim52fecjHlDM7L6xy90D9WQadGBlmVdU7ElG4Yn/Mv7H+Q1QFiovh7mQPz8BcWsGL3b+4VqTqMnviKksR2BZ3/d2jHfZVnOBFEO1DD+GXwcf7pE/W/9SQITdb52dzjqZ3ygwkZ/0hcBoKcnr8Tf+zc0G2E8QHCD5fuze8HV5L9XzvG60wpavnRQ9cNEjYDrj9MDiBUMeO78RvW7WfRZR2j/upT0z9RK2s5pZQ5vQzP4GFO7wuTOtpfJztn0v2GdTENfmt6vBT/mcFbHeUzgd1peXk/T2mA9xepItSKGMdYWeB72/uAwY/4xNCvej+rFDOwooTFJUoj48fDnGZ735NiIFAuuLAKN/h69GN64ghKkUrRJ8mn1VP/6yKlsSJN20eaesXnUzrqm9mBIkJRYCh/hbihiRICRmR5C1
X-Microsoft-Antispam-PRVS: <MWHPR02MB33919EB35CF3870F5DA4A61FDC0C0@MWHPR02MB3391.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(3231023)(10201501046)(93006095)(93004095)(6055026)(6041268)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:MWHPR02MB3391; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	4:ma8YnrUMcCwAHfTE6AOwXbMRjci86eFUemESV21RK6rYW2E818K1StZCZOL0CcdIuUE9+p/xWImkfIvf1BwAeM/yLrdeRfGxgl9d4Un8EcPxu1rj16u6sf6luqv3sezo7ZJe0ytDNhFJdimPg5MhIaItWAQQpE2vf8fLfGW8bjvZio6GP/PAVnOcXbGIaKMSj5YkCXWbkkR7jZdnEQeyxowpyNEZGdiFrQ4R/gNlENZ5xdOAticv/FmXgHs2pRMFPbKA2qVIfyx7hPtfKSz35OdsEiF/fmuI7PxkO2iN5iZ157y8lwH6wJyZpZhUpk+6ZeCad8AduG1lE9KtBK+rHQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3391;
	23:BMCCJe4q8cvJiDmObrhAXoP30/vG9ID5fkVAH6pek?=
	=?us-ascii?Q?LlApUApUbodWlNVJAP4R0w4abFwP744f3F82vsFSZ4bkj+g39LXnHZDPu+1i?=
	=?us-ascii?Q?IkLIvs46qSrBrKm6pBKD6Aj515DhfUOimvssBa83jzVSY5NJcD7YrLxg6Ie9?=
	=?us-ascii?Q?1PiP1PbZHedrM7B2TgCs1CFELZCD+KZIZ2h6Cuanfv8gpv/ZIWbQwLPG0uTu?=
	=?us-ascii?Q?BPJZEta46o8De3+Mg+9U+PMwuAYt7KPCe702wn2NJcU50wqX3RjkTcG7NQX+?=
	=?us-ascii?Q?qFlnYt6G2dxFJSSc6Ll1SoMysJ239Va4inpI0sQJN2dgpopKlaGTJO88br7h?=
	=?us-ascii?Q?M5+jwqXer7flUlyOF0c+1ynUMe3qFAxCENPmOZllvKg6qMzLfQX9wd4sWOf1?=
	=?us-ascii?Q?phqeXsvrTmqOOhidXPK5ElE+H0WQ6NyQs3SwO8dP0tKiHxI8zonHeXC3xrYS?=
	=?us-ascii?Q?EgEeQ2Pdju9OMN153Wj7USf2l2lYqgUsQrzb8atZarTMav2cngvOgu1b3JTZ?=
	=?us-ascii?Q?h3lzMA3KGUjLCuO6GexqdTNY/cZvPeaNwo7ewCjymRQBWwQ+NiothpughoBK?=
	=?us-ascii?Q?mtwRH433ZBuIiCrPkiv9TyQcJepjDikScpX16OaNOWmSAPfv4TAfk7arnaya?=
	=?us-ascii?Q?3uKyZjPl7d2L3vt+yvebwIZxpTsV825w14cDTm9Zr/6IVBjI107aQtJqoB7Z?=
	=?us-ascii?Q?igs0g9FyBx6DsIsU4R/KJfSX2j2RvIRU7sCAPOKYDt9HIeQRn3+QTPNy0hPp?=
	=?us-ascii?Q?65uqEGwXXgnDSzlOt0NFCERb+33vYTSa8Pfcwn23UHfwUXxCahqnuMVfjCgo?=
	=?us-ascii?Q?2iVYDEzBiJ4lLjoOI5O/j8dhvnBq9HKN84T7g9dt0twfizjpAtBr70mvGpjj?=
	=?us-ascii?Q?zGBuDOECqLu5Hw2ETJbowhJ+pP7lPkqGbboXGNDljXQsYk1JcJGpeI4tYSv2?=
	=?us-ascii?Q?LnCgtttLsfkqfLieYZaeTLeInccd9frxQhTwn9BIc0vejW/fi0jKVUG9DJm5?=
	=?us-ascii?Q?h0nAzUksr5boHl+ojDmGSCQ+NRwkh00W8k4Kt3DeNiF+3L+hPQO98bb8XAls?=
	=?us-ascii?Q?bNX3s0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	6:wtGqRimNHILJgDO5KC+DqKJkI8d4diXPljxDItMKPP99wbjBW3kYjCVmvGjEaAiE0Xk03zXSPwU9uqa+Krh/AHVOZzViTN2bz8Da/1LWV2TL5+lvR2NRjBbpmpMBzWoRmpFUvBk+gq1NyfexzEB4W4B//BHhejKG1PNtzPgbF+vlxJJabSOXsE+dSbHMoQsFAljtve/uunUSBiyY32JIQylGNW/UrmP6aU3vHUY5zMIq+E2G5V54Otihw/ILSo69dShrH47tcu7qSkrO6h7pmwYO9aNERZeLi9Ba0S9atTHc3299NURgwNx7l0+/X8U6MmVZAslrespxslyl+1Eeeh1aPtArNmoYY8O+c726i60=;
	5:OvjLl/NxSRVUXw9uW3UMSAQjSEaJdFBnn543kummajHjeqm4pyBtVW/7yKAnE8Hon+J7Z3jl3lNvGImbrs7j9qHoITgLuGziAnlHCYMiTTqbauMBClhay42++cnsuxm1QZ7bbRW3+dlN6zJfkaJXJphzwjrzjdhhczzRHhYdfmA=;
	24:FDJxmfqEyyLABRleaW7dL/iuT4lAA6AUJqBo3w8iZhDqlt5KrvNsM/k2Xzvt57+oDflqFXUVKYGyeLWvbeYuWNjnc1OCGIGOYVTBmwZ8tbo=;
	7:EeqStJovXkPZFq8JfQ9TRECL5VMwC70xLAi9mWKeY8dWKC6zuchOzXI/Rnme87u1icsYCZsuOowc7zJzF2owgfOs5RObaYrsR10ay+4cOOI7SVST4gxMmCtpe0zWTLlxgvw/HvAeObiqqgMy3EPP3MIuvh0ZdnffjAS9/cNIUZmzE9Ec+ixqolDuWs+98g7UeIcpkHSK1yvD7nWhxFrYhBaIxA9/WiIoQJFXuoKy1VCibalikQrvv89z2BAs9R+4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:52.6351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b3f830-41de-4335-150b-08d547cf23e8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3391
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.89
Subject: [Qemu-trivial] [PATCH v6 19/29] hw/pci*: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:03 -0000

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
index 2ebeab5d90..859aeecffe 100644
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
+                     ",pcimap_cfg=3D%x", addr, s->regs[BONITO_PCIMAP_CFG])=
;
         exit(1);
     }
     pciaddr =3D PCI_ADDR(pci_bus_num(phb->bus), devno, funno, regno);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index b2d139bd9a..420526c8d8 100644
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


