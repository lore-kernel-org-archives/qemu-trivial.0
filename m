Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWDk-00076g-QT
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:43:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWDi-00071H-Tc
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:43:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWDi-0006IS-07
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:43:30 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:40120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWDf-0006IA-MV; Sat, 21 Jul 2012 05:43:27 -0400
Received: by wgbfm10 with SMTP id fm10so3624843wgb.10
	for <multiple recipients>; Sat, 21 Jul 2012 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MyCi9ayNM5IkpGtnRZuNwTMebcdLJi611Fzxyw9jRCw=;
	b=uE/h4NKlKPJAqWSwqnlLN2LNwX5P+CQnU9ktyIv4sHlNqEQEFA5tcjMdHj7Z8M3HR3
	Ss7AZgARRXgkX4h4W381dwIWezeiysxC1vx0LkII7cr0YNt1WTrQgVHXN+4MWOTAQ8LI
	x/JcnsbnkmKgbCdtDmT8UPciwi5GfhzhmqYadqqMi5ZrJbbQ3MSK82OZltl8KJ1cUiP3
	+85SUfvhlNosQEOtQfz+29cOiJvSfD5PB2lpdCs4xb7uUwKnc9iW8QpO1j8s3m08wTLl
	fXLQL4LVLgqgvpDsUJWXvWAebbuDPrUrX217cofwHnud1qLBE1Hn5enM1ZcK0fhPqXcl
	ntNQ==
Received: by 10.216.68.3 with SMTP id k3mr5045114wed.202.1342863806614;
	Sat, 21 Jul 2012 02:43:26 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t8sm2992355wiy.3.2012.07.21.02.43.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:43:25 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:43:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Mao, Junjie" <junjie.mao@intel.com>
Message-ID: <20120721094325.GA14151@stefanha-thinkpad.localdomain>
References: <EF5A1D57CFBD5A4BA5EB3ED985B6DC6E0B4633@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EF5A1D57CFBD5A4BA5EB3ED985B6DC6E0B4633@SHSMSX101.ccr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: "'qemu-trivial@nongnu.org'" <qemu-trivial@nongnu.org>,
	"'qemu-devel@nongnu.org'" <qemu-devel@nongnu.org>,
	"'kvm@vger.kernel.org'" <kvm@vger.kernel.org>
Subject: Re: [Qemu-trivial] [PATCH RESEND] Recognize PCID feature
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
X-List-Received-Date: Sat, 21 Jul 2012 09:43:31 -0000

On Fri, Jul 20, 2012 at 07:08:21AM +0000, Mao, Junjie wrote:
> This patch makes Qemu recognize the PCID feature specified from configuration or command line options.
> 
> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
> ---
>  target-i386/cpu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

