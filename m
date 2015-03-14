Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWewp-0006cu-BT
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 01:49:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWewn-0006cn-4j
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 01:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWewj-00084G-Vq
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 01:49:17 -0400
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:60096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWewj-00083t-Le
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 01:49:13 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 05:49:10 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 05:49:09 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 060B42190046; 
	Sat, 14 Mar 2015 05:48:59 +0000 (GMT)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E5n8lr21627034; Sat, 14 Mar 2015 05:49:08 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E5n88d006385; Fri, 13 Mar 2015 23:49:08 -0600
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E5n7Bs006378; Fri, 13 Mar 2015 23:49:07 -0600
Date: Sat, 14 Mar 2015 06:49:05 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Message-ID: <20150314064905.34beab29@oc7435384737.ibm.com>
In-Reply-To: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031405-0009-0000-0000-00000379524C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/usb: Include USB files
 only if necessary
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
X-List-Received-Date: Sat, 14 Mar 2015 05:49:18 -0000

On Sat, 14 Mar 2015 06:33:35 +0100
Thomas Huth <thuth@linux.vnet.ibm.com> wrote:

> Boards that do not include an USB controller should not provide
> USB devices. However, when running "qemu-system-s390x -device help"

By the way, in case somebody wants to test the above example, and
wonders why there are also U/O/E/XHCI controllers in the list of
devices - the patch for removing them is currently on the way:

http://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg02722.html

> for example, there's still a usb-hub, usb-kbd, usb-mouse and
> usb-tablet in the list of "supported" devices. Let's fix that
> by compiling and linking the USB files only if it's really
> necessary.
> 
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>


