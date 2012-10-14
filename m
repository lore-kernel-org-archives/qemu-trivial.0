Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUsI-000554-4j
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:33:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1TNUsG-00052e-EF
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:33:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1TNUsF-0006Eo-M8
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:33:24 -0400
Received: from fe01x03-cgp.akado.ru ([77.232.31.164]:49749 helo=akado.ru)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>)
	id 1TNUsD-0006ED-R1; Sun, 14 Oct 2012 16:33:21 -0400
Received: from [10.0.66.9] ([10.0.66.9] verified)
	by fe01-cgp.akado.ru (CommuniGate Pro SMTP 5.2.13)
	with ESMTPS id 358980993; Mon, 15 Oct 2012 00:33:20 +0400
Date: Mon, 15 Oct 2012 00:32:57 +0400 (MSK)
From: malc <av1474@comtv.ru>
X-X-Sender: malc@linmac
To: Blue Swirl <blauwirbel@gmail.com>
In-Reply-To: <CAAu8pHtYEb8PXnFSyWn9ZEZkFvd4y4e77oxc-L+jZOOodLaNJw@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1210150030520.5387@linmac>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<CAAu8pHtYEb8PXnFSyWn9ZEZkFvd4y4e77oxc-L+jZOOodLaNJw@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 77.232.31.164
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] static patches
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
X-List-Received-Date: Sun, 14 Oct 2012 20:33:25 -0000

On Sun, 14 Oct 2012, Blue Swirl wrote:

> On Sun, Oct 14, 2012 at 7:58 PM, Blue Swirl <blauwirbel@gmail.com> wrote:
> > I made a small tool to detect unused functions and
> > variables. Here's some fixes.
> 
> Just run the attached tool in an object directory and after some time,
> it will produce a list of suspect symbols:
> AES_decrypt ( ./aes.o)
> AES_encrypt ( ./aes.o)


> AUD_get_elapsed_usec_in ( ./audio/audio.o)
> AUD_get_elapsed_usec_out ( ./audio/audio.o)
> AUD_init_time_stamp_in ( ./audio/audio.o)
> AUD_init_time_stamp_out ( ./audio/audio.o)
> AUD_is_active_in ( ./audio/audio.o)
> AUD_is_active_out ( ./audio/audio.o)

And those are all part of public API mentioned in audio.h
Unused yes, but they are not static intentionally.

[..snip..]

-- 
mailto:av1474@comtv.ru

