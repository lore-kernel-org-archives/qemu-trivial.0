Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYdas-0007Ye-S9
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 12:46:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YYdam-0007Q3-AJ
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 12:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YYdaf-0004Be-Pm
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 12:46:44 -0400
Received: from mail-ig0-f172.google.com ([209.85.213.172]:33871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YYdaf-0004BX-Lt
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 12:46:37 -0400
Received: by igcau2 with SMTP id au2so14194054igc.1
	for <qemu-trivial@nongnu.org>; Thu, 19 Mar 2015 09:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KFfOvNW73hr0KLmN2OwEekeNekUcM0pIHZEGdG9+Vac=;
	b=WKatz4X0HSiZyScIDvB3chnLViLtHkMY+sbTlYnnnL1BOrjCcfB7EJ4JBWAt+tCTg9
	Ns2kl7fFNstd9SqXLZT9wKZjo3CR4hXZi1W/J/ZK4nUd2Qxz6cALR3xywhAScpjbK5mg
	EohVNJRYGsxfQJJthhYluBDL3T7Mjvvsm8wg9pt0JjAmFbV2dxnGA+tJRU+qwWEruHSR
	WfxhTDZ43x9+vAc0egpmIY8ZPfVzmlNXepCo0pxdmC6T+ldJzZravijeALKnmrCMN1gA
	usAUWCgu97eRYcP+pCfgnvUtvru7eNG5iwu/RSJuL97nIMRiCSANIZZbaqh5ANDgtbyF
	/yLg==
X-Gm-Message-State: ALoCoQm8Z/iDQDJ/XOP1/lMZy2Vf0wlJmnbs+XiVlJtjt4n6B07PpUbgS+KHd+NYKbry0/TE2prb
X-Received: by 10.107.7.18 with SMTP id 18mr116380312ioh.69.1426783596904;
	Thu, 19 Mar 2015 09:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.170 with HTTP; Thu, 19 Mar 2015 09:46:16 -0700 (PDT)
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Mar 2015 16:46:16 +0000
Message-ID: <CAFEAcA_gjebZMST+8rTuyz4nR34-A4xo_QdZF-LQq7euUh5gnA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/24] Trivial patches for
	2015-03-19
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
X-List-Received-Date: Thu, 19 Mar 2015 16:46:50 -0000

On 19 March 2015 at 09:05, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another trivial-patches pull request, it comes very close to
> the release because I was too busy last 2 weeks to do anything useful
> with the trivial-patches queue, and because it accumulated quite a few
> patches since that.
>
> Here, there are many code defects fixes found by coverity and sparse,
> mostly from Stefan Weil, and also from Gonglei and Shannon Zhao.  There
> are a few other bits and pieces, all look quite harmless.  And a few
> more interesting changes:
>
>  - smbios: add max speed comdline option for type-17 (meory device) structure
>    by Gabriel L. Somlo
>
>  - configure: enable kvm on x32 by Michael Tokarev
>
>  - error: Replace error_report() & error_free() with error_report_err()
>    by zhanghailiang
>
> These aren't completely trivial, but again, should not have much impact,
> and has been in the queue for quite some time too.
>
> Please consider applying.
>
> I omited a few other patches sent to -trivial for now, partly to speed up
> processing of other patches, partly because some patches better wait for
> 2.4, and partly because some patches, in my opinion, needs one or another
> work.  I'll post comments about these as replies to individual patches
> posted.
>
> Thanks,
>
> /mjt
>
> The following changes since commit cd232acfa0d70002fed89e9293f04afda577a513:
>
>   Update version for v2.3.0-rc0 release (2015-03-17 18:58:33 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-03-19
>
> for you to fetch changes up to 8ce1ee4618f4a557959f5a5731f6726b30416df5:
>
>   qga/commands-posix: Fix resource leak (2015-03-19 11:39:18 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-03-19
>

Applied, thanks.

-- PMM

