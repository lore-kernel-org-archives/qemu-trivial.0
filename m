Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePBUN-0002uw-QT
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 13:10:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1ePBUH-0002pi-WB
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 13:10:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar@xilinx.com>) id 1ePBUE-0005YE-Te
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 13:10:34 -0500
Received: from mail-co1nam03on0055.outbound.protection.outlook.com
	([104.47.40.55]:8925
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgar@xilinx.com>)
	id 1ePBUE-0005XE-6q; Wed, 13 Dec 2017 13:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OM5HwYc92V9PPMPpTGbExcH+YBwrEryK7OLG2kx3m9U=;
	b=YnfNibPaVeCKkA8rvN6Q7tx8ri6WOCYRlc//EQg2NLDV9XuOY1eyW7l6+ez9dIIDq8gDW6uuSuCNS+d53N3TBearWsQfODFEbQBlK9+yzJmLmx35y8IG/Q2YI+lNUbnuKhRTtjSVvwbqECXlH03Y8TDpb6IBCOc7vVSB6g1MQSE=
Received: from CY4PR02CA0006.namprd02.prod.outlook.com (10.169.188.16) by
	DM5PR02MB3387.namprd02.prod.outlook.com (10.164.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Wed, 13 Dec 2017 18:10:26 +0000
Received: from BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by CY4PR02CA0006.outlook.office365.com
	(2603:10b6:903:18::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Wed, 13 Dec 2017 18:10:26 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; vivier.eu; dkim=none (message not signed)
	header.d=none;vivier.eu; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT051.mail.protection.outlook.com (10.152.76.181) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 13 Dec 2017 18:10:26 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1ePBU9-0006hF-Hz; Wed, 13 Dec 2017 10:10:25 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1ePBU9-0008CR-Fl; Wed, 13 Dec 2017 10:10:25 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBDIACOh004127; Wed, 13 Dec 2017 10:10:13 -0800
Received: from [172.19.116.86] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1ePBTw-00085t-Fl; Wed, 13 Dec 2017 10:10:12 -0800
Date: Thu, 14 Dec 2017 01:10:09 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
CC: Alistair Francis <alistair.francis@xilinx.com>, Eric Blake
	<eblake@redhat.com>, <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Message-ID: <20171213181009.GM26889@toto>
References: <20171213051736.17755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20171213051736.17755-1-f4bug@amsat.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23526.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(376002)(346002)(2980300002)(438002)(24454002)(199004)(189003)(23756003)(63266004)(1076002)(316002)(33716001)(76176011)(77096006)(106466001)(9786002)(5660300001)(4326008)(9686003)(2906002)(83506002)(76506005)(33656002)(57986006)(2870700001)(229853002)(54906003)(478600001)(305945005)(8936002)(47776003)(81166006)(59450400001)(50466002)(6666003)(6246003)(33896004)(81156014)(2950100002)(106002)(8676002)(6916009)(356003)(58126008)(36386004)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3387; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT051;
	1:0yMatCXVJmNRTT8nqnIxXnmD9v48WIzzp6Ay6nw7BmHI5DW3rKIrcsOqcHEJJIYf5RAgy+b0OdVFe76wlqVS3eoffdyXsEnTHTEvBVJk9zJVM4H0vzos5JMT6YXmRb2D
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16c2f446-b6f3-4522-cd4a-08d54254c949
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307);
	SRVR:DM5PR02MB3387; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	3:KTN4dR2ElBQhb8EvMUKIJ6pV4+sD2b0jPaQT9rpVLGnLBEzwg795H5l6Yph+7aGMj//TzZ1pOdBvNu4MAgwV97+uzRDVTmtAjr/JFH+q9Gv0ZXHtzVtiuTbtksleHjArHcun9zCj4qMfy43dCaPZvKPVJohnPw0XlcwCWpFvzchqX1h/JOX7Q2JJBy45zI/8ji1awk3K0In13d9o+aMrIB/JmpDeLnOjanhC0XdSln/xiIV4k42tEr4EN7wsQqFp0iZz0XPD0hwvXwv7mH10v7TqzIhihcjlm+PEiOCtAmSlUH72TNPWf3gLtPcF0z4Z69Tin9cwfkktjqfKWY0ZapyqWOQWfyVHGN6ADBdBtfk=;
	25:MnXOYboCu4VO4+erR81zG5LSGZ8nBLFTCZ1kJQpfvPOv0RXaIaD4AYO45ZqRA/SypjryEiRt7ft2QNSxLlP5pX/TZaa3JjofH/jcf/RkxAaAGgU0prYDb3J2GVA7eJhjbTOUyQyY6yHZF6dNHuLeNF/Q3rhYYjzJhebOyw1Pdl5SiUSnWBEtzx4fkwwWhAWaTbKSdEoNozkyf3h9jIgPgocBe17gXzL6ok2wF7N5nhvX34s3SF7gZFTofdvaQ+uRymPfU4TItzaBaLc7xL5QZ8BQ/2DPEu9XWGOWjmxNFq8eD57Zs850XOObTHRubL2/IIQTjshV30Jn5kTBfU0Glw==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3387:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	31:fm2gDYT6RBnmYfF40130anUuHyZ1s5Zoc5wOE5scMfaI/Jp4lL5BM4IYeOPIqlqwIFcclmoK3Y+tCr4O3tAJcAgAjCEXL6pMcZ6fWrUGXTj47s5Qn+rm4LlGBwhH9aVTmsKyNjfs3AKKJLRuQiQOE8iZuopbbZVsAXQOfR7FDZQW2OpTXT7w4BgaSg/UJn+FBuMYTSVM476H4GMJV2VR7EeH0CK3r+aEt5wSX+zkAOE=;
	20:Xf+8tZTkFBA/Sbu3AnaFdvMlq1KzlS/yWqRebamLjlIUXyUPAeqO6ZIH/ItM3bgchSDPup1t6JwIk/KLKjswd5F7w/aiy3b2oI7+/rA1G9l68TFUe1Loza4g97/M8jh+RwQ8nM9kKJjBbt+j5yXqO79mJJr2t0CHnF8Ove3om6JN4rmNho/Wtt+uZfmzuffh6HJJ1RyslG4jLpwGEOb3shnY+JL+vN+FHjXQ38VXrmOW6F3nbVKy+Q49SSI0mtZoMFMjYA820jbk0gMFwp6USz/xF8fVJg2695/VF+jWMd2UWvq0+ulbNOXbUJy9TmUB2AcyiaWRo0cVpIwgcJgzGw8WCrWLlNulGQxE263aFcFTZToqtpfV8mr1CoTKqxOrvYxIF9ng0xwU5MTXrJ6TXArqy+Gwyf/20wFFWJVljv7LEA99swR+vkCPSh5+/nRaK9D6UW0HfKWW1R6hqvZABG41gp/snZEsQtO2bXxE56Yp8F93h/JMLTwm8UYvwX+v
X-Microsoft-Antispam-PRVS: <DM5PR02MB3387FD5266B1915CBE6DE917C2350@DM5PR02MB3387.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231023)(93006095)(93004095)(6055026)(6041248)(20161123555025)(20161123558100)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011);
	SRVR:DM5PR02MB3387; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR02MB3387; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	4:5X0DzYUD5iSwf8TFDBq31cN5Cd6miFkeZ9NLjbDSt3s6NumAcUSawkqIvHyjebMvLv6A3O9m+qfuUrvsihsMGoESpRQNw8zf611td96r56GCE0D5LWGBxt+nbvJ5I9xTcYFhft1bEHTdm7DPHZEv9DTnKC1D2ceioLsacVqp1QjR77WIdC1PugbqCqTBZo66krmAyO4j/BeJNDlDGi0+BPrjjbmKhYX4E3y7NJUJa3ekF1bC6VKvw5u+oTJfnrP1j/Sr3j+JZv74OEHLKgXLO3HVXOeSNFuOqopUCekiHoxlf09IaMzGYUW3Z9xmm1tS
X-Forefront-PRVS: 052017CAF1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3387;
	23:Q4SEwUu7DkixqIsm7Ft+aiJxgbYdqQQj7GP3QeXDU?=
	=?us-ascii?Q?OWjbX6Zc5/Ey+Baph9nKvVYuZ0OVJlC9/tOKm/S6LduGbvuP/lPiQ4btlV9g?=
	=?us-ascii?Q?kqYv0AcLmdVfvHlEJUfoIx3Bqej5LSwLx/sYgX0xy5Q2UZ7ldcESLusTF8T5?=
	=?us-ascii?Q?nvTplLschf7K6IcgnjhJ47bO3psMfhEKoUUewKyDEo6r+FOpfT4cSK37V88e?=
	=?us-ascii?Q?EtLscwc4+kQY/OaTNlj/fYFb3VFsn3484Q8sGinJmBjadag2LIj+UaIGFfB2?=
	=?us-ascii?Q?Orp/HMpxK5MYue2ynvLmIBggjjyVrE7GaoimaWLy1mpWta/ERLQWgobTFHQm?=
	=?us-ascii?Q?F2WvFke6LLlYbowxeG6lnB6YaDuupfsEO56+RkNJ4jF1TldVk521TtMSNxAi?=
	=?us-ascii?Q?Y/+JjldXa7uCJVtuPODgQVSv8RZY8BoYJP6NXFTuHFLEaSEiQNLMTb+3BHxK?=
	=?us-ascii?Q?zk4wbaq3Ph0WwKIxQqev3jCSIduv/hHY1rmTtqeaL0HpKWBl6Hp57pNj0OWd?=
	=?us-ascii?Q?50KGEbYA8emwW/GDNXzVLzFKNSnYbLYM2nhSqzHdSUQhxPw4p90J7nbwxvHo?=
	=?us-ascii?Q?OucJfRkxT8k97BERnXZFM5F7k52xB4uxOkI6WIJ1vFDtairdSBO1jtzqIQUr?=
	=?us-ascii?Q?3z+SLQwC0r7ow0E35xGhDUnvdXTlQHKI13irnVVlOF7vaSuJhGusw53aQbIP?=
	=?us-ascii?Q?rsAqv2xnAV2ImPdwdtvIC5LruHQkK15xlzLkLSyRXSHZzc95JdrG2IW+JMb8?=
	=?us-ascii?Q?Rg0hWcvUlVeC9ok41hYX7blNniCdqdxPrWVBqqy28pybx/5fLmyiNpEswf2w?=
	=?us-ascii?Q?req5XIQSJgFFZDAIw5sdlpTXX+r+phpiRwoqjCrgXRlBe5+qedOiJQRQnw+E?=
	=?us-ascii?Q?8eVOE1oa711Wv5FgQmj6RRMGXXQRqEXF23uXjt4sVlQA7GjSySKQk/zfSuDX?=
	=?us-ascii?Q?B6owbhiI4iv9Ea2JWf2egnXRwQF82S7265reqNmvvdC2chDls4o8HPI9Lbll?=
	=?us-ascii?Q?F4rapkbwgYGcwrvqlFlQIZV1o7qLToPNdUIPoky87gqed+gCKuQVlF1GoUqL?=
	=?us-ascii?Q?fm0VlBJf55xpVmsBt5vOYgLTXira59c5jsy84WNcIKFk55s3MuLpxcTSJb8b?=
	=?us-ascii?Q?9zv1tMU9bDNkJdsIdNTwsX30Y40Q0G/MFuHwU/NuerDhrEXj2dbJg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3387;
	6:N4Be3pvhuVxX3wIfB+JIW3IIfSTzxj7jMxtHJNtX6rKWzphaHX6GEqqyb8HC+4Y9g1sV+YbsCDKhR/PvA5p+7oZCkQfkIfDhGhGvj1j8oDv38HPplyW/33tvEa0PtI+xDNfwKGWWGOWIIyh3ZxZE+k+Uc+EHIE7/cipBhJN1FNA1C/ui+fea26WemhpwhBRRWlIWg7xn/aGYZhODK5WkVGr6xJ2DcJ3X7WoyK92MvhM5FOBCrn02vlGgjJrSsgGPe1uhFse5C7aWSkdcrUXmsynNUjAlNvXDxnmI+EEOREhdwQuKlATjJzkQjuMO8VewUNxN4u65rn2M8KN75nnouEOgzpLEv+emTremADgaBQE=;
	5:G9jVEF+sVTUXrEMFiS4WsYh7fXKRzRxx5ZrDNf8GA6y97DWTlVY1Xocui3EiPEjXsI7sdsIP9GSY2UpDcfuJyzQLj2hcUITjDyP9AwNISCSXAcVc2usC2MSZbQzxr2QJTCYLuFd+Gz9w2BmZueZmrpempuXpqaGNtaVO7sqSg6w=;
	24:Tag2W9H2amNG6sxbwOI1I5ULrUJ5pKDJzlRb43Q4nO1+jNwvOsS5LPrlmqA2Wxpc3xsFyK3C3WIIZeS8akCMaxYpKDwiqkUchpf4jNHf39A=;
	7:t/ZPQ+s0dtZtrEgnPkPSbAvy3kS8mv3xhHk95Y+8CrT6+UO3GDfK8kSr3IkFKr1G+a6JlEGFavhBIgRtAyRlZQH4IkAaO/Vnj2fYYe7jhIwqTANGTvI5ht1APm0uTnyoHduyxJCKtpw+Sd4f6iLX2w/luAyNzuYpH/T2NG2ubcjG41VREtF6cQRQICKB8kAxFSNp0PK1uqQunC6CZTjV8Wi8WcIkDwbSn1Jm7ihaXON55pFCyKjInrtl/9vu08eS
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2017 18:10:26.2661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c2f446-b6f3-4522-cd4a-08d54254c949
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3387
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.55
Subject: Re: [Qemu-trivial] [PATCH 0/4] Trivial changes in "registerfields.h"
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
X-List-Received-Date: Wed, 13 Dec 2017 18:10:38 -0000

On Wed, Dec 13, 2017 at 02:17:32AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Philippe Mathieu-Daud=E9 (4):
>   MAINTAINERS: add "hw/registerfields.h" in Register API entry
>   hw/registerfields: fix a typo in the FIELD() documentation
>   hw/registerfields: add 64-bit extract/deposit macros
>   hw/registerfields: add missing include
>=20
>  include/hw/registerfields.h | 15 ++++++++++++++-
>  MAINTAINERS                 |  1 +
>  2 files changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


