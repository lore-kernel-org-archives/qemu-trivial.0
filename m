Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TL6qO-0002x2-K4
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2012 02:29:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TL6qL-0002oq-La
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 02:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TL6qK-0004AO-Rd
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 02:29:33 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:60069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TL6qI-00049Q-I6; Mon, 08 Oct 2012 02:29:30 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1532430bkc.4
	for <multiple recipients>; Sun, 07 Oct 2012 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BUeytkKpLybeVzi2Pun6DzLS3UUrXKOEoKtiRj/4WA0=;
	b=FGttxd+uC2bH5SYb8ZrGPHrk9/LhvCO8lB9nFb3L5mBokkC0tBZNEp1TjbOg2OOHjx
	jOzzRvSjUVpRvSBhjggtDg1rkQ2AmU7clDIVsC4MMHTo/K0QU4P2lJUCrf3hy6zc9Ywi
	Yom0RgdfSX7Xc8MLIyiOOA7et8qmCZM7d+bjY9K0CIs63GY51QdWU4BwBjVDortTAT7h
	tIFZugN+mvxYJnMUvgfPCuDGTQqqVY3wPAwKnmw6DQO98AntsXdYSD6dKDMT65YV9IT6
	51yKaG+nIYq5LhVwerKO2fUJTZhbswJSUNWFbTO6dR8K1bli6FkQeDCtUDAUqbnXm5n3
	ED1Q==
Received: by 10.204.156.13 with SMTP id u13mr4833035bkw.113.1349677769305;
	Sun, 07 Oct 2012 23:29:29 -0700 (PDT)
Received: from localhost ([89.204.130.116])
	by mx.google.com with ESMTPS id j24sm11226790bkv.0.2012.10.07.23.29.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Oct 2012 23:29:27 -0700 (PDT)
Date: Mon, 8 Oct 2012 08:29:25 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121008062925.GA12433@stefanha-thinkpad.redhat.com>
References: <1349454802-31742-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349454802-31742-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] configure: Tidy up remnants of
 non-64-bit physaddrs
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
X-List-Received-Date: Mon, 08 Oct 2012 06:29:35 -0000

On Fri, Oct 05, 2012 at 05:33:22PM +0100, Peter Maydell wrote:
> Tidy up some remnants of code to support non-64-bit physaddrs
> which were accidentally omitted from commit 4be403c8.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |    2 --
>  1 file changed, 2 deletions(-)

Applied, thanks!

https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

