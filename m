Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmfOK-0001Mr-Or
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 05:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1YmfOE-00017f-U4
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 05:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1YmfOE-0003z8-7U
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 05:31:46 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:34418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1YmfOC-0003we-6p; Mon, 27 Apr 2015 05:31:44 -0400
Received: by pdbqa5 with SMTP id qa5so122510140pdb.1;
	Mon, 27 Apr 2015 02:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NfqkAYGhMWU5+qge4SE88wAu4ylRrB1MLG02jmiwFzo=;
	b=HSekPXHMmEjIaJIqQxK5OK1UbykT8nbg4ob23IgcMWuZPzS+cFaKb06b8ZQ8nXCAUR
	E9z8VYh2SkdLN4mThYyOXtRS59wK1DLdiXUcv4JJKITDEk2HIqlHuK+SwjRUk0AocmEo
	r3NO/OZtCARLCE9B9PyTSRut/22hrKhfP+40jy+DbU+eUMR1PDGQmH49J+bkp1y8xwSe
	qYEsPh1EZ53KHJbGLojMDpsxN0zg9BEAZVipGsClNw1sny3IOnQZ0Jvuz2+6Fqo5Canq
	jsAwKuTP1vn+VSde74H5jMj5xP6j3NnEuWmXUQ8N38MkJMlPxkPgIcx+m8yDBmCVXThf
	jCrw==
X-Received: by 10.66.55.98 with SMTP id r2mr20653451pap.22.1430127102918;
	Mon, 27 Apr 2015 02:31:42 -0700 (PDT)
Received: from localhost ([203.126.243.116]) by mx.google.com with ESMTPSA id
	df7sm18802328pdb.32.2015.04.27.02.31.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 02:31:42 -0700 (PDT)
Date: Mon, 27 Apr 2015 19:28:38 +1000
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Message-ID: <20150427092838.GE17116@toto>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
	<1430075424-25975-6-git-send-email-crosthwaite.peter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430075424-25975-6-git-send-email-crosthwaite.peter@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com, qemu-devel@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH microblaze v1 5/6] mb: cpu:
	Delete EXCP_NMI
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
X-List-Received-Date: Mon, 27 Apr 2015 09:31:51 -0000

On Sun, Apr 26, 2015 at 12:10:23PM -0700, Peter Crosthwaite wrote:
> This define is unused. Remove.
> 
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Hi,

Any reason not to shift down the numbering?

Otherwise the whole series looks good to me.

Thanks,
Edgar


> ---
>  target-microblaze/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
> index f21da2f..6522af7 100644
> --- a/target-microblaze/cpu.h
> +++ b/target-microblaze/cpu.h
> @@ -36,7 +36,6 @@ typedef struct CPUMBState CPUMBState;
>  
>  #define ELF_MACHINE	EM_MICROBLAZE
>  
> -#define EXCP_NMI        1
>  #define EXCP_MMU        2
>  #define EXCP_IRQ        3
>  #define EXCP_BREAK      4
> -- 
> 1.9.1
> 
> 

