Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bT3y1-00035C-C9
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2016 05:20:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bT3xz-00033k-0p
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 05:20:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bT3xx-0005eS-Sl
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 05:20:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bT3xs-0005cj-5K; Fri, 29 Jul 2016 05:20:20 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BF9019CF86;
	Fri, 29 Jul 2016 09:20:19 +0000 (UTC)
Received: from redhat.com ([10.42.17.224])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6T9KGH5023512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 29 Jul 2016 05:20:18 -0400
Date: Fri, 29 Jul 2016 10:20:15 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eric Blake <eblake@redhat.com>
Message-ID: <20160729092015.GE4485@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1469758546-21040-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1469758546-21040-1-git-send-email-caoj.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 29 Jul 2016 09:20:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] util/qemu-sockets: revert Yoda
 Conditions to normal
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
X-List-Received-Date: Fri, 29 Jul 2016 09:20:28 -0000

On Fri, Jul 29, 2016 at 10:15:46AM +0800, Cao jin wrote:
> Follow CODING_STYLE
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  util/qemu-sockets.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> v2 changelog:
> 1. fix to Eric's comments.

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

