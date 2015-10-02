Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5np-0003ES-47
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:39:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1ZhpfR-0006Rk-9Y
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 22:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1ZhpfM-0008TW-Az
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 22:01:49 -0400
Received: from mail-bl2on0086.outbound.protection.outlook.com
	([65.55.169.86]:27200
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1ZhpfM-0008T8-6P
	for qemu-trivial@nongnu.org; Thu, 01 Oct 2015 22:01:44 -0400
Received: from BN1AFFO11FD054.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB029.protection.gbl (10.58.52.139) with Microsoft SMTP
	Server (TLS) id 15.1.274.4; Fri, 2 Oct 2015 00:26:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD054.mail.protection.outlook.com (10.58.53.69) with Microsoft
	SMTP Server (TLS) id 15.1.274.4 via Frontend Transport;
	Fri, 2 Oct 2015 00:26:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1ZhoBZ-0006fd-1z; Thu, 01 Oct 2015 17:26:53 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1ZhoBY-0007Td-To; Thu, 01 Oct 2015 17:26:52 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t920QO44023037; Thu, 1 Oct 2015 17:26:24 -0700
Received: from [172.19.162.146] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1ZhoBY-0007Ta-2y; Thu, 01 Oct 2015 17:26:52 -0700
Date: Thu, 1 Oct 2015 17:26:51 -0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20151002002651.GC29416@toto>
References: <1443213953-10022-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1443213953-10022-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21850.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD054;
	1:+TVWLxFBgP87lFVOCvG2hBuqWJIfy5BCRyK68q1D4VqTZ/g3dquiYxYMZbVsFHqHV1vAQosN0DEb51Wpfsotpm1sNqIG7S3GAWcQf4r3eRuaMQYcg3axrNFacWw8NEuMf/b1cYkuRiu7SkY7PotWY6lKAJNjSEdTyVnNVLLAMF1DtGvN3dU3o1+k7jZvO9NuBBemyl0+/pJPeBLT4K+XN6YsCjxfAfaERkRom6bM2GiyD29Mfu/3sMt+n+hx+lqFZFVWKLMDPXpGxx82gwDXpWxX/ssFXRZoFMiBclLWV/WyBfMhhYIVGYNFMN6UFPLKWT78K/zUfeZLrpotB+cb+hWNiBl/LjsMfDnqY3ued8lj9AkrtoDPHMLsjk1wkac3PFbcYaIAq3vw5RyAONoxYA==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(24454002)(199003)(189002)(11100500001)(5007970100001)(57986006)(189998001)(77096005)(110136002)(5001830100001)(86362001)(5008740100001)(83506001)(46406003)(47776003)(54356999)(87936001)(63266004)(5001960100002)(33716001)(62966003)(76176999)(46102003)(50986999)(106466001)(97756001)(33656002)(77156002)(19580405001)(23726002)(6806005)(64706001)(19580395003)(2950100001)(92566002)(4001540100001)(50466002)(4001350100001)(5001860100001)(81156007)(76506005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB029;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB029;
	2:o94Nk8uGOVD5brlx0AUH1yeSdrBsICrsoLbqLT9bDsVR0ZZoA8NUTrwf5x13PlJb4Fzhbk7GEhJBEiXVT0VoVaCxdzj8+on3BQv4+1t9EUw8KYcxu+kbCL+AFYJx/I3xVW5lg2vqJkkbYqG0/t80Dgt0vbWYbtGz1nowjZH5hH0=;
	3:/EdslFhACPGKvR7cF1hLsQMVZEr6/vz9gMhNzPHufka+o1Tu1UDQgAzLpfvuXz/02GixFh+MecIG7XmWsHGD/uA+7sDbOTZhCsuim75ZXit3DTyLgSycRgc2mWWjfmo0v3E6p4hhW5zUKfw3ZKk5EdD4lEL1Cx1arkpaBaR92fBYr68emQVNZYDyYKJ/AP/kff4oz4zpm5JZZwxgiGkwcneAr9HGxE1BDRVHkXNHxOP6FPkmr9wIRWrJfWK4Z0Y/NKVFch4ZJ7Fu4KC5tMhLsA==;
	25:iWEMtXN97GU1dcY5TMPFm68YY6iZRW/Sm0a/LiSSLQBMm+ci/ay8KXtI3HOMRE39k3eRRUyRnU6qRyagBQqt5LbK0jcZY2L32UWNvOKpvWCQJHr27LWacBStttokVpSOVDiv6F2U3v/NASd8kqToQq4a+wGi4lgahfsWYuivpNWvKOlXhFqYZrHJ+FaTSKP8U0sVdIqx2ZF35eDeMtnKLBhOI+ih9Vb8+oQZhVu5VYo5rroGF5g1womZr89dCo5T6wF0TQuZu0/cjckZAqO6Qw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1AFFO11HUB029; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB029;
	20:pqxWpt9EGdi8mZaG7eStKHEssq/dSW08vXSa+4zJ8DMWYdMW41EHzBY4ghkUnhLmY/wu8qVIdssg0eQySHrv5eLgg/EGGgkQM06/elp8RO/WCEH6AEeen2SgqX8OREko5h40SbcgsbW41VhXQvFCDKiQOuW6Zeb4M9iloTarOm7LVt8DhoDebIwGnzTbmCn1TjT1cFO1epjN2hW2BdzznHL+P5FuKQR4XhcCrfMbMw4Fn2Nky8xjvfCjyf4OVlYWJki4jG+eCWzyd4r30fNX/34jWw4DDo93udY/uCav/pIF/Q3dlU7mlDaZUpncjTzf1ItxkCazk++NNr3vRG1iLkFlqaP0ykH1ZEwb414LPMOArnYRWpSjGeIm+thniG6f6EcZWeOhjo8nC4GYcYyzLUr+g41+q34fTz4u+8ryM0cojOgdUVMoRIqprFmFJUoeQfZDHAiFm/Sc2fAAEmD3Jl3mLXUSM7CIV7anT1eFaX73AHfsoBFrRacuo4p+R7zH;
	4:Qrg4QqVy1mIQsBQKzZxMGNGnkojZLj6Khr3jwx3FEY+qK70XO9koAoJpMDnHY64HtBauWDnKuNdmXSNP5ecjFy/oA/SCM4fJRhcgVV17EMG0awTDbcqnYDjRAK+PPBj2VoSXAvgzsSptM/IR0+vITzVLdITcafHR4oaXMgfEMq80GlYI7tCRroL8UhGRcludX7AFQqlGT72vk5hJEqvvDXHBBC1BYB/soSsg/uVWg6I5JFmPcgb3xKbQ80DP6B0GSHwyz2web6sBMurCI1LWKghRMcFKvtXJ7rrlfBI9dnz9Qeb7KXt/fpPEVvw56qHAqY+MBLsRtnalsO9KBHoEECRYy+GFOV2cu7rRD+iNWxI=
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB0292C4903A8E877CF262E8BE34B0@BN1AFFO11HUB029.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001);
	SRVR:BN1AFFO11HUB029; BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB029; 
X-Forefront-PRVS: 0717E25089
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1AFFO11HUB029;
	23:ENfozz67+5Fwuhu8EEiCrUhL8CjSTGnpa5GjXS0?=
	=?us-ascii?Q?mlhk2ziSZyRYPcvDXxEDLCLSlYgznvVxfWoDwCX/w1vzrpMrxFE++/4lVG/B?=
	=?us-ascii?Q?Ush8Mj3bjbh8ssraRIG5AG0my8bi/V9aScSbfLMvTCk/D4jQp39Or+K2T/vj?=
	=?us-ascii?Q?IUhXCPN/yIq6UKlySSgcGvuyT/c/cI6+pAgCA09Ks3D20fK/PGuhjoOqHt4h?=
	=?us-ascii?Q?J+g7OE0i7fBRXn0JGA4ESUIc/lriMarL2ZLenfhpl6nnsspghJk0Bi9HkWwP?=
	=?us-ascii?Q?Z26xS6NJjtYeThbMr61L9FFnJ19Gc2V+3W+CX/pf0487gHJ4koTRmYEUxPgu?=
	=?us-ascii?Q?0N1yqic5UqmctokKXdkxKaVslU9l2nBek9wLjfKb4KFfLpkB5alRv2qAM8SS?=
	=?us-ascii?Q?1nknvMEA+E9EizzhR5ZF31zQhA2tRITTxndRy1SQTzcCMO47OHpuLA295TV1?=
	=?us-ascii?Q?0LDJCUaT7FF+Z1XnRWBluDPsd+QvbuRnEYchOgdsgjfKGXnjPS3EeUbu0XYQ?=
	=?us-ascii?Q?NpS6SPRqkOUAfG/P5K5Uh9t1jqP3AEZ6tMef7bmAzu4t0QN81eYwdJ7ZfxLq?=
	=?us-ascii?Q?SZuRXdeEynx7zshbs/2rGFAmENmvmOX72g78j26+4dz5J+hvFjn6nvKAExhX?=
	=?us-ascii?Q?X8O7FJSPjt2fk8IsLMlqGkI8Uk+5ggItuNPDWhEt18xfhsfN/44EdHx68uAq?=
	=?us-ascii?Q?KUBVKjcebnF8GnsaYu18S5VjrOS3zCTQgaia8Al5guNLENaX+dmV5PxasHCn?=
	=?us-ascii?Q?u7+INf66PNFlPSoxDXqICc3G+/s9piVhdDDEaWy0eqfTejedp7Df2Lhu1yIg?=
	=?us-ascii?Q?XDNxMH2ADTT8Lc4O6I+y8WExBGcCbDJXxdEwNEr/X6eTy4vcLbuVtsCoH3P1?=
	=?us-ascii?Q?9vAHltPrMccR5DXtJtxCHKhVEqaH84OfyN8I0OAtPjY8HPuDnE/2vienzQk9?=
	=?us-ascii?Q?Tujl4zZwC2ai4+QPrM7sR2kD2VBIJF1x9gan+BjFCO+ZZ64JUKAMOL6EMRZr?=
	=?us-ascii?Q?gUzGBa+jiPn4BahBLSEeUH2eJL744I9aEASzROH2HouHjuvbNc2KMyN6jO8t?=
	=?us-ascii?Q?7+W61spyndAWT6AglX2zBjZojzAHcBs5MiTJWHZ6Xb3gnvWAGBF1FLCByAWM?=
	=?us-ascii?Q?rubdtKsHpETGurrYGbC++c5lM6WAqrib1a6ODw4L6AOhihtloY2qcdPUaAFH?=
	=?us-ascii?Q?UNT/p6xNOzr9gshDutcSivJZjgD6LQihyab101rIP9lrQiAM2sEVj3hRp6g?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB029;
	5:WfYV9HROdJYjS0gAqXSOcF/ldgW0GR2bmkGvo/Lm0GRP2/fR8d448gE3+GVYPgRx2v7H/fOv1OMnl9c2miebbnjruFz0AxcVC2culvWBPNev/upWqCxfKYzJrvj/OT62wONiQHGgEnZYD4kFDF9DaA==;
	24:4zhfwgAZRJS1BD4c/YIvjOELjmP0LzbrxEa6TrWoDm6ddgoSj8qz56Rl09U5RebLCX8+bg7tZ0ryX+mTQINaBASd6g8OwDRLcWdpo7Zjjgs=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2015 00:26:54.0676 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB029
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.86
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] disas/cris: Fix typo in
	comment
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
X-List-Received-Date: Fri, 02 Oct 2015 02:01:50 -0000

On Fri, Sep 25, 2015 at 10:45:53PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Applied, thanks!



> ---
>  disas/cris.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/cris.c b/disas/cris.c
> index 1b76a09..4482a41 100644
> --- a/disas/cris.c
> +++ b/disas/cris.c
> @@ -2492,7 +2492,7 @@ print_with_operands (const struct cris_opcode *opcodep,
>  	  = spec_reg_info ((insn >> 12) & 15, disdata->distype);
>  
>  	if (sregp->name == NULL)
> -	  /* Should have been caught as a non-match eariler.  */
> +	  /* Should have been caught as a non-match earlier.  */
>  	  *tp++ = '?';
>  	else
>  	  {
> -- 
> 2.1.4
> 
> 

