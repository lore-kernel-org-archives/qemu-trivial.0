Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVYi-0003yC-UI
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 07:55:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVYa-0003cZ-S0
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVYU-0000Tj-SW
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:55:32 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:50098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVYN-0000TF-NE; Mon, 03 Dec 2012 07:55:19 -0500
Received: by mail-ea0-f173.google.com with SMTP id i13so1215308eaa.4
	for <multiple recipients>; Mon, 03 Dec 2012 04:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=egfsLZuLdiajAbpOaIVKPdYQsa51UAAKWJeU596C2bw=;
	b=Hsi/V6UTCfMZppYzgkhkutMQ616GVto/eK3FilaEw8hpKfe/fYVnC2PQ2yXkuY1aHJ
	RdjUjWw5ezntRiRRmFiBRwRc8oED57At/wzVB9+piqhPp3r6hp/SG5saVQxkqMw7AZ8Q
	pVD5pAvlOZ7TcWLkpVRapGDckV7GxSTN+EahpRWeHuXE3G/b5ln40M+vrojB4EMJPXUV
	HxAs9tg94vCAX6/3kWN8wl44yjo5ucSl6ebYE/v0Gsjhv7Wx3ubgPF4sI6qSsBEQ4HFx
	yGxIs8MSxF7rMyhg2HGroqZJFuMdlDCSNO26TzGfsFa+RJ5UbnWNite4cajeXfaduprU
	9FGw==
Received: by 10.14.0.71 with SMTP id 47mr35716556eea.19.1354539318837;
	Mon, 03 Dec 2012 04:55:18 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id a44sm31115854eeo.7.2012.12.03.04.55.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 04:55:18 -0800 (PST)
Date: Mon, 3 Dec 2012 13:55:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20121203125516.GC6048@stefanha-thinkpad.redhat.com>
References: <1353593796-26823-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353593796-26823-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH] Clean up pci_drive_hot_add()'s use of
 BlockInterfaceType
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
X-List-Received-Date: Mon, 03 Dec 2012 12:55:39 -0000

On Thu, Nov 22, 2012 at 03:16:36PM +0100, Markus Armbruster wrote:
> pci_drive_hot_add() parameter type has the wrong type: int instead of
> BlockInterfaceType.  It's actually redundant, so we can just drop it.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/device-hotplug.c | 11 ++++-------
>  hw/pci-hotplug.c    |  7 +++----
>  sysemu.h            |  3 +--
>  3 files changed, 8 insertions(+), 13 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

