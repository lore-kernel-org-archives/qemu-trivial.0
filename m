Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIHfq-0004CI-7W
	for mharc-qemu-trivial@gnu.org; Mon, 02 Feb 2015 09:08:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIDEL-0004gB-TS
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 04:23:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIDEH-0006Br-T4
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 04:23:41 -0500
Received: from mailout4.w1.samsung.com ([210.118.77.14]:32542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.ostapenko@partner.samsung.com>) id 1YIDEH-0006AM-Ms
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 04:23:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout4.w1.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0NJ500AUN0XWIP70@mailout4.w1.samsung.com> for
	qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:27:33 +0000 (GMT)
X-AuditID: cbfec7f5-b7fc86d0000066b7-63-54cf41823dce
Received: from eusync4.samsung.com ( [203.254.199.214])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id 73.1E.26295.2814FC45;
	Mon, 02 Feb 2015 09:21:06 +0000 (GMT)
Received: from [106.109.130.26] by eusync4.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTPA id <0NJ500GIV0R7UN60@eusync4.samsung.com>; Mon,
	02 Feb 2015 09:23:32 +0000 (GMT)
Message-id: <54CF33FD.5020003@partner.samsung.com>
Date: Mon, 02 Feb 2015 12:23:25 +0400
From: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:24.0) Gecko/20100101
	Thunderbird/24.1.0
MIME-version: 1.0
To: riku.voipio@iki.fi, peter.maydell@linaro.org, qemu-trivial@nongnu.org
References: <54CF336A.7080205@partner.samsung.com>
In-reply-to: <54CF336A.7080205@partner.samsung.com>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsVy+t/xa7pNjudDDA6ckLKYc+YBi8XaM3NZ
	LU5uuMRmcXLbDlaLQ58XMzmwehz+upDF4861PWweT65tZvLo27KKMYAlissmJTUnsyy1SN8u
	gSvj1eMJTAUbuSsa901haWDcytnFyMkhIWAicWH9VnYIW0ziwr31bF2MXBxCAksZJfZsuM4C
	4XxilJjSeYwJpIpXwEhi/ZN7zCA2i4CqRNfkVWwgNpuAucSM1YvAJokKREgcXf2MFaJeUOLH
	5HssILaIgKfEv0XTweLMAv4Su5Y+B7OFBTIkjtztYgSxhYDmH/y2EGgmBwengLHE2b8eEOXW
	EisnbWOEsOUlNq95yzyBUWAWkg2zkJTNQlK2gJF5FaNoamlyQXFSeq6RXnFibnFpXrpecn7u
	JkZIIH/dwbj0mNUhRgEORiUe3gfc50KEWBPLiitzDzFKcDArifBqWJwPEeJNSaysSi3Kjy8q
	zUktPsTIxMEp1cCoMrM4NUlZ8d/DgL/7zk5Vn/zYeqdfZ99N04BLRwRnsN34pWXPcuyp0fZH
	k0++XqF8MTXsT15PdNLavXeSl/+e4ZWp4pTRlHPr5wq2xxIl/+fc77VoTIg02n9yxeu+JYc3
	dq6T2tDzbUUuz65Fm888Ul97RUJ44XyBLnO/031/OxlWPp/9u7OjUImlOCPRUIu5qDgRACW3
	byBCAgAA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.14
X-Mailman-Approved-At: Mon, 02 Feb 2015 09:08:20 -0500
Cc: Slava Garbuzov <v.garbuzov@samsung.com>, Yury Gribov <y.gribov@samsung.com>
Subject: Re: [Qemu-trivial] [PATCH] Fix ABI incompatibility between
 Qemu-aarch64 and Linux Kernel in signal handling.
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
X-List-Received-Date: Mon, 02 Feb 2015 09:23:46 -0000

Sorry, missed ML.

-Maxim
On 02/02/2015 12:20 PM, Maxim Ostapenko wrote:
> Hi,
>
> this patch fixes https://bugs.launchpad.net/qemu/+bug/1416988.
>
> There is a small ABI incompatibility between Qemu-aarch64 and Linux 
> Kernel 3.19 caused by wrong size of struct target_siginfo in Qemu. 
> This tiny patch fixes the issue.
>
> -Maxim
>
> From 1d662e325d004bce2d640cfea5b337c92c7feca2 Mon Sep 17 00:00:00 2001
> From: Max Ostapenko <m.ostapenko@partner.samsung.com>
> Date: Mon, 2 Feb 2015 12:03:20 +0400
> Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some 
> targets.
>
> Fix TARGET_SI_PAD_SIZE for S390X, SPARC, ALPHA and AARCH64 to correspond
> Linux Kernel 3.19 c59c961ca511dc7ee2f4f7e9c224d16f5c76ca6e revision.
> ---
>  linux-user/syscall_defs.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index ebb3be1..b95a0b2 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -655,7 +655,12 @@ typedef struct {
>  #endif
>
>  #define TARGET_SI_MAX_SIZE    128
> +#if defined(TARGET_S390X) || defined(TARGET_SPARC) \
> +   || defined(TARGET_ALPHA) || defined(TARGET_AARCH64)
> +#define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 4)
> +#else
>  #define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
> +#endif
>
>  typedef struct target_siginfo {
>  #ifdef TARGET_MIPS


