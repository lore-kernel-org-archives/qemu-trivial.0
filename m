Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmMI6-0004iZ-Fg
	for mharc-qemu-trivial@gnu.org; Tue, 20 Sep 2016 10:44:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bmMI0-0004dM-Pe
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 10:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bmMHz-0004Ju-Sv
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 10:44:52 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:10844 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1bmMHp-000467-5o; Tue, 20 Sep 2016 10:44:41 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2ChAgBaSuFX/5tjdVteGQEBAQEBAQEBAQEBBwEBAQEBgzsBAQEBAR6BU40zlgQBAQEBAQEFAYEUAZIOgg+CBIYeAoFjOBQBAgEBAQEBAQFeJ4RiAQEEeRALDgoJJQ8BLBsGARKITgG8SAEBAQEBAQEDAQEBAQEihW2FHoogBZlxkTYBjhKMZIN7HjaFBTw0hyIBAQE
X-IPAS-Result: A2ChAgBaSuFX/5tjdVteGQEBAQEBAQEBAQEBBwEBAQEBgzsBAQEBAR6BU40zlgQBAQEBAQEFAYEUAZIOgg+CBIYeAoFjOBQBAgEBAQEBAQFeJ4RiAQEEeRALDgoJJQ8BLBsGARKITgG8SAEBAQEBAQEDAQEBAQEihW2FHoogBZlxkTYBjhKMZIN7HjaFBTw0hyIBAQE
X-IronPort-AV: E=Sophos;i="5.30,368,1470693600"; d="scan'208";a="55543239"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Sep 2016 16:44:39 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1bmMHm-0002s4-Nf; Tue, 20 Sep 2016 16:44:38 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1bmMHm-0008UV-L0; Tue, 20 Sep 2016 16:44:38 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, rth@twiddle.net
In-Reply-To: <1474382581-12766-1-git-send-email-eblake@redhat.com>
References: <1474382581-12766-1-git-send-email-eblake@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Tue, 20 Sep 2016 16:44:38 +0200
Message-ID: <w518tumockp.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore test executables
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2016 14:44:57 -0000

On Tue 20 Sep 2016 04:43:01 PM CEST, Eric Blake wrote:
> Commits 9ef8112a and efad6682 introduced new tests, but forgot
> to ignore the built executables from an in-tree build.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

