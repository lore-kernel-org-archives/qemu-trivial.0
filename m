Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzoY5-0007f4-10
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2013 08:14:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TzoY1-0007UH-Dy
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 08:14:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TzoY0-0003v8-42
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 08:14:53 -0500
Received: from mail-bk0-f48.google.com ([209.85.214.48]:64965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TzoXq-0003sY-GU; Mon, 28 Jan 2013 08:14:42 -0500
Received: by mail-bk0-f48.google.com with SMTP id jf20so634003bkc.7
	for <multiple recipients>; Mon, 28 Jan 2013 05:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0CXqO9+lbeFZnfq+99xzTPvN80748Wu8l1PvLjG83Ck=;
	b=zCr0BdOFLnyaY8Ia71Enzw7EtC+cskx65iiz+4z6F0gB3Qr8upBCBZV7F4HrCDoqsa
	7VUHHBF2ulrNTWmqmtQDGJVMAMrw9el3r77rWnB7BKPodKHkuecs3+bfUaxiRHnO1ldz
	9aBSn6cbeTp8EhAwTUzi/cRjvmAuATQsxsGfki28EBzuKjPF3TKfU2S20rIIpizpRzIN
	NbHHD1TuPmjoma4sDQONGu3D7clmR1o3pM6dq/NujYnGACsYWetQd6V+4SeZ9nvumnAZ
	sFMF/SMfhKlZX1UxncBqC/3ZMjuMSD5kdLbYYzYz9I8oxUS0lR61SuMBF4FLQ6xSyg1N
	mhWA==
X-Received: by 10.204.147.10 with SMTP id j10mr3977406bkv.7.1359378881480;
	Mon, 28 Jan 2013 05:14:41 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id hc16sm6119272bkc.2.2013.01.28.05.14.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:14:40 -0800 (PST)
Date: Mon, 28 Jan 2013 14:14:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Message-ID: <20130128131438.GF27668@stefanha-thinkpad.redhat.com>
References: <5101BDFD.5010801@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5101BDFD.5010801@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.48
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][TRIVIAL] vl: coding style
	cleanups
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
X-List-Received-Date: Mon, 28 Jan 2013 13:14:55 -0000

On Thu, Jan 24, 2013 at 05:04:29PM -0600, Jesse Larrew wrote:
> 
> Reformat the option parsing code in main() and various supporting functions
> to conform to the QEMU coding style.
> 
> Signed-off-by: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
> ---
>  vl.c | 476 +++++++++++++++++++++++++++++++++++++------------------------------
>  1 file changed, 260 insertions(+), 216 deletions(-)

Please CC qemu-trivial@nongnu.org on trivial patches in the future.

There has been discussion about whitespace cleanups recently and it also
applies to this patch.  There is a cost to such patches - they require
code review, can clog up the git-blame(1) output, and make it hard for
stable branch or downstream maintainers to backport fixes.

I'm happy to take this patch but I hope people don't get too
trigger-happy because this isn't free.

Waiting a while longer to merge in case Blue Swirl or anyone else wants
to chime in.

Stefan

