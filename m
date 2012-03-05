Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4b1a-0007F9-Jd
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 11:44:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4b1K-0007Eu-7t
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:44:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4b0u-00062D-SN
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:44:21 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:65197)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4b0u-0005zu-JN; Mon, 05 Mar 2012 11:43:56 -0500
Received: by werp12 with SMTP id p12so3114400wer.4
	for <multiple recipients>; Mon, 05 Mar 2012 08:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4NkSWRhuLhAh6pdRTKJKoiv2H9G6z640oWjh6PetwQk=;
	b=p3Ge4f+AYR8OIHGnXllXn1W+3j2atCoQ8JFwH1SMX8lTvxy5Cx4FKW3H02n5suibBe
	VnA/7fC3svvdFj6iJ+0vLvYpCzLUAUsXK2pOkR/NlTXevxKvfNyUntTp7mJjDAt/0RsB
	LfNwHpVnY94v/BAvrLc3agy4uD3g6LjX5IvEO5si2dUSQ4XLJNaDeoCgHfc9ljTNoh5X
	178RuRt9zzA/Fy9MTVcqI5EZcwIcZcs8uVO14DL7WXvg0+0aqHrHd01HqgD3HkzhrN6o
	roy/VcZXgWnTDHbRLytJJY1t3HXt0oEsAZfXAMCw0zQIvlVGbcP0dqKlKa5IYJOLOv0w
	YPMg==
Received: by 10.180.85.35 with SMTP id e3mr13125589wiz.6.1330965833972;
	Mon, 05 Mar 2012 08:43:53 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	w14sm9048102wiv.11.2012.03.05.08.43.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 08:43:53 -0800 (PST)
Date: Mon, 5 Mar 2012 16:43:51 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305164351.GB8197@stefanha-thinkpad.localdomain>
References: <1330379844-30735-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330379844-30735-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alon Levy <alevy@redhat.com>, qemu-devel@nongnu.org,
	Robert Relyea <rrelyea@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] libcacard: Spelling and
 grammar fixes in documentation
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
X-List-Received-Date: Mon, 05 Mar 2012 16:44:37 -0000

On Mon, Feb 27, 2012 at 10:57:24PM +0100, Stefan Weil wrote:
> * it's -> its
> 
> * it's -> it is (that's no fix, but makes future checks easier)
> 
> * this functions -> this function
> 
> * replacable -> replaceable
> 
> * reader's -> readers
> 
> * logins into -> logs into
> 
> v2:
> Also replace 'aid' by 'AID' (thanks to Peter Maydell for this hint).
> 
> v3:
> Fix sentence (contributed by Alon Levy / Robert Relyea).
> 
> Cc: Alon Levy <alevy@redhat.com>
> Cc: Robert Relyea <rrelyea@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/libcacard.txt |   26 +++++++++++++-------------
>  1 files changed, 13 insertions(+), 13 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

