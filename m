Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBG-00083w-M0
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBD-00081K-W8
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBA-0007Nn-Vh
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:19 -0500
Received: from mail-co1nam03on0060.outbound.protection.outlook.com
	([104.47.40.60]:60768
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBA-0007Mv-L5; Wed, 20 Dec 2017 12:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rl5KAzJZqZewgJ+HsEVNsvuWhgCBUIgxENXfZNIcuks=;
	b=SyfyktSYAWL414OAWzlWwmzFoeLmofSPKBsdRjN+tfdn7+SUs/5v/S0xZL6JaktiI4ZaDPKEsmjpUNWRpPReoLBeUm0ikK/oeWFW5zR+wN5lvXLZFyIGVLDreNC9XAqGpe3RNaYu5tc67sBxbEMGCyxntBftdrAD59NFfXnEx9A=
Received: from SN4PR0201CA0057.namprd02.prod.outlook.com (10.171.31.147) by
	SN1PR02MB1344.namprd02.prod.outlook.com (10.162.0.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:29:13 +0000
Received: from SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by SN4PR0201CA0057.outlook.office365.com
	(2603:10b6:803:20::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:13 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT029.mail.protection.outlook.com (10.152.72.110) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB6-0004tO-TL; Wed, 20 Dec 2017 09:29:12 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB6-0003vN-Qz; Wed, 20 Dec 2017 09:29:12 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHTBLx008635; Wed, 20 Dec 2017 09:29:11 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB5-0003vC-0s; Wed, 20 Dec 2017 09:29:11 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:24:54 -0800
Message-ID: <468b9e700d27ca73ef1a8f75ba024a38677d291b.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(376002)(39380400002)(346002)(39860400002)(396003)(2980300002)(438002)(199004)(189003)(8676002)(50466002)(6666003)(316002)(9786002)(5660300001)(106002)(23676004)(2906002)(2950100002)(110136005)(7696005)(305945005)(118296001)(39060400002)(54906003)(76176011)(106466001)(356003)(50226002)(59450400001)(8936002)(47776003)(81156014)(36756003)(2870700001)(36386004)(4326008)(77096006)(5820100001)(63266004)(478600001)(81166006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1344; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT029;
	1:QMY0J9xxGLU60HC/gBsge9f2qxRlmfZ9C2g2WDmGH/URnPPsEtApy7K7pZGK6b1raRYUSvEtNgrTuNKHRghKF9iyJ05A1EHAdJjIXYx73t3AjkDyVVA148XgAWNPLSgB
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61e34fed-4347-4382-4e12-08d547cf3068
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	3:Dxkfk2BvRLWoTavGxcMrrbLtEV5+Y/t+fRCHla3qXr6aIrn5Zo32sVKNhOuzMJPCTnt77Fj3bKekG35QorvakcQ9YcfsxMRQqUayuEF+58YwtnUFqhdttx1TgUjVt2ZKT5vlIwTtl3q/krhKKFgW/DfyT2jxOxpqDCIm5GEL/yt0c+h+eLUJEC1A3LvA1cvuDKuTDoQQOPPt5YiJ4O7zqtxL2aU5miFTQ2c4z9esXiliPDTpQtXGxVD8dPBJKN2O919phP1/w4CZjgcbYGvRxyGDHA/Ao/KQURG1Jsn8fjYhGOhdnK1JE30QFTMsaU81Bm+TbLfHWVKRR32n6goDl1jpAKw7eYSLfcF6mJqDlFM=;
	25:fV003at0VtZEPSAuSkxR+Q82z6j5lsycZuWiOCULsZpsbHILdbSz4S+gP8LJ0iZWyjjdo5YZVPz0BIbvIH+RbyfdRIwhKXt68owGjo9nVn/TwNbRQ0IShmsRbW+Nlw7uCTTgWtGWyy0gq6kPg++Q7jTrw8RRP9lYxWbyRgcrxoGhVsAf9HxynKThHfm4Q9K1T65/RHeP3w+dM9GicK+uYRDIwgUMlgy4/w/dtky9R+I8I/0FWT5O51ww8dkNDAhsFU5IE3T+28LChbCXZ6PClVxvN9UuoXVQ2zPCgfZnz095BNpjMZg2iQytknRbull5KLKdguylHShPr/eqndyOp2uaqqMynnnlinqoivKGvss=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1344:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	31:ld4ppkoWZpU65TNYOZJg4eR7BwPB3wuL/o/69wXD8lv2l7NXaZvApqATQgwvOFolxMWURISnbJiPPBKZQVfhV7TLO0ceZyiTHK1b55ujV8EDdDGSHZHOjkIXHred8er9hfbc9BsOL3vTp6cd9qPc86YBLUfqJMU75lVGAS+TDa1WJH+j3zbn1HkcBsDu0g9gjX11jRXc2W3HbR/TeHgXfuXXJMQIGMVUkMPlLaLgrAY=;
	20:iQoXolzVuzAf+15ShJmYk0qrsl1nZI0qfest5i/5N1VIURgwKLqF9wC4vbjW6pQP/GqjCwKTBnqAAkBNvBYMLKRFTY16xOlQk9gwpq2X0aqC29AP1YHyTGfADlxmPMEzJlknoOuVvXgd/pc9IR8rTikJwCEuAWoarC+4JjiPZc1C6dg6aFnrWAMQXsi2jD3TMZyaSNEcUQ8ChPkCYLYoRMWZV43yWfKOGjbs6KLhGUJR03Y9lY2yFhYmrffONxeNqHh7l/qtwCK5yIFvCIHXh80a/ePyzhIFV7DnP8BNQk9wskJcrFOFyOvTV939F2Jxg827ggvOJ+zGkscKdbfWO4mbgVRMloKVJz1BZy1SvmBSFwtRqUguIRhyLgZDnrEHxmti+rGDYnxnWaRENsaFwYpJ53uqwqzY+g3sc34xiAEpEQKR3lkiCvTX87nuXl5u+7tzX1Zn3zyBT4yfzfJyB4AXwctyBuaZ7QQeYbWGtohoLHXD1IZFonUPiD9nEaE3
X-Microsoft-Antispam-PRVS: <SN1PR02MB13442BD13E3EB973F42F9781DC0C0@SN1PR02MB1344.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3231023)(10201501046)(93006095)(93004095)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN1PR02MB1344; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	4:4oectlhw7ncoyvwNx/yLxVNT6mPQHuay1tR6H8NcyhVI2+P3xNOhFFMiCEU1NEuqhSdtMMAvPORJWmOPwv83QP5hLf7lQJnBLrm72d4Ltx/sZH/kKLGrXzO1/4Yw1tVd6ij7iGpWP64TSZZGS0bTaPn0vGJAyQ3QIgrz50qa1ZJxBvXyra+h9GNK1/zFiTF0F5DDRs8RmOAQMey2p3uakdEybBzXkZi0cUsSUhT3QLrtwiIpd03r1suIUxHLdEJqEHzNKAcjZubZj3VeqbpnqBYOxF9ezBiSa5ZjgUoRyT9fd2hMOuFtTKUwiWrnlknTy6N62X07gsBysHY3AVu2Nw==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1344;
	23:LqwDs3XluvgshREZGk3CDJ/4uMLUdxhjEg6Ua0/C5?=
	=?us-ascii?Q?GjdbmbrYVIN6nn7ONhVFWF6JdglDTXfVVVut5sBPj0/wJhE3UjoGjIc0Grr8?=
	=?us-ascii?Q?qGcjs/N5CnG0poJn3jEICqhm/cvHYJnzMmE7GFcZcxx4ncJVzA6pRbbjNE4g?=
	=?us-ascii?Q?fLVRlKTp78rphOFlGl0hOGBKBxv9+f6vTDPpBY0unVisPsgBQIhSvwtsmYDM?=
	=?us-ascii?Q?7RRkzB5J2ne4pEHeP2Yftq/QadQnRY4vMn8XEkWxcvEsuHuuOqGK5rFx74AV?=
	=?us-ascii?Q?5gnRIJ5qWLuaebY+sUc2sksA7lhybdv035qSHqwc1nJT5T8+jJ7boFxuZDn+?=
	=?us-ascii?Q?foL/K2VmIGNiMXctf7Bq8BXMHws8Kt3E8epvJQPTaR0UZa8P6iP5IrlBk1LZ?=
	=?us-ascii?Q?Xm85FFQDshgKfAK9whRqGzQPTDgoV3hd8aHy4qd83qt3KyUjUh1XtmEPyVoZ?=
	=?us-ascii?Q?sYsPUqRmjqkntqa/VU3VSrMGhQIov0uT0YzCHUXPsaa25U8hynY6CtHOBCgv?=
	=?us-ascii?Q?KPn71vGL/hQ5GPT0Fq9wfKVIR5gfi6USbNPbvBgPrtqQoIylNzPfcGKMcIz3?=
	=?us-ascii?Q?veIqty/CkwqeL3f5DhKlCpsPShijtMRunC1y/TDPZfaZoj6zMcg4H81JI4iv?=
	=?us-ascii?Q?LE9WU/Wx+5iwgGxF/K1NV9B9H+VX5hDOKXXGmGUNtlfZs/vgw/SYi2WcL3y1?=
	=?us-ascii?Q?MRGH4/NJvSYRzITCvj0NLFYCQwJU+vC0bEoM/C4UCXkAs5WAaX8U+PpuksTi?=
	=?us-ascii?Q?tNRYPci52ez//hdiHFab2tZsU31vmwA2UMsU8ef4CFTUx467FrO+2Zn6SD90?=
	=?us-ascii?Q?mwdU5Wbpo5J9pjxNVtoYCdqU0xVwiS89TzU3k87Y/fP78Er0YgqXJmnsEwER?=
	=?us-ascii?Q?yoWEG5z8LCwt5CK4vAVTrRx3QbdyqBNoxUZL/CfNwrD7q+/7AQG4I/IlQkDs?=
	=?us-ascii?Q?QKu/059FhYTGj5UUH+eoBgAwTuH8xHBTqeeySrs/fs4dnLUkQrRsGlkX4PpM?=
	=?us-ascii?Q?3wG8+yHWbG+yaF2T82/loPyVCINlHnKH1FKgCZNoA4Ztw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	6:fil1dCOfDgWO/ALcmD58KJfH6N+SiuKcRToyJoX2PxUIX32LsTciFpXQmVP9+IO4avz7Y1Y8EX6c4yfPh0HhUTkdrV9kDzpsDKUqjNulIB6aQb70JZ0uyu3L1XEgTKJWUcdQD4eP6qoH3+CzCyfMBb5I+VOtZaXyfOzhbeNUDLu6Qcj+jAlObWOYiehugaBSA3R5dMf6gfHkb6FWndADG9ak3HbOw78RVIyyckpxHww7ZjFKM4Pd4wMk5wnsg+Q+oJXYpwjidAF1D0kKsx8miXo7FeAs9OyJzlv461DGBQSJXY+VftrT7W5KcUF1BQLvxHy9YiMLdZO/qGCfKbmtQsszM3S83YMo7W2lwA+XpQE=;
	5:xych4VdkyuC4yQNlqfcLdwpLW7innwQ/H/cMa9zyS9EELNGEkgyeZCncXAmn4hb41kcFFKb8qXOkYv9vZXm5f1zO69UUv64t5pS1kztjs/ehykVxhNFJ5qibxEQxAk4hTocawXz2OlIqXxcwgoMZ8zhLK1KDzklZwPWOkYR/fBQ=;
	24:Sxgkis0Uoe+MsT2L1ejFObVZIo/E84t8lTCtEO28xWkUYy0W2FfrjrK7fGJPzzTMt5iTOlLa0yEKCGceIHtIe0FGEJyF6xX/98CP5hhNA7w=;
	7:XLd4P6OjIWxhsfSE6qMwots8+yOI4RXqFAk8TR/UXk8k6/J3NUJpYgXLyamH5ZjBVDV0Ab8h8GuiDvItgY/bRm1Hq7RPDo4zLNEYMBU2Z+a4YAp4SiMZcycBjz9J0xJBm8eCqqfRhKLCw0Ro2lJue9dAEb6WsGrrwhO5b8/No8CSDYKHnBdez3ST4jasA5Vc7T6Qoldv1RO8bjFKp98f2KozZeoLiA6KPoHctF2w9jKBOy072TqkaVZQYAXdg94y
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:13.6237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e34fed-4347-4382-4e12-08d547cf3068
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1344
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.60
Subject: [Qemu-trivial] [PATCH v6 25/29] hw/ssi: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:21 -0000

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
V2:
 - Split hw patch into individual directories

 hw/ssi/omap_spi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 34163e5646..98242d1e8b 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -20,6 +20,7 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
=20
@@ -295,9 +296,9 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
         if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
             omap_mcspi_dmarequest_update(s->ch + ch);
         if (((value >> 12) & 3) =3D=3D 3)			/* TRM */
-            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
+            error_report("%s: invalid TRM value (3)", __func__);
         if (((value >> 7) & 0x1f) < 3)			/* WL */
-            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
+            error_report("%s: invalid WL value (%" PRIx64 ")",
                             __func__, (value >> 7) & 0x1f);
         s->ch[ch].config =3D value & 0x7fffff;
         break;
--=20
2.14.1


