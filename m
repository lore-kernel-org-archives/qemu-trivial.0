Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3jOV-0006Nq-Lr
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 03:33:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U3jOS-0006Gi-3V
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 03:33:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U3jOQ-0005hP-Qo
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 03:33:11 -0500
Received: from mail-bk0-f46.google.com ([209.85.214.46]:49819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U3jON-0005gl-Fs; Fri, 08 Feb 2013 03:33:07 -0500
Received: by mail-bk0-f46.google.com with SMTP id j5so1572890bkw.19
	for <multiple recipients>; Fri, 08 Feb 2013 00:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qBuap+QoMhdirP6yzPBg22PAcuFkt5hLHbVpIiULhG4=;
	b=CNyQfU8Eyf+f3JSN2Ji9pMNltf9rqNqKXLcXki1dCzeBVnGmbn5Rn6fVibwtTCIwDd
	JAH3tDdZymRRlWdG2Rd30Rdfzv84HEqi5BbhWkyWQiZZ+zNHHtsjgfYKuBusfLCZLj9S
	TBMMFoZO4+fpN7oq40genKdMhmwB6p7UHGsydvkiW1tQ2gljZChgOpoeTHqAJOXRxgPo
	BVhPQ9f6L/ugruLiD3nXH9OKyz6w0iwY2ojhXIGrsZO8wCTru994/tmRv4NXQ78zCgg7
	guoMW72l5SjK25ibwvuDJ4xmhxTbusyIn2F09QivoKHOeEKw7V/1ulDbFzGRuoUqsmk5
	fi5w==
X-Received: by 10.204.7.195 with SMTP id e3mr1193347bke.115.1360312386055;
	Fri, 08 Feb 2013 00:33:06 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id o9sm9843678bko.15.2013.02.08.00.33.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 00:33:05 -0800 (PST)
Date: Fri, 8 Feb 2013 09:33:03 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Message-ID: <20130208083303.GA6438@stefanha-thinkpad.redhat.com>
References: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.46
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] virtio-net config_size cleanups
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
X-List-Received-Date: Fri, 08 Feb 2013 08:33:14 -0000

On Thu, Feb 07, 2013 at 02:49:25PM -0600, Jesse Larrew wrote:
> This patch set includes some minor cleanups requested by the community for
> the virtio-net config size solution.
> 
> [PATCH 1/2] hw/virtio-net: use existing macros to implement endof
> [PATCH 2/2] hw/virtio-net: fix config_size data type

Hi Jesse,
I can't apply these patches yet because the patches they depend on
haven't appeared in qemu.git/master.

Anthony: Want to merge these patches for 1.4-rc2, we can skip the
trivial-patches queue?

Stefan

