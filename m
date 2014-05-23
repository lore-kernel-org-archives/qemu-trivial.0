Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnwBY-0005zl-Hg
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 16:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwBQ-0005q7-PI
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwBL-000871-VJ
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:35:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WnwBB-0007n4-Sd; Fri, 23 May 2014 16:35:02 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D58D42C33;
	Sat, 24 May 2014 00:35:01 +0400 (MSK)
Message-ID: <537FB0F5.5010003@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 00:35:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1400861244-15972-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1400861244-15972-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] configure: Put tempfiles in a subdir
 of the build directory
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
X-List-Received-Date: Fri, 23 May 2014 20:35:22 -0000

23.05.2014 20:07, Peter Maydell wrote:
> When libtool support was added to configure, the new temporary files
> were left out of the list of files cleaned up on exit; this results
> in a lot of stale .lo files being left around in /tmp. Worse, libtool
> creates a /tmp/.libs directory which we can't easily clean up.
> 
> Put all our temporary files in a single temporary directory created
> as a subdirectory of the build directory, so we can easily clean it up,
> and don't need fragile or complicated code for creation to avoid it
> clashing with temporary directories from other instances of QEMU
> configure or being subject to attack from adversaries who can write
> to /tmp.
> 
> Since the temporaries now live in the build tree, we have no
> need to jump through hoops with a trap handler to try to remove
> them when configure exits; this fixes some weird bugs where hitting
> ^C during a configure run wouldn't actually make it stop, because
> we would run the trap handler but then not stop. (It is possible
> to get the trap handler semantics right but it is convoluted largely
> because of bugs in dash, so it is simpler to just avoid it.)
> 
> Note that "temporary files go in the build directory, not /tmp" is
> the way autoconf behaves.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Eric Blake <eblake@redhat.com>

*ACK*.

Applied to -trivial, thank you for doing this!

/mjt

