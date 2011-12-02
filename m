Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWT4Q-0006Ha-Ou
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 08:22:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWT4N-00066U-I0
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 08:22:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWT4M-0001k1-HX
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 08:22:27 -0500
Received: from mail-ww0-f41.google.com ([74.125.82.41]:63703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RWT4D-0001iC-0O; Fri, 02 Dec 2011 08:22:17 -0500
Received: by wgbdt12 with SMTP id dt12so979370wgb.4
	for <multiple recipients>; Fri, 02 Dec 2011 05:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H0JwHPkQ15xEiKnQzhP9vFAQhJCX3kAxM+uOq5tMp8w=;
	b=ITRTq879bhhW0y2LWDSrI1v6Vx5S7bWiMvMizFs5dE8P42jjHFmAaWrPnZxaXpdIci
	OEn7lRxa+AlESmxbBObBohC7q6+bhF3t79DWtegLQKXCsRIpZ/ZFEy2S5XHsjczb3x4o
	odIO/3gU50KD73LUYZa0LJbrjrf1RvYTCuCOM=
Received: by 10.216.189.147 with SMTP id c19mr1402159wen.92.1322832135904;
	Fri, 02 Dec 2011 05:22:15 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	gg1sm10174395wbb.17.2011.12.02.05.22.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 05:22:15 -0800 (PST)
Date: Fri, 2 Dec 2011 13:22:13 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111202132213.GC19437@stefanha-thinkpad.localdomain>
References: <1322654344-13741-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322654344-13741-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Pull linux-headers/asm
 symlink creation out of loop
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
X-List-Received-Date: Fri, 02 Dec 2011 13:22:28 -0000

On Wed, Nov 30, 2011 at 11:59:04AM +0000, Peter Maydell wrote:
> Pull the creation of the linux-headers/asm symlink out of the loop
> so we don't pointlessly delete and recreate it once for each target.
> Also move the setting of the includes variable up so that it is
> in the same place as the other code which sets this variable.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |   37 ++++++++++++++++++++-----------------
>  1 files changed, 20 insertions(+), 17 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

