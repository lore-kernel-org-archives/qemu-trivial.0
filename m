Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2kx-0006vj-S7
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:06:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2ku-0006mM-OY
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2kt-0003v8-LD
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:06:36 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:46284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2kr-0003u2-0U; Sun, 08 May 2011 08:06:33 -0400
Received: by wyb42 with SMTP id 42so3836642wyb.4
	for <multiple recipients>; Sun, 08 May 2011 05:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=E/nQuSrleBdhVevkX9P3roCYZFNI3RkZWQ6WJ5DNe3c=;
	b=jYSitbrrYI+oz4SezI4ROanmGI7DyFT1+xjWv+Fp1yGGbzmBoTYmpBmbpapaUN1JkT
	D/pcMQnBfMlarDct7vP//59g5Na01Uz8TqNX4GQfqLyC8SjkGWlXver8OwAvKXj0Bd6y
	f7JArjJqHqwBhl+KfBTmk0F2uQcp3XIXBTgnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RHpTE5sm5YkYohCdZ4Lp2NJe7iy6Tta4CR9CkfOw4Tt8bcTJTW8ziAfOapkeRn+zWq
	qOCsLxDGyKpzV9r/Os0wHldO8AAaJCiF/O+tdKIWbSsp84Oql8tl7VBTQ6GVi6ezAnwh
	lmkn8fCExpH/nzx7bT/RvgqfbTCsA4R5vdMSM=
Received: by 10.227.196.209 with SMTP id eh17mr6023953wbb.5.1304856392118;
	Sun, 08 May 2011 05:06:32 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id o6sm3111273wbo.54.2011.05.08.05.06.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:06:31 -0700 (PDT)
Date: Sun, 8 May 2011 13:06:26 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20110508120626.GA10606@stefanha-thinkpad.localdomain>
References: <1304322846-24376-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304322846-24376-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/4] libcacard: add correct subdirectory
 dependencies
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
X-List-Received-Date: Sun, 08 May 2011 12:06:38 -0000

On Mon, May 02, 2011 at 09:54:03AM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> ---
>  Makefile           |    2 ++
>  Makefile.objs      |    7 +++----
>  libcacard/Makefile |    9 +--------
>  3 files changed, 6 insertions(+), 12 deletions(-)

Thanks, applied to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

