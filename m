Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yt8Qv-0001AB-Se
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 01:45:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1Yt8Qt-00019Q-Cc
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 01:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1Yt8Qq-0004AO-5u
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 01:45:15 -0400
Received: from mail-bn1on0097.outbound.protection.outlook.com
	([157.56.110.97]:38683
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1Yt8Qq-0004AK-16
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 01:45:12 -0400
Received: from BL2FFO11FD021.protection.gbl (10.173.160.33) by
	BL2FFO11HUB035.protection.gbl (10.173.161.115) with Microsoft SMTP
	Server (TLS) id 15.1.160.8; Fri, 15 May 2015 05:45:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD021.mail.protection.outlook.com (10.173.161.100) with
	Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport; Fri, 15 May 2015
	05:45:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1Yt8Qn-0004BA-Q2; Thu, 14 May 2015 22:45:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1Yt8Qn-0002Ux-HL; Thu, 14 May 2015 22:45:09 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t4F5ifQg025065; Thu, 14 May 2015 22:44:42 -0700
Received: from [172.16.163.220] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1Yt8Qe-0002H5-5j; Thu, 14 May 2015 22:45:00 -0700
Date: Fri, 15 May 2015 15:41:42 +1000
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Message-ID: <20150515054142.GL30952@toto>
References: <1431668019-6987-1-git-send-email-crosthwaite.peter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1431668019-6987-1-git-send-email-crosthwaite.peter@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21544.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD021;
	1:9QsGUfNUSHLuWTeEMHbyx11XSbjGOKiAVxL+SP3Z9QPhpZN9h1YfzC++NZ/lhXeOuLqgY5LS2Bscwou1NzpJBy3HqBN+MTO6K39G0RBo938w2DfnSINPM8nJZOaGbsfkYLhqsnZiQlHwhUifb8VNC7b0sg2qqX6XKKSFUdJIAomT3lgyS1w+plrBbiL+v7PlssPlF7T2UYNaGUL0X2RtOQkfOWzU0v9rhQW/+D4jWxGeGvmQx/9DwaNY8HLL4xokRT6wd05/oMH5TtV1i4A/qA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(51704005)(24454002)(189002)(199003)(97756001)(87936001)(6806004)(33716001)(46406003)(47776003)(23726002)(76506005)(57986006)(63266004)(106466001)(2950100001)(77156002)(62966003)(77096005)(92566002)(46102003)(33656002)(86362001)(5001960100002)(110136002)(83506001)(19580405001)(19580395003)(50986999)(54356999)(76176999)(1411001)(189998001)(36386004)(4001350100001)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB035;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11HUB035;
	2:1XK5XYOqzeno1rTgw4PE10zxDAhCFmUpFN1OtiqtQ?=
	=?us-ascii?Q?HaOyeAdz6rQVxe42jIWD4PQ;
	2:o5qJIH4pWx+pZEnPdeGAPS5UKCggtKLXct?=
	=?us-ascii?Q?/Plmq1oMEQExFtLSJ97wvz59EFheGGEEL4OorFcp7FviD4iY5rbagsmSLWrp?=
	=?us-ascii?Q?76zqq5iHyTL/Rx5Hg7bD9TfOOOlvMi51TtCSSjPjVJ5xSR6N1ZK9PjD30pie?=
	=?us-ascii?Q?j6Y2VGlOSkmhruZvrikM6s6L6xBRNv569qNY2MCNvWnGz/NnkfYanrPKWBeZ?=
	=?us-ascii?Q?5eRNpRTbyANDL2rGooQEQ=3D;
	6:IyV3z5UCig+njqMQgUjIbr6MdZxK+6qDJ?=
	=?us-ascii?Q?pxHIObUsvK7ySLGYMStG0+BZfVxPJGcKiTvGMhziSrE7zmCDLnfIiMpQKAsj?=
	=?us-ascii?Q?aE7g03ycnfzw6wjthQTbdlKZ5ZdXj7RHH2fE4BQb9DtDe3ZGQxII8W4JKD7K?=
	=?us-ascii?Q?bzZdpEoVmxftaZhz0W74Unl+K+6+rOEnJboR3Fx5PeNVWnigvaajLv1F+8xZ?=
	=?us-ascii?Q?+x7JVuINoFSMZRaY9SVSQsuhjgllHBQ5frHeve8eYKDFrXOnGKxWIVYdDIsH?=
	=?us-ascii?Q?68RzahqnqNoSKuvlJQQXsPVJGVWaUf00IyBLN6SUfGHWlaC393FnePhrqxn5?=
	=?us-ascii?Q?/u32sPW0kvRfLha49BBDW2I7KgQ7zg6Rs0Zw9kP5Yg/GNZOl7ZJ+Pm99tkNG?=
	=?us-ascii?Q?ytpH7TY2NNrK6cB69+ksYD7CdvZ+QY3scMY4YualtILqjpX5LWDIqrHf7SLV?=
	=?us-ascii?Q?KeER6uKibiqYikh4W7lGrLJEGWN4RrLzKxxN0wE9AjwYVDLCVmHnWfRnjNq;
	?=
	=?us-ascii?Q?3:5DQJjN4DTwN15+o93XeNS7yedL65Z72Q49JqMhBopJA/bieTphEJe3lYnU?=
	=?us-ascii?Q?Nz48dIzGDiWYnSwx9nTC+KIHeD6VoKW5MwJ0CbzlF6cIIFwiDAVZb286fms8?=
	=?us-ascii?B?ZTVGMnVXYlB2OU5CQnRHOU1ERzYvSDZSVkhJS1ZoQzUNCg0KDQoNCkZPNHNn?=
	=?us-ascii?Q?/Qc5q+ty3S9JJb6KA7y859mGHcSlrCLqSy3OMQ37CFm8c9Pc8jWxoTrX+vUP?=
	=?us-ascii?Q?6hlhKP4ZCtgFlMpBw8wexGIDDD3K34lykjr43IyTgoHZFwcKgizgCHXaNDqW?=
	=?us-ascii?Q?Sa5nd2QnVqx5AuqcRBABOIwA=3D;
	9:LdIMF3L9muX1qTNwDRYNXMUGuMAgGT?=
	=?us-ascii?Q?dP+ClG7PeTDeUjEhbD9QAOgDQFW+5sIK05R0OwjxdqbPG3OEWd/ZJnL+aFem?=
	=?us-ascii?Q?BDTyWgUk5VqxeivMyoBqOSUGnOdwsTdXz+TQzUslOoajwG5hR6RZ75k0UpSp?=
	=?us-ascii?Q?A7f3/JkK4Jk+KtkniFABS2SRJnZrA2lCMdo3i8Z5mbwc61/bmZ8IUCMJqedP?=
	=?us-ascii?Q?FZkUBNIulQzkqHrxykU+AP7jIO3Dk5nA5LJF5M9Tya+/CO7E5kV5GgK0hA77?=
	=?us-ascii?Q?dWMxjjB+nH4KY1A34oBztu9GhKdh8Qa2dsNkBXaOQZt1MrSVXqgHqnD0tbTN?=
	=?us-ascii?Q?RiVJkVwV8yy0OSug0Byvh9mfFmJvM6SO6a4XjO+p8bhGVoa0g8zsl95AzE6g?=
	=?us-ascii?Q?4p/aQH4m5diL/xxDb1NT43eC1aQ2KqKn+5LFwBhuGTKuqFgL4/N79EGaLi8Z?=
	=?us-ascii?Q?5kinFp4yLVaX/c0iOev6Z11AigE460lySyGdYaLemseeZQKzIr6EQpGH2C3b?=
	=?us-ascii?Q?84PaKI+WMR0/8Glx+yzhqQ2/pXwySuVN9kjAn7Ide4b2lOaCmXxfUf+HNdT/?=
	=?us-ascii?Q?Y+AuCht7pXxQq+otQw225e/cdfiuRprsNRGlzyWslj6F/zoXsgO5nH1rn0Qj?=
	=?us-ascii?Q?EsdkB7PkYiNN/GinGLSa9b+BWIg8wGsV9n3pNVGySCBONctL161XdXxNHs8t?=
	=?us-ascii?Q?JO/cI8FkMOErO/H7ZL3uax0I1uNQFmruKZPLML77YIOlmjFX2tsgCgEZl/mc?=
	=?us-ascii?Q?RKBioKtPvWmqkVmC1datf6r/+bEnH0zNJeYXmA80HzMe2Fs/2y4D5DSAY2kG?=
	=?us-ascii?Q?1XKCfdoz4PQ3IAI9W5DYd=0D=0AA2=0D=0Aq0=0D=0A4rrY73VqFZSX8Cl8m?=
	=?us-ascii?Q?BqEP84OBxXufEBa6H9nVQdio2v9eFFWtgG30NSvQd2ZcQfyr3b3Yssq/V8er?=
	=?us-ascii?Q?IADPZEQuClRgBQ3w1PHkH1W4xO68XLqrU4bCRuUS5wrQ1UoEDSMNOyJcsCj4?=
	=?us-ascii?Q?IdEINooEvFSo9W57+tr+vKeDaCLZNZbPgXyhRXS6boSrTKidMRfW;
	3:HksOk?=
	=?us-ascii?Q?0IeUVl+uX3WgFqS76OMQLuzZ3ki/itk+MB3vPkfSGQFkftXzb3Iu7mmzj0wl?=
	=?us-ascii?Q?bwAfuOEOovthXi+mWs1lewblsH5Ok5A7srGhqkcJ1MxLOZzdZd4v/uBm3r1b?=
	=?us-ascii?Q?T5c/DvOwMHxKTMPYggzdZN7AA=3D=3D;
	10:8kbtKukPVKiG4iqrrhlHqoEMq?=
	=?us-ascii?Q?T3be3jz4z+xYWjS9e59z3fpTRWKdmnmswjg/gW2WrsAYzV8+BXDUeqeAb3Vu?=
	=?us-ascii?Q?F7XSTpn6lfN/vzjhCUBVqw=3D?=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB035;
X-Microsoft-Antispam-PRVS: <BL2FFO11HUB0355DA075C1ABBB1BA669E1E3C70@BL2FFO11HUB035.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BL2FFO11HUB035; BCL:0;
	PCL:0; RULEID:; SRVR:BL2FFO11HUB035; 
X-Forefront-PRVS: 0577AD41D6
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2015 05:45:10.6170 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.97
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.oorg
Subject: Re: [Qemu-trivial] [PATCH] microblaze: cpu: Delete MMAP_SHIFT
	definition
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
X-List-Received-Date: Fri, 15 May 2015 05:45:16 -0000

On Thu, May 14, 2015 at 10:33:39PM -0700, Peter Crosthwaite wrote:
> From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
> 
> Just fallback on the default of 12 like other architectures. This
> allows changing the system-mode-affecting definition of
> TARGET_PAGE_BITS without affecting microblaze linux-user.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>  target-microblaze/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
> index 4ea04ac..d73e1c7 100644
> --- a/target-microblaze/cpu.h
> +++ b/target-microblaze/cpu.h
> @@ -285,7 +285,6 @@ int cpu_mb_signal_handler(int host_signum, void *pinfo,
>  
>  /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
>  #define TARGET_PAGE_BITS 12
> -#define MMAP_SHIFT TARGET_PAGE_BITS
>  
>  #define TARGET_PHYS_ADDR_SPACE_BITS 32
>  #define TARGET_VIRT_ADDR_SPACE_BITS 32
> -- 
> 1.9.1
> 

