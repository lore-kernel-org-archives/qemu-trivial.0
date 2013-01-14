Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TusOA-0005KF-Jr
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2013 17:20:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1TusO5-00054N-2e
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 17:20:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1TusO0-0000da-PR
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2013 17:20:12 -0500
Received: from mail-ie0-f172.google.com ([209.85.223.172]:41114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1TusNw-0000UH-TE; Mon, 14 Jan 2013 17:20:04 -0500
Received: by mail-ie0-f172.google.com with SMTP id c13so5933094ieb.17
	for <multiple recipients>; Mon, 14 Jan 2013 14:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QnaCy7QXqHyApryTVkIjk5+buk5GOGZaTvPIHcCPHqI=;
	b=Nl+/kIBsuvN2xByM70K9PrgRq4oyxHUc7Q+LDoKJuRL3Lsiz8gEFMezwrMIA12kL+O
	LHM4G7LwSvwPbow51ctNUDoodfOJ7wPrtwATwvjtGPSQm0FLBwTNWBx0U1K2NO4Xalab
	aBpaWT1aZJ7YaDMBdH39HCuJtSygWGExhfnm6X/dIxTCxQ2UlLuFpnh0Zgk139pMRTAX
	a8NBw5NX4nwoYgtWm8IPF6PBYjralb8DfOEyTT42lY0mE9NgV2JIzZY900EnnMxHKKyC
	CigARe4gAZXTiLqLEy8MBLJY5n6PNv/ta5WiTDvRnGKUFLdAsjcsD8HcbVw5E60JZNGX
	PWiA==
X-Received: by 10.43.17.199 with SMTP id qd7mr60728980icb.52.1358202003773;
	Mon, 14 Jan 2013 14:20:03 -0800 (PST)
Received: from localhost ([32.97.110.59])
	by mx.google.com with ESMTPS id ee8sm415193igc.13.2013.01.14.14.20.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 14:20:03 -0800 (PST)
Sender: fluxion <flukshun@gmail.com>
Date: Mon, 14 Jan 2013 16:16:21 -0600
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130114221621.GC1755@vm>
References: <1357143311-10927-1-git-send-email-eblake@redhat.com>
	<20130102231421.GC17859@vm> <50F47E7D.4020909@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50F47E7D.4020909@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.172
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
X-List-Received-Date: Mon, 14 Jan 2013 22:20:17 -0000

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

Actually, since it applies cleanly for both I just send a separate pull

> 
> -- 
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 



