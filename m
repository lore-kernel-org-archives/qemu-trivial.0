Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmsSK-0002EZ-7f
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 19:28:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1YmsSH-0002Dd-BH
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 19:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1YmsSE-0005m6-4i
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 19:28:49 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:33646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1YmsSD-0005lh-TG; Mon, 27 Apr 2015 19:28:46 -0400
Received: by pacwv17 with SMTP id wv17so122924765pac.0;
	Mon, 27 Apr 2015 16:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F5fAbzh0Wep23xcy/ROxcC4JUlb4VnI14hPRlV+svS4=;
	b=xPsxQxr2c+C8l3IhYZ85JtgPdxSnFA9Vyc6SDjwXmya6IfATemq7Ht009d4uETwX12
	2ion9Cz6tkuOWIuI05z9LRfhBs5KwLSe4EQToLTcPQAqhwNb8yZbJEOLiKOfQ6BUnlgd
	bn1Ogk1KW7ou6NwmMaKuzzWAAdBvUppZml+5qrsC20KaaC8a/K/a8L+6nZVmuqUT2G+0
	ZT+qWEs+MMOUKJhaS/TKON3QwL8fWftuJF3hJVFoxcoK7tOQbvdjhfIeIhPnwCA6i646
	5Ul/F1aaV8RI+IjOchB5YROgWe5PLYpNbWM0IArGhGJpq7Feh3j4oY1ElZmHoYEi74bw
	fBMQ==
X-Received: by 10.66.63.72 with SMTP id e8mr25974425pas.3.1430177324960;
	Mon, 27 Apr 2015 16:28:44 -0700 (PDT)
Received: from localhost ([203.126.243.116])
	by mx.google.com with ESMTPSA id v7sm20472708pde.81.2015.04.27.16.28.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 16:28:43 -0700 (PDT)
Date: Tue, 28 Apr 2015 09:25:36 +1000
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150427232536.GB19252@toto>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
	<1430075424-25975-6-git-send-email-crosthwaite.peter@gmail.com>
	<20150427092838.GE17116@toto> <553E3C79.6020702@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553E3C79.6020702@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	edgari@xilinx.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH microblaze v1 5/6] mb: cpu: Delete
	EXCP_NMI
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
X-List-Received-Date: Mon, 27 Apr 2015 23:28:50 -0000

On Mon, Apr 27, 2015 at 04:41:13PM +0300, Michael Tokarev wrote:
> 27.04.2015 12:28, Edgar E. Iglesias wrote:
> > On Sun, Apr 26, 2015 at 12:10:23PM -0700, Peter Crosthwaite wrote:
> >> This define is unused. Remove.
> >>
> >> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > 
> > Hi,
> > 
> > Any reason not to shift down the numbering?
> > 
> > Otherwise the whole series looks good to me.
> 
> What does this mean, "looks good", is it your R-b? :)

Sure, with the change:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

> 
> >> @@ -36,7 +36,6 @@ typedef struct CPUMBState CPUMBState;
> >>  
> >>  #define ELF_MACHINE	EM_MICROBLAZE
> >>  
> >> -#define EXCP_NMI        1
> >>  #define EXCP_MMU        2
> >>  #define EXCP_IRQ        3
> >>  #define EXCP_BREAK      4
> 
> I can renumber this on commit just fine, there's no need
> to resend whole thing, is it okay with you Peter?
> 
> Thanks,
> 
> /mjt

