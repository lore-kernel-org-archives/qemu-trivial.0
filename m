Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJjD0-0001yF-Kz
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 06:30:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJjCo-0001vm-8k
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJjCj-0005q0-A8
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:30:45 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:47111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJjCj-0005ph-0T
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:30:41 -0400
Received: by werp12 with SMTP id p12so3772351wer.4
	for <qemu-trivial@nongnu.org>; Mon, 16 Apr 2012 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FNpJ7E+YdD+2B5b69k2Z8nKSqZmWlriXAGEtAOLi9GU=;
	b=U1Dpit/aFQs2R5Xxm+Iepgq0B2gTWQbk28NUvvMjqwdxAnEHEOmTbQncINppfGZ3KY
	MD4MW0dXY9q7KGerUFmy8/lsewcKoHPBfKqUKeiqf5VVKpeG9O4NZxALE+SjlF0r6lBb
	RmBFpeRU9HLW9E3/kd8vyIw34nItUwj2hFo5D5k7nq+YMF4NPj/7MspNLqvf0unRtbjV
	otfkxN9ybiIRY6kv0KIxpiJvS4fZXcFWESpe074qpUK94Sd1stMwz49jGnqWXH0nDvTf
	pF5v6mPwwAFC9D1MQN+HmHr9woNJV+0/pnPMdxa6x5tfphjVGa8rqKH3C0987Kkcyf9j
	Jqvg==
Received: by 10.216.135.105 with SMTP id t83mr6387436wei.105.1334572239060;
	Mon, 16 Apr 2012 03:30:39 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id 17sm19113257wis.0.2012.04.16.03.30.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 03:30:38 -0700 (PDT)
Date: Mon, 16 Apr 2012 11:30:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eduardo Elias Ferreira <edusf@linux.vnet.ibm.com>
Message-ID: <20120416103037.GA6291@stefanha-thinkpad.localdomain>
References: <1334246160-17278-1-git-send-email-edusf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334246160-17278-1-git-send-email-edusf@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] spice-qemu-char.c: Show what name is
 unsupported
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
X-List-Received-Date: Mon, 16 Apr 2012 10:30:52 -0000

On Thu, Apr 12, 2012 at 12:56:00PM -0300, Eduardo Elias Ferreira wrote:
> ---
>  spice-qemu-char.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Oops, I nearly missed it: this patch is missing your Signed-off-by:
line.  Please send your Signed-off-by: so this patch can be merged.

http://wiki.qemu.org/Contribute/SubmitAPatch

For more information on Signed-off-by:, please see:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/SubmittingPatches;h=689e2371095cc5dfea9927120009341f369159aa;hb=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#l297

Stefan

