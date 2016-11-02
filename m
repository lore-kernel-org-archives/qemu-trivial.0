Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1sdU-00085m-TO
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 06:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1c1sdO-00083S-DN
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 06:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1c1sdI-0006n3-TA
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 06:19:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1c1sdB-0006gG-LU; Wed, 02 Nov 2016 06:18:53 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E89C4C057FA9;
	Wed,  2 Nov 2016 10:18:52 +0000 (UTC)
Received: from redhat.com (vpn-239-210.phx2.redhat.com [10.3.239.210])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA2AIngH002822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 2 Nov 2016 06:18:51 -0400
Date: Wed, 2 Nov 2016 10:18:48 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org
Message-ID: <20161102101848.GB2573@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1478081328-25515-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1478081328-25515-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 02 Nov 2016 10:18:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/gtk: Fix build with
 older versions of gtk
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
X-List-Received-Date: Wed, 02 Nov 2016 10:19:11 -0000

On Wed, Nov 02, 2016 at 11:08:48AM +0100, Thomas Huth wrote:
> GDK_KEY_Delete is only defined with gtk version 2.22 and newer,
> on older versions this key was called GDK_Delete instead.
> Since this is the case for all GDK_KEY_* defines, change the
> already existing preprocessor check there to test for version 2.22,
> so we know that we can remove this code block in case we require
> that version as a minimum one day.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  ui/gtk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|

