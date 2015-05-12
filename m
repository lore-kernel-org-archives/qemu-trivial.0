Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsCCs-0000tZ-8E
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 11:34:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YsCCp-0000pu-TM
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 11:34:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YsCCp-0005EL-1Z
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 11:34:51 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:9942 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1YsCCk-00056U-F1; Tue, 12 May 2015 11:34:46 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AssGAAYdUlVbdWOb/2dsb2JhbABcgw+BMrMkAQEBAQEBBQGBBAGYVgKBOkwBAQEBAQGBC4QhAQEDATo/BQsLDhMlDwEsGwYBEogkDAHJZgEBAQEBAQEDAQEBAQEdhhaFI4UFB4QtAQS0IiNhgxg8MYJGAQEB
X-IPAS-Result: AssGAAYdUlVbdWOb/2dsb2JhbABcgw+BMrMkAQEBAQEBBQGBBAGYVgKBOkwBAQEBAQGBC4QhAQEDATo/BQsLDhMlDwEsGwYBEogkDAHJZgEBAQEBAQEDAQEBAQEdhhaFI4UFB4QtAQS0IiNhgxg8MYJGAQEB
X-IronPort-AV: E=Sophos;i="5.13,415,1427752800"; d="scan'208";a="360313409"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 12 May 2015 17:33:40 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1YsCBg-0006M8-5H; Tue, 12 May 2015 17:33:40 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1YsCBf-0006Sv-Vr; Tue, 12 May 2015 17:33:40 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
In-Reply-To: <1431443456-21605-1-git-send-email-eblake@redhat.com>
References: <1431443456-21605-1-git-send-email-eblake@redhat.com>
User-Agent: Notmuch/0.13.2 (http://notmuchmail.org) Emacs/23.2.1
	(i486-pc-linux-gnu)
Date: Tue, 12 May 2015 17:33:39 +0200
Message-ID: <w51iobx7quk.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] qemu-io: Use getopt()
	correctly
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
X-List-Received-Date: Tue, 12 May 2015 15:34:53 -0000

On Tue 12 May 2015 05:10:56 PM CEST, Eric Blake <eblake@redhat.com> wrote:

> POSIX says getopt() returns -1 on completion.  While Linux happens
> to define EOF as -1, this definition is not required by POSIX, and
> there may be platforms where checking for EOF instead of -1 would
> lead to an infinite loop.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

