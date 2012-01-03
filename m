Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri39k-0001P6-RH
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 07:07:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri39i-0001FS-8e
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:07:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri39c-0008DZ-LH
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:07:50 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:34266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri39U-0008Cu-Nx; Tue, 03 Jan 2012 07:07:36 -0500
Received: by eekb45 with SMTP id b45so18614105eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o57Pk+g+nBMurFo1XquZYe9eTy+24bMGeEuUpdWThHY=;
	b=s6W195ohn7qzFoTaZJ3PqNRazft142IgXzqAnXOU9VMG9YRorRCjoAL++bmU8BjucL
	U2x7KSM1RHK61JOWUaFeNjXfbz6b46arvzlg92chkKV4yjcPecwGhxRu0h0WOOMptBQD
	V0xSghXX/o3tKUP1bjz5EJLTsQTBfujGJxTZc=
Received: by 10.14.4.229 with SMTP id 77mr20363841eej.7.1325592456068;
	Tue, 03 Jan 2012 04:07:36 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	t1sm204943104eeb.3.2012.01.03.04.07.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 04:07:35 -0800 (PST)
Date: Tue, 3 Jan 2012 12:07:32 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120103120732.GD28826@stefanha-thinkpad.localdomain>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/8] qemu-queue cleanups
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
X-List-Received-Date: Tue, 03 Jan 2012 12:07:51 -0000

On Mon, Jan 02, 2012 at 07:00:29PM +0100, Paolo Bonzini wrote:
> These patches simplify the jungle of lists provided by qemu-queue from
> 4 to 3.  QCIRCLEQ is dropped, since it provides no real advantage over
> QTAILQ.  QSIMPLEQ is simplified to no longer permit insertion at the
> tail, with the advantage that it is more suited for simple free lists.
> 
> Stefan, these are a bit borderline for qemu-trivial.  Let me know
> if they're fine.

Please have them merged by a qemu.git committer.

The changes seem fine.  No list implementation is perfect for all use
cases and I see why you want the new QSIMPLEQ.

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

