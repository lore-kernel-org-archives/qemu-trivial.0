Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpO08-0002Qb-2g
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jan 2012 12:48:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RpO06-0002KS-B7
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 12:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RpO00-0004tV-OO
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 12:48:14 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:41361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RpNzt-0004st-WD; Mon, 23 Jan 2012 12:48:02 -0500
Received: by iahk25 with SMTP id k25so2952664iah.4
	for <multiple recipients>; Mon, 23 Jan 2012 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=34suzcd6v7czCWawJ+C+gslh27bfjX4VWPwW+iA4/e0=;
	b=lycENs+6Z0CO1Vb11U4L8d4k9JnBOwk2RXqfR84rGRHjBvqhfG+AD/0NDqXaGcyLF7
	U+856IviWa3eKQHsoFta+VhZGyVjKbjpfA/M95glqbpuzwxks9J8xIF+63rL/UFpw/nD
	DAJhwE+oVPV+0n+ZU8m/sMm9z8Xp0XTMP20eQ=
Received: by 10.50.15.131 with SMTP id x3mr4430337igc.13.1327340881359;
	Mon, 23 Jan 2012 09:48:01 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id ba5sm17966102igb.6.2012.01.23.09.47.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 09:48:00 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F1D9D4A.3000104@redhat.com>
Date: Mon, 23 Jan 2012 18:47:54 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: thigdon@akamai.com
References: <20120123171525.GM32632@akamai.com>
In-Reply-To: <20120123171525.GM32632@akamai.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] scsi: restrict buffer length to
 req->cmd.xfer for responses to INQUIRY commands.
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
X-List-Received-Date: Mon, 23 Jan 2012 17:48:15 -0000

On 01/23/2012 06:15 PM, Thomas Higdon wrote:
> This prevents the emulated SCSI device from trying to DMA more bytes to the
> initiator than are expected. Without this, the SCRIPTS code in the emulated LSI
> device eventually raises a DMA interrupt for a data overrun when an INQUIRY
> command whose buflen exceeds req->cmd.xfer is processed. It's the
> responsibility of the client to provide a request buffer and allocation
> length that are large enough for the result of the command.
>
> I'm no expert on SCSI (or qemu), but this appears to be more correct behavior
> than before, and makes my SCSI INQUIRY commands more successful.

Yes, this is correct.  SCSI says "The device server shall terminate 
transfers to the Data-In Buffer when the number of bytes or blocks 
specified by the ALLOCATION LENGTH field have been transferred or when 
all available data have been transferred, whichever is less".

The same is already done for example for MODE SENSE commands.

Can you please also do the same REPORT LUNS and INQUIRY in hw/scsi-bus.c?

Thanks,

Paolo

