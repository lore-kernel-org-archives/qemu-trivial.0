Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Whg8N-0005l3-DU
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 10:14:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdauchy@gmail.com>) id 1Whg8L-0005j1-AF
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdauchy@gmail.com>) id 1Whg8H-0005vo-Aj
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 10:14:13 -0400
Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231]:54445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdauchy@gmail.com>)
	id 1Whg8F-0005vI-4y; Tue, 06 May 2014 10:14:07 -0400
Received: by mail-vc0-f177.google.com with SMTP id if11so995220vcb.36
	for <multiple recipients>; Tue, 06 May 2014 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=in7ovN1iED93qb48rIXbMpnVDjGpwH8xaMcIUegi9t4=;
	b=yz46bZKrZ7zAQaw2qvapOL3i0P4Io1c1fuIcODBKPI70eC3Pdv9W7AuRFB+vmINa8z
	GdQYxLdzN5KA9t/lF0ikLRw0bRap80/pX5XkHIKnQ96ZkciftDnSYXa9yvT7pBJ+ofmd
	05x3pR99xHo8UrQjLoKFiy+xqA995qWqcV9OCUQ1euEDhL0LFbdIss15NVgbflfga0CC
	EYB+V5y23h9q0QjXqMTVMR/x/hLudKuc3DICSy8OVstfZD7mM38pyJEnWeukBk5TmCPT
	GaogLJi288Sn6WUsbPMCXHDB0JDc1wud0/e1HzdnyhFTSFvgVU7owhFbdRxPerPM7aOx
	3USQ==
X-Received: by 10.58.201.5 with SMTP id jw5mr32433200vec.6.1399385646472; Tue,
	06 May 2014 07:14:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.122.80 with HTTP; Tue, 6 May 2014 07:13:46 -0700 (PDT)
In-Reply-To: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
References: <1399374955-29082-1-git-send-email-dgilbert@redhat.com>
From: William Dauchy <wdauchy@gmail.com>
Date: Tue, 6 May 2014 16:13:46 +0200
Message-ID: <CAJ75kXaCCf+achqzNoDuPefwnE5DRH0=uidapJEv9Wffjap_vw@mail.gmail.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c03::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix 'name' option to work with
	-readconfig
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
X-List-Received-Date: Tue, 06 May 2014 14:14:14 -0000

On Tue, May 6, 2014 at 1:15 PM, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The 'name' option silently failed when used in config files
> ( http://lists.gnu.org/archive/html/qemu-devel/2014-04/msg00378.html )
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reported-by: William Dauchy <wdauchy@gmail.com>

Please use:

Reported-by: William Dauchy <william@gandi.net>

I have also successfully tested the patch
Tested-by: William Dauchy <william@gandi.net>

Thanks,
-- 
William

