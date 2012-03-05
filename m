Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4Xoo-0006aI-2t
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:19:14 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4Xod-0006a9-Q6
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:19:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4XoX-0008UX-Up
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:19:03 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:34224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4XoX-0008TI-Lb; Mon, 05 Mar 2012 08:18:57 -0500
Received: by werp12 with SMTP id p12so2953505wer.4
	for <multiple recipients>; Mon, 05 Mar 2012 05:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates
	10.216.137.205 as permitted sender) client-ip=10.216.137.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of stefanha@gmail.com
	designates 10.216.137.205 as permitted sender)
	smtp.mail=stefanha@gmail.com;
	dkim=pass header.i=stefanha@gmail.com
Received: from mr.google.com ([10.216.137.205])
	by 10.216.137.205 with SMTP id y55mr3786348wei.92.1330953535075
	(num_hops = 1); Mon, 05 Mar 2012 05:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p4kFttnWDHFIO5nOcY3jOOBnHNzF49XO+HSWQUV4dqw=;
	b=eYkA7b5nGynJ5/ujIBIuO7p2SkdqW8tn8LVuA7sQzBRblhVeCVN1bSKhU5j7jqccpo
	UcbYmgdE0eaAjcegXwZRS+dvkAeSqNhQYfyU9P0E03Yq+j8uLkCspgy8K+ov/MO3MKEj
	318ghEJyOt5ZrqidO8tMggwhZK0TenWWpSDrTJ/GtMu0niYw6rHW/8R66j89OAtik+bt
	dBj1EACaTjAkPRCcvmdxomtGWaqiuvojIAlv7qkPlbJPufrUBfYJ0hXTZ/6+e6Gk5/Is
	6PgeakVPTc6YftE/hJpYC4ALu+rYbsIrq+Mcwn+EgQLBm8r729ffHUu314JjrWVDh/M5
	wN/Q==
Received: by 10.216.137.205 with SMTP id y55mr3062806wei.92.1330953534985;
	Mon, 05 Mar 2012 05:18:54 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	be4sm61910835wib.8.2012.03.05.05.18.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:18:54 -0800 (PST)
Date: Mon, 5 Mar 2012 13:18:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305131853.GF28506@stefanha-thinkpad.localdomain>
References: <1330178057-21503-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330178057-21503-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: Use format
 specifier %u instead of %d for unsigned values
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
X-List-Received-Date: Mon, 05 Mar 2012 13:19:13 -0000

On Sat, Feb 25, 2012 at 02:54:17PM +0100, Stefan Weil wrote:
> splint reported warnings for those code statements.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  libcacard/vscclient.c |   20 ++++++++++----------
>  1 files changed, 10 insertions(+), 10 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

