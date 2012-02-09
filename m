Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQDR-00008V-8V
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 04:22:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDL-0008D3-0C
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDC-0007ns-JB
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:50 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:45631)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvQD1-0007kc-6o; Thu, 09 Feb 2012 04:22:31 -0500
Received: by werh12 with SMTP id h12so1158879wer.4
	for <multiple recipients>; Thu, 09 Feb 2012 01:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=hy98ySq0imJKIlatG3MJOiAqRheYf0EIO0pZv1UBViw=;
	b=nXouq9rDnBO5VrXeDUnY+aZwf8T3QkgEvOtwMU4y0AJ2j+hZ+dPG+rg4Ov0j57JS1Z
	TM3ep73Du1d7QktfOxQRNWHkzW5RQbUcyCpeIK5mcmpz6zpwc3R3drUJb4yiofdIqXb1
	B6A3nZvehssKISKt1Z6x3TqzYwfGKp+eFardE=
Received: by 10.216.139.147 with SMTP id c19mr385818wej.11.1328779350233;
	Thu, 09 Feb 2012 01:22:30 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id q2sm5453348wiy.7.2012.02.09.01.22.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 01:22:29 -0800 (PST)
Date: Thu, 9 Feb 2012 08:38:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20120209083827.GB30956@stefanha-thinkpad.localdomain>
References: <20120206060255.GA55374@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120206060255.GA55374@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] cpu-exec.c: Correct comment about
 this file and indentation cleanup
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
X-List-Received-Date: Thu, 09 Feb 2012 09:22:55 -0000

On Mon, Feb 06, 2012 at 02:02:55PM +0800, 陳韋任 wrote:
>   Each target use #define marco (in target-xxx/cpu.h) to rename cpu_exec
> (cpu-exec.c) to cpu_xxx_exec, then defines its own cpu_loop which calls
> cpu_xxx_exec. So basically, cpu-exec.c is not i386 (only) emulator main
> execution loop. This patch correctes the comment of this file and does
> indentation cleanup.
> 
> Signed-off-by: Chen Wei-Ren (陳韋任) <chenwj@iis.sinica.edu.tw>
> ---
> v1 -> v2:
> 
>  Didn't notice tab in previous patch, please use this patch instead. 
>  Sorry about that.
> 
>  cpu-exec.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

