Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaMsp-0005mX-Px
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 03:39:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaMsl-0005lQ-PK
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:39:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaMsi-0001vM-My
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 03:39:07 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:57036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TaMsi-0001v3-FK; Mon, 19 Nov 2012 03:39:04 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so783846bkc.4
	for <multiple recipients>; Mon, 19 Nov 2012 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rPdK/fHlgVcWKUu4AL+LjolzHXi7b5sVBDog47Q5Ulc=;
	b=bcmrBzcnsv2vVBk0hSF1IotjUvgpvWLAVvrU+LPtKbppNUr6ize8yAzxUhnSf1ck4i
	/L9Up52uqrtPetRE7UzgukmC/de/iH/xMl4TbVAnyxP9dEGGmnrMucml504py+jiJ9Tj
	SlPb7h1aFqPHFnk12QFSEJT2/7WD9oyrEeS2DzT1lYRQNUQSEZOIbUM+shONPhZuVy6G
	MKoWRLHlzokrGM5ahTk/9n4NhDwCgVpYdoDA+e85HzIFFGML6BCbv5LTysmtuAA9/aVW
	nSSw19cKPoexli9J+Z7oOO4ecP1LXBXIaowY3chYdf2VIVJBDbeUmeFgT7Xt2IAgEEL4
	fI6w==
Received: by 10.204.147.141 with SMTP id l13mr4400246bkv.43.1353314343435;
	Mon, 19 Nov 2012 00:39:03 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id a5sm1594388bkw.8.2012.11.19.00.39.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 00:39:02 -0800 (PST)
Date: Mon, 19 Nov 2012 09:39:01 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121119083901.GC17444@stefanha-thinkpad.redhat.com>
References: <1351841754-26483-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1351841754-26483-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] s390x: Spelling fixes (endianess ->
 endianness, occured -> occurred)
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
X-List-Received-Date: Mon, 19 Nov 2012 08:39:10 -0000

On Fri, Nov 02, 2012 at 08:35:54AM +0100, Stefan Weil wrote:
> Replace also "write into" by "write to".
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I think "write to" is better, but I am not sure about this,
> so please wait until a native speaker has reviewed that patch.

"write to" is better.

Applied to the trivial patches tree.  There is a pending pull request -
this patch will be in the next pull request.

Stefan

