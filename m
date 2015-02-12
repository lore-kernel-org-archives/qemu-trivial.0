Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLrdz-0005UR-Jt
	for mharc-qemu-trivial@gnu.org; Thu, 12 Feb 2015 06:09:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YLrdx-0005SA-Ks
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 06:09:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YLrdw-0003QK-Ln
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 06:09:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YLrdp-0003PO-I2; Thu, 12 Feb 2015 06:09:05 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1CB94C4014614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Feb 2015 06:09:04 -0500
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t1CB91oN009678; Thu, 12 Feb 2015 06:09:02 -0500
Date: Thu, 12 Feb 2015 12:09:01 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150212110901.GI4189@noname.str.redhat.com>
References: <1423738334-13545-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423738334-13545-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] hmp: Normalize HMP
	command handler names
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
X-List-Received-Date: Thu, 12 Feb 2015 11:09:14 -0000

Am 12.02.2015 um 11:52 hat Markus Armbruster geschrieben:
> When I can't guess a handler's name, I have to look it up in
> hmp-commands.hx.  Happens often enough to annoy me.  Let's make them
> more predictable.
> 
> Touches several subsystems because HMP command handlers are still
> spread far and wide, but the changes are trivial.  Speak up if you
> want your subsystem's part routed through your tree rather than
> -trivial.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>

For the block layer parts:

Acked-by: Kevin Wolf <kwolf@redhat.com>

