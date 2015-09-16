Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZcAcA-0005di-R0
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 07:11:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sai.pavan.boddu@xilinx.com>) id 1ZcAc4-0005b6-7V
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 07:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sai.pavan.boddu@xilinx.com>) id 1ZcAbz-0006go-9l
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 07:10:55 -0400
Received: from mail-bn1on0086.outbound.protection.outlook.com
	([157.56.110.86]:61174
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sai.pavan.boddu@xilinx.com>) id 1ZcAby-0006gc-QF
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 07:10:51 -0400
Received: from BN1AFFO11FD009.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB024.protection.gbl (10.58.52.134) with Microsoft SMTP
	Server (TLS) id 15.1.262.18; Wed, 16 Sep 2015 10:56:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD009.mail.protection.outlook.com (10.58.52.69) with Microsoft
	SMTP Server (TLS) id 15.1.262.18 via Frontend Transport;
	Wed, 16 Sep 2015 10:56:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <sai.pavan.boddu@xilinx.com>)
	id 1ZcANx-00085u-GP; Wed, 16 Sep 2015 03:56:21 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <sai.pavan.boddu@xilinx.com>)
	id 1ZcANx-0008Rx-C1; Wed, 16 Sep 2015 03:56:21 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t8GAtnJK021678; Wed, 16 Sep 2015 03:55:49 -0700
Received: from [172.22.159.26] (helo=XAP-PVEXCAS02.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <saipava@xilinx.com>)
	id 1ZcANw-0008Rp-Ad; Wed, 16 Sep 2015 03:56:20 -0700
Received: from XAP-PVEXMBX02.xlnx.xilinx.com ([fe80::6c95:7dae:8014:5ca1]) by
	XAP-PVEXCAS02.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Wed, 16 Sep 2015 18:56:19 +0800
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "crosthwaitepeter@gmail.com"
	<crosthwaitepeter@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>
Thread-Topic: [PATCH V4 2/2] sdhci: Change debug prints to compile
	unconditionally
Thread-Index: AQHQ6Zf/7ruiaZyCnUKgJnvc4IhJ9p4+euCAgACOVbA=
Date: Wed, 16 Sep 2015 10:56:18 +0000
Message-ID: <4025671C58A6E340B47F5CA342BC783A42AC1F2E@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1441649201-13839-1-git-send-email-saipava@xilinx.com>
	<1441649201-13839-2-git-send-email-saipava@xilinx.com>
	<55F943BB.309@msgid.tls.msk.ru>
In-Reply-To: <55F943BB.309@msgid.tls.msk.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.92.177]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21818.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD009;
	1:fHnyXXF9rrkKzQA09bfI0TS0TmBJbT0tnE5bwUNJVE+eXgYTQ2/s0/OAfO6JINGKfLWGdQRW86R6tBL/LxgYRuSnNKsB+5tLBNrNEB9uloTzS2OEi+j/qDR4yXYZsZ5haQfgX8D30iwnCup6HVnB3Scjkri7hG35Q6ueXK+oZsUdocO4jxPXv1xsweq33aT6cUq/nb7QP9oaBRlUIjAxrBUsHXw2vUI26ug62Pw0iY01Et0DNK9y4FMnzoAY3f9QzXyUbeCzxoArQLr2UsSqQdYAk4KCTgU0QT/7/uwOqUmIf01FdeJHShQ/8SDDedUJbcFyVom6CuMvR5i8pVEcsbHBmy9Y46QIhjeBsIakMjod8V8btQi7bDBTdjU/YAX1l98WE7IJENr6MdKcCMmEpA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(189002)(199003)(377454003)(24454002)(13464003)(5001830100001)(102836002)(77156002)(5004730100002)(62966003)(5007970100001)(5001860100001)(2501003)(5250100002)(55846006)(2900100001)(50466002)(2950100001)(2920100001)(11100500001)(4001540100001)(5001770100001)(92566002)(5003600100002)(189998001)(81156007)(5001960100002)(23746002)(54356999)(50986999)(19580395003)(6806004)(19580405001)(2201001)(47776003)(76176999)(63266004)(86362001)(87936001)(64706001)(106466001)(33656002)(106116001)(46102003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB024;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB024;
	2:2aYrAW9QnABp3bAQxVfgfQTFKxxTX6gaD0aoklsF7h0YXK/PS1u9IgYA0HquLS8OZY7ba2NV3/MbkwnDZ06YV+GKpcoV1ZtZ+FSGpohtTFff/oLwqUeNWXjT3ZIzq1fLEoLFL/l/orcfleGjIZbaveZshrOx3w/DK41ndCbzVtg=;
	3:H+9VDHhOWJWUzW6liCz5SP9F5KcyXMi+Lg969Z8wIWI91w9Q/NVdPJL2q7ICoqIQYLeGN3L8/o6rgYjomdrp1HodeR+q7dhR3NqMLYg/E5mDNMWn1HUGuWl83LRr3V+3/vyG5A9rhtUYaVeQqOyfaEYxWiQ/4IqUaOEySBkSNNk1FtjOTwc6uCqmUweWCwp2JIyFHgmcvzoR2ZvErMMHsRLRTecKi5ZYhtC+E7go3tJTUgroFASSyIHHvo4nQChsHk32LctRRbxM2ywgcxYgDg==;
	25:Cgt84VCUrHaKkzduvNTvsWVVKleAd+dOeWHM3tv2LMX7ZWEAaPKewsh8bR1ARwlqFEr0opUeI3IEJBEx49rqhGGIDKyUip4d2bDn5u/mpZXWqoMjDRH1VZfCMjn3hvt6Ub4l/u2YzTTXSmFzRUmxWdLYMVj8nUzLTYuOIddBSmaVPyfHqU5a2lGJ1qwFf7xJDjKg2rSw8gVDVjYfCd9SNDsBNekFrlywOk2MmEmBBV16bLyjNajcFmYCU2qZ3r5B7ZtFtaSJRzuc3SiVK6/ZlQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1AFFO11HUB024; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB024;
	20:z1jylK0Mb8g0ih4/pqeI6Efpp2LDoGsyXJjyH0gDPhfCNFz144opO0gJvPhUHGnPM/dHHFB7zWETBYjV0iBaeDHlNvZpJJ+Nop86N38TWNTxx7c3/p4HClcS/iW7BAI8onzC/eidB2ZVu2uL+R3FyVXQaD6vfCT7/TCXudZ4gCBM8FJnlhHsmm7mBUJTugNnqU/RssfDcLGNNlIgQ9+prikAq3dHE6bKwRN4hRAQKcpJYAH08qbYJegC8QeWUe0V4e3ZZQ/ov8ahWpvo745TUSps4NUYnb3vHs5qEowWKN5bLEcOOhl3JUjv2/Un6B49ZVpfmHm/4pPC2HzqAm3d/rGTRRhw0ZrDbVMYI8T6fVQW7sbqgMjp79Fhrx+h4YWC0NuZcOyF/wG6Kh6JIQamKHTtiQFqDldwwPyYDpEGbZ8llf5sa9RRZmGWy4tNxhm0v86QUqvoEOr2rD+ui/4DsNhTuSF84dcJADaMNQGb2HzIzR1nQWXEEmhSvOcVmWMf;
	4:elA20L10nS8MG4iEL9sV0R8MNX9rDojXekeIJBGOlRA34jRIOO5q351yvFkJFCwVyvRlQ02rjL5XC4eKbwvCBxcGyd+q9pb/pkeK06E6ZrnpRxvt/BIeFYkoSyYxY6j2MKTjyf6b7nVc7sJym7ZZi/lCTFpRuL5dPFoQKdHWAyYR29ui8xcGgHEuW7nFvimiFN3dEw+3dsFOiJheIPkMa73UBkcXAYXk7HtWRyMcB2BXRka19HDdX7pqDyK9pnsjtRyjdGgR1H609Ab9SIzk+U6XBetDrzHsFHZPctje3nN4UfnNlUrV4MGxK9uGlvlCzZO9dutr+u1/D9GKR/JmwtAEB7BJoNMn/r1wyQ+N8VGNT4G+W3rGxuVzW92vJFiBCK4AtTPKsePxZmZcKQKSlw==
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB02434AA620142DD002523F5DC5B0@BN1AFFO11HUB024.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(520029)(520078)(520075)(520058)(5005006)(520017)(8121501046)(3002001);
	SRVR:BN1AFFO11HUB024; BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB024; 
X-Forefront-PRVS: 07013D7479
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN1AFFO11HUB024;
	23:ntd99p2MDO1sw/eyUQ40vNIjEh0xFA8iI7N?=
	=?Windows-1252?Q?QDVkxdSY7MrRCxXrsSIsxV8A4+j1Vd9TIf7QtmLLbM/rsK9Bmd/18pAi?=
	=?Windows-1252?Q?WLLnbxFeh1e2/uqWgyX3UioTYwkKuXWS2JCkF/FF6Sd+H0qFt2oSk6ie?=
	=?Windows-1252?Q?OOEN7qyIorcbgbbpyYurl66ySOxpwEdZDSrlC00oLtG84XNKVNjcS9k2?=
	=?Windows-1252?Q?z6jHv7owJ/1DKGCrNG8V/vT19X+vBtel5rOhHRvUA/Cj2D7papISXXP8?=
	=?Windows-1252?Q?u2YwVNpJZn9EmCWh2lmRdbiGpteW/ZCygejNYNChpe5qUJobqN7diP7p?=
	=?Windows-1252?Q?zEDA7MF0V+IMmimXRLvZT7sQ79CDFh4pYz9x3Qun65Ynd9DrmP3QoyDd?=
	=?Windows-1252?Q?AO8AChSeV9qMKCL882DUVu0soJHUM3rsql7s5MHWJSyROWzUPA8lT7hK?=
	=?Windows-1252?Q?yKOvzXkD66bJY0Wf4Plc7wSCoEPHYHf3sokHngqmB8Ar8gS+n2ON3AHX?=
	=?Windows-1252?Q?bAyLZ5S/7Wi4djwvwe2hmZYr/4POzo8JAzXoHijDOHSXVWO8P/dtyvoc?=
	=?Windows-1252?Q?hScGrVE7jsPZTi+sTvQhNw6vk3EcPzEOjeS1EPXdpqHDNV0tBAOMebe3?=
	=?Windows-1252?Q?WHmvE+9QOmOiAtfVbVokVXcVbrk1OvXX8QT1XSPHHS63HlgyWOJLJwR+?=
	=?Windows-1252?Q?XHs1VwbZ8Coor2IUgy/ZXfPyZJpykzEl56ywJZNz7vvcHacX4arjbyAt?=
	=?Windows-1252?Q?fR3EGqt9SoYS9YEVJ2bvlGfKr7jtoEQtVPdR/56Hmfu1VTzaaaPRyfjQ?=
	=?Windows-1252?Q?darGFV3iVsNArMhH5gjKqkG+9i20BALaeBQsOb6oDczM9uSB+VAzC1yD?=
	=?Windows-1252?Q?ZzcSMbkgVgLu0nEUsEs/h9HCg7KnQveK+H92A7fMfKcv0cvA4tacZMNp?=
	=?Windows-1252?Q?uwZVV/BZderu/6WnykAkeGzYlEffXrpUGhLkOJS8azqsFRBwNtYQIsKm?=
	=?Windows-1252?Q?b+xnCbO/frjh16QU7tJhuEvQaX+9jB4I7LX3erB89ulyAgu+D/8xMxpc?=
	=?Windows-1252?Q?dt7XYpvl6HiemTQ7iIu7fSZ/WGR1WDC8uS+mNv9gafQdNnGxKNjKJbvd?=
	=?Windows-1252?Q?YcoFlu9tSqLSnsd7ekChEObnqZKsLFBq10UkVuhkPmGnXfZyBuEP7Q64?=
	=?Windows-1252?Q?EFT4u1/rnp5LtCv0KA4SEn9gmNQgNPteaiox9nJSo5Tn51ioZp0Ajtmd?=
	=?Windows-1252?Q?XohFvkvJmo2whn+Sq9nIApUhj2/O3b+UgAO7e6FvZ6v2CHTRhhPzbSJh?=
	=?Windows-1252?Q?0Dd5DJPc9haMavddsnKeTb6vo50AcX70zSimfvWhV3OMpAZwNzk8E3gf?=
	=?Windows-1252?Q?lenyuA770MNkaTq2gNcmv9+1flhZDMeHT+g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB024;
	5:5pPUTFAHiXdHtfHHYChm5pnCt0LMwohAOI2kehHHEHElzRNE8pn9llhv9dyOL5oPZzjs0UuEJeblkdKjHgLV1HZR3NOs9jUzcJijD6OPMYcvWx5/O7nDUUICTWzilrKOEZWAs8jm9wfbO165H7GioA==;
	24:aBM3A0dtOXaZ9A+2+4stzzDOdXxKTM8fwZlXK6bevTtt2u8Vb8iale6lLmfl/J1JYAzkwhnxwHOq1Fpszl/L/iNqgG9PiqCww+86dFI6zms=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2015 10:56:22.5586 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB024
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.86
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
	Alistair Francis <alistai@xilinx.com>
Subject: Re: [Qemu-trivial] [PATCH V4 2/2] sdhci: Change debug prints to
 compile unconditionally
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Sep 2015 11:10:59 -0000



> -----Original Message-----
> From: Michael Tokarev [mailto:mjt@tls.msk.ru]
> Sent: Wednesday, September 16, 2015 3:56 PM
> To: Sai Pavan Boddu; qemu-devel@nongnu.org;
> crosthwaitepeter@gmail.com; eblake@redhat.com;
> peter.maydell@linaro.org
> Cc: Sai Pavan Boddu; Edgar Iglesias; Alistair Francis; qemu-trivial
> Subject: Re: [PATCH V4 2/2] sdhci: Change debug prints to compile
> unconditionally
>=20
> 07.09.2015 21:06, Sai Pavan Boddu wrote:
> > Conditional compilation hides few type mismatch warnings, fix it to
> > compile unconditionally.
>=20
> Applied to the trivial-patches tree, thanks!
Thanks Michael,

Regards,
Sai
>=20
> /mjt


