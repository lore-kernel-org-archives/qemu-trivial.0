Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rohiu-0005Vg-If
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2012 15:39:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1Rohiq-0005Jp-QW
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 15:39:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jamie@shareable.org>) id 1Rohip-00019I-Fl
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 15:39:36 -0500
Received: from mail2.shareable.org ([80.68.89.115]:38978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jamie@shareable.org>)
	id 1Rohin-00018P-DH; Sat, 21 Jan 2012 15:39:33 -0500
Received: from jamie by mail2.shareable.org with local (Exim 4.63)
	(envelope-from <jamie@shareable.org>)
	id 1Rohid-0005Ir-L5; Sat, 21 Jan 2012 20:39:23 +0000
Date: Sat, 21 Jan 2012 20:39:23 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120121203923.GE4871@jl-vm1.vm.bytemark.co.uk>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 80.68.89.115
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] main-loop: For tools,
 initialize timers as part of qemu_init_main_loop()
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
X-List-Received-Date: Sat, 21 Jan 2012 20:39:37 -0000

Michael Roth wrote:
> In some cases initializing the alarm timers can lead to non-negligable
> overhead from programs that link against qemu-tool.o. At least,
> setting a max-resolution WinMM alarm timer via mm_start_timer() (the
> current default for Windows) can increase the "tick rate" on Windows
> OSs and affect frequency scaling, and in the case of tools that run
> in guest OSs such has qemu-ga, the impact can be fairly dramatic
> (+20%/20% user/sys time on a core 2 processor was observed from an idle
> Windows XP guest).
> 
> This patch doesn't address the issue directly (not sure what a good
> solution would be for Windows, or what other situations it might be
> noticeable),

Is this a timer that need to fire soon after setting, every time?

I wonder if a different kind of Windows timer, lower-resolution, could
be used if the timeout is longer.  If it has insufficient resolution,
it could be set to trigger a little early, then set a high-resolution
timer at that point.

Maybe that could help for Linux CONFIG_NOHZ guests?

-- Jamie

