Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g6stw-0000hH-8R
	for mharc-qemu-trivial@gnu.org; Mon, 01 Oct 2018 03:45:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1g6stv-0000h3-4I
	for qemu-trivial@nongnu.org; Mon, 01 Oct 2018 03:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1g6str-0004uu-U4
	for qemu-trivial@nongnu.org; Mon, 01 Oct 2018 03:45:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1g6str-0004u8-N0
	for qemu-trivial@nongnu.org; Mon, 01 Oct 2018 03:45:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB7E744BD5;
	Mon,  1 Oct 2018 07:45:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 670C276623;
	Mon,  1 Oct 2018 07:45:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4B01F9C487; Mon,  1 Oct 2018 09:45:48 +0200 (CEST)
Date: Mon, 1 Oct 2018 09:45:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Miguel GAIO <mgaio35@gmail.com>
Cc: qemu-trivial@nongnu.org
Message-ID: <20181001074548.ahngt5fz3uivd3kx@sirius.home.kraxel.org>
References: <20180927151936.3647-1-mgaio35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180927151936.3647-1-mgaio35@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 01 Oct 2018 07:45:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ohci: set effectively usb frame rate to
 1kHz
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
X-List-Received-Date: Mon, 01 Oct 2018 07:45:55 -0000

On Thu, Sep 27, 2018 at 05:19:36PM +0200, Miguel GAIO wrote:
> USB frame rate is slightly lower than 1kHz: ie. ~950Hz.
> Thus usb-audio device is not able to perform a simple audio playback
> without underruns on audio backend.
> eg. "-device pci-ohci,id=ohci -device usb-audio,bus=ohci.0" vs PulseAudio
> backend. more than 50 underruns are observed per second.
> 
> Update ohci_sof_time computation, using QEMU_CLOCK_VIRTUAL in
> ohci_usb_start(), and increment by usb_frame_time in ohci_sof()
> makes USB frame rate close to 1kHz.
> This way, no audio underrun are observed during audio playback.

Added to usb patch queue.

thanks,
  Gerd


