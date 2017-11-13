Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOA-0002fu-9u
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENO4-0002bf-Lb
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENO1-00076b-HF
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:28 -0500
Received: from mail-by2nam01on0078.outbound.protection.outlook.com
	([104.47.34.78]:51891
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENO1-00075r-6K; Mon, 13 Nov 2017 17:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AWX4c71g+kzdY+bxhaz0/0IDVev7o8AOiZms+K2qTmg=;
	b=5bnRBelEWP0IBgP3ugpTKV4Bv0Vd9260ioEnSBw7I7fS6ixd3YFjC9ImWVo85pPPfyWP9/TFzFfpxltQ0tq7KSODr6TrW3s5o9rkg2AZLf83pounvgJrzj7DK8UCozrBmvZLpgAq9X+P8GIr6naAK1hH8lp9vxMb8kUIQ7Al8YI=
Received: from SN4PR0201CA0032.namprd02.prod.outlook.com (10.162.76.18) by
	SN1PR02MB1343.namprd02.prod.outlook.com (10.162.0.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:22 +0000
Received: from SN1NAM02FT002.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by SN4PR0201CA0032.outlook.office365.com
	(2603:10b6:803:2e::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT002.mail.protection.outlook.com (10.152.72.94) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNx-00049D-4O; Mon, 13 Nov 2017 14:39:21 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNx-0000SP-1b; Mon, 13 Nov 2017 14:39:21 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdDxF002785; Mon, 13 Nov 2017 14:39:13 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNp-0000Rm-81; Mon, 13 Nov 2017 14:39:13 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:35:13 -0800
Message-ID: <46c461836a838351cc117dbcedb9102c480fc9da.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(6306002)(9786002)(110136005)(54906003)(316002)(39060400002)(8936002)(575784001)(50466002)(47776003)(4326008)(5660300001)(36756003)(23676003)(5820100001)(305945005)(50986999)(63266004)(77096006)(81156014)(81166006)(2870700001)(76176999)(106466001)(189998001)(2906002)(50226002)(356003)(106002)(33646002)(8676002)(118296001)(478600001)(36386004)(2950100002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1343; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT002;
	1:ieFboX95GEhxDvB//k0DDBuwgkSEiiegpTRElUH2SFHWaZLcVo8LFryOHcK44YLzRSrdGYKjBjGu4ioh4QcKmN5xenDoJOi2aA46a6Vv8e89Khel05VYLOf7sowgTx7y
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b63cd61-eb34-429b-aca9-08d52ae76241
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:SN1PR02MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	3:b1B3F+3/d/qfQ2M8UJ5czRw6CwMMiUYZKaTm+u3OS24tTKFrnD00hq1WsdGGsBr5FZ+do9oHCqRr01gWylC6yT8lXGNwjf03Z8j0Y2qTlTa6gm0oCM1N5ZGPRV3kUaZ7x4xNihqFyPpTOC1kqcp266o69NQOdvJMtOWOymPES5sRSgiBYCQuSogy+5lhingZdD224EN5rLWJU9+pRcDf8KN9MGN310HsNCSU9XrgPcfQjT2NHJGXlp/EX6v6+F0dTpUMd4eO5iHzH9dH+FghiHPorUXNI47rmt/MN9I8+8Us4EIzneMEcIqQ40QQNrm1Y3a1ousXL1BqDQMnIGDMhGc91vH59vcaabTLjzKVW+A=;
	25:Tmnw2mSKgdCjosJaQY5uEGWxhp+WQnG2VJ0Vn4yzc1fghvRNgwg+H/r2ixb9jsMtHK7ZBB5hzq5KuwBRQDFGBE+z4FTTaBbACtAxIL7bk5JfWAKjU0Lfuy4RjSZun4YTbhPZpNCqRUSTMQb/qmfstoq340SL7caqSg2HTcTD4wf5bauUs0gy74jVF5wGFDTCaFJjMi5DLGHO52LqMDDdUkVDXSSoAWNectJGAD8TudfA1V1IJKKJFucAUUtqMkV/+dMDHixnIQ3PifSgOLxTihEhasbWRRoe6gNWLH4WEFTKFn41YYFl2womBoojNYCoouhK5WIPeDS3UktKEskUjzLcMKQ8wz36gSRiN5zsT0A=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1343:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	31:puukb/fc85vgJghMdjjUaEYW3eZb2k9rTxRWxnM6zFRDAN974wsM3DdjggXb7N4vmE4mJ2mw1u06ksE79odMZD4uU/FYNxDoKZV1ZlVgFo0RDZh6w6XcUc8kr4qaiLQq8l4ftLiDqhFai7n1xoQGnx8g1eTbMfRTrH2uBzpUg1i0xkbBJDq0REHpctaogFrjUC9+kXGJuLMdqDKyw5FuPaCFaQnKVkuPUyK1eN9PAhU=;
	20:+q8apIPQjnh54jobUDv6VWRLuPz+MeZKknHdcAqx5tDU4VyZqI4zSHwNPzQzV5qXX767faOd1vkG6xnnC42ej1MnYSA4unZdm3U2a7aKGGRW+QOtTSppEIvOHHiQrPz9KqlB0KgeEgho3XbCJGKt9L+cE8Q4r0CsVf2ZvMlqo4M60HUUZeQw9Ef2O+IDSG6KWds6+UP9Dy3iLkhLAcR9XKcRQGvwrPkE57YzbXW4sDhHltaWtIru4CEIbKghJ1tSfBX0wW4dkhnYoUQILV4tlWYCG5BlbyxyEAckSZDyYs8oF6b73dE2DrUtp/ntRLoeOZrXgqNaczotzRBPo/XpQsgn2Hx8cboQeOrpRxbNmoDxeBmgndfJEH9WxB7xHSbdOH4eEPWtWUOyWHxKXUkYEh1YQ7jwjRG3y2dGKHqPcQTaALRaubSL471ViWlYC/0qua08FBYGTBHvwh4vgZpDFQgO39mnGhrH6PYT8kHTLP81HPsI6mwbf6UnisGE6xDa
X-Microsoft-Antispam-PRVS: <SN1PR02MB13436D095C32228F626C0DBEDC2B0@SN1PR02MB1343.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(3231022)(3002001)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR02MB1343; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR02MB1343; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	4:xNgRLTrvhmDLG0/Tpay0s/mOdujCtcBd4mD19rVq/VdnVkzuHRH8K83dAmPIPDUPjMC9Gk3fnTxfxbJeuMFxQzPtlhAmmjdXMbDOKN8jCAbP1emhAUjHDmRg/81t5tj3Da/Hb7G5xp8Mcu7uDN/o1YHRF5YUeoQI2d/dkLk1CJNeRzyjlxN/3f5RJteK8LpX0yMxILB0P0gfJy1TICVrVuCzBbq0eQXSYaw4otzq7EIet93JrYJp20B3sN3x7pJIZSXq6jPpPo2qrbPIPPXKftxpVA3ge+v/YLoxTWGpyJw+Di1lTg69rKg8AeFE9xm06lVeb4SZyCcCiMpPeSyS/UOs6B9gewWmxxSYfUbCpAIypq8TmAfkWlT+ZtkFyLYQXs7SXTGzBURIidljXu1WCBbqQ1os8pwLlikfR3KRYR4=
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1343;
	23:MXU3cMRwcj6Kxx04pFzUvUpIFK1YJ4NaTiShSIBhv?=
	=?us-ascii?Q?3OP47QgYgmK+7Ee/OhlrrCqKM0MB3B3fsgwOkS4OjKOucPLgU0VH5lBJwKHY?=
	=?us-ascii?Q?atVOqwBRl/qelZvhjqZG9mlYPntoANL02fesnhp1QAp6xYusZNvSZTIp2Tsk?=
	=?us-ascii?Q?URX10/vUGQUSHCNG6+oYvr9bWBUqXdorQ13/esFbAR1DWZ69M/n7dwOS16tE?=
	=?us-ascii?Q?KtkXk8Ja5GTDDDUhINAT9BGfvi91zQZb+Nkd/6qoysvsbbwz89K218EA1X+A?=
	=?us-ascii?Q?olRJ78cxBLxO76F++vF1TYMgBS02jHjjkWpRjdPyhMY/K7yLtQk/Rq4e/y2W?=
	=?us-ascii?Q?Xhxc1AzcTDmThWjwJEe9Mwxljr21Cz7qp1cOk1oKyau7kCniZd17r8jxzZqB?=
	=?us-ascii?Q?ntOleL6zMnjuUFMpysIsUANdLRYLP5+HsnmipW3JMNdjh/MCz1IaCfaJQ0YS?=
	=?us-ascii?Q?2iWRU3VUZyjtMpX2vXFv5D/jL3FUrF+fE49/OCKroFq8ARC4Li+UVXPTY2Mi?=
	=?us-ascii?Q?yExkwPIW+SxmlBEUYoXP4nlqCp8UipYqiD6qi+DvCQJ/zdE5fXCg4/KTJZZW?=
	=?us-ascii?Q?ROlKAbjQD0Xc2Wa/7DpVIOnFOfZ3gehEfNIaTSYDCIxHS2sFOjJliExlbP/y?=
	=?us-ascii?Q?l7S05zRUAWDM5C1DUmNIKoOYi5GYwyMweuOG6fS42gqYWJtuW5sSIjkatGjM?=
	=?us-ascii?Q?shg+N1yY9GuSOyhuymt/FVGJ3Ncr8TYDwgIB84wXV52FrkESb1MG4CbSOkKQ?=
	=?us-ascii?Q?qZk7jSr9rXb2cpJaQKfj24FidpDk5jTXJ4s5HWQBa612WQHZUxQnEvQh3ZjV?=
	=?us-ascii?Q?dPbrgkVoJpD9zQrF38lY6GfU921X2m9SymLfkFGoLX4KqUpKUFuEOKcgxRPZ?=
	=?us-ascii?Q?WGrAYyqw+wSb2Y3krCb5MQyHR7VFEXhZxliCQBiWnHh8fqtBuXm/llZpvUtP?=
	=?us-ascii?Q?ZhQwyYifq50f1mRlNDUVu5Uq8UDPvXA9nlt1cFEGkN1dLEt/VuerOu4zpkRf?=
	=?us-ascii?Q?yc2vtuchWf8Hiw6FzvJ5DxWpqvxb8d/ohaUI7ZOvJAi49Lah3Vm57qv+AlAM?=
	=?us-ascii?Q?JswPdg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1343;
	6:Gaybz7w5xyUwCK7owulCW9X93tgbW3uH0ypzRGKBxpvciVCYyOerWtEozroABoePiCOd0L32uDGF6TXm25QoxKeQb4kuMLMxUJgoRS06L8Y4GTNVUL/yvUTZtTT0Zh+1oEEQds/qqs4dg92qSdwuHFAOWh/W6vFU90wOv8Ht9SW+2ofcStizN0wk4iprNkDwkctseHlggtmPKVc+Mx2fOJ0vK/AmQl/GeVL673kMy0wVJnkJVFqBNAfV+ggEnLEdU+4i6xErd64qH1Dac9bMwvgJBP/RTIwkfN7XBD7QZKSu07RzLfKtY55ymPgSEFgvT+x2naVWVd4fTAQwojxPQedDWq2drhautVFAVQC5uq0=;
	5:rmCVrzsLWR48Fp8E7HfWA7yxKpz5LnqitYOQWclXMvPA1BUwUBOHr6ZxxxChj075lkMQ+TvVjehMf6f5mADjd4bK6jGUFNdlzE/ZM5ar7QexCchjpZbNvMHDtkkCzYIHwKas2wf0jXee+huoryJbNxZ7JO5QmVE4Xr6k1mxn6G0=;
	24:Tfw1qndqtH5w61NW43HmzTikIJdyDHsSMQK81FWuEhp69wyGMqKLnA0H45Bw9sZ3yiajafb0Kw4eanMTKzF59NwnoPi12OvEjVuR4vyqflg=;
	7:Zf73XPWMJKccWbFfAnFDX5aDBKnpuFMrcbvGNLpSp/6mEu8ZgKP3/uKqZJZ2iN2X+op10kB6n++MEnNKrK8wE4zONmzc1maY9bLy6wcub1c8UeIYo+v14r5UPoN64B6p0dZJQ1hFDVRWRbFFgffuj3/PBaD8u0c0ZouD6mEX6UmAWlYBxRzy50/yMBh5QVops9i2OB8EoyGwkR93TcYIo52r9WcSH32KwdVBQMEEj9xUVBsge1y1aymg9Y9jtH7Q
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:21.4576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b63cd61-eb34-429b-aca9-08d52ae76241
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1343
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.78
Subject: [Qemu-trivial] [PATCH v5 12/29] hw/isa: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:33 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/isa/isa-bus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 348e0eab9d..0f2e426d02 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licens=
es/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "monitor/monitor.h"
@@ -186,15 +187,15 @@ ISADevice *isa_vga_init(ISABus *bus)
     case VGA_CIRRUS:
         return isa_create_simple(bus, "isa-cirrus-vga");
     case VGA_QXL:
-        fprintf(stderr, "%s: qxl: no PCI bus\n", __func__);
+        error_report("%s: qxl: no PCI bus", __func__);
         return NULL;
     case VGA_STD:
         return isa_create_simple(bus, "isa-vga");
     case VGA_VMWARE:
-        fprintf(stderr, "%s: vmware_vga: no PCI bus\n", __func__);
+        error_report("%s: vmware_vga: no PCI bus", __func__);
         return NULL;
     case VGA_VIRTIO:
-        fprintf(stderr, "%s: virtio-vga: no PCI bus\n", __func__);
+        error_report("%s: virtio-vga: no PCI bus", __func__);
         return NULL;
     case VGA_NONE:
     default:
--=20
2.14.1


