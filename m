Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAH-00074O-E2
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAE-00071b-6z
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAB-0005lI-73
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:18 -0500
Received: from mail-co1nam03on0060.outbound.protection.outlook.com
	([104.47.40.60]:21440
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAA-0005ji-Ty; Wed, 20 Dec 2017 12:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OrynN4WZoZoHYgqML/BL2R502hXxxrywlbwEAlffRvw=;
	b=VTN7kAewuEMn4XxZubOAwqSnG8JaK/LZQ7/BlUfNpDCg7nIKVY3NAaRXOhdRbXSn+uP1okWV9aAwXAmubbkB76zYKbQLepEY9khsNv3hKaqfXmRaS/Om1/9HP0zqMaVREKANqgpU4A4UaZ2gGrTXFMb69CW6pMYlSoa/psKKavQ=
Received: from MWHPR0201CA0033.namprd02.prod.outlook.com (10.167.160.174) by
	DM5PR02MB3385.namprd02.prod.outlook.com (10.164.152.161) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:12 +0000
Received: from SN1NAM02FT033.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by MWHPR0201CA0033.outlook.office365.com
	(2603:10b6:301:74::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT033.mail.protection.outlook.com (10.152.72.133) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49371
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiA7-0003rC-9t; Wed, 20 Dec 2017 09:28:11 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiA7-0003fa-7Q; Wed, 20 Dec 2017 09:28:11 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHS0fb008254; Wed, 20 Dec 2017 09:28:00 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9w-0003cd-5O; Wed, 20 Dec 2017 09:28:00 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:23:43 -0800
Message-ID: <53565215d007f2cf0c6bac85c3e2a6a6623afe8c.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(396003)(39380400002)(39860400002)(376002)(346002)(2980300002)(438002)(199004)(189003)(4326008)(110136005)(39060400002)(81166006)(316002)(305945005)(63266004)(8676002)(81156014)(356003)(77096006)(8936002)(118296001)(9786002)(106002)(50226002)(54906003)(36386004)(2906002)(478600001)(2950100002)(47776003)(36756003)(106466001)(7696005)(50466002)(6666003)(76176011)(2870700001)(5660300001)(5820100001)(23676004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3385; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT033;
	1:vW0rOE538bloatWRBbTlgNh9yRwfdmcGFjc2qAMhN2fFHDAUuphc887ASB/zoYSW49zh0BuNwJLTigTv0SMnMDtqG8MElr9TTEs7oJOzaPVd9aNm1nr0ZJ/rijajeWP1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9bd6701-ec22-423b-947b-08d547cf0b95
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:DM5PR02MB3385; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	3:UgcWp8CVVhg/1Sosk8ADXdDGcCcngeODEl5pNtuaAKFFzl6RO00ju4CW8ZyAxY1HseY5uHxpFBECrYSTTm+rQsa0Dpn9YEuJ8wPzuwmn7ThJyNSTfg+c/L+2D5IminNIPzCR4XkOS6g18pItvuHnTOt7YEE47cH/GW6+Gap1gZbil7YtQgJuH6wTF7R0kMfavH5FPWDsU4FMO1Ku/sVggdLUijpJw38T1MHzD8Ep+9uP7otmQ7Nxje2w/DgN4DUbzwHPXdxYycVmXQ3temT6TiDcy33weMh+QRZEo8JU4Fn57JrmWdMYuvjm+1uljgxDeYSqKSDsdBA2P+WUzHtZHcIOn9WMAzkFGwR8LhiyxTg=;
	25:mJMYq+wENGwgXytycsjux2+JWAoh9tGDA8FeA5l0gRtEcFzVctQxVmkXEtMxKTjyMcQEqdD9QrWswk1uKm27jedwQxCOkjXhtcv3nan5pTYwEDtfhfWQJ/3kyjzJANskeaRKRDot8J5sb/hY32qhXDUtDupjqmpjV+VQpwmRIQiDsVYK/2lOHJEuJ9xThiY7Ba6ZuRV9qddTTQ87Mb2DGSivQHYsHRyflYlhoCCSwHPYdXuebi+CAZHzc8o8irl0LBPkA4T6HQfXb/IrXa+52QHPDfMiwKfNwnuro0LRHFukFQmNPGBoHGc0sst50tnbrdljjRVwHE1kmMxa7Jo2hQ==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3385:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	31:CLOArdkotFSHmuORIa2XV175miL84MKrU9dlweDeTKlllcTQde2AqrewMp9AuZ0Sr8FsZOv/inuvuIvSZIA8DhTJqFUrwqFTsiWOnIi5hsvHJ3yEKslWKSHr9FfxjSdXlv67aw/QzAEInCVXFzYz80iV9LeYHN7RxaXoXH3WxWfS6SR0whs/9IdGGTGhbICE2fGoGoItSok3+H7jpxj48pom01x7+Qev4TMaQ5KftRc=;
	20:tVwcbLJlCeQbg8Qt/5gjVjFjQBVGtgUfNU14cL+v9zpVYsnmuoPNWIQDI7kODiY3z8ijSAtZRYwoQEHZRhiwON9BGTZSNGMZGZoyyYEN+qcGsLt1yGDkRMeN2FbMJXIE42EP5r835lcs2nOMghfFs3L6iY1pi04VHtWmOafa/+ThrsYVMRe66IC2mc4mwapzuq3krZAxGetL5bxy6xwHmE0AX3sdmVjjAd2SV15cg+aPDguhTeNQcPW7E7DEpLP4gXNM6PJZgBEnBUSLu6VNUSN4ARaTnJ2ja8j3QiVvyV8Zlfv1uzbcx2mumJAgJpoxB1kBIsQXuedOWr2MMxPpinBq6x9LW7zqF/8MvZtL3qZUKJs0aGWrch+JhQSh1pas/8ATGobtww2fvxogWYnYYkkSOr4dFV3aCB5NsCZg9umNQ43RZ+9tvH+FEKW39Qs7G7M/Ku3TJne7xsHUfrrsEY/VKEDvbkGHR3LADsN0K0ZrOxatlVqcltuNkDKLAsfh
X-Microsoft-Antispam-PRVS: <DM5PR02MB3385A04E23855B5406D8D491DC0C0@DM5PR02MB3385.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM5PR02MB3385; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR02MB3385; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	4:jDIfRGO4DgmXRZTZSqzg8sOPIq+pl+WFIVxWMbg1D4WN53eHbKou3/ERqZzZSOGyHHSnvTsnldTUa6bQPH1HpjojZAZ1WmKHuSDHYEPYN3suVPLvFCjCL2oOQ0IOwRPEj+Lv70Za63z53Gze21ALCejhLB4nKBCyf8vLBxSl17nlicMR0FqLDuHQRshdHxtrGVoya5/XvkVMhsCs7NcoWvtydsmCcmRSKPXL/LqcQvUM3DjzTw8a2d7/2BJORCSJaf7Y5Xs3vdDulN/Hu7uSI+fFlxFySxm8pJn60stMnoN5hIFXf7KQp7G3SLC7dO1A8s8ksjqskSRqi4mBVctnHQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3385;
	23:V6McyjlsN/oR+6xQSUdOzpTngxpmt+VRL6Y4X18xe?=
	=?us-ascii?Q?EBQdH3Z0l5clxk4cv2KMX3h5ugn17qWzRcgSiHLoE24FDlCi745BRJZM2fXD?=
	=?us-ascii?Q?b46XcFvq8IAIqZ/eALvRlaKui8ZyBNtvdAtElz/5HATpP3eUIBGGqUT2KNAo?=
	=?us-ascii?Q?Z0Xn1Qe7wTbft/G/NNfZjGLQKNB01XDr41KFqzwv0jBWZRoJkPXFuwbixO3V?=
	=?us-ascii?Q?ncN5cBvVi21i7qFsgjjGmSIDBtdA6Q9ufrwi+MehVvhoBk9b8pqIAOmzkqor?=
	=?us-ascii?Q?eI53PYsf3r/Jgxde8nOywUFyfkPqs7U9PySGsZWVT+9OQWMgmxmrUxlo8O8R?=
	=?us-ascii?Q?oi7z4IXPjsKby72jf+6wR1XL9MP++lKAmJlwn3j6NeAwYXI8FoHIbDBVcCvY?=
	=?us-ascii?Q?U/oDN3018e8ualB5Nj6UZp6aVPigpMpjCQx+fw13lyISDbPquq4ZIqwOmy89?=
	=?us-ascii?Q?EM96dbXMcYlKsTdcsRYl7MkgQ60V5nvVwBXXN04CF5emv9QB0Utw57/Z1LJk?=
	=?us-ascii?Q?+yUV0NmpSSH8CLRR/PsZ2VOCBX9wWCZCEAzE+LcjV3ewbe+PsEed2+X4TlfV?=
	=?us-ascii?Q?RZ0nWMfGFLmayVOndF2nJ3Xk9rUwYGzo9/yhIExgkRpp67C/ZatN4IrRZyLD?=
	=?us-ascii?Q?4SpPOqcC88v86tOuLayn6K6V69gNaZsQV0Q0daaq7sjYOH9HHjZwMNZuqt+U?=
	=?us-ascii?Q?f6PF/gywEuS6XSbHXGe/2/cJQBIvlxTob1cjGS2liDopQ7R8f0y+RQEl0+VU?=
	=?us-ascii?Q?OOCCUrlXn3pCVMLgWOyNaWsC3sPyb4A8mJqGFqtgg/wV0wAivm06J9hVOPiw?=
	=?us-ascii?Q?Pj+M/6vnSpwO19nO+VRchEDR7p+K6JSI7a2mMbNMfeU8CqdJmt5oonG+taKB?=
	=?us-ascii?Q?um7eIA7ClqAkQ8hgah5oKon3xk3ruzQ8NOuHVrwjqabmx4cndQRydMHgX5LN?=
	=?us-ascii?Q?BZ8EGwBU+d5D6SBdrYWMvVSSPM6Gb8oArbCWrVvqI9x5YD1lsO6M77A7uxKQ?=
	=?us-ascii?Q?fhy5oAKrsI9dKBWfMHFrFGwBTzooenyoOC/SXXjRS4kdoqvfCUzc8KhoezQG?=
	=?us-ascii?Q?BJ39q4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3385;
	6:SwUXRxkzU2Bxz97ig+7svStPmbIEHhsmgJU47GRe2e4xIdqZjckRhxnaHYv+HttJuneI+nWKb8QVsbOyxR//cY13IF9yCBvhXBJT/VzcP8QeAr8P26csG/+dWIuvEMNPzbF9Z8NBeZqBzEz8ktab2qtHZPYsvqEtHnaCJtLgFPEnyLI58aQQU8xoG1VmNYEsw/zlYxstOW+utryWiVaNeKZ/UUm76kuZVST+zbgqktcfRQaKZbeSkK+d+mGiPZqToJa85D81ad71vwy23Z+Wzaz2VyDa8WP+fLr9Kp4lVv9ZXq7mIrRpB+2KUXyHDNQUCc3K0xPY0SjeHSFmWqbSMN3xGDE1E8RGXPb5hlx7wiw=;
	5:gF3x+UmgJZjXizgSNZWS2ctTtSsAoQ5W+0hw3x4y+C3enBOS9FffSgcmDhZuImw5Vtz5Bauok3sC3gqOekbEKQ4Lh3e9IWQVpuoDcO6T2b+tqE11fkN3FCRJ+KOam6gbKEIN0gFWZDYicbXYWqm19F7nWIRsHZE/kzSWEpavJ14=;
	24:/VxdWYGkGadBwhOO90lVctxuBptDRzH5zagqr50wY7/olGt3Rb5qwvpBdjp9q5UK2aIlS4puYnDJBjkcjKoB2SQ43nzKaTzviHXGjJmPwO4=;
	7:vzcD7YhcGqkUJLzSx4Z3/zWV/JJCUhRjJjk1Faa3Wm0m5Fnv9+3WbYmcva4ViBwXki6PT90k5lIzF1dJdUNuK+glj2OddtbrclPK8vI3W8v0tddu8hLyMSGUR3yT3ImTzyEPgfFILV/BvcYWCA4Q6u4fFtoz7z4sITc3vD/eYnE8fkpTKh38WLngWZ2c5bbGS8hV8P+UI/udvErVBSF8xYz5vN+elt2tBE5d3Nt1YWmY3OKqKSdP5jMf95CN/I7v
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:11.8447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bd6701-ec22-423b-947b-08d547cf0b95
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3385
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.60
Subject: [Qemu-trivial] [PATCH v6 11/29] hw/ipmi: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:19 -0000

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
 - Remove left over include
V2:
 - Split hw patch into individual directories

 hw/ipmi/ipmi_bmc_extern.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index abab3bba4f..8c0535d3dd 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -28,6 +28,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "chardev/char-fe.h"
@@ -194,8 +195,8 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
=20
     if (ibe->outlen) {
         /* We already have a command queued.  Shouldn't ever happen. */
-        fprintf(stderr, "IPMI KCS: Got command when not finished with the"
-                " previous command\n");
+        error_report("IPMI KCS: Got command when not finished with the"
+                     " previous command");
         abort();
     }
=20
--=20
2.14.1


