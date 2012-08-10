Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzpPr-0000Cv-S4
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 09:38:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzpPn-0008O1-8g
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 09:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzpPm-0003SG-8B
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 09:38:11 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:58827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SzpPj-0003Rn-RZ; Fri, 10 Aug 2012 09:38:07 -0400
Received: by wgbds1 with SMTP id ds1so1179904wgb.4
	for <multiple recipients>; Fri, 10 Aug 2012 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xRnN8CIMec9EME5DSL5T0iHTz9DobsB1lW3rs7xATRQ=;
	b=BD+fQD5rnXxxEA9gGSZ+5tF2awdxiZEoi/iT+Lvsex4cpf2hUoVKCK/DwO4d7vxWj5
	PNMPqoP0V6lviLE2bOiGewCwpGxJNA6xnrkqAP/qCeS8CtiwGVI5ftsaUrIlYmqpiNWx
	sXsZ9RwGGcF4Z9Qzc3DXLxIX8SWKSV5AQEDYoT7aWp1TTcPTMzaLUAC15kAi16VDT8rr
	JE/BDDKf9XBppYXey/X44UkDStwcZx9XLyb3HD4SAb2NEfvh+/hE9IcI79DuJ00pIogv
	CsPx7LXr/YTIm8D8Em0jUMQ1GG3djCNEUErK9/8W6ChZ98mZa7a0Ay1zaCxlBhk2fGS1
	WWvQ==
Received: by 10.180.83.66 with SMTP id o2mr6177166wiy.14.1344605886879;
	Fri, 10 Aug 2012 06:38:06 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id el6sm7787947wib.8.2012.08.10.06.38.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:38:06 -0700 (PDT)
Date: Fri, 10 Aug 2012 14:38:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120810133804.GB14122@stefanha-thinkpad.localdomain>
References: <1344271338-17688-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344271338-17688-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org,
	"Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] target-arm: Fix typos in comments
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
X-List-Received-Date: Fri, 10 Aug 2012 13:38:14 -0000

On Mon, Aug 06, 2012 at 05:42:18PM +0100, Peter Maydell wrote:
> Fix a variety of typos in comments in target-arm files.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2: s/inputs values/input values/
> 
>  target-arm/arm-semi.c    |    2 +-
>  target-arm/cpu.h         |    2 +-
>  target-arm/helper.c      |    6 +++---
>  target-arm/neon_helper.c |   26 +++++++++++++-------------
>  target-arm/op_helper.c   |    2 +-
>  target-arm/translate.c   |   10 +++++-----
>  6 files changed, 24 insertions(+), 24 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

