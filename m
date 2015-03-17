Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXqTq-0001gI-QX
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 08:20:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YXqTk-0001X4-CW
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YXqTg-0003oY-8H
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 08:20:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YXqTY-0003Rk-HV; Tue, 17 Mar 2015 08:20:00 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id CC356C6A1D;
	Tue, 17 Mar 2015 12:19:59 +0000 (UTC)
Received: from [10.36.116.18] (ovpn-116-18.ams2.redhat.com [10.36.116.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HCJvoV006455; Tue, 17 Mar 2015 08:19:58 -0400
Message-ID: <1426594797.27188.103.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Tue, 17 Mar 2015 13:19:57 +0100
In-Reply-To: <1426593930.27188.96.camel@nilsson.home.kraxel.org>
References: <1426311215-12764-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1426593930.27188.96.camel@nilsson.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 17 Mar 2015 12:20:18 -0000

On Di, 2015-03-17 at 13:05 +0100, Gerd Hoffmann wrote:
> On Sa, 2015-03-14 at 06:33 +0100, Thomas Huth wrote:
> > Boards that do not include an USB controller should not provide
> > USB devices. However, when running "qemu-system-s390x -device help"
> > for example, there's still a usb-hub, usb-kbd, usb-mouse and
> > usb-tablet in the list of "supported" devices. Let's fix that
> > by compiling and linking the USB files only if it's really
> > necessary.
> 
> Added to usb queue.

Removed, fails to build.

Needs a complete rebuild due to the new CONFIG_USB option.  Hardly
avoidable I guess.  But even with that done I still get this:

  LINK  lm32-softmmu/qemu-system-lm32
../hw/usb/redirect.o: In function `usbredir_bulk_packet':
/home/kraxel/projects/qemu/hw/usb/redirect.c:1978: undefined reference
to `usb_combined_input_packet_complete'
../hw/usb/redirect.o: In function `usbredir_flush_ep_queue':
/home/kraxel/projects/qemu/hw/usb/redirect.c:951: undefined reference to
`usb_ep_combine_input_packets'
../hw/usb/redirect.o: In function `usbredir_cancel_packet':
/home/kraxel/projects/qemu/hw/usb/redirect.c:367: undefined reference to
`usb_combined_packet_cancel'
../hw/usb/host-libusb.o: In function `usb_host_cancel_packet':
/home/kraxel/projects/qemu/hw/usb/host-libusb.c:1014: undefined
reference to `usb_combined_packet_cancel'
../hw/usb/host-libusb.o: In function `usb_host_req_complete_data':
/home/kraxel/projects/qemu/hw/usb/host-libusb.c:396: undefined reference
to `usb_combined_input_packet_complete'
../hw/usb/host-libusb.o: In function `usb_host_flush_ep_queue':
/home/kraxel/projects/qemu/hw/usb/host-libusb.c:1358: undefined
reference to `usb_ep_combine_input_packets'
collect2: error: ld returned 1 exit status

cheers,
  Gerd




