Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz3j6-0004NV-Jh
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 08:24:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xz3iz-0004BN-Lv
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 08:24:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xz3iu-0007DB-Qh
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 08:24:09 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:56266 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xz3iu-0007Cz-JG; Thu, 11 Dec 2014 08:24:04 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xz4Of-00023a-KH; Thu, 11 Dec 2014 15:07:13 +0100
References: <1418298396-27089-1-git-send-email-dgilbert@redhat.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
In-reply-to: <1418298396-27089-1-git-send-email-dgilbert@redhat.com>
Date: Thu, 11 Dec 2014 13:24:33 +0000
Message-ID: <87oaracoa6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Sort
	include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 11 Dec 2014 13:24:14 -0000


Dr. David Alan Gilbert (git) <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Mainly to make it less likely to conflict during merges.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I'm happy with the idea (having been adding stuff recently). However
have you:

a) checked for typedefs no longer used by the wider code base
b) audited for others using opaque types pulling in full definitions?

Otherwise:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Cheers,

-- 
Alex Bennée

