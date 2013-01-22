Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxfPB-0004Be-0U
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 10:04:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TxfP7-0003zs-2t
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 10:04:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TxfP1-0002zR-S5
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 10:04:48 -0500
Received: from mail-wi0-f180.google.com ([209.85.212.180]:54531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TxfOy-0002yk-BC; Tue, 22 Jan 2013 10:04:40 -0500
Received: by mail-wi0-f180.google.com with SMTP id hj13so5996309wib.1
	for <multiple recipients>; Tue, 22 Jan 2013 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/pVtcZl+0LRwaRuDw6gW8pQ36AJlu5wwQux/moSjM5s=;
	b=gAcInbCZsOCWmjXa7HKHhAVHSOr2g3imeamCC8UeqguOZz+SaY8Zvs4Q19gf4hzMye
	2C8mVg0t/GRrY0TlAWpbKKkGcvyXTS898300U9uej77qCh7xT1ivqBixLQvLg+nBDHMq
	vmYQATtLaIA4U642EmQI347kXBkFeWpj2xLXOkCJYVn88Cay9U5+Veqeyyk4m6ciWCob
	htRzRZDMIAwwed95Paf2BSp7k7kiCqxdQSfZBeugVVkJr4rS15NnFKFKtb/44DeX1O7/
	LiKaD6Y5ivAGvW8Cr54ISYB5i76FNmviGdMxgr7bBgcCzENVnJ0JCs/I2w2z4kut50fE
	rlEQ==
X-Received: by 10.180.85.165 with SMTP id i5mr21740268wiz.11.1358867079322;
	Tue, 22 Jan 2013 07:04:39 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id bd7sm24247264wib.8.2013.01.22.07.04.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 07:04:38 -0800 (PST)
Date: Tue, 22 Jan 2013 16:04:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130122150436.GA29789@stefanha-thinkpad.redhat.com>
References: <1358849286-24750-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358849286-24750-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.180
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3 00/11] Trivial memory allocation fixes
 & cleanups
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
X-List-Received-Date: Tue, 22 Jan 2013 15:04:51 -0000

On Tue, Jan 22, 2013 at 11:07:55AM +0100, Markus Armbruster wrote:
> v3: const tweak suggested by stefanha in PATCH 08/11, rest identical
>     except 03/11's commit message mentions leak (thanks stefanha!)
> 
> v2: Windows compile fix in PATCH 08/11 (thanks eblake!), rest identical
> 
> Markus Armbruster (11):
>   g_malloc(0) and g_malloc0(0) return NULL; simplify
>   g_strdup(NULL) returns NULL; simplify
>   hw/9pfs: Fix unchecked strdup() by converting to g_strdup()
>   readline: Fix unchecked strdup() by converting to g_strdup()
>   spice: Fix unchecked strdup() by converting to g_strdup()
>   virtfs-proxy-helper: Fix unchecked strdup() by conv. to g_strdup()
>   qemu-log: Fix unchecked strdup() by converting to g_strdup()
>   qemu-log: Plug trivial memory leak in cpu_set_log_filename()
>   libcacard: Fix unchecked strdup() by converting to g_strdup()
>   qapi: Fix unchecked strdup() by converting to g_strdup()
>   qemu-ga: Fix unchecked strdup() by converting to g_strdup()
> 
>  block/qcow2-refcount.c      |  6 +-----
>  block/vdi.c                 |  4 +---
>  fsdev/virtfs-proxy-helper.c |  4 ++--
>  hw/9pfs/virtio-9p-device.c  |  8 ++------
>  hw/9pfs/virtio-9p-local.c   |  8 ++++----
>  hw/9pfs/virtio-9p.c         |  6 +-----
>  hw/block-common.c           |  4 +---
>  hw/vhost.c                  |  7 ++-----
>  libcacard/vcard_emul_nss.c  |  4 ++--
>  libcacard/vreader.c         |  2 +-
>  libcacard/vscclient.c       |  4 ++--
>  net/net.c                   |  4 +---
>  qapi/qmp-registry.c         |  2 +-
>  qemu-log.c                  | 15 ++++++++++-----
>  qga/commands.c              |  2 +-
>  readline.c                  |  4 ++--
>  slirp/slirp.c               |  8 ++------
>  ui/spice-core.c             |  4 ++--
>  util/qemu-option.c          |  8 ++------
>  19 files changed, 40 insertions(+), 64 deletions(-)
> 
> -- 
> 1.7.11.7
> 
> 

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

