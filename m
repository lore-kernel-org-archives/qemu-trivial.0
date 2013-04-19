Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7hB-0000ub-GG
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:33:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7h9-0000uA-Su
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7h8-00043h-UX
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:33:27 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:46641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7h7-000433-0G; Fri, 19 Apr 2013 05:33:25 -0400
Received: by mail-wi0-f175.google.com with SMTP id h11so502564wiv.14
	for <multiple recipients>; Fri, 19 Apr 2013 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sahUtC48C3qaKfM9HHXsKaYiw57HGqzUxaBJKTq5o7A=;
	b=PY7x8w9cSdDDSTW42gwW8yQEgqBr70RUS40jeg8qr5g3LrFMT3dOVS1ZGC/qbA2xs1
	GpmTT4zrAp4Rg6fpyh5ic0PxglMgaZhYm3VQnu0n6BdEERI40LTGaqDJi5skDL9T6d0l
	jrmsdREGs9ibHlV0OEMpsh9hARKHHW3N6dHOFt6ILfg1toG348WfL9+6Zr/NIT3bBHan
	bK3nquz10VltAJUlVTBvZYlp3W35oZqyM9yszXQhbXAUtyGRnbaroeFaJN1bl5Z7qcej
	zGrfxMA0K05nhyhBISjcYAt7TiOb0hX6L0x0DMiHiEZVcvJXZ5mIjueksksHBoCfVKGd
	ckRw==
X-Received: by 10.194.93.68 with SMTP id cs4mr24470963wjb.17.1366364004167;
	Fri, 19 Apr 2013 02:33:24 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPS id bq19sm2378076wib.7.2013.04.19.02.33.22
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:33:23 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:33:21 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20130419093321.GB30143@stefanha-thinkpad.redhat.com>
References: <20130412091255.7a3f1c75@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130412091255.7a3f1c75@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	fred.konrad@greensocs.com
Subject: Re: [Qemu-trivial] [PATCH] virtio.h: drop unused function prototypes
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
X-List-Received-Date: Fri, 19 Apr 2013 09:33:28 -0000

On Fri, Apr 12, 2013 at 09:12:55AM -0400, Luiz Capitulino wrote:
> They are unused since commit 5c7d0962f60498c3f11d402e1c857cb9d5d8568d.
> 
> Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 2 --
>  1 file changed, 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

