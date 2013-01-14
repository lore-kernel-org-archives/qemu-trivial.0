Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TusEV-0008Jl-Hc
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 17:10:19 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1TusEP-00081n-O9
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 17:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1TusEO-0006eV-M3
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 17:10:13 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:35834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1TusEH-0006UE-73; Mon, 14 Jan 2013 17:10:05 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so6026344iej.18
	for <multiple recipients>; Mon, 14 Jan 2013 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4pyDY/FlpRfo1vhOZ4Eehum7dFoc5+Em7rfj5RcOhXI=;
	b=Yx5fKS+wFSKJRPFRFiRQqrjFlXP0i8RtH+yyc3UyLnIwHP0jyCONbt7fwc+K1pRQr3
	EEjtswOyAF+Awjl38cxVU5aVd1SejlOEEVOYQ2jn2sEXUTunFR8YAgXOvrhNMq7imdhe
	W3617ey+QMzmmYjDYtlZ4hwgbbVr8Q21WXcrJMSezW1GAbBTom/6K2gY6JAVrVsFnIOk
	3PJPin+dauy8QEyfssXQzdgCl/YcZCneleK7lH8phW3rI/LSoaftcXnULx0+ie1/e13k
	Tf3WKesk9BWRp7z7fiXMIBoBhyWcwXir2O8QaC9v20Z8kJSs5Rnq1hLNAkk5zWzMEFKQ
	Mqfw==
X-Received: by 10.42.212.4 with SMTP id gq4mr64773232icb.38.1358201404437;
	Mon, 14 Jan 2013 14:10:04 -0800 (PST)
Received: from localhost ([32.97.110.59])
	by mx.google.com with ESMTPS id bg10sm408320igc.6.2013.01.14.14.10.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 14:10:03 -0800 (PST)
Sender: fluxion <flukshun@gmail.com>
Date: Mon, 14 Jan 2013 16:08:48 -0600
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130114220848.GB1755@vm>
References: <1357143311-10927-1-git-send-email-eblake@redhat.com>
	<20130102231421.GC17859@vm> <50F47E7D.4020909@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50F47E7D.4020909@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qga: add missing commas in json docs
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
X-List-Received-Date: Mon, 14 Jan 2013 22:10:18 -0000

On Mon, Jan 14, 2013 at 02:54:05PM -0700, Eric Blake wrote:
> On 01/02/2013 04:14 PM, mdroth wrote:
> > On Wed, Jan 02, 2013 at 09:15:11AM -0700, Eric Blake wrote:
> >> * qga/qapi-schema.json: Use valid JSON.
> >>
> >> Signed-off-by: Eric Blake <eblake@redhat.com>
> > 
> > Thanks, applied to qga branch
> 
> Ping.  I don't see this patch in today's qga pull request:
> https://lists.gnu.org/archive/html/qemu-devel/2013-01/msg02272.html
> Should it go in through the trivial branch instead?

Strange... I must've forgotten to push it after applying it locally.
I'll include it in a v2 of the current pull shortly.

> 
> -- 
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 



