Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ12P-00019n-PW
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 08:25:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ12I-0000yC-Gc
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ12E-0006CJ-Cs
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:25:30 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:36813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UJ12A-00068l-8g; Fri, 22 Mar 2013 08:25:22 -0400
Received: by mail-wi0-f177.google.com with SMTP id hm14so4250667wib.4
	for <multiple recipients>; Fri, 22 Mar 2013 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JluTiB4r5eIwhOMjcyR/ixVRidd6lrIkbQiLlN4mgyM=;
	b=pWYTQu/QczttHm6k7rN7+IhUsFwzDUs6sng4zy12t8kj25O0Babv6GP+OiUAk8SHCy
	5qFecPKRCfpQMHsArgsMxZkf3Q6PAz48wi53p3Dio3QdZMjgMyub5qQTfqZzoKhgcNs2
	C7SHp/8gz8k+DE6YN1eJ5HyaKGwAa/Pjv0JlLz+fghMzrGVtLjkVlFfwg/GvLINGvvYO
	UfCOVYuwxpuhq1JRsDFpVLDrh8zbhZJwF6qp245fQE5AWfdF9s3S1GFiyDSvnQE7H1z9
	4JdQIf4wcy86LMja0z6jSB/UWN7zg0A73ZYaBJQ9IUfEuQtl2KGUcXhZyRZUNXv/MbNA
	Kveg==
X-Received: by 10.194.63.109 with SMTP id f13mr2791839wjs.11.1363955121489;
	Fri, 22 Mar 2013 05:25:21 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:81b0:6069:490c:9a88])
	by mx.google.com with ESMTPS id f1sm3214431wib.0.2013.03.22.05.25.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 05:25:20 -0700 (PDT)
Date: Fri, 22 Mar 2013 13:25:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130322122518.GD30604@stefanha-thinkpad.redhat.com>
References: <1363627207-29224-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1363627207-29224-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Fix typos and misspellings
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
X-List-Received-Date: Fri, 22 Mar 2013 12:25:36 -0000

On Mon, Mar 18, 2013 at 05:20:07PM +0000, Peter Maydell wrote:
> Fix various typos and misspellings. The bulk of these were found with
> codespell.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I noticed the PCI typo while reading the file so I figured I'd run codespell
> on the tree while I was at it. (Oddly codespell doesn't complain about the
> typos in pci_host.c.)
> 
>  docs/usb-storage.txt     |    4 ++--
>  hw/arm-misc.h            |    2 +-
>  hw/pci/pci_host.c        |    2 +-
>  hw/sdhci.c               |    2 +-
>  include/qom/object.h     |    2 +-
>  monitor.c                |    8 ++++----
>  net/tap.c                |    2 +-
>  qemu-options.hx          |    2 +-
>  qga/commands-posix.c     |    2 +-
>  target-i386/translate.c  |    2 +-
>  target-s390x/translate.c |    2 +-
>  11 files changed, 15 insertions(+), 15 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

