Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXqoE-0002uU-C2
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 08:41:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXqo9-0002q7-Tg
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXqnz-00030b-Q3
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:41:17 -0400
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:48235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YXqnz-00030D-Fl
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:41:07 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Tue, 17 Mar 2015 12:41:05 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 17 Mar 2015 12:41:02 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id D36862190046; 
	Tue, 17 Mar 2015 12:40:51 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2HCf1aA65011838; Tue, 17 Mar 2015 12:41:01 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2HCf1xx011400; Tue, 17 Mar 2015 06:41:01 -0600
Received: from oc7435384737.ibm.com (dyn-9-152-224-100.boeblingen.de.ibm.com
	[9.152.224.100])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2HCevoE011172; Tue, 17 Mar 2015 06:40:58 -0600
Date: Tue, 17 Mar 2015 13:40:56 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20150317134056.5485884b@oc7435384737.ibm.com>
In-Reply-To: <1426594797.27188.103.camel@nilsson.home.kraxel.org>
References: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426593930.27188.96.camel@nilsson.home.kraxel.org>
	<1426594797.27188.103.camel@nilsson.home.kraxel.org>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031712-0041-0000-0000-0000039BF38C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/usb: Include USB files only if
	necessary
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
X-List-Received-Date: Tue, 17 Mar 2015 12:41:20 -0000

On Tue, 17 Mar 2015 13:19:57 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Di, 2015-03-17 at 13:05 +0100, Gerd Hoffmann wrote:
> > On Sa, 2015-03-14 at 06:33 +0100, Thomas Huth wrote:
> > > Boards that do not include an USB controller should not provide
> > > USB devices. However, when running "qemu-system-s390x -device help"
> > > for example, there's still a usb-hub, usb-kbd, usb-mouse and
> > > usb-tablet in the list of "supported" devices. Let's fix that
> > > by compiling and linking the USB files only if it's really
> > > necessary.
> > 
> > Added to usb queue.
> 
> Removed, fails to build.
> 
> Needs a complete rebuild due to the new CONFIG_USB option.  Hardly
> avoidable I guess.  But even with that done I still get this:
> 
>   LINK  lm32-softmmu/qemu-system-lm32
> ../hw/usb/redirect.o: In function `usbredir_bulk_packet':
> /home/kraxel/projects/qemu/hw/usb/redirect.c:1978: undefined reference
> to `usb_combined_input_packet_complete'

Oh, sorry, seems like I missed the "--enable-usb-redir" configure
option ... I'll have a look and rework my patch...

 Thomas


