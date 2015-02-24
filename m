Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQ9VO-0006sI-72
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 02:02:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YQ9VL-0006p9-Rs
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 02:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1YQ9VL-000317-86
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 02:02:03 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:43293 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1YQ9VD-0002z9-NK; Tue, 24 Feb 2015 02:01:55 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AokIAIsg7FRbdWOb/2dsb2JhbABbgwaxZQUBAQEBAQEFAXeXTQKBJEMBAQEBAQF8hBABBTo/EAsOEyUPBSghiEYB0nABAQEBAQEEAQEBAQEdhgeFDIRuB4MXgRQFmRQBkzMig289gnQBAQE
X-IPAS-Result: AokIAIsg7FRbdWOb/2dsb2JhbABbgwaxZQUBAQEBAQEFAXeXTQKBJEMBAQEBAQF8hBABBTo/EAsOEyUPBSghiEYB0nABAQEBAQEEAQEBAQEdhgeFDIRuB4MXgRQFmRQBkzMig289gnQBAQE
X-IronPort-AV: E=Sophos;i="5.09,637,1418079600"; d="scan'208";a="328844260"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Feb 2015 08:01:53 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1YQ9VB-0002PN-2M; Tue, 24 Feb 2015 08:01:53 +0100
Received: from berto by mail.igalia.com with local (Exim)
	id 1YQ9VA-0002DT-Tl; Tue, 24 Feb 2015 08:01:52 +0100
Date: Tue, 24 Feb 2015 08:01:52 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20150224070152.GA8006@igalia.com>
References: <1424723236-24368-1-git-send-email-berto@igalia.com>
	<54EB9B04.1070901@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54EB9B04.1070901@redhat.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx: Fix
	several typos
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
X-List-Received-Date: Tue, 24 Feb 2015 07:02:04 -0000

On Mon, Feb 23, 2015 at 02:26:28PM -0700, Eric Blake wrote:

> > -- "tls": whevener the channel is encrypted (json-bool)
> > +- "tls": whenever the channel is encrypted (json-bool)
> 
> Might be nicer as 'whether' rather than 'whenever'.

Oh, you're right. Feel free to change it, or do you want me to
resubmit the patch?

Berto

