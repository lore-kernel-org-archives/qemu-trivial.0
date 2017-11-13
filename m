Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENP0-0003rG-I4
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOw-0003fC-Qh
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOt-0007ec-Ko
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:22 -0500
Received: from mail-sn1nam01on0066.outbound.protection.outlook.com
	([104.47.32.66]:49078
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOt-0007dr-Ax; Mon, 13 Nov 2017 17:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/O0IU2PRp3vQdfP2MEMiimaozIhOZMhixXhY72PmrUw=;
	b=0tyrso4QzFZPfwIEREE8v0Or2Ex4nPJV6jHX/s3rAf1GJ4Djx/9WPUzJXtmdIn/OKFCSvlWckWjDNQSxEE/rm23cmMJbFnz/NnV6BlibeAxdZOlVg6AZkr57sCwrkOFDWyn8fYHBsGwXRb1XvS6HThJ35Uyv5dIbj5m97uZNFJM=
Received: from MWHPR0201CA0098.namprd02.prod.outlook.com (10.167.161.39) by
	BN6PR02MB3379.namprd02.prod.outlook.com (10.161.153.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:17 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by MWHPR0201CA0098.outlook.office365.com
	(2603:10b6:301:75::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47830
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0004Wp-Ds; Mon, 13 Nov 2017 14:40:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0000sx-AJ; Mon, 13 Nov 2017 14:40:15 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMe5XV013039; Mon, 13 Nov 2017 14:40:06 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOe-0000fT-46; Mon, 13 Nov 2017 14:40:04 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:36:04 -0800
Message-ID: <a09d5f8c16c55ae51867267607d7b657e279d1cb.1510612380.git.alistair.francis@xilinx.com>
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
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(189002)(199003)(5660300001)(8936002)(478600001)(33646002)(23676003)(77096006)(76176999)(47776003)(50986999)(189998001)(9786002)(5820100001)(50226002)(36756003)(110136005)(54906003)(39060400002)(63266004)(4326008)(2950100002)(356003)(81166006)(81156014)(106466001)(118296001)(106002)(8676002)(6306002)(305945005)(36386004)(2906002)(2870700001)(50466002)(316002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3379; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT023;
	1:WkG3v0OLsRvhVWcPqbJi6en03O8bDur8cgo9HQQpMmgggg4e/YGDzEXGR+LjncRjpK+JMvJmMZGjVESE+igOGQDssVS7FMrfB9Plw3sx1n3CVaagT0Ul7ds0euhB45Bi
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3f7cdd-9884-4188-f38d-08d52ae782ed
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	3:KxaWzLTLzJVnkbky1h9ORM/SNxR9vHe07WwV6zdhoTkAysJTIBr9jLftjQIg8muLlG7Wvjg9Y/ouKWOBJfE9KZhwQcJG66ZCTThvP1/svlSW0lqJLGuOfFzQ7pzmpyu+r0jsnbLkAp6OnX724/3HX6iMx1kZiVQT3GFPQ/4euwoZgAurSeBQvM4SBdyoizPzRUi4KFKKZe/b4n7COw7/jv3tYJsXpjV0MT6Kf0lfPZLMdFAZ+x90xiZPT8SW+7I+eWfPtdybGYG8ZAhKNPrxYnzww+gRJc0RiNvGtOuKzX+L8Br0rd3PYAVqv6FyzAy96qTj4hwnSUj2QpzZT0bra5bK80LC6Y/a5w4a4fBxNhg=;
	25:gTfJlD9rS1rbwnBMd8rUGpAOUuMZzdMRtsM3PxEkGGUNaXeH8DBZIQ7/reH9XVgvuJWeXNB1kvhuR379JouWjorzWuqidXYaFxfBsLxsIu/zySjmuhDWvlZPml7hCJzwvcwPs8JCUdY5fgfGayx0LP8VFJm3Q8CzZsA0cMy5Vm11r3n66uaGyQ/D8E3OO/Py9zi+3hx6OYk0yi6RIedugbZ4fjsQ/tLhNaqgSjs5Vn8rbbT1JnCZasiIdWbZMJ6LFCpkQNpU4WFmxaPBZdSLg3ioGyqmQmKQVKk/MJ4pLRLXhHdyv5ghXv3dQSAbkBJDoZBWKZrwDcoN+tD1FlDopg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3379:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	31:aYclmNnoNeyfsxmZxgS1vL8r2xwzz4HHpY9KYUxH6wvsPprX5MMM91eX4NRcd6pUVR1P+anq9dXV7nSIqf8KLLnhn4AoJlsJKLYu59UkVLoPqvKqlPBeekbvzrxAziOOAaoVx+z9f3XAsggm84GUThoq8ASBukqb/5uygawz4PnoaYFFD0z8OS14r/5lj5Fj7uzoGOZbnG4OLqgUBfKJ+sc5BM6ZauHu/UUcnj+Y9sY=;
	20:SLTgRMS7cPru9nKb0GN5SplGuVnratSmggcv1Oj1ACiD1oepAqw56lwla8rjsvu6KYcTfUM0afOUpSErhG5Q69q4ndobcNzcCvDflSj+PxXOfjnMKbMmhGeizTb4ThN8fbpT4u9rHkvuhY01XuPo6iaQzeU50k08B/9fte5I20oBF/YPbhK5Il6HtuefWDdZLxRaZH2hUAf1R0tC/cYkMiTBusiBJATi7miXq1+VwPd5p6MhYhIoiYgwvDxFYF33SrtvWbI6bekCTrrjn2Q+OnHP5BzeaLJWsaC06sAS2qMGLxnyM0zVuwTanmWWAfVcTG1GlXrQdpYO3zM1VqqNWO/yzU4GGpbor1mnAFQRNeoAX6oIzAl4t9x4U04MtHuFJn3y76STgzBnxhkkjgEYQEUDRnF1mLxFbmKcF0/Upo8KLxjK92n8SlfKZyGG1gaqRCFDSxCJ52U0Rtnhco9ZUUQUhAoLI+M755O/CF7O/zPgq8zNjHkcI4DLvz52Ullc
X-Microsoft-Antispam-PRVS: <BN6PR02MB33793819D6BB33F4ED38C01FDC2B0@BN6PR02MB3379.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231022)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3379; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3379; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	4:TCpzUgAjEYAhIhaKmIcvyJ1jxvSRsL1NKtRUgIoAqmIXHWID/qamY1qBljv2fxJ6dsGKFTuqZYepb0zewqgjoEX9rI3q/RgBHQC/9245p1hU7mk6TqlcOflzvEkDJVIKat4PDIARnAcfEyKB9gP3f24jUjDa1nDlOg/GeVfzJ23/wgD/459btK9pzJbLjz0nzK/xCYEhreKIb66TI9ayl5S1hB/1XtcUh/KlfjDMR6tixE+0Bh5Uwk7WWzLxEuwBaciNNayKo7uD5jNIISKcXk3jb8tLfetD84hYd35z0OoOKlQ57XuRiETly+FTiOnLh5v8emFB9oQtIwfwciGUFsO/nM6WEsflbsYJfM6czo26yJgIdj59GnBxFnqFZIJZ/pTrXdhMr0fzuX5JncFuXIjRz5Jfa+1il7oLmWSAvBY=
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3379;
	23:1pZAicU3A1i90A+vdJtdf0hGVw5yotyOE+kclYgD0?=
	=?us-ascii?Q?h10BZ8IR5ql/vMHdVpgfXVoT1ANlUCatXu8FlMnakxoapn60sHTcxQStI655?=
	=?us-ascii?Q?chVoEhIhWvtclPc0QuDpRroV23BahPqBtQ09LbqiosObXpeUjsF1jvu1zs7e?=
	=?us-ascii?Q?XjObOR6Td3Z/4YLT8zq+3k1PKAU9+lxy83sAgomoqf6VZvamFpWna7qgaLqK?=
	=?us-ascii?Q?QZ09LML7ncTF5qRxhbL0U7vI4vIbNNHqaxr92Kiqc16kReM533t2IuBvNJOR?=
	=?us-ascii?Q?BsZ2wod8qXrYpQ7Ue87wP8y97gozHR3G5J3kzF9xDr1FkAGRIoz3YRmUIoBA?=
	=?us-ascii?Q?c2SdZInbBwlUi0nsMcbeie+o1IYsP4cmNaVF8jcDUhOM47k9a3j22fXQyTaT?=
	=?us-ascii?Q?HpYPIgBniRIyRn5GeiVbtQMBwGtWp+fG/ZBeuEFaCLiiR+fzqZIbcu1hLMaF?=
	=?us-ascii?Q?5hWNerGBtud+lrPJQ7O+4mcIh/NA3ecn0XY77aKz498aXCiPe09Xjayy6oKP?=
	=?us-ascii?Q?apKSxVBFnU4qjGZqBgp1GQWYoqSc6DP8eBiD0Ngb35ZE5z1NbyRGDifhXcZJ?=
	=?us-ascii?Q?GUIXZtgoN8mehdrwI5CGUjXSiR7iQ1lStXEcQrJZTN++Ya/LDmXVK0uDXKPV?=
	=?us-ascii?Q?3hHeQIvJBdvuTGxt2tZOGjpVqOGwFf+lyjSXN/fMfwdNU1vKkHQw0uJjaU6S?=
	=?us-ascii?Q?MiD5I1YTt6ItnfNW7uZ82g70fpQo7W8pDoRKuf3Nco5FZml9sU7M/IezxcD4?=
	=?us-ascii?Q?Ru8rSAix4WDFwRics7LwT7pJWVr1lk3RRG5zyoYB+kjc/vsuRqubF/9ZHe15?=
	=?us-ascii?Q?XGEp4m05ogmeY9BHa2bOlYkjx+gbJiMlE1EPpSBL/TqN1j/ciC69ZheKxeAv?=
	=?us-ascii?Q?99gEFE7LJYqS5Ru1UH/MpcFO16tAAvCRrM0B8VoW4bUWO2j34LEsM4Ety8yu?=
	=?us-ascii?Q?N1frN9nLvJqnm4BXXcCSQkig/Q0tpGdEDZVlTcfrCtqxn9eLB7G48nHWYXmg?=
	=?us-ascii?Q?LANp0OYm/ZaHMYIWR/SU1Naa8ubh02X+GvlOQdYXlH1MKSjCsIwapVmRPzSn?=
	=?us-ascii?Q?Ee7iTf3WtbE1IgZCBKWOMmv150C?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3379;
	6:RI2p2FvSXGg20MzlHEL7iYVKjCJJrY9MKbEr6ouh1FJEkEUUW0R3uzZ6972PjLLztDqK/hejEW0IuYj151oHzRP4fCuORKR+dbNRVdP/aIJa1nXqUHzdu8lDaKPAsiE8jkiUF7CfBn5iBqg6Sep2AKhM4KTHtwyN0KzScqTs371vNYiRsNRs8XmT75pjC7pU95NcNvSEsgjQUaQfD3cROSUdKoIOQ1w22GfDjb5ZPHHJFJm7C6YLzZbfX/fnHUutmAo875mlqEpNzkDGQH8huravoj4ignZb1B6lB3mh5kR32tetz2rpkL1bAZgmEObHUYX4/faHd/Yi4FdT/8PVg0tokRzf2d6Z86or9HEFty4=;
	5:RQV7JE0RIGXYtn2QtAsrUVHSwXhaMTFl3zVE9ZX0V9Jh2i+p+fJ44omd4v1U+BuM6b8v0IErQhRU0pXkQmkim+Nq18daBFTGBgEQ0nPzKgXPOjbeaHaIbTX4aJcJqrXgtxmJSgvOp1iNY6mAeQ47Z/SzyppqjIDgsGvE/HlG8Kc=;
	24:lfY6epEJmavjafjZsG5p2wX5DysskijXbKrVg/BSGHibeAYEoFPGV2R06LNKzzrPDhzUXKfwEuyfa0jyqv4WwubbtU71gfTbPDK4eQxOR5E=;
	7:0h48fOFeb9qbANuPf26ZG+Scxv2twXukyyIrvep3g6P/e/FWoWwjIS7vcpojJjw46ACJFm43WtrzpA35L4DduFmd/mf/dHaLAJvpIfKHdktpGT7Q9hPzEg3IxFomR3iQ5cT5JITyMuWtLKDBv5+ICbJ90rlIBHHsDUSZP6nDXTPl8xEfy0l9TYejKjzGy0vRkpuL39nX+4Kc0MUobVtNmXHaHiDojXd1rFiVa4jqoHE8EjXIj4H/oPfRyVDXjUQq
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:16.1800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3f7cdd-9884-4188-f38d-08d52ae782ed
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.66
Subject: [Qemu-trivial] [PATCH v5 26/29] hw/timer: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:24 -0000

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

 hw/timer/omap_gptimer.c | 11 ++++++-----
 hw/timer/twl92230.c     |  2 +-
 hw/timer/xilinx_timer.c |  8 ++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
index ae2dc99832..0f064241d3 100644
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
@@ -356,7 +357,7 @@ static void omap_gp_timer_write(void *opaque, hwaddr ad=
dr,
     case 0x10:	/* TIOCP_CFG */
         s->config =3D value & 0x33d;
         if (((value >> 3) & 3) =3D=3D 3)				/* IDLEMODE */
-            fprintf(stderr, "%s: illegal IDLEMODE value in TIOCP_CFG\n",
+            error_report("%s: illegal IDLEMODE value in TIOCP_CFG",
                             __func__);
         if (value & 2)						/* SOFTRESET */
             omap_gp_timer_reset(s);
@@ -394,11 +395,11 @@ static void omap_gp_timer_write(void *opaque, hwaddr =
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
index ef116c636c..18880884c6 100644
--- a/hw/timer/twl92230.c
+++ b/hw/timer/twl92230.c
@@ -614,7 +614,7 @@ static void menelaus_write(void *opaque, uint8_t addr, =
uint8_t value)
             break;
         rtc_badness:
         default:
-            fprintf(stderr, "%s: bad RTC_UPDATE value %02x\n",
+            error_report("%s: bad RTC_UPDATE value %02x",
                             __func__, value);
             s->status |=3D 1 << 10;				/* RTCERR */
             menelaus_update(s);
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 59439c05be..a80bba846b 100644
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
@@ -135,7 +135,7 @@ static void timer_enable(struct xlx_timer *xt)
 {
     uint64_t count;
=20
-    D(fprintf(stderr, "%s timer=3D%d down=3D%d\n", __func__,
+    D(error_report("%s timer=3D%d down=3D%d", __func__,
               xt->nr, xt->regs[R_TCSR] & TCSR_UDT));
=20
     ptimer_stop(xt->ptimer);
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


