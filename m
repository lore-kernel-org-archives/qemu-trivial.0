Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqeYl-0000Il-9k
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 00:41:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqeYh-0000A5-UY
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:41:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqeYh-0005EV-0O
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:41:11 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:38058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RqeYe-0005E8-Qp; Fri, 27 Jan 2012 00:41:09 -0500
Received: by dajr28 with SMTP id r28so1404927daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 21:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2coX8gNQ5q17gzPNWHE/8AUVCBkHcXgpPq00HAEz3tE=;
	b=o41yZejCxJ8QN5OLiHPznxog91/V6x6gn9FZP4UgQsLesndXMdytiIsOIXPjwW/7rF
	IDGKCP75Mrr+l7wmARmTPVLPEZlQnxmBiHz3vNIuVVtxbu7i1EJpTAjm/Vm3v7cxifMa
	BHMZeIeH7+KuTFRkcOdsqQTBK79oSNrcYGwp0=
Received: by 10.68.212.130 with SMTP id nk2mr11609523pbc.69.1327642867863;
	Thu, 26 Jan 2012 21:41:07 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id x8sm17200731pbr.11.2012.01.26.21.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 21:41:06 -0800 (PST)
Date: Fri, 27 Jan 2012 05:41:01 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120127054101.GB17836@stefanha-thinkpad.localdomain>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] main-loop: Fix SetEvent() on
 uninitialized handle on win32
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
X-List-Received-Date: Fri, 27 Jan 2012 05:41:12 -0000

On Fri, Jan 20, 2012 at 07:08:27PM -0600, Michael Roth wrote:
> diff --git a/main-loop.c b/main-loop.c
> index 692381c..62d95b9 100644
> --- a/main-loop.c
> +++ b/main-loop.c
> @@ -164,7 +164,7 @@ static int qemu_signal_init(void)
>  
>  #else /* _WIN32 */
>  
> -HANDLE qemu_event_handle;
> +HANDLE qemu_event_handle = NULL;

Global variables are automatically zeroed, no need to assign NULL.

