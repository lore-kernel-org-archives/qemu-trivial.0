Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvVvt-0005df-Sb
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 10:29:13 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvVvo-0005cq-P6
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 10:29:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvVvi-0000I9-CZ
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 10:29:08 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:36827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvVvi-0000Hx-2w; Thu, 09 Feb 2012 10:29:02 -0500
Received: by werh12 with SMTP id h12so1454916wer.4
	for <multiple recipients>; Thu, 09 Feb 2012 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z6I2vxLlPa4ImhgGAIzlU4VtaWwpijQMtI9xQt8H5fw=;
	b=tBBYAtr3cnNZF3FMsh5WOZtUrfcYIl3QkHKUXauQ4YbeEZ9+OZaATgOelmGcb7mjp1
	+ijY3hKWDLnUGdRc0FoAb/UZEtRjX7Obm9ZYqCqf1RaxrvkmvF/4GHrnF4RW5bbocWNT
	9evBi4WGeyjsVCAfuU5xzAKAQBEotHjfMgzDU=
Received: by 10.180.79.229 with SMTP id m5mr3520366wix.6.1328801340845;
	Thu, 09 Feb 2012 07:29:00 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id s2sm8760954wix.3.2012.02.09.07.28.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 07:28:59 -0800 (PST)
Date: Thu, 9 Feb 2012 15:28:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20120209152858.GA6051@stefanha-thinkpad.localdomain>
References: <20120209112942.77ce62bf@doriath.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120209112942.77ce62bf@doriath.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [TRIVIAL] virtio_cleanup(): Remove unneeded
 g_free() parameter check
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
X-List-Received-Date: Thu, 09 Feb 2012 15:29:12 -0000

On Thu, Feb 09, 2012 at 11:29:42AM -0200, Luiz Capitulino wrote:
> 
> Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  hw/virtio.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Tweaked commit message to be more conventional with "virtio: Remove
unneeded g_free() check in virtio_cleanup()".

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

