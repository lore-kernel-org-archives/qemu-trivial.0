Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXjmD-0003yg-Ug
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 04:56:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXjmA-0003w4-Ke
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 04:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXjm9-0007US-OQ
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 04:56:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57386 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fXjm1-0007Ns-KL; Tue, 26 Jun 2018 04:56:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 063A181A4EAD;
	Tue, 26 Jun 2018 08:56:29 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40FE42026D6A;
	Tue, 26 Jun 2018 08:56:27 +0000 (UTC)
Date: Tue, 26 Jun 2018 10:56:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org, Mark
	Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	qemu-arm@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno
	<aurelien@aurel32.net>
Message-ID: <20180626105625.2396944a.cohuck@redhat.com>
In-Reply-To: <79c0775f-49b5-1d79-a4f9-234941854e4f@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
	<20180626104001.617d4ea9.cohuck@redhat.com>
	<79c0775f-49b5-1d79-a4f9-234941854e4f@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 08:56:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 26 Jun 2018 08:56:29 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [qemu-s390x] [PATCH v3] loader: Check access
 size when calling rom_ptr() to avoid crashes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2018 08:56:41 -0000

On Tue, 26 Jun 2018 10:55:09 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 26.06.2018 10:40, Cornelia Huck wrote:
> > On Fri, 15 Jun 2018 11:49:05 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> The rom_ptr() function allows direct access to the ROM blobs that we
> >> load during startup. However, there are currently no checks for the
> >> size of the accesses, so it's currently possible to crash QEMU for
> >> example with:
> >>
> >> $ echo "Insane in the mainframe" > /tmp/test.txt
> >> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> >> Segmentation fault (core dumped)
> >> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> >> Segmentation fault (core dumped)
> >> $ echo -n HdrS > /tmp/hdr.txt
> >> $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
> >> Segmentation fault (core dumped)
> >>
> >> We need a possibility to check the size of the ROM area that we want
> >> to access, thus let's add a size parameter to the rom_ptr() function
> >> to avoid these problems.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>  
> > 
> > Grmpf, this conflicts with "s390/ipl: fix ipl with -no-reboot" in
> > s390-next... do you want to rebase it?  
> 
> Really? Where is the conflict? I can rebase my patch to your s390-next
> branch, but the patch looks identical after that rebase. As far as I can
> see, the patches only change different parts of the ipl.c file.

Yes, but the result does not compile :)

