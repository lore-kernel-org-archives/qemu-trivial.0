Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnNlH-00055E-7D
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 04:54:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1YnNCg-0000a7-L0
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 04:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1YnNCf-00029p-OX
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 04:18:46 -0400
Received: from mail-bn1bon0071.outbound.protection.outlook.com
	([157.56.111.71]:37425
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1YnNCb-00029H-6E; Wed, 29 Apr 2015 04:18:41 -0400
Received: from BY2FFO11FD014.protection.gbl (10.1.14.33) by
	BY2FFO11HUB001.protection.gbl (10.1.14.143) with Microsoft SMTP Server
	(TLS) id 15.1.160.8; Wed, 29 Apr 2015 05:44:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD014.mail.protection.outlook.com (10.1.14.76) with Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Wed, 29 Apr 2015 05:44:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1YnKiu-0008Hd-AT; Tue, 28 Apr 2015 22:39:52 -0700
Date: Wed, 29 Apr 2015 15:42:07 +1000
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1430286001-2473-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1430286001-2473-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21508.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <dfaa1679-7292-47b2-b120-1de118088733@BY2FFO11FD014.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(24454002)(51704005)(189002)(199003)(110136001)(50466002)(74316001)(97756001)(6806004)(2950100001)(106466001)(46102003)(104016003)(4477795004)(23726002)(19580395003)(19580405001)(70736001)(46406003)(47776003)(31696002)(53416004)(86362001)(87936001)(5001920100001)(1496007)(50986999)(92566002)(54356999)(76176999)(77156002)(62966003)(107986001)(23106004)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB001;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en;
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB001;
X-Microsoft-Antispam-PRVS: <BY2FFO11HUB00159E5C7509D6975FE59F8E3D70@BY2FFO11HUB001.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2FFO11HUB001; BCL:0;
	PCL:0; RULEID:; SRVR:BY2FFO11HUB001; 
X-Forefront-PRVS: 05610E64EE
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2015 05:44:49.9439 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB001
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.71
X-Mailman-Approved-At: Wed, 29 Apr 2015 04:54:29 -0400
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] mb: cpu: Renumber EXCP_* constants to
	close gap
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
X-List-Received-Date: Wed, 29 Apr 2015 08:18:47 -0000

On Wed, Apr 29, 2015 at 08:40:01AM +0300, Michael Tokarev wrote:
> After removal of EXCP_NMI there's a gap in EXCP_*
> numbering. Let's remove it.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> Since I applied Peter's series already, without renumbering,
> b/c he wanted to make no code changes and that's a good plan,
> I send this renumbering as a separate change.  Hopefully this
> way it is possible to get Reviewed-by from Edgar for the whole
> series including this my change in a separate patch, because
> Edgar only gave his R-b for the series with the change :)
> 
>  target-microblaze/cpu.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
> index 6522af7..d389597 100644
> --- a/target-microblaze/cpu.h
> +++ b/target-microblaze/cpu.h
> @@ -36,11 +36,11 @@ typedef struct CPUMBState CPUMBState;
>  
>  #define ELF_MACHINE	EM_MICROBLAZE
>  
> -#define EXCP_MMU        2
> -#define EXCP_IRQ        3
> -#define EXCP_BREAK      4
> -#define EXCP_HW_BREAK   5
> -#define EXCP_HW_EXCP    6
> +#define EXCP_MMU        1
> +#define EXCP_IRQ        2
> +#define EXCP_BREAK      3
> +#define EXCP_HW_BREAK   4
> +#define EXCP_HW_EXCP    5
>  
>  /* MicroBlaze-specific interrupt pending bits.  */
>  #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
> -- 
> 2.1.4
> 

