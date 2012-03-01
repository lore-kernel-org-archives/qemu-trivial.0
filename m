Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S2vF1-0007DM-KE
	for mharc-qemu-trivial@gnu.org; Wed, 29 Feb 2012 20:55:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S2vEz-0007B3-0D
	for qemu-trivial@nongnu.org; Wed, 29 Feb 2012 20:55:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S2vEd-00033v-Le
	for qemu-trivial@nongnu.org; Wed, 29 Feb 2012 20:55:32 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:45584)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S2vEd-00031p-Ff
	for qemu-trivial@nongnu.org; Wed, 29 Feb 2012 20:55:11 -0500
Received: by pbcuo1 with SMTP id uo1so310297pbc.4
	for <qemu-trivial@nongnu.org>; Wed, 29 Feb 2012 17:55:09 -0800 (PST)
Received-SPF: pass (google.com: domain of anthony@codemonkey.ws designates
	10.68.212.130 as permitted sender) client-ip=10.68.212.130; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of anthony@codemonkey.ws
	designates 10.68.212.130 as permitted sender)
	smtp.mail=anthony@codemonkey.ws
Received: from mr.google.com ([10.68.212.130])
	by 10.68.212.130 with SMTP id nk2mr13824741pbc.69.1330566909100
	(num_hops = 1); Wed, 29 Feb 2012 17:55:09 -0800 (PST)
Received: by 10.68.212.130 with SMTP id nk2mr11456637pbc.69.1330566909056;
	Wed, 29 Feb 2012 17:55:09 -0800 (PST)
Received: from [192.168.0.104] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id f10sm624268pbn.58.2012.02.29.17.55.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 17:55:08 -0800 (PST)
Message-ID: <4F4ED6F9.30109@codemonkey.ws>
Date: Wed, 29 Feb 2012 19:55:05 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1330555499-11726-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1330555499-11726-1-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Gm-Message-State: ALoCoQndpsA7zGvavElSvDJTXyQYbdQbs2m+rgwB/M/skgdm0z0YPgkG0NiRlfRLFZtlqofQG03T
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pc: make user-triggerable
 exit conditional to DEBUG_BIOS define
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
X-List-Received-Date: Thu, 01 Mar 2012 01:55:34 -0000

On 02/29/2012 04:44 PM, Hervé Poussineau wrote:
> The port 0x501 is (at least) used by SCO Xenix 2.3.4 installer.

For what?  What device would normally be there?

I don't want to disable this by default.  My regression suite depends on this as 
an exit mechanism.

Regards,

Anthony Liguori

>
> Signed-off-by: Hervé Poussineau<hpoussin@reactos.org>
> ---
>   hw/pc.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/hw/pc.c b/hw/pc.c
> index 12c02f2..113a38a 100644
> --- a/hw/pc.c
> +++ b/hw/pc.c
> @@ -565,7 +565,10 @@ static void bochs_bios_write(void *opaque, uint32_t addr, uint32_t val)
>           /* LGPL'ed VGA BIOS messages */
>       case 0x501:
>       case 0x502:
> +#ifdef DEBUG_BIOS
>           exit((val<<  1) | 1);
> +#endif
> +        break;
>       case 0x500:
>       case 0x503:
>   #ifdef DEBUG_BIOS


