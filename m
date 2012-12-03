Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVZD-0004Do-2x
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 07:56:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVZ5-0004Ab-Nn
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVZ4-0000XQ-E9
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:56:03 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:45823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVZ4-0000XA-5s; Mon, 03 Dec 2012 07:56:02 -0500
Received: by mail-ea0-f173.google.com with SMTP id i13so1215630eaa.4
	for <multiple recipients>; Mon, 03 Dec 2012 04:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mFgZsSY7+hCryt/2wHIDmRbeVd0yg1wSz228Rlb2N88=;
	b=y36MYizi7/KWC77e3HuJDl8obngvaWV65ALUTnG3uf9NZwsDisPSjUx21B2gfqGGr9
	aDZYrKCGRKS3GupfoTTjl0SABQ0Du9jtnMRzu1wuYjLGcP+QbvCzUFpIlPdnXTYdx9ED
	nJNaOILDM7AoEPhzsQcLPhIYzFnTIpx8pqk5niB+/KuPfED7OBYnuvYLtHXI80YTjWCq
	ZWNasdFsDD16lgx2rcD4VVXYuYlkbCLGFYhZ+TbL61/e/gOZe9bILxOLJrKFtnSY/UsF
	Pkyk2QBze9anjdgxmlt67PPlxNOAP5DFCZhvWix4H6KhYTX3SA1/JDpx7jKawqBjzdt3
	z9kg==
Received: by 10.14.172.195 with SMTP id t43mr36257691eel.17.1354539361016;
	Mon, 03 Dec 2012 04:56:01 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id z8sm31111492eeo.11.2012.12.03.04.55.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 04:56:00 -0800 (PST)
Date: Mon, 3 Dec 2012 13:55:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121203125558.GD6048@stefanha-thinkpad.redhat.com>
References: <1353651964-10507-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353651964-10507-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Fix spelling in comments and
	documentation
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
X-List-Received-Date: Mon, 03 Dec 2012 12:56:09 -0000

On Fri, Nov 23, 2012 at 07:26:04AM +0100, Stefan Weil wrote:
> These spelling bugs were found by codespell:
> 
> supressing -> suppressing
> transfered -> transferred
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/usb.h                      |    6 +++---
>  tests/qemu-iotests/iotests.py |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

