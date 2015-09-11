Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaPbq-0000PK-GA
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 10:47:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZaPbo-0000OL-I0
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 10:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZaPbl-0008DM-By
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 10:47:24 -0400
Received: from mail-vk0-f45.google.com ([209.85.213.45]:33334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZaPbl-0008DE-7t
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 10:47:21 -0400
Received: by vkgd64 with SMTP id d64so27708262vkg.0
	for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2015 07:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jqxz2NteQ4M8Bot+zrNbsXVZog7uZLPvQcYdU6CH4vs=;
	b=MjZMSNBLtqZa/RzlsHHe84rY48tzxbB50tIWfjvhyLVygYqFwWem2x5Mb1xI+gS+pB
	1GaciBzjAPjapTI+mmQhkhAmVET8QEs2ejTnNM8auhc01ePD4hWv8DPg9FQBYNJcBeb5
	rxNq3LgRCaFR/sSLFVv06enMuZnYRhudn9amhnOGjYsWbKLOFvEgpZSu55OeLpPaiANF
	TCGI8S+10vdS9ISuEGoq9oWgu0pamENCNJ3w9h56QPnmea2F+1SjtFfDskqQPKQpQsTc
	teH6AaHEddf85gRv1Z2RgeSPvyukjeEk5YV+OJr1NabQ9h6PWkuMwInPXJ5+nKZeMrdA
	kA5A==
X-Gm-Message-State: ALoCoQl9c32IwIt74aeXahO4Ao2haeqle9cJ4icbEYZeUuaIUs6nR8hr3i3TGInqp2kUNiQE/Hw7
X-Received: by 10.31.16.38 with SMTP id g38mr2604266vki.83.1441982840758; Fri,
	11 Sep 2015 07:47:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Fri, 11 Sep 2015 07:47:01 -0700 (PDT)
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Sep 2015 15:47:01 +0100
Message-ID: <CAFEAcA_3WJKx8wgUtwCw6NZ_s=WCkZ+wD=DMmnKFxw=BzKmP6A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/26] Trivial patches for
	2015-09-11
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
X-List-Received-Date: Fri, 11 Sep 2015 14:47:25 -0000

On 11 September 2015 at 12:03, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a next trivial-patches pull request after more than one month
> delay.  Hopefully this one is okay...
>
> The following changes since commit 7b9c09f7d486647784c605739d69b708a7249c9b:
>
>   Merge remote-tracking branch 'remotes/sstabellini/tags/xen-2015-09-10-tag' into staging (2015-09-10 18:25:52 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-09-11
>
> for you to fetch changes up to af5b83d7d5297f8bdfd3353a420c120c4fd5adfd:
>
>   virtio-vga: enable for i386 (2015-09-11 12:18:37 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-09-11
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

