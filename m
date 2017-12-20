Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRi9b-0006QM-Kg
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:27:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9X-0006MO-Tx
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9U-0005AZ-R0
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:35 -0500
Received: from mail-dm3nam03on0077.outbound.protection.outlook.com
	([104.47.41.77]:39343
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9U-00059v-I2; Wed, 20 Dec 2017 12:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=45ezQMHwBHjjVfB6b6cpo7AwGrA4tmtr56e025FLqH8=;
	b=hnwQ+t+GcWdiC4sRdHEIFkqK5zilQHw0c4STcBhpZOBxqBRIccNEDWjKnz6pJnM7ivltaEUEvXncZnbLTOLVB0puAtOw8ZrwSAREVMtQzhgGayaQjeX6XWvTO+Wem56ZzMzY14mqmoTl2xgEuYZyADAmIdtKqzl5FZZ3RWJGS/Q=
Received: from CY4PR02CA0040.namprd02.prod.outlook.com (10.175.57.154) by
	CY4PR02MB3381.namprd02.prod.outlook.com (10.165.89.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:27:30 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by CY4PR02CA0040.outlook.office365.com
	(2603:10b6:903:117::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48730
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9R-0003qT-EM; Wed, 20 Dec 2017 09:27:29 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9R-0003Xs-By; Wed, 20 Dec 2017 09:27:29 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHRNmS008155; Wed, 20 Dec 2017 09:27:23 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9L-0003Wn-39; Wed, 20 Dec 2017 09:27:23 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:23:04 -0800
Message-ID: <75171003322239e9f9c16cc723c2d4cac569fde4.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(39860400002)(396003)(346002)(39380400002)(376002)(2980300002)(438002)(189003)(199004)(106466001)(6306002)(478600001)(81166006)(76176011)(23676004)(5820100001)(59450400001)(7696005)(47776003)(81156014)(8676002)(6666003)(5660300001)(2906002)(305945005)(356003)(50466002)(2950100002)(9786002)(50226002)(4326008)(118296001)(77096006)(8936002)(39060400002)(63266004)(2870700001)(36756003)(110136005)(54906003)(36386004)(316002)(106002)(107986001)(21314002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3381; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT035;
	1:haT2JhDOwNBsExw0WuYLUvHwvXWXBcCnR8SKvP6cZ4Z/7zBAmIvDECpofPHKScBAdC8hWu+ESEBqE1ahUKpUC0uGfqOxPoQ9+DEVjxzFVO5qWAGuPyA7Etfoyt1VAWDR
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5352d3-dde0-4ff5-d972-08d547cef2d2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	3:7/XDElGrxWI2AqSW/8oqIWWBphY9ULhzm/+6LZUWxmwT/EYuNMY9BGNtr1drFy9a1/mg2283GlvCGen5LUq5HF6n3DwVjOCEg0d/4sXYgyHL51cSSlIq1r6BHs4J9z0Zw6wmEdZrEriOvcntpFi8/CbzHzQs36MUumV0eW+7WQAvUvkklRCadwgxfzhJMvZGjqBMXfoVjJd3i27FpjHgx/CUWAahOSgFxkZEEqmZTu6BQ2KszkW0vy6jamfUZTJsauWAkX+3LvRODrmXmsWvxoI9G0tiu1Tc8KVpyu8L8MreKohg1gdVUpvGiDKbaSgvEuN64aubgcM4ySfLzka4pfaDU41x1yXekkge6WMNKsA=;
	25:dyJnXZu6ll6fFnN9Uecb5E59l+XKweaAchg3+r8Xo+EmVywM+sYt9H3L6v5difXVKV2r69LIg09h0sproShHZa3nXQlr47FMLDfF/NGMvby++UqwReIgr6HED6G6v5SH0udSeuBsurOGESGTFNQqIY3lUeikJxNjr5p5mS3WlpRfKm5Usk/Q03prambQ/VArd3DTo78tOOOZkgj7JRXA9GqHnJkdTqklL0Y+8MeUVI4rJid4zNY17mftVukj3itlQttLxNRpUJTQEtFfctwu8aux2p6SltWrNP/fSB7o0begKdB1zDJeb7Mp5bek9lrCjF0yjm6DMFQEk0gp1J3N4Q==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	31:BzgolcZMp6t7sP7DlmnjErgJfO8Yv5wlVIIR1FnhuTuMufZ5FSRwGY8pAL2mDXtOYuAKoLP4oJK2zl9agFf5QfM0adFQeGm70FShgqEZdwrG7EOrKmrZvoWQCvBnSX8YJzAmJ3+xKGJkjcgqk8BUntMf/Ahvs71unsWKkqPQWL6bfJNcw3MzbjV2qkLfsaxJdppsK06T+2E/c2tvA74koEpPGTFE8XunUWKTCm7o/jw=;
	20:mtWwLTIkusPWKFrLSDz2PpEm+SSrBfDe8hH7RkfTIBJsFtEMWCpuCiHxt2XPEVAwe5IYr/rSpwnseM0bXiyEhKpRd3NE5SoapCPI7i5oVAlVDKoK/mi/35niEYr2P314+wLOSvZ+6yuFK/QawT+VBSH7Yy43EmR2juDkD3rDZ1QcjimG7PYQ+wyf3f7ZfRDdIRLZm31oBOWWPLyk0i04QVS42sY28AbRmUqBEOKdgTHHE3F7oq32/XInxCZ0AH1LkT4kv+drv00M7YBtFqIGY7zSWrK+o+Cu43Q8GblLiud+17kDqY1n0X2HqnssONg6wTK95XBSFxjeeP5I5SvSADcu1oqbfAMkYTuk3W5EaKzJUfeHiU/Lu3wPSY0TK4WGZOauedMwN/E1rEH4rLmca36sS7rUuJmSyIvySfrZkdrZ11k8RTLmOuge+z4/GAL4ESeaLNz5ORIoZ2/4lLwITg5Ab5GiITEVhgkPKSM3cFzosYlKi3bFZ4sN84yVK8m7
X-Microsoft-Antispam-PRVS: <CY4PR02MB3381BDD7F43C1FF525D5EF18DC0C0@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(3231023)(93006095)(93004095)(10201501046)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR02MB3381; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	4:cc/4o+cWk88c4RXEhKCn7YRdBAuxE/a3Dr3C3B2IPZjmR4CHt5ZYYGs4hbKvZBAJ93AVC97rNj1oGGWV+YRrvxpcs7nkOznpO9r0QBAEG1BaYjuGAOtwCXQdJsSrghulBpxbfbfTi/bp3vOqsDukWqd2K33mRwmXYQydMRthY4jpFXODT41ERa8jc3mZnFqedwds+5F5A304Sp+og3JV+QJVlRDOOjKFOnYrdwTkqgs6BXZkdDkgF8BgXlfwcnbRVl6URdpCLv6QKvWQb5XUj9Am5swm5JQi2BF3xY9/GF0rSx3GI6hlrFw32NfP3rS1X1A7f98PVvMIsYqCcnWbG78TaQ+ilTm7a930dapdvaEb3MezL3vIEedaDGvawI4LYK8JMlrDjzqWOsHv1tisRQhO9CT9gHDPFeBgw5txuqk=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3381;
	23:tSQIyKIoIXDeMfZa4B5IDR4tRH95WhVMsY9hxRw8W?=
	=?us-ascii?Q?p1pFOy0T/ZQwGSxolxq4rvFHSwVjx9+eNNjNzOv1qHWEZgyT5g3ij4fih+gX?=
	=?us-ascii?Q?T01S7/lfeDWhQecDWY7ZtO0JAtiQZfKlkxUJbgIM84cFOJIA3Z95G0niy9ya?=
	=?us-ascii?Q?yDiJZa5fUEfW8AE1BJ0BA57ryikdhIgspQBJcoSSB92cIKFbSCZNeVIJpNMj?=
	=?us-ascii?Q?r1usveMEQ+GQ9ROW1kKAF/X13bDOgvASyik4X/AVv2zi1ImVcrF5NvCOjice?=
	=?us-ascii?Q?bhX+fMB7lC2jCGaN7zn88elZhH9tqELlYXfqtzmC1JfntcdK4qhHkFndjrYp?=
	=?us-ascii?Q?tj94i2ylwf0HrL1t8+RlnoBPBRg4nFBIC6tcsZLWzv/eELRAQowkvOwPGzA0?=
	=?us-ascii?Q?yeH/C1r0hJNWqOyRsV2WnhqYL1e5VsQKjPOsfl0IdxFTi02IAJZwhU6vyI/C?=
	=?us-ascii?Q?rNHiBrLt3daUXrGKyKpc3jVqDWyZyJyqZx/UU5jUUVDPh7by8MHI+ZkfIFDL?=
	=?us-ascii?Q?O0Ed+wtBGv1HI7dmkvOtbQcjUVXTS5cZPJSNaRVvODg8n7SY8yEn9vrO77ap?=
	=?us-ascii?Q?d0KEzUft5V6SseB3PVtvbtQU2X1PvUFfqcRPb4UoFZQQ4+8W3o8N7BAXfeLX?=
	=?us-ascii?Q?LcXwxKgdF0vSMDfsUMRJzjpm3NFyGMGS96/LHMVkYQDDBYvxuwLaNf/rUZyt?=
	=?us-ascii?Q?EaLnpKregvu3eeCfijIu0b5pa4iCjVGKqa2FpQcPhmK7JnRcev5+49NSYlYI?=
	=?us-ascii?Q?YDeBrmWoUp5tPJn1ab1GWRfD/1b7UJODU1NMbu6Uy6HTR2s/PLzCk6c+4z7d?=
	=?us-ascii?Q?bpNkqyMN6zP3hyuTi7bTt90zBGaQVZ7SczaXkgKR7UDpl5PrkxtlYGU/KrZD?=
	=?us-ascii?Q?ViTUZf5cK/aMyBaUsqVAk5yr20aZkGlOkwIfihIcZqIV8Ncs9P26vN83u5rm?=
	=?us-ascii?Q?ieEHsLcZ2NnDIhkts8DuQEXqsec6k3UVwSHDpsnMH0562jTViSnEik7NBzbu?=
	=?us-ascii?Q?gFbAKGu5dD9YKJzS/U4E7at8/a8C2Wdc5Qfdki350Oh8ny9VMJN8FkW6nPln?=
	=?us-ascii?Q?r4C0wy8N8w96atwC+CSm8vnMqSUnlJfIn6v/LlaIghStyV0D8BWc2MawtnV9?=
	=?us-ascii?Q?m5MpPM3nxE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	6:8R9eS3fibkYps5y65u/BeqbhWY6lpOR4onQNzO6++fJZuCZyP1/5ELAy2KZc5Bziwqw3LCwxUq0QsqbPrp6vzz2AC0E0RvEYZbzcAjnrcgh/609KAIMYZ+uvvogvW1o+If7Wue3gf3h+kRDsfOyYsBooQs4E/mNzu/rVyvGNfzPWEDC8fWAZc1xRcifcC1kH3tpv5NENP959HcescQvIreH3wQar81ZrUxiZ75Voal4M/7CM4NHusKQkFh2Hz28OWRM3UYQhprPDb6ljInZmVQNB3dnBW/TcC9LVXtvRLVdgz7/DkjiKmfmIaS3MSq5N4MUyspY57fyCnGincMY31WiXwHcLO0heIP9KbSjx3L0=;
	5:+4qWt5AeIgBISFfyVroAT2eAuyMYK0CHGFvmPFERIURB+j0Iy8RKTbruyjxkVtWdr2Xam+/ksQdBjf6qTkBtr1G6fkFwh2EAAASgIJTB8Erb1QPIEeDemxmBINqO27xQS/L04jSXnz7juW6ygpPwwUqSIz3qmP8dRgppUecw/FY=;
	24:lelPIUcq/v1amKoWPa4Iljw3lE93VTGarrVjSTLrcsJomnof4Twm9E2USpfMU4oLUmLPjfdWFVF/NwZnajqdeTb089Ome4To44yEVKkvnn8=;
	7:aVQ7q/5ilv5QISruvxzUnB6ltQvgJsFAXINDCo9goL8ZSOlkn+CGA0psfjX4kOX9UugqCX/obTVVFpTGAfpBhi1raaJUnMKNFB+EVFlRYo+wcUW1OzBUdLhzRV4o1PTAneNrpkVAELOoOUTNGg8el5I85SSJzHs/qpLApmctgDPD/RMjU0FdgPg9v7wLl5V4aw5g8gbMVqy3vTaQgYMRfLc9J/3qcX7QTbHs6XdyhmShWOe7e1eTsBlcj1jNmkQo
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:30.0376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5352d3-dde0-4ff5-d972-08d547cef2d2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.77
Subject: [Qemu-trivial] [PATCH v6 05/29] hw/dma: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:27:37 -0000

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
 - Remove ""s
V2:
 - Split hw patch into individual directories

 hw/dma/omap_dma.c | 26 ++++++++++++++------------
 hw/dma/soc_dma.c  | 36 ++++++++++++++++++------------------
 2 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index abd18c67ea..5d7fe06d98 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
@@ -1898,13 +1899,13 @@ static void omap_dma4_write(void *opaque, hwaddr ad=
dr,
             omap_dma_reset(s->dma);
         s->ocp =3D value & 0x3321;
         if (((s->ocp >> 12) & 3) =3D=3D 3)				/* MIDLEMODE */
-            fprintf(stderr, "%s: invalid DMA power mode\n", __func__);
+            error_report("%s: invalid DMA power mode", __func__);
         return;
=20
     case 0x78:	/* DMA4_GCR */
         s->gcr =3D value & 0x00ff00ff;
 	if ((value & 0xff) =3D=3D 0x00)		/* MAX_CHANNEL_FIFO_DEPTH */
-            fprintf(stderr, "%s: wrong FIFO depth in GCR\n", __func__);
+            error_report("%s: wrong FIFO depth in GCR", __func__);
         return;
=20
     case 0x80 ... 0xfff:
@@ -1934,8 +1935,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
         ch->buf_disable =3D (value >> 25) & 1;
         ch->src_sync =3D (value >> 24) & 1;	/* XXX For CamDMA must be 1 */
         if (ch->buf_disable && !ch->src_sync)
-            fprintf(stderr, "%s: Buffering disable is not allowed in "
-                            "destination synchronised mode\n", __func__);
+            error_report("%s: Buffering disable is not allowed in "
+                         "destination synchronised mode", __func__);
         ch->prefetch =3D (value >> 23) & 1;
         ch->bs =3D (value >> 18) & 1;
         ch->transparent_copy =3D (value >> 17) & 1;
@@ -1946,8 +1947,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
         ch->priority =3D (value & 0x0040) >> 6;
         ch->fs =3D (value & 0x0020) >> 5;
         if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1])
-            fprintf(stderr, "%s: For a packet transfer at least one port "
-                            "must be constant-addressed\n", __func__);
+            error_report("%s: For a packet transfer at least one port "
+                         "must be constant-addressed", __func__);
         ch->sync =3D (value & 0x001f) | ((value >> 14) & 0x0060);
         /* XXX must be 0x01 for CamDMA */
=20
@@ -1977,8 +1978,8 @@ static void omap_dma4_write(void *opaque, hwaddr addr=
,
         ch->endian[1] =3D(value >> 19) & 1;
         ch->endian_lock[1] =3D(value >> 18) & 1;
         if (ch->endian[0] !=3D ch->endian[1])
-            fprintf(stderr, "%s: DMA endianness conversion enable attempt\=
n",
-                            __func__);
+            error_report("%s: DMA endianness conversion enable attempt",
+                          __func__);
         ch->write_mode =3D (value >> 16) & 3;
         ch->burst[1] =3D (value & 0xc000) >> 14;
         ch->pack[1] =3D (value & 0x2000) >> 13;
@@ -1986,12 +1987,13 @@ static void omap_dma4_write(void *opaque, hwaddr ad=
dr,
         ch->burst[0] =3D (value & 0x0180) >> 7;
         ch->pack[0] =3D (value & 0x0040) >> 6;
         ch->translate[0] =3D (value & 0x003c) >> 2;
-        if (ch->translate[0] | ch->translate[1])
-            fprintf(stderr, "%s: bad MReqAddressTranslate sideband signal\=
n",
-                            __func__);
+        if (ch->translate[0] | ch->translate[1]) {
+            error_report("%s: bad MReqAddressTranslate sideband signal",
+                         __func__);
+        }
         ch->data_type =3D 1 << (value & 3);
         if ((value & 3) =3D=3D 3) {
-            printf("%s: bad data_type for DMA channel\n", __func__);
+            error_report("%s: bad data_type for DMA channel", __func__);
             ch->data_type >>=3D 1;
         }
         break;
diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 9bb499bf9c..45516241c6 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
@@ -270,11 +271,11 @@ void soc_dma_port_add_fifo(struct soc_dma_s *soc, hwa=
ddr virt_base,
         if (entry->type =3D=3D soc_dma_port_mem) {
             if (entry->addr <=3D virt_base &&
                             entry->addr + entry->u.mem.size > virt_base) {
-                fprintf(stderr, "%s: FIFO at %"PRIx64
-                                " collides with RAM region at %"PRIx64
-                                "-%"PRIx64 "\n", __func__,
-                                virt_base, entry->addr,
-                                (entry->addr + entry->u.mem.size));
+                error_report("%s: FIFO at %"PRIx64
+                             " collides with RAM region at %"PRIx64
+                             "-%"PRIx64, __func__,
+                             virt_base, entry->addr,
+                             (entry->addr + entry->u.mem.size));
                 exit(-1);
             }
=20
@@ -284,9 +285,9 @@ void soc_dma_port_add_fifo(struct soc_dma_s *soc, hwadd=
r virt_base,
             while (entry < dma->memmap + dma->memmap_size &&
                             entry->addr <=3D virt_base) {
                 if (entry->addr =3D=3D virt_base && entry->u.fifo.out =3D=
=3D out) {
-                    fprintf(stderr, "%s: FIFO at %"PRIx64
-                                    " collides FIFO at %"PRIx64 "\n",
-                                    __func__, virt_base, entry->addr);
+                    error_report("%s: FIFO at %"PRIx64
+                                 " collides FIFO at %"PRIx64,
+                                 __func__, virt_base, entry->addr);
                     exit(-1);
                 }
=20
@@ -321,11 +322,11 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, uint=
8_t *phys_base,
             if ((entry->addr >=3D virt_base && entry->addr < virt_base + s=
ize) ||
                             (entry->addr <=3D virt_base &&
                              entry->addr + entry->u.mem.size > virt_base))=
 {
-                fprintf(stderr, "%s: RAM at %"PRIx64 "-%"PRIx64
-                                " collides with RAM region at %"PRIx64
-                                "-%"PRIx64 "\n", __func__,
-                                virt_base, virt_base + size,
-                                entry->addr, entry->addr + entry->u.mem.si=
ze);
+                error_report("%s: RAM at %"PRIx64 "-%"PRIx64
+                             " collides with RAM region at %"PRIx64
+                             "-%"PRIx64, __func__,
+                             virt_base, virt_base + size,
+                             entry->addr, entry->addr + entry->u.mem.size)=
;
                 exit(-1);
             }
=20
@@ -334,11 +335,10 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, uint=
8_t *phys_base,
         } else {
             if (entry->addr >=3D virt_base &&
                             entry->addr < virt_base + size) {
-                fprintf(stderr, "%s: RAM at %"PRIx64 "-%"PRIx64
-                                " collides with FIFO at %"PRIx64
-                                "\n", __func__,
-                                virt_base, virt_base + size,
-                                entry->addr);
+                error_report("%s: RAM at %"PRIx64 "-%"PRIx64
+                             " collides with FIFO at %"PRIx64,
+                             __func__, virt_base, virt_base + size,
+                             entry->addr);
                 exit(-1);
             }
=20
--=20
2.14.1


